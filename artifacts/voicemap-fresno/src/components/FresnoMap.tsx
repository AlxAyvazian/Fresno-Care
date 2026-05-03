import { useEffect, useRef } from "react";
import type { Report } from "@/lib/storage";

// Fresno neighborhood → approximate centre coordinates
const NEIGHBORHOOD_COORDS: Record<string, [number, number]> = {
  "tower district":      [36.7775, -119.7929],
  "fig garden":          [36.8060, -119.8190],
  "old fig garden":      [36.7917, -119.8229],
  "downtown":            [36.7378, -119.7871],
  "fresno high":         [36.7572, -119.7746],
  "woodward park":       [36.8350, -119.7740],
  "sunnyside":           [36.7379, -119.7383],
  "mclane":              [36.7850, -119.7476],
  "central fresno":      [36.7468, -119.7726],
  "north fresno":        [36.8600, -119.7830],
  "southwest fresno":    [36.7220, -119.8100],
  "southeast fresno":    [36.7200, -119.7400],
  "west fresno":         [36.7450, -119.8200],
  "clovis":              [36.8252, -119.7029],
  "bullard":             [36.8020, -119.8050],
  "hoover":              [36.7660, -119.7550],
  "roosevelt":           [36.7250, -119.7580],
  "washington":          [36.7320, -119.7980],
  "van ness":            [36.7530, -119.7870],
  "palm":                [36.8050, -119.7910],
};

// Fresno city centre fallback
const FRESNO_CENTRE: [number, number] = [36.7468, -119.7726];

function resolveCoords(report: Report): [number, number] {
  const key = report.neighborhood.toLowerCase().trim();
  const base = NEIGHBORHOOD_COORDS[key] ?? FRESNO_CENTRE;
  // Small random jitter so pins at the same neighbourhood don't perfectly overlap
  const jitter = (): number => (Math.random() - 0.5) * 0.006;
  return [base[0] + jitter(), base[1] + jitter()];
}

const DANGER_COLORS: Record<string, string> = {
  yes:    "#F85525",
  unsure: "#FAA968",
  no:     "#028391",
};

const STATUS_RING: Record<string, string> = {
  resolved:    "#22c55e",
  routed:      "#FAA968",
  "follow-up": "#F85525",
  submitted:   "#028391",
  draft:       "#94a3b8",
};

interface FresnoMapProps {
  reports: Report[];
  onSelectReport?: (r: Report) => void;
}

export function FresnoMap({ reports, onSelectReport }: FresnoMapProps) {
  const mapRef = useRef<HTMLDivElement>(null);
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  const leafletMap = useRef<any>(null);

  useEffect(() => {
    if (!mapRef.current || leafletMap.current) return;

    let L: typeof import("leaflet");

    async function initMap() {
      // Dynamic import so leaflet only loads when the map tab is shown
      L = (await import("leaflet")).default;
      await import("leaflet/dist/leaflet.css");

      // Prevent double-init on StrictMode double-render
      if (leafletMap.current) return;

      const map = L.map(mapRef.current!, {
        center: FRESNO_CENTRE,
        zoom: 12,
        zoomControl: true,
        attributionControl: true,
      });

      L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
        attribution: '© <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
        maxZoom: 19,
      }).addTo(map);

      leafletMap.current = map;
      plotMarkers(map, L);
    }

    initMap();

    return () => {
      if (leafletMap.current) {
        leafletMap.current.remove();
        leafletMap.current = null;
      }
    };
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  // Re-plot markers whenever reports change
  useEffect(() => {
    if (!leafletMap.current) return;
    import("leaflet").then(({ default: L }) => {
      // Clear existing markers layer
      leafletMap.current.eachLayer((layer: import("leaflet").Layer) => {
        if ((layer as import("leaflet").Marker).getLatLng) {
          leafletMap.current.removeLayer(layer);
        }
      });
      plotMarkers(leafletMap.current, L);
    });
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [reports]);

  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  function plotMarkers(map: any, L: any) {
    reports.forEach((report) => {
      const coords = resolveCoords(report);
      const fill = DANGER_COLORS[report.inDanger] ?? "#028391";
      const ring = STATUS_RING[report.status] ?? "#028391";
      const animal = report.animalType === "cat" ? "🐱" : report.animalType === "dog" ? "🐶" : "🐾";

      const icon = L.divIcon({
        className: "",
        html: `
          <div style="
            width:36px; height:36px;
            border-radius:50%;
            background:${fill};
            border:3px solid ${ring};
            display:flex; align-items:center; justify-content:center;
            font-size:16px;
            box-shadow:0 2px 8px rgba(1,32,78,0.35);
            cursor:pointer;
            transition:transform 0.15s;
          " title="${report.animalType} · ${report.neighborhood}">
            ${animal}
          </div>`,
        iconSize: [36, 36],
        iconAnchor: [18, 18],
        popupAnchor: [0, -20],
      });

      const date = new Date(report.dateObserved).toLocaleDateString("en-US", {
        month: "short", day: "numeric", year: "numeric",
      });

      const dangerLabel = report.inDanger === "yes" ? "⚠ Immediate danger"
        : report.inDanger === "unsure" ? "? Danger unclear" : "✓ Not in danger";

      const popupHtml = `
        <div style="font-family:'Inter',sans-serif;min-width:200px;max-width:240px;">
          <div style="font-weight:700;font-size:13px;margin-bottom:4px;text-transform:capitalize;">
            ${animal} ${report.count} ${report.animalType}${report.count > 1 ? "s" : ""}
          </div>
          <div style="font-size:11px;color:#555;margin-bottom:2px;">📍 ${report.location}</div>
          <div style="font-size:11px;color:#555;margin-bottom:2px;">🏘 ${report.neighborhood}</div>
          <div style="font-size:11px;color:#555;margin-bottom:6px;">📅 ${date}</div>
          <div style="font-size:11px;font-weight:600;color:${fill};margin-bottom:4px;">${dangerLabel}</div>
          <div style="font-size:10px;color:#777;border-top:1px solid #eee;padding-top:4px;">
            ${report.concernTypes.join(" · ")}
          </div>
        </div>`;

      const marker = L.marker(coords, { icon }).addTo(map);
      marker.bindPopup(popupHtml, { maxWidth: 260 });

      if (onSelectReport) {
        marker.on("click", () => onSelectReport(report));
      }
    });
  }

  return (
    <div className="relative w-full" style={{ height: "420px" }}>
      <div
        ref={mapRef}
        style={{ width: "100%", height: "100%", borderRadius: "16px", overflow: "hidden" }}
      />

      {/* Legend */}
      <div
        className="absolute bottom-3 left-3 z-[1000] rounded-xl px-3 py-2 text-xs"
        style={{
          background: "rgba(255,252,243,0.95)",
          boxShadow: "0 2px 12px rgba(1,32,78,0.14)",
          backdropFilter: "blur(4px)",
        }}
      >
        <p className="font-semibold mb-1.5 text-[10px] uppercase tracking-wide opacity-60">
          Pin colour = danger
        </p>
        <div className="flex flex-col gap-1">
          {[
            { color: "#F85525", label: "Immediate danger" },
            { color: "#FAA968", label: "Unclear" },
            { color: "#028391", label: "Not in danger" },
          ].map(({ color, label }) => (
            <div key={label} className="flex items-center gap-1.5">
              <div className="w-3 h-3 rounded-full flex-shrink-0" style={{ background: color }} />
              <span className="opacity-70">{label}</span>
            </div>
          ))}
        </div>
        <p className="font-semibold mt-2 mb-1 text-[10px] uppercase tracking-wide opacity-60">
          Ring = status
        </p>
        <div className="flex flex-col gap-1">
          {[
            { color: "#22c55e", label: "Resolved" },
            { color: "#028391", label: "Submitted" },
            { color: "#FAA968", label: "Routed" },
            { color: "#F85525", label: "Follow-up" },
          ].map(({ color, label }) => (
            <div key={label} className="flex items-center gap-1.5">
              <div className="w-3 h-3 rounded-full border-2 flex-shrink-0"
                style={{ borderColor: color, background: "transparent" }} />
              <span className="opacity-70">{label}</span>
            </div>
          ))}
        </div>
      </div>

      {/* Report count badge */}
      <div
        className="absolute top-3 right-3 z-[1000] rounded-xl px-3 py-1.5 text-xs font-semibold"
        style={{
          background: "rgba(2,131,145,0.90)",
          color: "white",
          boxShadow: "0 2px 8px rgba(2,131,145,0.4)",
        }}
      >
        {reports.length} concern{reports.length !== 1 ? "s" : ""} mapped
      </div>
    </div>
  );
}
