import { AlertTriangle, MapPin, Clock3 } from "lucide-react";
import type { Report } from "@/lib/storage";

export function HotspotSummary({ reports }: { reports: Report[] }) {
  const urgent = reports.filter((r) => r.inDanger === "yes");
  const recent = [...reports]
    .sort((a, b) => new Date(b.createdAt).getTime() - new Date(a.createdAt).getTime())
    .slice(0, 3);

  const topNeighborhood = Array.from(
    reports.reduce((m, r) => m.set(r.neighborhood, (m.get(r.neighborhood) ?? 0) + 1), new Map<string, number>())
  ).sort((a, b) => b[1] - a[1])[0];

  return (
    <div className="glass-card rounded-3xl p-5">
      <div className="flex items-center gap-2 mb-4">
        <MapPin size={14} className="text-primary" />
        <h3 className="font-heading font-bold text-sm">Hotspot Summary</h3>
      </div>
      <div className="grid sm:grid-cols-3 gap-3">
        <div className="rounded-2xl p-4" style={{ background: "rgba(248,85,37,0.08)" }}>
          <p className="text-xs uppercase tracking-wide text-muted-foreground mb-1">Urgent reports</p>
          <p className="text-2xl font-bold font-heading text-destructive">{urgent.length}</p>
        </div>
        <div className="rounded-2xl p-4" style={{ background: "rgba(2,131,145,0.08)" }}>
          <p className="text-xs uppercase tracking-wide text-muted-foreground mb-1">Top neighborhood</p>
          <p className="text-sm font-semibold">{topNeighborhood ? topNeighborhood[0] : "—"}</p>
        </div>
        <div className="rounded-2xl p-4" style={{ background: "rgba(250,169,104,0.10)" }}>
          <p className="text-xs uppercase tracking-wide text-muted-foreground mb-1">Newest</p>
          <p className="text-sm font-semibold">{recent[0]?.neighborhood ?? "No reports"}</p>
        </div>
      </div>
      <div className="mt-4 space-y-2">
        {recent.map((r) => (
          <div key={r.id} className="flex items-center justify-between text-xs rounded-xl px-3 py-2 bg-muted/50">
            <span className="truncate">{r.neighborhood} · {r.location}</span>
            <span className="flex items-center gap-1 text-muted-foreground"><Clock3 size={11} /> {new Date(r.createdAt).toLocaleDateString()}</span>
          </div>
        ))}
      </div>
      <div className="mt-4 text-xs text-muted-foreground flex items-center gap-2">
        <AlertTriangle size={12} className="text-destructive" />
        Quick scan of danger and recency
      </div>
    </div>
  );
}
