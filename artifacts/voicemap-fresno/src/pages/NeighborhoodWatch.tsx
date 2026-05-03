import { useState, useEffect } from "react";
import { MapPin, Plus, Trash2, Bell, BellOff, AlertTriangle, CheckCircle2, Clock, Eye, X, Save, FileText, Share2, Rss, PawPrint } from "lucide-react";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { AnimatedBackground } from "@/components/AnimatedBackground";
import { KurzgesagtCat } from "@/components/KurzgesagtCat";
import { KurzgesagtDog } from "@/components/KurzgesagtDog";
import { getReports, STATUS_LABELS, STATUS_COLORS, type Report } from "@/lib/storage";
import { buildShareUrl } from "@/lib/shareUtils";
import { useLocation } from "wouter";

// ─── Types ────────────────────────────────────────────────────────────────────

export interface WatchZone {
  id: string;
  createdAt: string;
  address: string;
  neighborhood: string;
  description: string;
  severity: "low" | "medium" | "high";
  status: "active" | "resolved" | "monitoring";
  checkBackDate: string;
  notifyEnabled: boolean;
  notes: string;
  tags: string[];
  lastChecked?: string;
}

const WATCH_KEY = "voicemap_watch_zones";

function getZones(): WatchZone[] {
  try { return JSON.parse(localStorage.getItem(WATCH_KEY) ?? "[]"); }
  catch { return []; }
}
function saveZones(zones: WatchZone[]) {
  localStorage.setItem(WATCH_KEY, JSON.stringify(zones));
}
function genId() { return `wz-${Date.now()}-${Math.random().toString(36).slice(2, 6)}`; }

// ─── Blank form ───────────────────────────────────────────────────────────────

const BLANK: Omit<WatchZone, "id" | "createdAt"> = {
  address: "",
  neighborhood: "",
  description: "",
  severity: "medium",
  status: "active",
  checkBackDate: (() => {
    const d = new Date(); d.setDate(d.getDate() + 7); return d.toISOString().slice(0, 10);
  })(),
  notifyEnabled: true,
  notes: "",
  tags: [],
};

const SEVERITY_CONFIG = {
  low:    { label: "Low",    color: "#028391", bg: "rgba(2,131,145,0.12)",   dot: "#028391"   },
  medium: { label: "Medium", color: "#FAA968", bg: "rgba(250,169,104,0.18)", dot: "#F0943A"   },
  high:   { label: "High",   color: "#F85525", bg: "rgba(248,85,37,0.14)",   dot: "#F85525"   },
};

const STATUS_CONFIG = {
  active:     { label: "Active Watch",    icon: <Eye size={12} />,        color: "#F85525" },
  monitoring: { label: "Monitoring",      icon: <Clock size={12} />,      color: "#FAA968" },
  resolved:   { label: "Resolved",        icon: <CheckCircle2 size={12} />, color: "#028391" },
};

const FRESNO_NEIGHBORHOODS = [
  "Tower District", "Fig Garden", "Woodward Park", "Fresno High",
  "Roosevelt", "McLane", "Bullard", "Hoover", "Sunnyside", "Clovis Ave",
  "Blackstone", "Palm-Shields", "West Fresno", "Southwest Fresno",
  "Southeast Fresno", "Downtown", "Chinatown", "North Fresno",
  "Old Fig Garden", "Sequoia", "Manchester", "Lowell",
  "Unincorporated County", "Other",
];

// ─── Subscriptions storage ─────────────────────────────────────────────────────

const SUB_KEY = "voicemap_subscriptions";

function getSubs(): string[] {
  try { return JSON.parse(localStorage.getItem(SUB_KEY) ?? "[]"); }
  catch { return []; }
}
function saveSubs(subs: string[]) {
  localStorage.setItem(SUB_KEY, JSON.stringify(subs));
}

// ─── Feed Item ────────────────────────────────────────────────────────────────

const DANGER_CFG = {
  yes:    { label: "⚠ Immediate Danger", color: "#F85525", bg: "rgba(248,85,37,0.10)",  stripe: "#F85525" },
  unsure: { label: "? Unclear",          color: "#D4883A", bg: "rgba(250,169,104,0.12)", stripe: "#FAA968" },
  no:     { label: "✓ Not in Danger",    color: "#028391", bg: "rgba(2,131,145,0.09)",  stripe: "#028391" },
};

function FeedItem({
  report,
  onShare,
  copied,
  onFile,
}: {
  report: Report;
  onShare: () => void;
  copied: boolean;
  onFile: () => void;
}) {
  const d = DANGER_CFG[report.inDanger];
  const animal = report.animalType === "cat" ? "🐱" : report.animalType === "dog" ? "🐶" : "🐾";

  return (
    <div
      className="rounded-2xl overflow-hidden flex"
      style={{
        background: "rgba(255,252,243,0.95)",
        boxShadow: "0 2px 10px rgba(1,32,78,0.07), 0 4px 20px rgba(1,32,78,0.05)",
        border: "1px solid rgba(246,220,172,0.7)",
      }}
    >
      {/* Danger stripe */}
      <div style={{ width: "5px", flexShrink: 0, background: d.stripe }} />

      <div className="flex-1 p-4">
        {/* Top row */}
        <div className="flex items-start justify-between gap-2 mb-1.5">
          <div className="flex items-center gap-2 flex-wrap">
            <span className="font-heading font-bold text-sm">
              {animal} {report.count} {report.animalType}{report.count > 1 ? "s" : ""}
            </span>
            <span
              className="text-xs font-semibold px-2 py-0.5 rounded-full"
              style={{ background: d.bg, color: d.color }}
            >
              {d.label}
            </span>
          </div>
          <span className="text-xs text-muted-foreground whitespace-nowrap flex-shrink-0">
            {new Date(report.dateObserved).toLocaleDateString("en-US", { month: "short", day: "numeric" })}
          </span>
        </div>

        {/* Location */}
        <div className="flex items-center gap-1.5 mb-2">
          <MapPin size={11} className="text-muted-foreground flex-shrink-0" />
          <span className="text-xs text-muted-foreground truncate">{report.location}</span>
          <span className="text-xs text-muted-foreground">·</span>
          <span className="text-xs font-medium">{report.neighborhood}</span>
        </div>

        {/* Concern tags */}
        <div className="flex flex-wrap gap-1.5 mb-3">
          {report.concernTypes.slice(0, 3).map((t) => (
            <span key={t}
              className="text-xs px-2 py-0.5 rounded-lg capitalize font-medium"
              style={{ background: "rgba(1,32,78,0.06)", color: "rgba(1,32,78,0.65)" }}
            >
              {t}
            </span>
          ))}
          {report.concernTypes.length > 3 && (
            <span className="text-xs text-muted-foreground px-1">+{report.concernTypes.length - 3} more</span>
          )}
        </div>

        {/* Bottom row */}
        <div className="flex items-center justify-between gap-2">
          <span className={`text-xs font-semibold px-2.5 py-1 rounded-lg ${STATUS_COLORS[report.status]}`}>
            {STATUS_LABELS[report.status]}
          </span>
          <div className="flex gap-1.5">
            <button
              onClick={onFile}
              className="flex items-center gap-1 px-2.5 py-1 rounded-lg text-xs font-semibold text-white transition-all"
              style={{ background: "#028391" }}
            >
              <FileText size={10} /> File Report
            </button>
            <button
              onClick={onShare}
              title="Copy share link"
              className="flex items-center gap-1 px-2.5 py-1 rounded-lg text-xs font-semibold transition-all"
              style={copied
                ? { background: "#22c55e", color: "#fff" }
                : { background: "rgba(2,131,145,0.10)", color: "#028391" }}
            >
              {copied ? <CheckCircle2 size={10} /> : <Share2 size={10} />}
              {copied ? "Copied!" : "Share"}
            </button>
          </div>
        </div>
      </div>
    </div>
  );
}

// ─── Add/Edit Modal ───────────────────────────────────────────────────────────

function ZoneModal({
  initial,
  onSave,
  onClose,
}: {
  initial?: WatchZone;
  onSave: (z: WatchZone) => void;
  onClose: () => void;
}) {
  const [form, setForm] = useState<Omit<WatchZone, "id" | "createdAt">>(
    initial ? { ...initial } : { ...BLANK }
  );
  const [tagInput, setTagInput] = useState("");

  function addTag() {
    const t = tagInput.trim().toLowerCase().replace(/\s+/g, "-");
    if (t && !form.tags.includes(t)) setForm({ ...form, tags: [...form.tags, t] });
    setTagInput("");
  }

  function handleSave() {
    if (!form.address.trim()) return;
    onSave({
      ...form,
      id: initial?.id ?? genId(),
      createdAt: initial?.createdAt ?? new Date().toISOString(),
    });
  }

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center p-4" style={{ background: "rgba(1,32,78,0.5)" }}>
      <div
        className="w-full max-w-xl max-h-[90vh] overflow-y-auto rounded-2xl"
        style={{ background: "hsl(39 75% 93%)", border: "2px solid rgba(2,131,145,0.35)", boxShadow: "6px 6px 0 rgba(1,32,78,0.15)" }}
      >
        <div className="flex items-center justify-between p-5 border-b-2 border-[rgba(2,131,145,0.2)]">
          <h3 className="font-heading font-bold text-lg">{initial ? "Edit Watch Zone" : "Add Watch Zone"}</h3>
          <button onClick={onClose} className="p-1.5 rounded-lg hover:bg-primary/10 transition-colors"><X size={16} /></button>
        </div>

        <div className="p-5 space-y-4">
          <div>
            <label className="text-xs font-semibold block mb-1.5 uppercase tracking-wide text-muted-foreground">Address / Intersection *</label>
            <Input value={form.address} onChange={(e) => setForm({ ...form, address: e.target.value })}
              placeholder="e.g. E Olive Ave & N Van Ness, or 1234 Blackstone Ave"
              className="rounded-xl font-medium" />
          </div>

          <div className="grid sm:grid-cols-2 gap-3">
            <div>
              <label className="text-xs font-semibold block mb-1.5 uppercase tracking-wide text-muted-foreground">Neighborhood</label>
              <select value={form.neighborhood} onChange={(e) => setForm({ ...form, neighborhood: e.target.value })}
                className="w-full h-10 px-3 rounded-xl border-2 border-input bg-background text-sm focus:outline-none focus:ring-2 focus:ring-ring font-medium">
                <option value="">Select…</option>
                {FRESNO_NEIGHBORHOODS.map((n) => <option key={n} value={n}>{n}</option>)}
              </select>
            </div>
            <div>
              <label className="text-xs font-semibold block mb-1.5 uppercase tracking-wide text-muted-foreground">Severity</label>
              <select value={form.severity} onChange={(e) => setForm({ ...form, severity: e.target.value as WatchZone["severity"] })}
                className="w-full h-10 px-3 rounded-xl border-2 border-input bg-background text-sm focus:outline-none focus:ring-2 focus:ring-ring font-medium">
                <option value="low">Low — General concern</option>
                <option value="medium">Medium — Ongoing issue</option>
                <option value="high">High — Immediate risk</option>
              </select>
            </div>
          </div>

          <div>
            <label className="text-xs font-semibold block mb-1.5 uppercase tracking-wide text-muted-foreground">What are you watching for?</label>
            <textarea value={form.description} onChange={(e) => setForm({ ...form, description: e.target.value })} rows={2}
              placeholder="e.g. Multiple stray dogs seen near abandoned lot, no water visible"
              className="w-full rounded-xl border-2 border-input bg-background px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-ring resize-none" />
          </div>

          <div className="grid sm:grid-cols-2 gap-3">
            <div>
              <label className="text-xs font-semibold block mb-1.5 uppercase tracking-wide text-muted-foreground">Status</label>
              <select value={form.status} onChange={(e) => setForm({ ...form, status: e.target.value as WatchZone["status"] })}
                className="w-full h-10 px-3 rounded-xl border-2 border-input bg-background text-sm focus:outline-none focus:ring-2 focus:ring-ring font-medium">
                <option value="active">Active Watch</option>
                <option value="monitoring">Monitoring</option>
                <option value="resolved">Resolved</option>
              </select>
            </div>
            <div>
              <label className="text-xs font-semibold block mb-1.5 uppercase tracking-wide text-muted-foreground">Check Back Date</label>
              <Input type="date" value={form.checkBackDate} onChange={(e) => setForm({ ...form, checkBackDate: e.target.value })}
                className="rounded-xl font-medium" />
            </div>
          </div>

          <div>
            <label className="text-xs font-semibold block mb-1.5 uppercase tracking-wide text-muted-foreground">Notes</label>
            <textarea value={form.notes} onChange={(e) => setForm({ ...form, notes: e.target.value })} rows={2}
              placeholder="Agency contact attempts, responses, anything relevant…"
              className="w-full rounded-xl border-2 border-input bg-background px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-ring resize-none" />
          </div>

          {/* Tags */}
          <div>
            <label className="text-xs font-semibold block mb-1.5 uppercase tracking-wide text-muted-foreground">Tags</label>
            <div className="flex gap-2 mb-2">
              <Input value={tagInput} onChange={(e) => setTagInput(e.target.value)}
                onKeyDown={(e) => { if (e.key === "Enter") { e.preventDefault(); addTag(); } }}
                placeholder="stray-dogs, no-water, repeat-location…" className="rounded-xl" />
              <Button type="button" variant="outline" onClick={addTag} className="rounded-xl px-3 border-2"><Plus size={14} /></Button>
            </div>
            <div className="flex flex-wrap gap-1.5">
              {form.tags.map((t) => (
                <span key={t} className="flex items-center gap-1 text-xs rounded-lg px-2.5 py-1 font-medium"
                  style={{ background: "rgba(2,131,145,0.12)", border: "1px solid rgba(2,131,145,0.25)", color: "#028391" }}>
                  {t}
                  <button onClick={() => setForm({ ...form, tags: form.tags.filter((x) => x !== t) })}><X size={9} /></button>
                </span>
              ))}
            </div>
          </div>

          {/* Notification toggle */}
          <div className="flex items-center justify-between p-3 rounded-xl"
            style={{ background: "rgba(2,131,145,0.08)", border: "2px solid rgba(2,131,145,0.18)" }}>
            <div>
              <p className="text-sm font-semibold">Check-back reminder</p>
              <p className="text-xs text-muted-foreground">Show a reminder badge when check-back date arrives</p>
            </div>
            <button onClick={() => setForm({ ...form, notifyEnabled: !form.notifyEnabled })}
              className="relative w-11 h-6 rounded-full transition-colors flex items-center px-0.5"
              style={{ background: form.notifyEnabled ? "#028391" : "rgba(1,32,78,0.15)" }}>
              <span className="w-5 h-5 rounded-full bg-white shadow transition-transform"
                style={{ transform: form.notifyEnabled ? "translateX(20px)" : "translateX(0)" }} />
            </button>
          </div>

          <div className="flex gap-3 pt-1">
            <Button onClick={handleSave} className="flex-1 rounded-xl gap-2 font-semibold" style={{ background: "#028391", color: "white", border: "2px solid rgba(1,32,78,0.15)", boxShadow: "3px 3px 0 rgba(1,32,78,0.12)" }}>
              <Save size={14} /> {initial ? "Save Changes" : "Add to Watch List"}
            </Button>
            <Button variant="outline" onClick={onClose} className="rounded-xl border-2 font-semibold">Cancel</Button>
          </div>
        </div>
      </div>
    </div>
  );
}

// ─── Zone Card ────────────────────────────────────────────────────────────────

function ZoneCard({
  zone,
  reportCount,
  onEdit,
  onDelete,
  onMarkChecked,
  onQuickReport,
}: {
  zone: WatchZone;
  reportCount: number;
  onEdit: () => void;
  onDelete: () => void;
  onMarkChecked: () => void;
  onQuickReport: () => void;
}) {
  const sev = SEVERITY_CONFIG[zone.severity];
  const stat = STATUS_CONFIG[zone.status];
  const checkDate = new Date(zone.checkBackDate + "T12:00:00");
  const today = new Date();
  today.setHours(0, 0, 0, 0);
  const isOverdue = checkDate < today && zone.status !== "resolved";
  const isDueSoon = !isOverdue && (checkDate.getTime() - today.getTime()) <= 3 * 86400000 && zone.status !== "resolved";

  return (
    <div
      className="rounded-2xl overflow-hidden transition-all"
      style={{
        border: `2px solid ${isOverdue ? "#F85525" : "rgba(2,131,145,0.25)"}`,
        boxShadow: isOverdue ? "4px 4px 0 rgba(248,85,37,0.18)" : "4px 4px 0 rgba(1,32,78,0.1)",
        background: "hsl(39 70% 94%)",
      }}
    >
      {/* Severity stripe */}
      <div style={{ height: "4px", background: sev.color }} />

      <div className="p-4">
        <div className="flex items-start justify-between gap-3 mb-2">
          <div className="flex-1 min-w-0">
            <div className="flex items-center gap-2 flex-wrap mb-1">
              <span className="text-xs font-bold uppercase tracking-wide px-2 py-0.5 rounded-md" style={{ background: sev.bg, color: sev.color }}>
                {sev.label}
              </span>
              <span className="flex items-center gap-1 text-xs font-semibold px-2 py-0.5 rounded-md"
                style={{ background: "rgba(1,32,78,0.08)", color: stat.color }}>
                {stat.icon} {stat.label}
              </span>
              {reportCount > 0 && (
                <span className="text-xs font-bold px-2 py-0.5 rounded-md"
                  style={{ background: "rgba(2,131,145,0.12)", color: "#028391", border: "1px solid rgba(2,131,145,0.2)" }}>
                  {reportCount} report{reportCount !== 1 ? "s" : ""}
                </span>
              )}
            </div>
            <div className="flex items-start gap-1.5">
              <MapPin size={13} className="text-muted-foreground mt-0.5 flex-shrink-0" />
              <div>
                <p className="text-sm font-bold leading-snug">{zone.address}</p>
                {zone.neighborhood && <p className="text-xs text-muted-foreground">{zone.neighborhood}, Fresno, CA</p>}
              </div>
            </div>
          </div>
        </div>

        {zone.description && (
          <p className="text-xs text-muted-foreground leading-relaxed mb-3 line-clamp-2">{zone.description}</p>
        )}

        {/* Check-back date */}
        <div
          className="flex items-center justify-between rounded-lg px-3 py-2 mb-3"
          style={{
            background: isOverdue ? "rgba(248,85,37,0.1)" : isDueSoon ? "rgba(250,169,104,0.15)" : "rgba(2,131,145,0.07)",
            border: `1px solid ${isOverdue ? "rgba(248,85,37,0.3)" : isDueSoon ? "rgba(250,169,104,0.3)" : "rgba(2,131,145,0.15)"}`,
          }}
        >
          <div className="flex items-center gap-2">
            {zone.notifyEnabled
              ? <Bell size={12} style={{ color: isOverdue ? "#F85525" : isDueSoon ? "#F0943A" : "#028391" }} />
              : <BellOff size={12} className="text-muted-foreground" />}
            <span className="text-xs font-semibold" style={{ color: isOverdue ? "#F85525" : isDueSoon ? "#F0943A" : "inherit" }}>
              {isOverdue ? "⚠ Overdue: " : isDueSoon ? "Soon: " : "Check back: "}
              {checkDate.toLocaleDateString("en-US", { month: "short", day: "numeric" })}
            </span>
          </div>
          {zone.lastChecked && (
            <span className="text-xs text-muted-foreground">Last: {new Date(zone.lastChecked).toLocaleDateString("en-US", { month: "short", day: "numeric" })}</span>
          )}
        </div>

        {/* Tags */}
        {zone.tags.length > 0 && (
          <div className="flex flex-wrap gap-1.5 mb-3">
            {zone.tags.map((t) => (
              <span key={t} className="text-xs px-2 py-0.5 rounded-lg"
                style={{ background: "rgba(1,32,78,0.08)", color: "rgba(1,32,78,0.6)", fontWeight: 500 }}>
                {t}
              </span>
            ))}
          </div>
        )}

        {/* Actions */}
        <div className="flex gap-1.5 flex-wrap">
          <button
            onClick={onQuickReport}
            className="flex items-center gap-1.5 px-3 py-1.5 rounded-lg text-xs font-semibold transition-all hover:opacity-90"
            style={{ background: "#028391", color: "white", boxShadow: "2px 2px 0 rgba(1,32,78,0.15)" }}
          >
            <FileText size={11} /> File Report
          </button>
          <button
            onClick={onMarkChecked}
            className="flex items-center gap-1.5 px-3 py-1.5 rounded-lg text-xs font-semibold border-2 transition-all hover:bg-primary/10"
            style={{ borderColor: "rgba(2,131,145,0.3)" }}
          >
            <CheckCircle2 size={11} /> Checked Now
          </button>
          <button onClick={onEdit}
            className="px-3 py-1.5 rounded-lg text-xs font-semibold border-2 transition-all hover:bg-primary/10"
            style={{ borderColor: "rgba(2,131,145,0.25)" }}>
            Edit
          </button>
          <button onClick={onDelete}
            className="px-3 py-1.5 rounded-lg text-xs font-semibold border-2 transition-all hover:bg-destructive/10 hover:border-destructive/50"
            style={{ borderColor: "rgba(2,131,145,0.2)", color: "#F85525" }}>
            <Trash2 size={11} />
          </button>
        </div>
      </div>
    </div>
  );
}

// ─── Main Page ─────────────────────────────────────────────────────────────────

export default function NeighborhoodWatch() {
  const [zones, setZones] = useState<WatchZone[]>(() => getZones());
  const [showModal, setShowModal] = useState(false);
  const [editZone, setEditZone] = useState<WatchZone | null>(null);
  const [filterStatus, setFilterStatus] = useState<"all" | WatchZone["status"]>("all");
  const [, setLocation] = useLocation();

  const [subs, setSubs] = useState<string[]>(() => getSubs());
  const [copiedFeedId, setCopiedFeedId] = useState<string | null>(null);
  const [showAllSubs, setShowAllSubs] = useState(false);

  function toggleSub(neighborhood: string) {
    const next = subs.includes(neighborhood)
      ? subs.filter((s) => s !== neighborhood)
      : [...subs, neighborhood];
    saveSubs(next);
    setSubs(next);
  }

  function handleFeedShare(r: Report) {
    navigator.clipboard.writeText(buildShareUrl(r));
    setCopiedFeedId(r.id);
    setTimeout(() => setCopiedFeedId(null), 2500);
  }

  function handleFeedFile(r: Report) {
    sessionStorage.setItem("voicemap_prefill", JSON.stringify({
      location: r.location,
      neighborhood: r.neighborhood,
    }));
    setLocation("/submit");
  }

  const reports = getReports();

  const overdueCount = zones.filter((z) => {
    const d = new Date(z.checkBackDate + "T12:00:00");
    const t = new Date(); t.setHours(0, 0, 0, 0);
    return d < t && z.status !== "resolved" && z.notifyEnabled;
  }).length;

  function getReportCount(zone: WatchZone) {
    const addr = zone.address.toLowerCase();
    const nb = zone.neighborhood.toLowerCase();
    return reports.filter((r) =>
      r.location?.toLowerCase().includes(addr) ||
      r.neighborhood?.toLowerCase().includes(nb)
    ).length;
  }

  function handleSave(z: WatchZone) {
    const all = getZones();
    const idx = all.findIndex((x) => x.id === z.id);
    if (idx >= 0) all[idx] = z; else all.unshift(z);
    saveZones(all);
    setZones(getZones());
    setShowModal(false);
    setEditZone(null);
  }

  function handleDelete(id: string) {
    const next = zones.filter((z) => z.id !== id);
    saveZones(next);
    setZones(next);
  }

  function handleMarkChecked(zone: WatchZone) {
    const next = new Date();
    next.setDate(next.getDate() + 7);
    handleSave({
      ...zone,
      lastChecked: new Date().toISOString(),
      checkBackDate: next.toISOString().slice(0, 10),
    });
  }

  function handleQuickReport(zone: WatchZone) {
    sessionStorage.setItem("voicemap_prefill", JSON.stringify({
      location: zone.address,
      neighborhood: zone.neighborhood,
    }));
    setLocation("/submit");
  }

  const filtered = zones.filter((z) => filterStatus === "all" || z.status === filterStatus);

  const stats = {
    total: zones.length,
    active: zones.filter((z) => z.status === "active").length,
    resolved: zones.filter((z) => z.status === "resolved").length,
    high: zones.filter((z) => z.severity === "high").length,
  };

  return (
    <div className="relative min-h-screen pt-28 pb-16 px-4">
      <AnimatedBackground />
      <div className="relative z-10 max-w-5xl mx-auto">

        {/* Header */}
        <div className="flex items-start justify-between gap-6 mb-8">
          <div>
            <div className="flex items-center gap-3 mb-2">
              <h1 className="font-heading text-4xl font-bold">Neighborhood Watch</h1>
              {overdueCount > 0 && (
                <span className="flex items-center gap-1.5 px-3 py-1 rounded-lg text-sm font-bold"
                  style={{ background: "rgba(248,85,37,0.15)", border: "2px solid rgba(248,85,37,0.4)", color: "#F85525" }}>
                  <Bell size={13} /> {overdueCount} overdue
                </span>
              )}
            </div>
            <p className="text-muted-foreground max-w-xl">
              Mark specific addresses as concern zones, get check-back reminders, and quickly file reports — all linked to your documented observations.
            </p>
          </div>
          <div className="hidden sm:block flex-shrink-0">
            <KurzgesagtDog size={80} />
          </div>
        </div>

        {/* Stat strip */}
        <div className="grid grid-cols-2 sm:grid-cols-4 gap-3 mb-6">
          {[
            { label: "Total Zones",    value: stats.total,    color: "#028391" },
            { label: "Active Watches", value: stats.active,   color: "#F85525" },
            { label: "High Severity",  value: stats.high,     color: "#FAA968" },
            { label: "Resolved",       value: stats.resolved, color: "#22c55e" },
          ].map((s) => (
            <div key={s.label} className="glass-card rounded-2xl p-4 text-center">
              <p className="text-3xl font-heading font-black" style={{ color: s.color }}>{s.value}</p>
              <p className="text-xs font-semibold text-muted-foreground mt-0.5">{s.label}</p>
            </div>
          ))}
        </div>

        {/* Filter + Add */}
        <div className="flex items-center justify-between gap-4 mb-5 flex-wrap">
          <div className="flex items-center gap-2 flex-wrap">
            {(["all", "active", "monitoring", "resolved"] as const).map((f) => (
              <button
                key={f}
                onClick={() => setFilterStatus(f)}
                className="px-3 py-1.5 rounded-lg text-sm font-semibold capitalize transition-all border-2"
                style={
                  filterStatus === f
                    ? { background: "#028391", color: "white", borderColor: "#028391", boxShadow: "2px 2px 0 rgba(1,32,78,0.15)" }
                    : { borderColor: "rgba(2,131,145,0.25)", background: "transparent" }
                }
              >
                {f === "all" ? `All (${zones.length})` : `${f.charAt(0).toUpperCase() + f.slice(1)} (${zones.filter((z) => z.status === f).length})`}
              </button>
            ))}
          </div>
          <Button
            onClick={() => { setEditZone(null); setShowModal(true); }}
            className="rounded-xl gap-2 font-semibold"
            style={{ background: "#01204E", color: "white", border: "2px solid rgba(255,255,255,0.1)", boxShadow: "3px 3px 0 rgba(1,32,78,0.2)" }}
          >
            <Plus size={15} /> Add Watch Zone
          </Button>
        </div>

        {/* Zone list */}
        {filtered.length === 0 ? (
          <div
            className="rounded-2xl p-12 text-center"
            style={{ border: "2px dashed rgba(2,131,145,0.3)", background: "rgba(2,131,145,0.04)" }}
          >
            <div className="flex justify-center gap-4 mb-4 opacity-40">
              <KurzgesagtCat size={64} />
              <KurzgesagtDog size={64} />
            </div>
            <p className="font-heading font-bold text-lg mb-1">No watch zones yet</p>
            <p className="text-sm text-muted-foreground mb-5">
              Add a location you want to monitor and check back on regularly.
            </p>
            <Button
              onClick={() => setShowModal(true)}
              className="rounded-xl gap-2 font-semibold"
              style={{ background: "#028391", color: "white", boxShadow: "3px 3px 0 rgba(1,32,78,0.15)" }}
            >
              <Plus size={15} /> Add Your First Watch Zone
            </Button>
          </div>
        ) : (
          <div className="grid sm:grid-cols-2 gap-4">
            {filtered.map((zone) => (
              <ZoneCard
                key={zone.id}
                zone={zone}
                reportCount={getReportCount(zone)}
                onEdit={() => { setEditZone(zone); setShowModal(true); }}
                onDelete={() => handleDelete(zone.id)}
                onMarkChecked={() => handleMarkChecked(zone)}
                onQuickReport={() => handleQuickReport(zone)}
              />
            ))}
          </div>
        )}

        {/* ── Alert Feed ─────────────────────────────────────────────────── */}
        {(() => {
          const feedReports = subs.length > 0
            ? [...reports]
                .filter((r) => subs.some((s) => r.neighborhood?.toLowerCase() === s.toLowerCase()))
                .sort((a, b) => new Date(b.createdAt).getTime() - new Date(a.createdAt).getTime())
            : [];
          const visibleNeighborhoods = showAllSubs ? FRESNO_NEIGHBORHOODS : FRESNO_NEIGHBORHOODS.slice(0, 12);

          return (
            <div className="mt-8 glass-card rounded-2xl p-6">
              {/* Feed header */}
              <div className="flex items-center justify-between gap-3 mb-5">
                <div className="flex items-center gap-3">
                  <div
                    className="w-9 h-9 rounded-xl flex items-center justify-center"
                    style={{ background: "rgba(248,85,37,0.12)", color: "#F85525" }}
                  >
                    <Rss size={16} />
                  </div>
                  <div>
                    <h2 className="font-heading font-bold text-lg leading-none">My Alert Feed</h2>
                    <p className="text-xs text-muted-foreground mt-0.5">Reports from neighborhoods you follow</p>
                  </div>
                </div>
                {subs.length > 0 && (
                  <span
                    className="text-xs font-bold px-3 py-1 rounded-full"
                    style={{ background: "rgba(248,85,37,0.12)", color: "#F85525" }}
                  >
                    {subs.length} following
                  </span>
                )}
              </div>

              {/* Neighborhood subscription picker */}
              <div
                className="rounded-xl p-4 mb-5"
                style={{ background: "rgba(1,32,78,0.03)", border: "1.5px solid rgba(2,131,145,0.18)" }}
              >
                <p className="text-xs font-semibold uppercase tracking-wide text-muted-foreground mb-3">
                  Follow Neighborhoods
                </p>
                <div className="flex flex-wrap gap-2">
                  {visibleNeighborhoods.map((nb) => {
                    const active = subs.includes(nb);
                    return (
                      <button
                        key={nb}
                        onClick={() => toggleSub(nb)}
                        className="text-xs font-semibold px-3 py-1.5 rounded-xl transition-all"
                        style={
                          active
                            ? { background: "#028391", color: "#fff", boxShadow: "0 2px 8px rgba(2,131,145,0.3)" }
                            : { background: "rgba(1,32,78,0.06)", color: "rgba(1,32,78,0.65)", border: "1.5px solid rgba(2,131,145,0.2)" }
                        }
                      >
                        {active && <span className="mr-1">✓</span>}{nb}
                      </button>
                    );
                  })}
                  <button
                    onClick={() => setShowAllSubs(!showAllSubs)}
                    className="text-xs font-semibold px-3 py-1.5 rounded-xl transition-all"
                    style={{ background: "transparent", color: "#028391", border: "1.5px dashed rgba(2,131,145,0.35)" }}
                  >
                    {showAllSubs ? "Show less" : `+${FRESNO_NEIGHBORHOODS.length - 12} more`}
                  </button>
                </div>
                {subs.length > 0 && (
                  <button
                    onClick={() => { saveSubs([]); setSubs([]); }}
                    className="mt-3 text-xs text-muted-foreground hover:text-destructive transition-colors underline underline-offset-2"
                  >
                    Clear all subscriptions
                  </button>
                )}
              </div>

              {/* Feed content */}
              {subs.length === 0 ? (
                <div className="text-center py-10">
                  <div className="flex justify-center gap-3 mb-3 opacity-30">
                    <KurzgesagtCat size={52} />
                    <KurzgesagtDog size={52} />
                  </div>
                  <p className="font-heading font-bold mb-1">No neighborhoods followed yet</p>
                  <p className="text-sm text-muted-foreground">
                    Tap any neighborhood above to follow it — matching reports will appear here.
                  </p>
                </div>
              ) : feedReports.length === 0 ? (
                <div className="text-center py-10">
                  <PawPrint size={32} className="mx-auto mb-3 opacity-25" />
                  <p className="font-heading font-bold mb-1">All clear in your areas</p>
                  <p className="text-sm text-muted-foreground">
                    No reports found for {subs.slice(0, 2).join(", ")}
                    {subs.length > 2 ? ` and ${subs.length - 2} more` : ""}.
                    New concerns will appear here automatically.
                  </p>
                </div>
              ) : (
                <div className="space-y-3">
                  <p className="text-xs font-semibold text-muted-foreground uppercase tracking-wide mb-1">
                    {feedReports.length} concern{feedReports.length !== 1 ? "s" : ""} in your areas — newest first
                  </p>
                  {feedReports.map((r) => (
                    <FeedItem
                      key={r.id}
                      report={r}
                      copied={copiedFeedId === r.id}
                      onShare={() => handleFeedShare(r)}
                      onFile={() => handleFeedFile(r)}
                    />
                  ))}
                </div>
              )}
            </div>
          );
        })()}

        {/* How it works */}
        <div
          className="mt-8 rounded-2xl p-5"
          style={{ border: "2px solid rgba(2,131,145,0.2)", background: "rgba(2,131,145,0.05)" }}
        >
          <p className="font-heading font-bold text-sm uppercase tracking-wide text-primary mb-4">How Neighborhood Watch Works</p>
          <div className="grid sm:grid-cols-3 gap-4">
            {[
              { num: "1", title: "Mark a Zone", desc: "Add any address or intersection in Fresno that you want to keep an eye on — even before you've seen a problem." },
              { num: "2", title: "Set a Reminder", desc: "Choose a check-back date. When it arrives, the zone shows as overdue so you remember to go look again." },
              { num: "3", title: "File & Escalate", desc: "Hit 'File Report' to open the submit form with the location pre-filled. Reports are automatically linked to the zone." },
            ].map((s) => (
              <div key={s.num} className="flex gap-3">
                <div
                  className="w-7 h-7 rounded-lg font-heading font-black text-sm flex items-center justify-center flex-shrink-0 mt-0.5"
                  style={{ background: "#028391", color: "white" }}
                >
                  {s.num}
                </div>
                <div>
                  <p className="font-semibold text-sm mb-0.5">{s.title}</p>
                  <p className="text-xs text-muted-foreground leading-relaxed">{s.desc}</p>
                </div>
              </div>
            ))}
          </div>
        </div>
      </div>

      {showModal && (
        <ZoneModal
          initial={editZone ?? undefined}
          onSave={handleSave}
          onClose={() => { setShowModal(false); setEditZone(null); }}
        />
      )}
    </div>
  );
}
