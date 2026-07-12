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

const CONTEXT_ZONES: Array<{
  center: [number, number];
  radius: number;
  color: string;
}> = [
  { center: [36.7775, -119.7929], radius: 1500, color: "#F8E2AA" },
  { center: [36.806, -119.819], radius: 1700, color: "#FAEDCD" },
  { center: [36.7378, -119.7871], radius: 1450, color: "#8FBAE1" },
  { center: [36.835, -119.774], radius: 1800, color: "#CAE7FF" },
  { center: [36.7379, -119.7383], radius: 1700, color: "#FDFAE0" },
  { center: [36.722, -119.81], radius: 1800, color: "#F8E2AA" },
];

const DANGER_COLORS: Record<PublicMapReport["inDanger"], string> = {
  yes: "#D86F5E",
  unsure: "#D9A44A",
  no: "#6C9FCA",
};

const STATUS_RINGS: Record<string, string> = {
  resolved: "#5F9F87",
  routed: "#F8E2AA",
  "follow-up": "#D86F5E",
  submitted: "#8FBAE1",
};

function hashString(value: string): number {
  let hash = 2166136261;
  for (let index = 0; index < value.length; index += 1) {
    hash ^= value.charCodeAt(index);
    hash = Math.imul(hash, 16777619);
  }
  return hash >>> 0;
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

      L.tileLayer("https://{s}.basemaps.cartocdn.com/rastertiles/voyager/{z}/{x}/{y}{r}.png", {
        attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> &copy; CARTO',
        subdomains: "abcd",
        maxZoom: 20,
      }).addTo(map);

      const contextLayer = L.layerGroup().addTo(map);
      CONTEXT_ZONES.forEach((zone) => {
        L.circle(zone.center, {
          radius: zone.radius,
          stroke: true,
          color: zone.color,
          weight: 1,
          opacity: compact ? 0.24 : 0.32,
          fillColor: zone.color,
          fillOpacity: compact ? 0.08 : 0.11,
          interactive: false,
          className: "public-map-context-zone",
        }).addTo(contextLayer);
      });

      markersRef.current = L.layerGroup().addTo(map);
      mapRef.current = map;
      setReady(true);

      window.setTimeout(() => map.invalidateSize(), 80);
    }

    void initialize();

    return () => {
      cancelled = true;
      mapRef.current?.remove();
      mapRef.current = null;
      markersRef.current = null;
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
        const ring = STATUS_RINGS[report.status] ?? "#FDFAE0";
        const marker = L.circleMarker(coordinates, {
          radius: report.inDanger === "yes" ? 11 : 9,
          color: ring,
          weight: 3,
          opacity: 1,
          fillColor: fill,
          fillOpacity: 0.94,
          className: "public-map-dot",
        });

        marker.bindPopup(popupContent(report), { closeButton: false, maxWidth: 250 });
        marker.addTo(markersRef.current!);
        bounds.extend(coordinates);
      });

      if (reports.length > 1 && bounds.isValid()) {
        mapRef.current.fitBounds(bounds.pad(0.2), { maxZoom: 13 });
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
      <div ref={containerRef} className="public-map" aria-label="Neighborhood-level map of approved animal concerns" />
      <div className="public-map__sheen" aria-hidden="true" />
      <div className="public-map__badge">
        <span className="public-map__pulse" />
        {reports.length} approved concern{reports.length === 1 ? "" : "s"} mapped
      </div>
      <div className="public-map__legend" aria-label="Map color legend">
        <span><i className="is-sand" /> Neighborhood context</span>
        <span><i className="is-blue" /> Approved report</span>
        <span><i className="is-urgent" /> Immediate concern</span>
      </div>
      {reports.length === 0 && (
        <div className="public-map__empty">
          <strong>Community map is ready</strong>
          <span>Approved neighborhood-level reports will appear here.</span>
        </div>
      )}
    </div>
  );
}
