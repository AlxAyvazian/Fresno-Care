import { useState } from "react";
import { useLocation } from "wouter";
import {
  Copy, CheckCircle2, Printer, ArrowLeft, AlertTriangle,
  MapPin, Calendar, PawPrint, FileText, Share2,
} from "lucide-react";
import { KurzgesagtCat } from "@/components/KurzgesagtCat";
import { KurzgesagtDog } from "@/components/KurzgesagtDog";
import { decodeReport, buildShareUrl } from "@/lib/shareUtils";
import { STATUS_LABELS } from "@/lib/storage";

const DANGER_CONFIG = {
  yes:    { label: "⚠ Immediate Danger Reported", bg: "rgba(248,85,37,0.10)", color: "#F85525", border: "rgba(248,85,37,0.3)" },
  unsure: { label: "? Danger Status Unclear",       bg: "rgba(250,169,104,0.10)", color: "#D4883A", border: "rgba(250,169,104,0.4)" },
  no:     { label: "✓ Not in Immediate Danger",    bg: "rgba(2,131,145,0.08)", color: "#028391", border: "rgba(2,131,145,0.25)" },
};

function InfoRow({ icon, label, value }: { icon: React.ReactNode; label: string; value: string }) {
  return (
    <div className="flex items-start gap-3">
      <div className="w-7 h-7 rounded-lg flex items-center justify-center flex-shrink-0 mt-0.5"
        style={{ background: "rgba(2,131,145,0.10)", color: "#028391" }}>
        {icon}
      </div>
      <div>
        <p className="text-xs text-muted-foreground font-medium">{label}</p>
        <p className="text-sm font-semibold">{value}</p>
      </div>
    </div>
  );
}

export default function ShareReport() {
  const [, navigate] = useLocation();
  const [copiedLink, setCopiedLink] = useState(false);
  const [copiedMsg, setCopiedMsg] = useState<string | null>(null);

  // Parse ?r= from the URL
  const params = new URLSearchParams(window.location.search);
  const encoded = params.get("r") ?? "";
  const report = decodeReport(encoded);

  if (!report) {
    return (
      <div className="min-h-screen pt-32 pb-16 px-4 flex flex-col items-center justify-center text-center">
        <div className="glass-card rounded-3xl p-10 max-w-md">
          <AlertTriangle size={36} className="mx-auto mb-4" style={{ color: "#F85525" }} />
          <h2 className="font-heading text-2xl font-bold mb-2">Invalid Share Link</h2>
          <p className="text-muted-foreground text-sm mb-6">
            This link appears to be broken or expired. Share links encode the full report
            in the URL and do not expire, so this usually means the link was truncated.
          </p>
          <button
            onClick={() => navigate("/dashboard")}
            className="inline-flex items-center gap-2 px-5 py-2.5 rounded-xl text-sm font-semibold text-white"
            style={{ background: "#028391" }}
          >
            <ArrowLeft size={14} /> Go to Dashboard
          </button>
        </div>
      </div>
    );
  }

  const dangerCfg = DANGER_CONFIG[report.inDanger];
  const animal = report.animalType === "cat" ? "🐱" : report.animalType === "dog" ? "🐶" : "🐾";
  const dateObs = new Date(report.dateObserved).toLocaleDateString("en-US", {
    weekday: "long", year: "numeric", month: "long", day: "numeric",
  });
  const dateCreated = new Date(report.createdAt).toLocaleDateString("en-US", {
    year: "numeric", month: "long", day: "numeric",
  });
  const shareUrl = buildShareUrl(report);

  function copyLink() {
    navigator.clipboard.writeText(shareUrl);
    setCopiedLink(true);
    setTimeout(() => setCopiedLink(false), 2500);
  }

  function copyMsg(key: string, text: string) {
    navigator.clipboard.writeText(text);
    setCopiedMsg(key);
    setTimeout(() => setCopiedMsg(null), 2500);
  }

  const templates = [
    {
      id: "animal-control",
      title: "Animal Control",
      accent: "#028391",
      light: "rgba(2,131,145,0.08)",
      text: `Subject: Animal Welfare Concern — ${report.neighborhood}, Fresno\n\nI am sharing a documented animal welfare concern at ${report.location}, ${report.neighborhood}. The concern was observed on ${dateObs} and involves ${report.count} ${report.animalType}(s). Danger assessment: ${report.inDanger.toUpperCase()}. Concern types: ${report.concernTypes.join(", ")}. Full report link: ${shareUrl}\n\nReport ID: ${report.id}`,
    },
    {
      id: "council",
      title: "City Council",
      accent: "#FAA968",
      light: "rgba(250,169,104,0.09)",
      text: `Subject: Documented Animal Welfare Concern — ${report.neighborhood}\n\nI am a Fresno resident sharing a documented animal welfare concern that requires city-level attention. Location: ${report.location}, ${report.neighborhood}. Observed: ${dateObs}. Full details: ${shareUrl}\n\nI am requesting confirmation of any prior reports at this location and the status of any response. Report ID: ${report.id}`,
    },
    {
      id: "media",
      title: "Media Tip",
      accent: "#F85525",
      light: "rgba(248,85,37,0.07)",
      text: `Media Tip — Animal Welfare, Fresno\n\nDocumented concern in ${report.neighborhood}, Fresno involving ${report.count} stray ${report.animalType}(s) observed ${dateObs}. Concern: ${report.concernTypes.join(", ")}. Agency response has been limited. Full details: ${shareUrl}`,
    },
  ];

  return (
    <div className="min-h-screen pt-24 pb-16 px-4">
      <div className="max-w-2xl mx-auto">

        {/* Back nav */}
        <button
          onClick={() => navigate("/dashboard")}
          className="inline-flex items-center gap-1.5 text-sm font-medium text-muted-foreground hover:text-foreground transition-colors mb-6"
        >
          <ArrowLeft size={14} /> Back to Dashboard
        </button>

        {/* ── Main report card ── */}
        <div
          className="rounded-3xl p-8 mb-5"
          style={{
            background: "rgba(255,252,243,0.96)",
            boxShadow: "0 4px 24px rgba(1,32,78,0.09), 0 8px 40px rgba(1,32,78,0.07)",
          }}
        >
          {/* Header */}
          <div className="flex items-start gap-4 mb-6">
            <div className="flex-1">
              <div
                className="inline-flex items-center gap-1.5 px-3 py-1 rounded-full text-xs font-semibold mb-3"
                style={{ background: "rgba(2,131,145,0.12)", color: "#028391" }}
              >
                <PawPrint size={11} /> Shared Animal Welfare Concern
              </div>
              <h1 className="font-heading text-2xl font-bold mb-1 capitalize">
                {animal} {report.count} {report.animalType}{report.count > 1 ? "s" : ""} — {report.neighborhood}
              </h1>
              <p className="text-sm text-muted-foreground">
                Documented via VoiceMap Fresno · Report ID: <code className="text-xs font-mono bg-muted px-1.5 py-0.5 rounded">{report.id}</code>
              </p>
            </div>
            <div className="flex-shrink-0 hidden sm:block">
              {report.animalType === "dog"
                ? <KurzgesagtDog size={80} />
                : <KurzgesagtCat size={80} />}
            </div>
          </div>

          {/* Danger badge */}
          <div
            className="flex items-center gap-2.5 px-4 py-3 rounded-2xl mb-6"
            style={{ background: dangerCfg.bg, border: `1.5px solid ${dangerCfg.border}` }}
          >
            <AlertTriangle size={16} style={{ color: dangerCfg.color }} />
            <span className="font-semibold text-sm" style={{ color: dangerCfg.color }}>
              {dangerCfg.label}
            </span>
          </div>

          {/* Info grid */}
          <div className="grid sm:grid-cols-2 gap-4 mb-6">
            <InfoRow icon={<MapPin size={13} />}    label="Location"    value={report.location} />
            <InfoRow icon={<MapPin size={13} />}    label="Neighbourhood" value={report.neighborhood} />
            <InfoRow icon={<Calendar size={13} />}  label="Date Observed" value={dateObs} />
            <InfoRow icon={<FileText size={13} />}  label="Status"        value={STATUS_LABELS[report.status]} />
          </div>

          {/* Concern types */}
          <div className="mb-5">
            <p className="text-xs font-semibold text-muted-foreground uppercase tracking-wide mb-2">Concern Types</p>
            <div className="flex flex-wrap gap-2">
              {report.concernTypes.map((t) => (
                <span
                  key={t}
                  className="px-3 py-1 rounded-xl text-xs font-medium capitalize"
                  style={{ background: "rgba(2,131,145,0.10)", color: "#028391" }}
                >
                  {t}
                </span>
              ))}
            </div>
          </div>

          {/* Description */}
          <div className="mb-5">
            <p className="text-xs font-semibold text-muted-foreground uppercase tracking-wide mb-2">Description</p>
            <p className="text-sm leading-relaxed">{report.description}</p>
          </div>

          {report.evidenceNotes && (
            <div className="mb-5">
              <p className="text-xs font-semibold text-muted-foreground uppercase tracking-wide mb-2">Evidence Notes</p>
              <p className="text-sm leading-relaxed text-muted-foreground">{report.evidenceNotes}</p>
            </div>
          )}

          {(report.agenciesContacted && report.agenciesContacted !== "None yet") && (
            <div className="mb-5">
              <p className="text-xs font-semibold text-muted-foreground uppercase tracking-wide mb-2">Agencies Contacted</p>
              <p className="text-sm">{report.agenciesContacted}</p>
              {report.responseReceived && (
                <p className="text-xs text-muted-foreground mt-1">Response: {report.responseReceived}</p>
              )}
            </div>
          )}

          {/* Disclaimer */}
          <div
            className="px-4 py-3 rounded-2xl text-xs text-muted-foreground leading-relaxed mt-4"
            style={{ background: "rgba(1,32,78,0.04)", border: "1px solid rgba(1,32,78,0.08)" }}
          >
            <strong>Disclaimer:</strong> This is a submitted concern documented by a Fresno resident. It is not a
            confirmed incident, legal finding, or official report. Information is based on direct observation only.
            Documented {dateCreated} via VoiceMap Fresno.
          </div>
        </div>

        {/* ── Action buttons ── */}
        <div className="flex flex-wrap gap-3 mb-6">
          <button
            onClick={copyLink}
            className="inline-flex items-center gap-2 px-5 py-2.5 rounded-xl text-sm font-semibold text-white transition-all"
            style={{
              background: copiedLink ? "#22c55e" : "#028391",
              boxShadow: copiedLink ? "0 3px 12px rgba(34,197,94,0.35)" : "0 3px 12px rgba(2,131,145,0.35)",
            }}
          >
            {copiedLink ? <CheckCircle2 size={15} /> : <Share2 size={15} />}
            {copiedLink ? "Link Copied!" : "Copy Share Link"}
          </button>

          <button
            onClick={() => window.print()}
            className="inline-flex items-center gap-2 px-5 py-2.5 rounded-xl text-sm font-semibold transition-all"
            style={{
              background: "rgba(1,32,78,0.07)",
              border: "1.5px solid rgba(1,32,78,0.12)",
            }}
          >
            <Printer size={15} /> Print / Save PDF
          </button>
        </div>

        {/* ── Ready-to-send message templates ── */}
        <div
          className="rounded-2xl px-5 py-4 mb-4"
          style={{
            background: "rgba(255,252,243,0.88)",
            boxShadow: "0 2px 10px rgba(1,32,78,0.06)",
          }}
        >
          <h3 className="font-heading font-bold text-sm mb-4 flex items-center gap-2">
            <Copy size={14} style={{ color: "#028391" }} />
            Ready-to-Send Messages
          </h3>
          <div className="grid sm:grid-cols-3 gap-3">
            {templates.map((t) => (
              <div
                key={t.id}
                className="rounded-xl p-4 flex flex-col gap-3"
                style={{ borderLeft: `3px solid ${t.accent}`, background: t.light }}
              >
                <span className="text-xs font-bold" style={{ color: t.accent }}>{t.title}</span>
                <p className="text-xs text-muted-foreground leading-relaxed flex-1 line-clamp-4">{t.text}</p>
                <button
                  onClick={() => copyMsg(t.id, t.text)}
                  className="flex items-center justify-center gap-1.5 py-1.5 rounded-lg text-xs font-semibold transition-all"
                  style={
                    copiedMsg === t.id
                      ? { background: t.accent, color: "#fff" }
                      : { background: "rgba(255,255,255,0.7)", color: t.accent, border: `1px solid ${t.accent}44` }
                  }
                >
                  {copiedMsg === t.id ? <CheckCircle2 size={11} /> : <Copy size={11} />}
                  {copiedMsg === t.id ? "Copied!" : "Copy"}
                </button>
              </div>
            ))}
          </div>
        </div>

        <p className="text-center text-xs text-muted-foreground">
          This link contains the full report data. No server needed — it works completely offline.
        </p>
      </div>
    </div>
  );
}
