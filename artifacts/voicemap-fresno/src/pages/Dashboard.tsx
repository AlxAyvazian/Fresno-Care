import { useState } from "react";
import {
  BarChart, Bar, XAxis, YAxis, Tooltip, ResponsiveContainer,
  AreaChart, Area, PieChart, Pie, Cell, Legend,
} from "recharts";
import {
  BarChart2, MapPin, TrendingUp, AlertCircle, CheckCircle2,
  Clock, FileText, Activity, Download, RefreshCw, Share2,
} from "lucide-react";
import { Button } from "@/components/ui/button";
import { AnimatedBackground } from "@/components/AnimatedBackground";
import { KurzgesagtDog } from "@/components/KurzgesagtDog";
import { FresnoMap } from "@/components/FresnoMap";
import { getReports, getStats, updateReportStatus, STATUS_LABELS, STATUS_COLORS, type Report } from "@/lib/storage";
import { buildShareUrl } from "@/lib/shareUtils";

const CHART_COLORS = ["#028391", "#FAA968", "#F85525", "#01204E", "#F6DCAC"];

function StatCard({ label, value, icon, color, sub }: { label: string; value: number; icon: React.ReactNode; color: string; sub?: string }) {
  return (
    <div className={`glass-card rounded-2xl p-5 border-l-4 ${color}`}>
      <div className="flex items-start justify-between">
        <div>
          <p className="text-2xl font-bold font-heading">{value}</p>
          <p className="text-sm text-muted-foreground mt-0.5">{label}</p>
          {sub && <p className="text-xs text-muted-foreground/60 mt-0.5">{sub}</p>}
        </div>
        <div className="opacity-50 mt-0.5">{icon}</div>
      </div>
    </div>
  );
}

function CustomTooltip({ active, payload, label }: { active?: boolean; payload?: { value: number }[]; label?: string }) {
  if (active && payload?.length) {
    return (
      <div className="glass-card rounded-xl px-3 py-2 text-xs border border-border/40 shadow-lg">
        <p className="font-semibold mb-0.5">{label}</p>
        <p className="text-primary">{payload[0].value} concern{payload[0].value !== 1 ? "s" : ""}</p>
      </div>
    );
  }
  return null;
}

export default function Dashboard() {
  const [reports, setReports] = useState<Report[]>(() => getReports());
  const stats = getStats(reports);
  const [filter, setFilter] = useState<Report["status"] | "all">("all");
  const [chartView, setChartView] = useState<"neighborhood" | "type" | "timeline" | "status" | "map">("map");
  const [copiedShareId, setCopiedShareId] = useState<string | null>(null);

  function handleShare(r: Report) {
    const url = buildShareUrl(r);
    navigator.clipboard.writeText(url);
    setCopiedShareId(r.id);
    setTimeout(() => setCopiedShareId(null), 2500);
  }

  const filtered = filter === "all" ? reports : reports.filter((r) => r.status === filter);

  const neighborhoodData = Array.from(reports.reduce((m, r) => { m.set(r.neighborhood, (m.get(r.neighborhood) ?? 0) + 1); return m; }, new Map<string, number>())).map(([name, count]) => ({ name, count })).sort((a, b) => b.count - a.count).slice(0, 10);
  const allTypes = Array.from(new Set(reports.flatMap((r) => r.concernTypes)));
  const typeData = allTypes.map((type) => ({ name: type, count: reports.filter((r) => r.concernTypes.includes(type)).length })).sort((a, b) => b.count - a.count).slice(0, 8);
  const now = Date.now();
  const timelineData = Array.from({ length: 8 }, (_, i) => { const weekStart = now - (7 - i) * 7 * 864e5; const weekEnd = weekStart + 7 * 864e5; const count = reports.filter((r) => { const t = new Date(r.createdAt).getTime(); return t >= weekStart && t < weekEnd; }).length; const d = new Date(weekStart); return { name: `${d.getMonth() + 1}/${d.getDate()}`, count }; });
  const statusData = [
    { name: "Open", value: reports.filter((r) => r.status === "submitted").length, color: "#028391" },
    { name: "Draft", value: reports.filter((r) => r.status === "draft").length, color: "#F6DCAC" },
    { name: "Routed", value: reports.filter((r) => r.status === "routed").length, color: "#FAA968" },
    { name: "Follow-Up", value: reports.filter((r) => r.status === "follow-up").length, color: "#F85525" },
    { name: "Resolved", value: reports.filter((r) => r.status === "resolved").length, color: "#01204E" },
  ].filter((d) => d.value > 0);
  const danger = { yes: reports.filter((r) => r.inDanger === "yes").length, no: reports.filter((r) => r.inDanger === "no").length, unsure: reports.filter((r) => r.inDanger === "unsure").length };

  function handleExportCSV() {
    const header = ["ID", "Date", "Animal", "Count", "Location", "Neighborhood", "Concerns", "Status", "In Danger"];
    const rows = reports.map((r) => [r.id, r.dateObserved, r.animalType, r.count, r.location, r.neighborhood, r.concernTypes.join("; "), r.status, r.inDanger]);
    const csv = [header, ...rows].map((r) => r.map((v) => `"${v}"`).join(",")).join("\n");
    const blob = new Blob([csv], { type: "text/csv" });
    const a = document.createElement("a");
    a.href = URL.createObjectURL(blob);
    a.download = `voicemap-fresno-${new Date().toISOString().slice(0, 10)}.csv`;
    a.click();
  }

  function handleStatusUpdate(id: string, status: Report["status"]) { updateReportStatus(id, status); setReports(getReports()); }

  const chartTabs = [
    { id: "map", label: "📍 Map View" },
    { id: "neighborhood", label: "Neighborhood Heat Map" },
    { id: "type", label: "Concern Types" },
    { id: "timeline", label: "Activity Timeline" },
    { id: "status", label: "Status Breakdown" },
  ] as const;

  return (
    <div className="relative min-h-screen pt-28 pb-16 px-4">
      <AnimatedBackground />
      <div className="relative z-10 max-w-7xl mx-auto">
        <div className="flex items-end gap-6 mb-8">
          <div className="flex-1">
            <h1 className="font-heading text-4xl font-bold mb-2">Public Dashboard</h1>
            <p className="text-muted-foreground max-w-2xl">Overview of documented animal welfare concerns in Fresno. All entries are submitted concerns — not confirmed incidents.</p>
          </div>
          <div className="flex items-end gap-3">
            <KurzgesagtDog size={80} className="hidden sm:block" />
            <div className="flex gap-2 pb-1">
              <Button variant="outline" size="sm" className="rounded-xl gap-2" onClick={() => setReports(getReports())}><RefreshCw size={13} /> Refresh</Button>
              <Button variant="outline" size="sm" className="rounded-xl gap-2" onClick={handleExportCSV}><Download size={13} /> Export CSV</Button>
            </div>
          </div>
        </div>

        <div className="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-6 gap-4 mb-8">
          <StatCard label="Total Concerns" value={stats.total} icon={<FileText size={20} />} color="border-primary" />
          <StatCard label="Open" value={stats.open} icon={<AlertCircle size={20} />} color="border-accent" />
          <StatCard label="Follow-Up" value={stats.followUp} icon={<Clock size={20} />} color="border-destructive" />
          <StatCard label="Routed" value={stats.routed} icon={<TrendingUp size={20} />} color="border-primary/60" />
          <StatCard label="Resolved" value={stats.resolved} icon={<CheckCircle2 size={20} />} color="border-green-500" />
          <StatCard label="Animals" value={stats.animals} icon={<BarChart2 size={20} />} color="border-secondary" />
        </div>

        <div className="grid grid-cols-3 gap-4 mb-8">
          <div className="glass-card rounded-2xl p-4 border-l-4 border-destructive/60"><p className="text-xl font-bold font-heading text-destructive">{danger.yes}</p><p className="text-sm text-muted-foreground">Immediate Danger Reported</p></div>
          <div className="glass-card rounded-2xl p-4 border-l-4 border-muted"><p className="text-xl font-bold font-heading">{danger.unsure}</p><p className="text-sm text-muted-foreground">Danger Status Unclear</p></div>
          <div className="glass-card rounded-2xl p-4 border-l-4 border-green-500/60"><p className="text-xl font-bold font-heading text-green-600 dark:text-green-400">{danger.no}</p><p className="text-sm text-muted-foreground">Not in Immediate Danger</p></div>
        </div>

        <div className="glass-card rounded-3xl p-6 mb-8">
          <div className="flex flex-wrap items-center justify-between gap-3 mb-5">
            <h3 className="font-heading font-bold text-base flex items-center gap-2"><Activity size={16} className="text-primary" /> Analytics</h3>
            <div className="flex flex-wrap gap-1.5">
              {chartTabs.map((t) => (<button key={t.id} onClick={() => setChartView(t.id)} className={`px-3 py-1.5 rounded-xl text-xs font-medium transition-all ${chartView === t.id ? "bg-primary text-primary-foreground" : "bg-muted text-muted-foreground hover:bg-primary/10"}`}>{t.label}</button>))}
            </div>
          </div>
          <div className={chartView === "map" ? "" : "h-64"}>
            {chartView === "map" && (<FresnoMap reports={reports} />)}
            {chartView === "neighborhood" && (<ResponsiveContainer width="100%" height="100%"><BarChart data={neighborhoodData} layout="vertical" margin={{ left: 8, right: 24, top: 4, bottom: 4 }}><XAxis type="number" hide /><YAxis type="category" dataKey="name" width={120} tick={{ fontSize: 11, fill: "currentColor" }} /><Tooltip content={<CustomTooltip />} /><Bar dataKey="count" radius={[0, 6, 6, 0]}>{neighborhoodData.map((_, i) => (<Cell key={i} fill={`hsl(${190 - i * 12}, ${70 - i * 2}%, ${40 + i * 3}%)`} />))}</Bar></BarChart></ResponsiveContainer>)}
            {chartView === "type" && (<ResponsiveContainer width="100%" height="100%"><BarChart data={typeData} margin={{ left: 8, right: 24, top: 4, bottom: 40 }}><XAxis dataKey="name" tick={{ fontSize: 10, fill: "currentColor" }} angle={-30} textAnchor="end" interval={0} /><YAxis tick={{ fontSize: 11, fill: "currentColor" }} /><Tooltip content={<CustomTooltip />} /><Bar dataKey="count" radius={[6, 6, 0, 0]}>{typeData.map((_, i) => (<Cell key={i} fill={CHART_COLORS[i % CHART_COLORS.length]} />))}</Bar></BarChart></ResponsiveContainer>)}
            {chartView === "timeline" && (<ResponsiveContainer width="100%" height="100%"><AreaChart data={timelineData} margin={{ left: 0, right: 24, top: 4, bottom: 4 }}><defs><linearGradient id="tealGrad" x1="0" y1="0" x2="0" y2="1"><stop offset="5%" stopColor="#028391" stopOpacity={0.4} /><stop offset="95%" stopColor="#028391" stopOpacity={0.02} /></linearGradient></defs><XAxis dataKey="name" tick={{ fontSize: 11, fill: "currentColor" }} /><YAxis allowDecimals={false} tick={{ fontSize: 11, fill: "currentColor" }} /><Tooltip content={<CustomTooltip />} /><Area type="monotone" dataKey="count" stroke="#028391" strokeWidth={2.5} fill="url(#tealGrad)" dot={{ r: 4, fill: "#028391" }} /></AreaChart></ResponsiveContainer>)}
            {chartView === "status" && (<ResponsiveContainer width="100%" height="100%"><PieChart><Pie data={statusData} cx="50%" cy="50%" innerRadius={60} outerRadius={90} paddingAngle={3} dataKey="value" label={({ name, percent }) => `${name} ${(percent * 100).toFixed(0)}%`} labelLine={false}>{statusData.map((entry, i) => (<Cell key={i} fill={entry.color} />))}</Pie><Legend iconType="circle" iconSize={10} /><Tooltip /></PieChart></ResponsiveContainer>)}
          </div>
        </div>

        <div className="glass-card rounded-3xl p-6 mb-8">
          <div className="flex items-center justify-between gap-3 mb-4"><h3 className="font-heading font-bold text-base flex items-center gap-2"><MapPin size={15} className="text-primary" /> Fast Actions</h3><span className="text-xs text-muted-foreground">Hotspots, flyers, and duplicates</span></div>
          <div className="grid md:grid-cols-3 gap-4"><a href="/watch" className="rounded-2xl p-4 bg-primary/10 border border-primary/20 hover:bg-primary/15 transition-colors"><p className="font-semibold text-sm mb-1">Nearby alerts</p><p className="text-xs text-muted-foreground">Follow neighborhoods and see matching reports.</p></a><a href="/flyer" className="rounded-2xl p-4 bg-accent/20 border border-border/40 hover:bg-accent/30 transition-colors"><p className="font-semibold text-sm mb-1">Printable flyer</p><p className="text-xs text-muted-foreground">Make a share sheet in one click.</p></a><a href="/tools" className="rounded-2xl p-4 bg-destructive/10 border border-destructive/20 hover:bg-destructive/15 transition-colors"><p className="font-semibold text-sm mb-1">Evidence checklist</p><p className="text-xs text-muted-foreground">Quickly verify you captured the right details.</p></a></div>
        </div>

        <div className="grid lg:grid-cols-3 gap-6 mb-8">
          <div className="glass-card rounded-3xl p-5"><h3 className="font-heading font-bold text-sm mb-4 flex items-center gap-2"><MapPin size={14} className="text-primary" /> Top Neighborhoods</h3><div className="space-y-2.5">{neighborhoodData.slice(0, 6).map(({ name, count }, i) => { const max = neighborhoodData[0]?.count ?? 1; return (<div key={name}><div className="flex justify-between text-xs mb-1"><span className="font-medium">{name}</span><span className="text-muted-foreground font-semibold">{count}</span></div><div className="h-2 rounded-full bg-muted overflow-hidden"><div className="h-full rounded-full transition-all duration-700" style={{ width: `${(count / max) * 100}%`, background: `hsl(${190 - i * 15}, 70%, 40%)` }} /></div></div>); })}</div></div>
          <div className="glass-card rounded-3xl p-5"><h3 className="font-heading font-bold text-sm mb-4 flex items-center gap-2"><BarChart2 size={14} className="text-primary" /> Animal Types</h3><div className="space-y-3">{["cat", "dog", "other"].map((type) => { const c = reports.filter((r) => r.animalType === type).length; const pct = stats.total > 0 ? (c / stats.total) * 100 : 0; return (<div key={type}><div className="flex justify-between text-xs mb-1"><span className="capitalize font-medium">{type === "cat" ? "🐱 Cats" : type === "dog" ? "🐶 Dogs" : "🐾 Other"}</span><span className="text-muted-foreground">{c} ({pct.toFixed(0)}%)</span></div><div className="h-2.5 rounded-full bg-muted overflow-hidden"><div className="h-full rounded-full" style={{ width: `${pct}%`, background: type === "cat" ? "#FAA968" : type === "dog" ? "#028391" : "#F85525" }} /></div></div>); })}</div></div>
          <div className="glass-card rounded-3xl p-5"><h3 className="font-heading font-bold text-sm mb-4 flex items-center gap-2"><TrendingUp size={14} className="text-primary" /> Resolution Rate</h3><div className="flex items-center justify-center py-4"><div className="relative w-28 h-28"><svg viewBox="0 0 100 100" className="w-full h-full -rotate-90"><circle cx="50" cy="50" r="40" fill="none" stroke="currentColor" strokeWidth="12" className="text-muted opacity-20" /><circle cx="50" cy="50" r="40" fill="none" stroke="#028391" strokeWidth="12" strokeDasharray={`${stats.total > 0 ? (stats.resolved / stats.total) * 251.2 : 0} 251.2`} strokeLinecap="round" style={{ transition: "stroke-dasharray 1s ease" }} /></svg><div className="absolute inset-0 flex flex-col items-center justify-center"><p className="text-2xl font-bold font-heading">{stats.total > 0 ? Math.round((stats.resolved / stats.total) * 100) : 0}%</p><p className="text-xs text-muted-foreground">resolved</p></div></div></div><p className="text-center text-xs text-muted-foreground">{stats.resolved} of {stats.total} concerns marked resolved</p></div>
        </div>

        <div className="glass-card rounded-3xl p-6">
          <div className="flex flex-wrap items-center justify-between gap-4 mb-5">
            <h3 className="font-heading font-bold text-base flex items-center gap-2"><FileText size={16} className="text-primary" /> Reported Concerns</h3>
            <div className="flex flex-wrap gap-2">{(["all", "draft", "submitted", "routed", "follow-up", "resolved"] as const).map((s) => (<button key={s} data-testid={`button-filter-${s}`} onClick={() => setFilter(s)} className={`px-3 py-1 rounded-lg text-xs font-medium transition-all ${filter === s ? "bg-primary text-primary-foreground" : "bg-muted text-muted-foreground hover:bg-primary/10"}`}>{s === "all" ? "All" : STATUS_LABELS[s]}</button>))}</div>
          </div>
          <div className="overflow-x-auto">
            <table className="w-full text-sm"><thead><tr className="border-b border-border/40"><th className="text-left py-2 px-3 text-xs font-semibold text-muted-foreground">Date</th><th className="text-left py-2 px-3 text-xs font-semibold text-muted-foreground">Animal</th><th className="text-left py-2 px-3 text-xs font-semibold text-muted-foreground">Location</th><th className="text-left py-2 px-3 text-xs font-semibold text-muted-foreground">Concern</th><th className="text-left py-2 px-3 text-xs font-semibold text-muted-foreground">Danger</th><th className="text-left py-2 px-3 text-xs font-semibold text-muted-foreground">Status</th><th className="text-left py-2 px-3 text-xs font-semibold text-muted-foreground">Update</th><th className="py-2 px-3 text-xs font-semibold text-muted-foreground">Share</th></tr></thead><tbody>{filtered.length === 0 ? (<tr><td colSpan={8} className="py-8 text-center text-muted-foreground text-sm">No concerns match this filter.</td></tr>) : filtered.map((r) => (<tr key={r.id} data-testid={`row-report-${r.id}`} className="border-b border-border/20 hover:bg-primary/5 transition-colors"><td className="py-3 px-3 text-xs text-muted-foreground whitespace-nowrap">{new Date(r.dateObserved).toLocaleDateString()}</td><td className="py-3 px-3 capitalize font-medium">{r.animalType} × {r.count}</td><td className="py-3 px-3 text-xs max-w-[160px] truncate">{r.location}</td><td className="py-3 px-3 text-xs max-w-[180px]"><span className="capitalize">{r.concernTypes[0]}</span>{r.concernTypes.length > 1 && <span className="text-muted-foreground"> +{r.concernTypes.length - 1}</span>}</td><td className="py-3 px-3"><span className={`text-xs font-medium ${r.inDanger === "yes" ? "text-destructive" : r.inDanger === "unsure" ? "text-accent" : "text-muted-foreground"}`}>{r.inDanger === "yes" ? "⚠ Yes" : r.inDanger === "unsure" ? "? Unsure" : "✓ No"}</span></td><td className="py-3 px-3"><span className={`px-2 py-0.5 rounded-lg text-xs font-medium ${STATUS_COLORS[r.status]}`}>{STATUS_LABELS[r.status]}</span></td><td className="py-3 px-3"><select value={r.status} onChange={(e) => handleStatusUpdate(r.id, e.target.value as Report["status"])} className="text-xs h-7 px-2 rounded-lg border border-input bg-background focus:outline-none focus:ring-1 focus:ring-ring">{(["draft", "submitted", "routed", "follow-up", "resolved"] as const).map((s) => (<option key={s} value={s}>{STATUS_LABELS[s]}</option>))}</select></td><td className="py-3 px-3 text-center"><button onClick={() => handleShare(r)} title="Copy share link" className="inline-flex items-center justify-center w-7 h-7 rounded-lg transition-all" style={copiedShareId === r.id ? { background: "#22c55e", color: "#fff" } : { background: "rgba(2,131,145,0.10)", color: "#028391" }}>{copiedShareId === r.id ? <CheckCircle2 size={13} /> : <Share2 size={13} />}</button></td></tr>))}</tbody></table>
          </div>
        </div>
      </div>
    </div>
  );
}
