import { useState, useRef } from "react";
import { Printer, Download, Copy, CheckCircle2, ArrowLeft, Plus, X } from "lucide-react";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { AnimatedBackground } from "@/components/AnimatedBackground";
import { KurzgesagtCat } from "@/components/KurzgesagtCat";
import { KurzgesagtDog } from "@/components/KurzgesagtDog";
import { getLostFoundPosts, type LostFoundPost } from "@/lib/lostfound";
import { useLocation } from "wouter";

const FLYER_COLORS = {
  lost: { bg: "#F85525", text: "white", border: "#C44020" },
  found: { bg: "#028391", text: "white", border: "#016570" },
  reunited: { bg: "#22c55e", text: "white", border: "#16a34a" },
};

interface FlyerData {
  status: "lost" | "found" | "reunited";
  petName: string;
  petType: "cat" | "dog" | "other";
  breed: string;
  color: string;
  neighborhood: string;
  lastSeen: string;
  dateSeen: string;
  description: string;
  contactName: string;
  contactPhone: string;
  contactEmail: string;
  reward: string;
  microchipped: boolean;
  collarDescription: string;
  photoBase64: string;
  tags: string[];
}

function makeTearStrips(phone: string, name: string, count = 8) {
  return Array.from({ length: count }, (_, i) => ({ id: i, phone, name }));
}

function PrintFlyer({ data }: { data: FlyerData }) {
  const colors = FLYER_COLORS[data.status];
  const strips = makeTearStrips(data.contactPhone, data.petName || "Pet");

  return (
    <div
      id="print-flyer"
      style={{
        width: "680px",
        fontFamily: "'Arial', sans-serif",
        background: "white",
        border: "1px solid #ddd",
        borderRadius: "12px",
        overflow: "hidden",
        boxShadow: "0 4px 24px rgba(0,0,0,0.12)",
      }}
    >
      {/* Header banner */}
      <div style={{ background: colors.bg, color: colors.text, padding: "24px 28px 20px", textAlign: "center" }}>
        <div style={{ fontSize: "52px", fontWeight: 900, letterSpacing: "6px", lineHeight: 1, textTransform: "uppercase" }}>
          {data.status === "lost" ? "⚠ LOST" : data.status === "found" ? "✔ FOUND" : "🎉 REUNITED"}
        </div>
        <div style={{ fontSize: "22px", fontWeight: 700, marginTop: "6px", textTransform: "capitalize" }}>
          {data.petType === "cat" ? "🐱" : data.petType === "dog" ? "🐶" : "🐾"} {data.petType}
        </div>
      </div>

      {/* Main content */}
      <div style={{ display: "flex", gap: "0", minHeight: "260px" }}>
        {/* Photo panel */}
        <div
          style={{
            width: "240px",
            flexShrink: 0,
            background: data.photoBase64 ? "transparent" : "#f5f5f5",
            display: "flex",
            alignItems: "center",
            justifyContent: "center",
            borderRight: "2px dashed #eee",
          }}
        >
          {data.photoBase64 ? (
            <img src={data.photoBase64} alt="Pet" style={{ width: "100%", height: "240px", objectFit: "cover" }} />
          ) : (
            <div style={{ textAlign: "center", color: "#ccc", padding: "20px" }}>
              <div style={{ fontSize: "64px" }}>{data.petType === "cat" ? "🐱" : data.petType === "dog" ? "🐶" : "🐾"}</div>
              <div style={{ fontSize: "11px", marginTop: "8px" }}>No photo provided</div>
            </div>
          )}
        </div>

        {/* Details panel */}
        <div style={{ flex: 1, padding: "20px 24px" }}>
          {data.petName && (
            <div style={{ fontSize: "28px", fontWeight: 800, color: "#01204E", marginBottom: "4px" }}>
              {data.petName}
            </div>
          )}
          {data.breed && (
            <div style={{ fontSize: "14px", color: "#555", marginBottom: "12px" }}>{data.breed}</div>
          )}

          <table style={{ width: "100%", borderCollapse: "collapse", fontSize: "13px" }}>
            <tbody>
              {data.color && (
                <tr>
                  <td style={{ fontWeight: 700, paddingRight: "10px", paddingBottom: "5px", color: "#333", whiteSpace: "nowrap" }}>Color:</td>
                  <td style={{ color: "#555", paddingBottom: "5px" }}>{data.color}</td>
                </tr>
              )}
              {data.lastSeen && (
                <tr>
                  <td style={{ fontWeight: 700, paddingRight: "10px", paddingBottom: "5px", color: "#333", whiteSpace: "nowrap" }}>Last seen:</td>
                  <td style={{ color: "#555", paddingBottom: "5px" }}>{data.lastSeen}</td>
                </tr>
              )}
              {data.dateSeen && (
                <tr>
                  <td style={{ fontWeight: 700, paddingRight: "10px", paddingBottom: "5px", color: "#333", whiteSpace: "nowrap" }}>Date:</td>
                  <td style={{ color: "#555", paddingBottom: "5px" }}>{new Date(data.dateSeen + "T12:00:00").toLocaleDateString("en-US", { weekday: "long", year: "numeric", month: "long", day: "numeric" })}</td>
                </tr>
              )}
              {data.neighborhood && (
                <tr>
                  <td style={{ fontWeight: 700, paddingRight: "10px", paddingBottom: "5px", color: "#333", whiteSpace: "nowrap" }}>Area:</td>
                  <td style={{ color: "#555", paddingBottom: "5px" }}>{data.neighborhood}, Fresno, CA</td>
                </tr>
              )}
              {data.collarDescription && (
                <tr>
                  <td style={{ fontWeight: 700, paddingRight: "10px", paddingBottom: "5px", color: "#333", whiteSpace: "nowrap" }}>Collar:</td>
                  <td style={{ color: "#555", paddingBottom: "5px" }}>{data.collarDescription}</td>
                </tr>
              )}
              <tr>
                <td style={{ fontWeight: 700, paddingRight: "10px", paddingBottom: "5px", color: "#333", whiteSpace: "nowrap" }}>Microchip:</td>
                <td style={{ color: "#555", paddingBottom: "5px" }}>{data.microchipped ? "Yes — please scan" : "Unknown"}</td>
              </tr>
            </tbody>
          </table>

          {data.description && (
            <div style={{ marginTop: "10px", fontSize: "12px", color: "#555", lineHeight: 1.5, borderTop: "1px solid #eee", paddingTop: "10px" }}>
              {data.description}
            </div>
          )}

          {data.tags.length > 0 && (
            <div style={{ marginTop: "8px", display: "flex", flexWrap: "wrap", gap: "4px" }}>
              {data.tags.map((t) => (
                <span key={t} style={{ background: "#f0f0f0", borderRadius: "999px", padding: "2px 8px", fontSize: "11px", color: "#555" }}>
                  {t}
                </span>
              ))}
            </div>
          )}
        </div>
      </div>

      {/* Contact / reward bar */}
      <div style={{ background: colors.bg, color: colors.text, padding: "16px 28px", display: "flex", alignItems: "center", justifyContent: "space-between", flexWrap: "wrap", gap: "12px" }}>
        <div>
          <div style={{ fontSize: "11px", opacity: 0.8, textTransform: "uppercase", letterSpacing: "1px" }}>Contact</div>
          <div style={{ fontSize: "17px", fontWeight: 800 }}>{data.contactPhone || data.contactEmail || "Contact info not provided"}</div>
          {data.contactName && <div style={{ fontSize: "13px", opacity: 0.85 }}>{data.contactName}</div>}
          {data.contactEmail && data.contactPhone && <div style={{ fontSize: "12px", opacity: 0.75 }}>{data.contactEmail}</div>}
        </div>
        {data.reward && (
          <div style={{ background: "rgba(0,0,0,0.2)", borderRadius: "8px", padding: "10px 16px", textAlign: "center" }}>
            <div style={{ fontSize: "11px", opacity: 0.8, textTransform: "uppercase", letterSpacing: "1px" }}>Reward</div>
            <div style={{ fontSize: "24px", fontWeight: 900 }}>{data.reward}</div>
          </div>
        )}
      </div>

      {/* Tear-off strips */}
      {data.contactPhone && (
        <div style={{ borderTop: "2px dashed #ccc", padding: "10px 4px 8px" }}>
          <div style={{ textAlign: "center", fontSize: "10px", color: "#aaa", marginBottom: "6px" }}>— tear off strips —</div>
          <div style={{ display: "flex", gap: "4px", justifyContent: "center", flexWrap: "wrap" }}>
            {strips.map((s) => (
              <div key={s.id} style={{
                writingMode: "vertical-rl",
                textOrientation: "mixed",
                transform: "rotate(180deg)",
                fontSize: "11px",
                padding: "8px 5px",
                border: `1px solid ${colors.bg}`,
                borderRadius: "4px",
                color: colors.bg,
                fontWeight: 700,
                letterSpacing: "0.5px",
                minHeight: "80px",
                display: "flex",
                alignItems: "center",
                justifyContent: "center",
                gap: "4px",
              }}>
                {data.status === "lost" ? "LOST" : "FOUND"} {s.name} · {s.phone}
              </div>
            ))}
          </div>
        </div>
      )}

      {/* Footer */}
      <div style={{ padding: "8px 24px 10px", textAlign: "center", fontSize: "10px", color: "#bbb", borderTop: "1px solid #f0f0f0" }}>
        Please also report sightings to Fresno Animal Center (559) 621-5795 · Generated by VoiceMap Fresno
      </div>
    </div>
  );
}

export default function FlyerGenerator() {
  const [, setLocation] = useLocation();
  const existingPosts = getLostFoundPosts().filter((p) => p.status !== "reunited");
  const [selectedPostId, setSelectedPostId] = useState<string>("manual");
  const [copied, setCopied] = useState(false);
  const [tagInput, setTagInput] = useState("");
  const fileRef = useRef<HTMLInputElement>(null);

  const [data, setData] = useState<FlyerData>({
    status: "lost",
    petName: "",
    petType: "cat",
    breed: "",
    color: "",
    neighborhood: "",
    lastSeen: "",
    dateSeen: new Date().toISOString().slice(0, 10),
    description: "",
    contactName: "",
    contactPhone: "",
    contactEmail: "",
    reward: "",
    microchipped: false,
    collarDescription: "",
    photoBase64: "",
    tags: [],
  });

  function loadFromPost(post: LostFoundPost) {
    setData({
      status: post.status as "lost" | "found",
      petName: post.petName || "",
      petType: post.petType === "rabbit" || post.petType === "bird" ? "other" : post.petType,
      breed: post.breed || "",
      color: post.color,
      neighborhood: post.neighborhood,
      lastSeen: post.lastSeenAddress,
      dateSeen: post.dateSeen,
      description: post.description,
      contactName: post.contactName,
      contactPhone: post.contactPhone || "",
      contactEmail: post.contactEmail || "",
      reward: post.reward || "",
      microchipped: post.microchipped || false,
      collarDescription: post.collarDescription || "",
      photoBase64: post.photoBase64 || "",
      tags: post.tags,
    });
  }

  function handlePhoto(e: React.ChangeEvent<HTMLInputElement>) {
    const file = e.target.files?.[0];
    if (!file) return;
    const reader = new FileReader();
    reader.onload = (ev) => setData({ ...data, photoBase64: ev.target?.result as string });
    reader.readAsDataURL(file);
  }

  function addTag() {
    const t = tagInput.trim().toLowerCase().replace(/\s+/g, "-");
    if (t && !data.tags.includes(t)) setData({ ...data, tags: [...data.tags, t] });
    setTagInput("");
  }

  function handlePrint() {
    const flyer = document.getElementById("print-flyer");
    if (!flyer) return;
    const printWin = window.open("", "_blank", "width=800,height=900");
    if (!printWin) return;
    printWin.document.write(`
      <!DOCTYPE html>
      <html>
      <head>
        <title>${data.status === "lost" ? "LOST" : "FOUND"} ${data.petType}${data.petName ? " — " + data.petName : ""} — Fresno CA</title>
        <style>
          body { margin: 20px; font-family: Arial, sans-serif; }
          @media print {
            body { margin: 0; }
            @page { margin: 0.5in; }
          }
        </style>
      </head>
      <body>${flyer.outerHTML}</body>
      </html>
    `);
    printWin.document.close();
    printWin.focus();
    setTimeout(() => { printWin.print(); }, 400);
  }

  function handleCopyText() {
    const text = [
      `${data.status.toUpperCase()} ${data.petType.toUpperCase()}${data.petName ? ": " + data.petName : ""}`,
      data.breed && `Breed: ${data.breed}`,
      `Color: ${data.color}`,
      data.lastSeen && `Last seen: ${data.lastSeen}${data.neighborhood ? ", " + data.neighborhood : ""}, Fresno, CA`,
      data.dateSeen && `Date: ${new Date(data.dateSeen + "T12:00:00").toLocaleDateString()}`,
      data.collarDescription && `Collar: ${data.collarDescription}`,
      data.microchipped && "Microchipped: Yes — please scan",
      data.description && `\n${data.description}`,
      data.reward && `\n💰 REWARD: ${data.reward}`,
      `\n📞 Contact: ${data.contactPhone || data.contactEmail || data.contactName}`,
      data.contactName && `Name: ${data.contactName}`,
      "\nPlease also report sightings to Fresno Animal Center: (559) 621-5795",
      "\n— Generated by VoiceMap Fresno (free civic tool) —",
    ].filter(Boolean).join("\n");
    navigator.clipboard.writeText(text);
    setCopied(true);
    setTimeout(() => setCopied(false), 2500);
  }

  const set = (k: keyof FlyerData, v: FlyerData[keyof FlyerData]) =>
    setData((prev) => ({ ...prev, [k]: v }));

  return (
    <div className="relative min-h-screen pt-28 pb-16 px-4">
      <AnimatedBackground />
      <div className="relative z-10 max-w-7xl mx-auto">

        {/* Header */}
        <div className="flex items-center gap-4 mb-8">
          <button onClick={() => setLocation("/lostfound")} className="p-2 rounded-xl hover:bg-muted transition-colors">
            <ArrowLeft size={18} />
          </button>
          <div>
            <h1 className="font-heading text-4xl font-bold mb-1">Flyer Generator</h1>
            <p className="text-muted-foreground">Create a printable lost or found pet flyer with tear-off contact strips.</p>
          </div>
        </div>

        <div className="grid lg:grid-cols-2 gap-8">
          {/* Left: Form */}
          <div className="space-y-5">

            {/* Load from existing post */}
            {existingPosts.length > 0 && (
              <div className="glass-card rounded-2xl p-5">
                <p className="text-sm font-semibold mb-3">Load from a Lost & Found post</p>
                <select
                  value={selectedPostId}
                  onChange={(e) => {
                    setSelectedPostId(e.target.value);
                    if (e.target.value !== "manual") {
                      const p = existingPosts.find((x) => x.id === e.target.value);
                      if (p) loadFromPost(p);
                    }
                  }}
                  className="w-full h-10 px-3 rounded-xl border border-input bg-background text-sm focus:outline-none focus:ring-2 focus:ring-ring"
                >
                  <option value="manual">— Enter manually —</option>
                  {existingPosts.map((p) => (
                    <option key={p.id} value={p.id}>
                      {p.status.toUpperCase()}: {p.petName || p.color + " " + p.petType} — {p.neighborhood}
                    </option>
                  ))}
                </select>
              </div>
            )}

            {/* Basic info */}
            <div className="glass-card rounded-2xl p-5 space-y-4">
              <p className="text-sm font-semibold">Basic Information</p>
              <div className="grid grid-cols-2 gap-3">
                <div>
                  <label className="text-xs font-medium block mb-1">Status</label>
                  <select value={data.status} onChange={(e) => set("status", e.target.value as FlyerData["status"])}
                    className="w-full h-10 px-3 rounded-xl border border-input bg-background text-sm focus:outline-none focus:ring-2 focus:ring-ring">
                    <option value="lost">Lost</option>
                    <option value="found">Found</option>
                    <option value="reunited">Reunited</option>
                  </select>
                </div>
                <div>
                  <label className="text-xs font-medium block mb-1">Animal Type</label>
                  <select value={data.petType} onChange={(e) => set("petType", e.target.value as FlyerData["petType"])}
                    className="w-full h-10 px-3 rounded-xl border border-input bg-background text-sm focus:outline-none focus:ring-2 focus:ring-ring">
                    <option value="cat">Cat</option>
                    <option value="dog">Dog</option>
                    <option value="other">Other</option>
                  </select>
                </div>
              </div>
              <div className="grid sm:grid-cols-2 gap-3">
                <div>
                  <label className="text-xs font-medium block mb-1">Pet Name</label>
                  <Input value={data.petName} onChange={(e) => set("petName", e.target.value)} placeholder="e.g. Luna" className="rounded-xl" />
                </div>
                <div>
                  <label className="text-xs font-medium block mb-1">Breed</label>
                  <Input value={data.breed} onChange={(e) => set("breed", e.target.value)} placeholder="e.g. Domestic Shorthair" className="rounded-xl" />
                </div>
              </div>
              <div>
                <label className="text-xs font-medium block mb-1">Color / Markings</label>
                <Input value={data.color} onChange={(e) => set("color", e.target.value)} placeholder="e.g. Grey tabby with white chest" className="rounded-xl" />
              </div>
              <div className="grid sm:grid-cols-2 gap-3">
                <div>
                  <label className="text-xs font-medium block mb-1">Neighborhood</label>
                  <Input value={data.neighborhood} onChange={(e) => set("neighborhood", e.target.value)} placeholder="e.g. Tower District" className="rounded-xl" />
                </div>
                <div>
                  <label className="text-xs font-medium block mb-1">Date Seen</label>
                  <Input type="date" value={data.dateSeen} onChange={(e) => set("dateSeen", e.target.value)} className="rounded-xl" />
                </div>
              </div>
              <div>
                <label className="text-xs font-medium block mb-1">Last Seen Address / Location</label>
                <Input value={data.lastSeen} onChange={(e) => set("lastSeen", e.target.value)} placeholder="e.g. E Olive Ave & N Van Ness Ave" className="rounded-xl" />
              </div>
              <div className="grid sm:grid-cols-2 gap-3">
                <div>
                  <label className="text-xs font-medium block mb-1">Collar Description</label>
                  <Input value={data.collarDescription} onChange={(e) => set("collarDescription", e.target.value)} placeholder="e.g. Pink collar, heart tag" className="rounded-xl" />
                </div>
                <div>
                  <label className="text-xs font-medium block mb-1">Reward</label>
                  <Input value={data.reward} onChange={(e) => set("reward", e.target.value)} placeholder="e.g. $200" className="rounded-xl" />
                </div>
              </div>
              <div className="flex items-center gap-3">
                <input type="checkbox" id="mc" checked={data.microchipped} onChange={(e) => set("microchipped", e.target.checked)} className="w-4 h-4 rounded" />
                <label htmlFor="mc" className="text-sm">Microchipped</label>
              </div>
              <div>
                <label className="text-xs font-medium block mb-1">Description</label>
                <textarea value={data.description} onChange={(e) => set("description", e.target.value)} rows={3}
                  placeholder="Physical description, temperament, circumstances…"
                  className="w-full rounded-xl border border-input bg-background px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-ring resize-none" />
              </div>
            </div>

            {/* Contact */}
            <div className="glass-card rounded-2xl p-5 space-y-3">
              <p className="text-sm font-semibold">Contact Information</p>
              <div className="grid sm:grid-cols-3 gap-3">
                <div>
                  <label className="text-xs font-medium block mb-1">Name</label>
                  <Input value={data.contactName} onChange={(e) => set("contactName", e.target.value)} placeholder="Your name" className="rounded-xl" />
                </div>
                <div>
                  <label className="text-xs font-medium block mb-1">Phone</label>
                  <Input value={data.contactPhone} onChange={(e) => set("contactPhone", e.target.value)} placeholder="(559) 555-0000" className="rounded-xl" />
                </div>
                <div>
                  <label className="text-xs font-medium block mb-1">Email</label>
                  <Input type="email" value={data.contactEmail} onChange={(e) => set("contactEmail", e.target.value)} placeholder="you@email.com" className="rounded-xl" />
                </div>
              </div>
            </div>

            {/* Photo + tags */}
            <div className="glass-card rounded-2xl p-5 space-y-3">
              <p className="text-sm font-semibold">Photo & Tags</p>
              <div
                className="rounded-xl border-2 border-dashed border-border/50 p-4 flex flex-col items-center gap-2 cursor-pointer hover:border-primary/50 transition-colors"
                onClick={() => fileRef.current?.click()}
              >
                {data.photoBase64 ? (
                  <img src={data.photoBase64} alt="pet" className="max-h-32 rounded-xl object-contain" />
                ) : (
                  <>
                    <div className="flex gap-2 opacity-40">
                      <KurzgesagtCat size={48} /> <KurzgesagtDog size={48} />
                    </div>
                    <p className="text-sm text-muted-foreground">Click to upload photo</p>
                  </>
                )}
              </div>
              <input ref={fileRef} type="file" accept="image/*" className="hidden" onChange={handlePhoto} />

              <div className="flex gap-2">
                <Input value={tagInput} onChange={(e) => setTagInput(e.target.value)}
                  onKeyDown={(e) => { if (e.key === "Enter") { e.preventDefault(); addTag(); } }}
                  placeholder="Add a tag (indoor-only, shy…)" className="rounded-xl" />
                <Button type="button" variant="outline" className="rounded-xl px-3" onClick={addTag}><Plus size={14} /></Button>
              </div>
              <div className="flex flex-wrap gap-1.5">
                {data.tags.map((t) => (
                  <span key={t} className="flex items-center gap-1 text-xs bg-primary/10 text-primary rounded-full px-2.5 py-0.5">
                    {t}
                    <button onClick={() => setData({ ...data, tags: data.tags.filter((x) => x !== t) })}><X size={10} /></button>
                  </span>
                ))}
              </div>
            </div>

            {/* Actions */}
            <div className="flex gap-3 flex-wrap">
              <Button onClick={handlePrint} className="rounded-xl gap-2 flex-1" style={{ background: "#028391", color: "white" }}>
                <Printer size={15} /> Print Flyer
              </Button>
              <Button onClick={handleCopyText} variant="outline" className="rounded-xl gap-2 flex-1">
                {copied ? <CheckCircle2 size={15} className="text-primary" /> : <Copy size={15} />}
                {copied ? "Copied!" : "Copy Text"}
              </Button>
            </div>
          </div>

          {/* Right: Preview */}
          <div className="sticky top-24">
            <div className="flex items-center justify-between mb-3">
              <p className="text-sm font-semibold text-muted-foreground">Live Preview</p>
              <Button onClick={handlePrint} size="sm" variant="outline" className="rounded-xl gap-2">
                <Download size={13} /> Print / Save PDF
              </Button>
            </div>
            <div className="overflow-x-auto">
              <PrintFlyer data={data} />
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
