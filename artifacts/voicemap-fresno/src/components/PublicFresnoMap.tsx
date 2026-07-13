import { useEffect, useRef, useState } from "react";

export type PublicMapReport = {
  id?: string;
  publicId?: string;
  neighborhood: string;
  animalType: string;
  count: number;
  dateObserved: string;
  inDanger: "yes" | "no" | "unsure";
  status: string;
  concernTypes: string[];
};

const FRESNO_CENTER: [number, number] = [36.7468, -119.7726];

const NEIGHBORHOOD_COORDS: Record<string, [number, number]> = {
  "tower district": [36.7775, -119.7929],
  "fig garden": [36.806, -119.819],
  "old fig garden": [36.7917, -119.8229],
  downtown: [36.7378, -119.7871],
  "fresno high": [36.7572, -119.7746],
  "woodward park": [36.835, -119.774],
  sunnyside: [36.7379, -119.7383],
  mclane: [36.785, -119.7476],
  "central fresno": [36.7468, -119.7726],
  "north fresno": [36.86, -119.783],
  "southwest fresno": [36.722, -119.81],
  "southeast fresno": [36.72, -119.74],
  "west fresno": [36.745, -119.82],
  clovis: [36.8252, -119.7029],
  bullard: [36.802, -119.805],
  hoover: [36.766, -119.755],
  roosevelt: [36.725, -119.758],
  washington: [36.732, -119.798],
  "van ness": [36.753, -119.787],
  palm: [36.805, -119.791],
};

const DANGER_COLORS: Record<PublicMapReport["inDanger"], string> = {
  yes: "#D94A3D",
  unsure: "#D49C38",
  no: "#2F6EA5",
};

const STATUS_RINGS: Record<string, string> = {
  resolved: "#38A169",
  routed: "#F6D365",
  "follow-up": "#F97316",
  submitted: "#A7D8FF",
};

function hashString(value: string): number {
  let hash = 2166136261;
  for (let index = 0; index < value.length; index += 1) {
    hash ^= value.charCodeAt(index);
    hash = Math.imul(hash, 16777619);
  }
  return hash >>> 0;
}

function titleCase(value: string) {
  return value
    .split(" ")
    .filter(Boolean)
    .map((word) => word.charAt(0).toUpperCase() + word.slice(1))
    .join(" ");
}

function nearestNeighborhood(lat: number, lng: number) {
  let nearest = "central fresno";
  let nearestDistance = Number.POSITIVE_INFINITY;

  Object.entries(NEIGHBORHOOD_COORDS).forEach(([name, [nLat, nLng]]) => {
    const latDistance = (lat - nLat) * 69;
    const lngDistance = (lng - nLng) * 69 * Math.cos((lat * Math.PI) / 180);
    const distance = latDistance * latDistance + lngDistance * lngDistance;
    if (distance < nearestDistance) {
      nearest = name;
      nearestDistance = distance;
    }
  });

  return titleCase(nearest);
}

function neighborhoodCoordinates(report: PublicMapReport): [number, number] {
  const neighborhood = report.neighborhood.trim().toLowerCase();
  const base = NEIGHBORHOOD_COORDS[neighborhood] ?? FRESNO_CENTER;
  const identity = report.publicId ?? report.id ?? `${neighborhood}-${report.dateObserved}`;
  const hash = hashString(identity);
  const latOffset = (((hash & 0xffff) / 0xffff) - 0.5) * 0.006;
  const lngOffset = ((((hash >>> 16) & 0xffff) / 0xffff) - 0.5) * 0.006;
  return [base[0] + latOffset, base[1] + lngOffset];
}

function popupContent(report: PublicMapReport): HTMLElement {
  const wrapper = document.createElement("div");
  wrapper.className = "public-map-popup";

  const eyebrow = document.createElement("div");
  eyebrow.className = "public-map-popup__eyebrow";
  eyebrow.textContent = report.inDanger === "yes" ? "Immediate concern reported" : "Documented concern";

  const title = document.createElement("strong");
  title.className = "public-map-popup__title";
  const animalLabel = report.count === 1 ? report.animalType : `${report.animalType}s`;
  title.textContent = `${report.count} ${animalLabel}`;

  const location = document.createElement("p");
  location.textContent = report.neighborhood || "Fresno neighborhood";

  const date = document.createElement("p");
  date.textContent = `Observed ${report.dateObserved}`;

  const status = document.createElement("span");
  status.className = "public-map-popup__status";
  status.textContent = report.status.replace("-", " ");

  wrapper.append(eyebrow, title, location, date, status);
  return wrapper;
}

function selectionPopupContent(lat: number, lng: number): HTMLElement {
  const neighborhood = nearestNeighborhood(lat, lng);
  const location = `${neighborhood} area near ${lat.toFixed(4)}, ${lng.toFixed(4)}`;
  const params = new URLSearchParams({ location, neighborhood });

  const wrapper = document.createElement("div");
  wrapper.className = "public-map-popup public-map-popup--selection";

  const eyebrow = document.createElement("div");
  eyebrow.className = "public-map-popup__eyebrow";
  eyebrow.textContent = "Selected reporting area";

  const title = document.createElement("strong");
  title.className = "public-map-popup__title";
  title.textContent = neighborhood;

  const note = document.createElement("p");
  note.textContent = "This location is only used to start a private report. Public map placement remains neighborhood-level.";

  const action = document.createElement("button");
  action.type = "button";
  action.className = "public-map-popup__action";
  action.textContent = "Document concern here";
  action.addEventListener("click", () => {
    window.location.assign(`/submit?${params.toString()}`);
  });

  wrapper.append(eyebrow, title, note, action);
  return wrapper;
}

export function PublicFresnoMap({
  reports,
  compact = false,
}: {
  reports: PublicMapReport[];
  compact?: boolean;
}) {
  const containerRef = useRef<HTMLDivElement>(null);
  const mapRef = useRef<import("leaflet").Map | null>(null);
  const markersRef = useRef<import("leaflet").LayerGroup | null>(null);
  const selectionRef = useRef<import("leaflet").LayerGroup | null>(null);
  const [ready, setReady] = useState(false);

  useEffect(() => {
    if (!containerRef.current || mapRef.current) return;

    let cancelled = false;

    async function initialize() {
      const L = (await import("leaflet")).default;
      await import("leaflet/dist/leaflet.css");
      if (cancelled || !containerRef.current || mapRef.current) return;

      const map = L.map(containerRef.current, {
        center: FRESNO_CENTER,
        zoom: compact ? 11 : 12,
        zoomControl: true,
        attributionControl: true,
        scrollWheelZoom: !compact,
      });

      map.getContainer().style.cursor = "crosshair";

      L.tileLayer(
        "https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}",
        {
          attribution: "Tiles &copy; Esri",
          maxZoom: 19,
          className: "public-map-imagery-tiles",
        },
      ).addTo(map);

      L.tileLayer(
        "https://server.arcgisonline.com/ArcGIS/rest/services/Reference/World_Boundaries_and_Places/MapServer/tile/{z}/{y}/{x}",
        {
          attribution: "",
          maxZoom: 19,
          opacity: 0.95,
          className: "public-map-label-tiles",
        },
      ).addTo(map);

      L.tileLayer(
        "https://server.arcgisonline.com/ArcGIS/rest/services/Reference/World_Transportation/MapServer/tile/{z}/{y}/{x}",
        {
          attribution: "",
          maxZoom: 19,
          opacity: 0.72,
          className: "public-map-transport-tiles",
        },
      ).addTo(map);

      markersRef.current = L.layerGroup().addTo(map);
      selectionRef.current = L.layerGroup().addTo(map);

      map.on("click", (event) => {
        if (!selectionRef.current) return;
        selectionRef.current.clearLayers();
        const marker = L.circleMarker(event.latlng, {
          radius: compact ? 9 : 11,
          color: "#FDFAE0",
          weight: 3,
          opacity: 1,
          fillColor: "#426F9D",
          fillOpacity: 1,
          className: "public-map-selection-dot",
        });
        marker.bindPopup(selectionPopupContent(event.latlng.lat, event.latlng.lng), {
          closeButton: true,
          maxWidth: 260,
        });
        marker.addTo(selectionRef.current);
        marker.openPopup();
      });

      mapRef.current = map;
      setReady(true);
      window.setTimeout(() => map.invalidateSize(), 100);
    }

    void initialize();

    return () => {
      cancelled = true;
      mapRef.current?.remove();
      mapRef.current = null;
      markersRef.current = null;
      selectionRef.current = null;
      setReady(false);
    };
  }, [compact]);

  useEffect(() => {
    if (!ready || !mapRef.current || !markersRef.current) return;

    let cancelled = false;

    async function renderMarkers() {
      const L = (await import("leaflet")).default;
      if (cancelled || !markersRef.current || !mapRef.current) return;

      markersRef.current.clearLayers();
      const bounds = L.latLngBounds([]);

      reports.forEach((report) => {
        const coordinates = neighborhoodCoordinates(report);
        const fill = DANGER_COLORS[report.inDanger] ?? DANGER_COLORS.unsure;
        const ring = STATUS_RINGS[report.status] ?? "#FFFFFF";
        const marker = L.circleMarker(coordinates, {
          radius: report.inDanger === "yes" ? 12 : 10,
          color: ring,
          weight: 4,
          opacity: 1,
          fillColor: fill,
          fillOpacity: 1,
          className: "public-map-dot",
        });

        marker.bindPopup(popupContent(report), { closeButton: false, maxWidth: 250 });
        marker.addTo(markersRef.current!);
        bounds.extend(coordinates);
      });

      if (reports.length > 1 && bounds.isValid()) {
        mapRef.current.fitBounds(bounds.pad(0.22), { maxZoom: 13 });
      } else if (reports.length === 1) {
        mapRef.current.setView(neighborhoodCoordinates(reports[0]), 13);
      } else {
        mapRef.current.setView(FRESNO_CENTER, compact ? 11 : 12);
      }
    }

    void renderMarkers();
    return () => {
      cancelled = true;
    };
  }, [ready, reports, compact]);

  return (
    <div className={`public-map-shell ${compact ? "public-map-shell--compact" : ""}`}>
      <div ref={containerRef} className="public-map" aria-label="Clickable neighborhood-level map of approved animal concerns" />
      <div className="public-map__click-hint">Click the map to start a report from that area</div>
      {reports.length > 0 && (
        <>
          <div className="public-map__badge">
            <span className="public-map__pulse" />
            {reports.length} approved concern{reports.length === 1 ? "" : "s"} mapped
          </div>
          <div className="public-map__legend" aria-label="Map marker legend">
            <span><i className="is-blue" /> Approved report</span>
            <span><i className="is-urgent" /> Immediate concern</span>
          </div>
        </>
      )}
    </div>
  );
}
