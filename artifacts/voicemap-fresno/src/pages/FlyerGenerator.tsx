import { useRef, useState } from "react";
import {
  ArrowLeft,
  CheckCircle2,
  Copy,
  Download,
  MapPin,
  Phone,
  Plus,
  Printer,
  X,
} from "lucide-react";
import { useLocation } from "wouter";
import { AnimalArt, artForPet } from "@/components/AnimalArt";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { getLostFoundPosts, type LostFoundPost } from "@/lib/lostfound";

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

const STATUS_STYLE = {
  lost: {
    label: "LOST PET",
    accent: "#B24F4B",
    pale: "#F7E4DE",
    message: "Please help bring this pet home",
  },
  found: {
    label: "FOUND PET",
    accent: "#326F8E",
    pale: "#DDECF2",
    message: "Help identify this pet's family",
  },
  reunited: {
    label: "REUNITED",
    accent: "#39775F",
    pale: "#DDECE4",
    message: "This pet has returned home",
  },
} as const;

function formatDate(value: string) {
  if (!value) return "Not provided";
  return new Date(`${value}T12:00:00`).toLocaleDateString("en-US", {
    weekday: "short",
    year: "numeric",
    month: "long",
    day: "numeric",
  });
}

function makeTearStrips(phone: string, name: string, count = 8) {
  return Array.from({ length: count }, (_, index) => ({ id: index, phone, name }));
}

function PrintFlyer({ data }: { data: FlyerData }) {
  const status = STATUS_STYLE[data.status];
  const strips = makeTearStrips(data.contactPhone, data.petName || "Pet");
  const fallbackVariant = artForPet(data.petType, data.status === "found");
  const primaryContact = data.contactPhone || data.contactEmail || "Contact information not provided";

  const detailRows = [
    ["Breed", data.breed || "Not specified"],
    ["Color / markings", data.color || "Not specified"],
    ["Date", formatDate(data.dateSeen)],
    ["Microchip", data.microchipped ? "Yes — please scan" : "Unknown"],
    ["Collar", data.collarDescription || "Not specified"],
  ];

  return (
    <div
      id="print-flyer"
      style={{
        width: 680,
        overflow: "hidden",
        border: "2px solid #294866",
        borderRadius: 18,
        background: "#FDFAE0",
        color: "#243A52",
        fontFamily: "'DM Sans', Arial, sans-serif",
        boxShadow: "0 18px 50px rgba(24, 44, 67, .18)",
      }}
    >
      <header
        style={{
          display: "grid",
          gridTemplateColumns: "1fr auto",
          alignItems: "center",
          gap: 20,
          padding: "24px 28px",
          color: "#F8FBFF",
          background: "linear-gradient(135deg, #1F3650 0%, #315F89 72%, #477DAA 100%)",
          borderBottom: `8px solid ${status.accent}`,
        }}
      >
        <div>
          <div
            style={{
              display: "inline-block",
              marginBottom: 10,
              border: "1px solid rgba(255,255,255,.45)",
              borderRadius: 999,
              padding: "6px 11px",
              color: "#1F3650",
              background: "#F8E2AA",
              fontSize: 12,
              fontWeight: 900,
              letterSpacing: 1.6,
            }}
          >
            {status.label}
          </div>
          <div style={{ fontFamily: "Manrope, Arial, sans-serif", fontSize: 38, fontWeight: 900, lineHeight: 1.05 }}>
            {data.petName || `${data.petType === "other" ? "Pet" : data.petType} needs help`}
          </div>
          <div style={{ marginTop: 8, color: "#DDEBFA", fontSize: 15, fontWeight: 650 }}>{status.message}</div>
        </div>
        {data.reward && (
          <div
            style={{
              minWidth: 120,
              border: "1px solid rgba(255,255,255,.45)",
              borderRadius: 16,
              padding: "12px 16px",
              textAlign: "center",
              color: "#263A50",
              background: "#F8E2AA",
            }}
          >
            <div style={{ fontSize: 10, fontWeight: 900, letterSpacing: 1.5 }}>REWARD</div>
            <div style={{ marginTop: 2, fontSize: 25, fontWeight: 900 }}>{data.reward}</div>
          </div>
        )}
      </header>

      <main style={{ padding: 22 }}>
        <div style={{ display: "grid", gridTemplateColumns: "270px 1fr", gap: 18 }}>
          <div
            style={{
              minHeight: 300,
              overflow: "hidden",
              border: "1px solid #A8C7DF",
              borderRadius: 16,
              background: "linear-gradient(145deg, #CAE7FF, #FAEDCD)",
              display: "flex",
              alignItems: "center",
              justifyContent: "center",
            }}
          >
            {data.photoBase64 ? (
              <img src={data.photoBase64} alt="Pet" style={{ width: "100%", height: 300, objectFit: "cover" }} />
            ) : (
              <div style={{ display: "grid", placeItems: "center", padding: 18, textAlign: "center" }}>
                <AnimalArt variant={fallbackVariant} size={190} />
                <div style={{ marginTop: 6, color: "#546D86", fontSize: 11, fontWeight: 700 }}>Add a clear recent photo when possible</div>
              </div>
            )}
          </div>

          <section
            style={{
              border: "1px solid #B7CCDD",
              borderRadius: 16,
              padding: 18,
              background: "rgba(255,255,255,.62)",
            }}
          >
            <div style={{ marginBottom: 12, fontFamily: "Manrope, Arial, sans-serif", fontSize: 18, fontWeight: 900 }}>
              Identifying information
            </div>
            <div style={{ display: "grid", gap: 8 }}>
              {detailRows.map(([label, value]) => (
                <div
                  key={label}
                  style={{
                    display: "grid",
                    gridTemplateColumns: "112px 1fr",
                    gap: 10,
                    borderBottom: "1px solid #D8E3EA",
                    paddingBottom: 7,
                    fontSize: 12,
                  }}
                >
                  <strong style={{ color: "#36536F" }}>{label}</strong>
                  <span>{value}</span>
                </div>
              ))}
            </div>

            {data.tags.length > 0 && (
              <div style={{ display: "flex", flexWrap: "wrap", gap: 5, marginTop: 13 }}>
                {data.tags.map((tag) => (
                  <span
                    key={tag}
                    style={{ borderRadius: 999, padding: "4px 8px", background: "#DDEAF4", color: "#36536F", fontSize: 10, fontWeight: 800 }}
                  >
                    {tag}
                  </span>
                ))}
              </div>
            )}
          </section>
        </div>

        <section
          style={{
            display: "grid",
            gridTemplateColumns: "auto 1fr",
            alignItems: "center",
            gap: 12,
            marginTop: 16,
            borderRadius: 14,
            padding: "14px 18px",
            color: "#F7FBFF",
            background: "#2B557D",
          }}
        >
          <MapPin size={25} />
          <div>
            <div style={{ fontSize: 10, fontWeight: 900, letterSpacing: 1.5, color: "#BBD8EE" }}>
              {data.status === "found" ? "FOUND NEAR" : "LAST SEEN"}
            </div>
            <div style={{ marginTop: 2, fontSize: 17, fontWeight: 900 }}>
              {data.lastSeen || data.neighborhood || "Location not provided"}
            </div>
            {data.neighborhood && data.lastSeen && <div style={{ marginTop: 2, fontSize: 12, color: "#D4E7F5" }}>{data.neighborhood}, Fresno, California</div>}
          </div>
        </section>

        {data.description && (
          <section
            style={{
              marginTop: 14,
              borderLeft: `5px solid ${status.accent}`,
              borderRadius: 12,
              padding: "12px 15px",
              background: status.pale,
              fontSize: 12,
              lineHeight: 1.55,
            }}
          >
            <strong style={{ display: "block", marginBottom: 4 }}>Important details</strong>
            {data.description}
          </section>
        )}

        <section
          style={{
            display: "grid",
            gridTemplateColumns: "1fr auto",
            alignItems: "center",
            gap: 16,
            marginTop: 16,
            border: "2px solid #294866",
            borderRadius: 15,
            padding: "15px 18px",
            background: "#F8E2AA",
          }}
        >
          <div>
            <div style={{ display: "flex", alignItems: "center", gap: 7, color: "#294866", fontSize: 11, fontWeight: 900, letterSpacing: 1.2 }}>
              <Phone size={14} /> CONTACT WITH INFORMATION
            </div>
            <div style={{ marginTop: 4, fontSize: 20, fontWeight: 900 }}>{primaryContact}</div>
            {data.contactName && <div style={{ marginTop: 2, fontSize: 12 }}>{data.contactName}</div>}
            {data.contactPhone && data.contactEmail && <div style={{ marginTop: 2, fontSize: 11 }}>{data.contactEmail}</div>}
          </div>
          <div style={{ color: "#5B7187", fontSize: 10, textAlign: "right" }}>Please do not chase.<br />Photograph and report direction of travel.</div>
        </section>
      </main>

      {data.contactPhone && (
        <div style={{ borderTop: "2px dashed #7993AA", padding: "9px 10px 11px", background: "#F6F0D7" }}>
          <div style={{ marginBottom: 6, textAlign: "center", color: "#587087", fontSize: 9, fontWeight: 800, letterSpacing: 1.2 }}>TEAR-OFF CONTACT STRIPS</div>
          <div style={{ display: "flex", justifyContent: "center", gap: 4 }}>
            {strips.map((strip) => (
              <div
                key={strip.id}
                style={{
                  minHeight: 80,
                  border: "1px solid #52789B",
                  borderRadius: 5,
                  padding: "7px 4px",
                  color: "#294866",
                  fontSize: 9,
                  fontWeight: 800,
                  writingMode: "vertical-rl",
                  transform: "rotate(180deg)",
                }}
              >
                {status.label} · {strip.name} · {strip.phone}
              </div>
            ))}
          </div>
        </div>
      )}

      <footer style={{ borderTop: "1px solid #CAD7E1", padding: "8px 20px 10px", textAlign: "center", color: "#6D8294", fontSize: 9 }}>
        Report sightings to Fresno Animal Center: (559) 621-5795 · Generated by VoiceMap Fresno
      </footer>
    </div>
  );
}

export default function FlyerGenerator() {
  const [, setLocation] = useLocation();
  const existingPosts = getLostFoundPosts().filter((post) => post.status !== "reunited");
  const [selectedPostId, setSelectedPostId] = useState("manual");
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

  function update<K extends keyof FlyerData>(key: K, value: FlyerData[K]) {
    setData((previous) => ({ ...previous, [key]: value }));
  }

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

  function handlePhoto(event: React.ChangeEvent<HTMLInputElement>) {
    const file = event.target.files?.[0];
    if (!file) return;
    const reader = new FileReader();
    reader.onload = (loadEvent) => update("photoBase64", loadEvent.target?.result as string);
    reader.readAsDataURL(file);
  }

  function addTag() {
    const tag = tagInput.trim().toLowerCase().replace(/\s+/g, "-");
    if (tag && !data.tags.includes(tag)) update("tags", [...data.tags, tag]);
    setTagInput("");
  }

  function handlePrint() {
    const flyer = document.getElementById("print-flyer");
    if (!flyer) return;
    const printWindow = window.open("", "_blank", "width=800,height=980");
    if (!printWindow) return;
    printWindow.document.write(`
      <!DOCTYPE html>
      <html>
        <head>
          <title>${data.status.toUpperCase()} ${data.petName || data.petType} — Fresno</title>
          <style>
            body { margin: 18px; background: white; font-family: Arial, sans-serif; }
            @media print { body { margin: 0; } @page { margin: .35in; } }
          </style>
        </head>
        <body>${flyer.outerHTML}</body>
      </html>
    `);
    printWindow.document.close();
    printWindow.focus();
    window.setTimeout(() => printWindow.print(), 400);
  }

  function handleCopyText() {
    const text = [
      `${data.status.toUpperCase()} ${data.petType.toUpperCase()}${data.petName ? `: ${data.petName}` : ""}`,
      data.breed && `Breed: ${data.breed}`,
      data.color && `Color: ${data.color}`,
      data.lastSeen && `Last seen: ${data.lastSeen}${data.neighborhood ? `, ${data.neighborhood}` : ""}, Fresno, CA`,
      data.dateSeen && `Date: ${formatDate(data.dateSeen)}`,
      data.collarDescription && `Collar: ${data.collarDescription}`,
      data.microchipped && "Microchipped: Yes — please scan",
      data.description,
      data.reward && `Reward: ${data.reward}`,
      `Contact: ${data.contactPhone || data.contactEmail || data.contactName || "Not provided"}`,
      "Please also report sightings to Fresno Animal Center: (559) 621-5795",
    ]
      .filter(Boolean)
      .join("\n");

    void navigator.clipboard.writeText(text);
    setCopied(true);
    window.setTimeout(() => setCopied(false), 2500);
  }

  return (
    <main className="min-h-screen px-4 pb-16 pt-28">
      <div className="mx-auto max-w-7xl">
        <header className="mb-7 flex items-start gap-3">
          <button
            type="button"
            onClick={() => setLocation("/lostfound")}
            className="liquid-button mt-1 rounded-xl p-2"
            aria-label="Return to Lost and Found"
          >
            <ArrowLeft size={18} />
          </button>
          <div>
            <p className="text-xs font-extrabold uppercase tracking-[.16em] text-primary">Printable community notice</p>
            <h1 className="mt-1 font-heading text-4xl font-extrabold">Lost &amp; found flyer studio</h1>
            <p className="mt-2 text-muted-foreground">Build a clear, professional flyer that prioritizes the animal, location, and contact information.</p>
          </div>
        </header>

        <div className="grid gap-8 xl:grid-cols-[minmax(420px,.85fr)_minmax(680px,1.15fr)]">
          <section className="space-y-5">
            {existingPosts.length > 0 && (
              <div className="glass-card rounded-3xl p-5">
                <label className="mb-3 block text-sm font-bold">Load an existing Lost &amp; Found post</label>
                <select
                  value={selectedPostId}
                  onChange={(event) => {
                    setSelectedPostId(event.target.value);
                    if (event.target.value !== "manual") {
                      const post = existingPosts.find((candidate) => candidate.id === event.target.value);
                      if (post) loadFromPost(post);
                    }
                  }}
                  className="h-11 w-full rounded-xl border border-input bg-[#FDFAE0]/70 px-3 text-sm focus:outline-none focus:ring-2 focus:ring-ring"
                >
                  <option value="manual">Enter manually</option>
                  {existingPosts.map((post) => (
                    <option key={post.id} value={post.id}>
                      {post.status.toUpperCase()}: {post.petName || `${post.color} ${post.petType}`} — {post.neighborhood}
                    </option>
                  ))}
                </select>
              </div>
            )}

            <div className="glass-card space-y-4 rounded-3xl p-5">
              <h2 className="font-heading text-lg font-extrabold">Pet and sighting details</h2>
              <div className="grid grid-cols-2 gap-3">
                <label className="text-xs font-bold">Status
                  <select value={data.status} onChange={(event) => update("status", event.target.value as FlyerData["status"])} className="mt-1 h-10 w-full rounded-xl border border-input bg-[#FDFAE0]/70 px-3 text-sm">
                    <option value="lost">Lost</option>
                    <option value="found">Found</option>
                    <option value="reunited">Reunited</option>
                  </select>
                </label>
                <label className="text-xs font-bold">Animal type
                  <select value={data.petType} onChange={(event) => update("petType", event.target.value as FlyerData["petType"])} className="mt-1 h-10 w-full rounded-xl border border-input bg-[#FDFAE0]/70 px-3 text-sm">
                    <option value="cat">Cat</option>
                    <option value="dog">Dog</option>
                    <option value="other">Other</option>
                  </select>
                </label>
              </div>

              <div className="grid gap-3 sm:grid-cols-2">
                <label className="text-xs font-bold">Pet name<Input value={data.petName} onChange={(event) => update("petName", event.target.value)} placeholder="Luna" className="mt-1 rounded-xl" /></label>
                <label className="text-xs font-bold">Breed<Input value={data.breed} onChange={(event) => update("breed", event.target.value)} placeholder="Domestic Shorthair" className="mt-1 rounded-xl" /></label>
              </div>
              <label className="block text-xs font-bold">Color / markings<Input value={data.color} onChange={(event) => update("color", event.target.value)} placeholder="Grey tabby with white chest" className="mt-1 rounded-xl" /></label>
              <div className="grid gap-3 sm:grid-cols-2">
                <label className="text-xs font-bold">Neighborhood<Input value={data.neighborhood} onChange={(event) => update("neighborhood", event.target.value)} placeholder="Tower District" className="mt-1 rounded-xl" /></label>
                <label className="text-xs font-bold">Date seen<Input type="date" value={data.dateSeen} onChange={(event) => update("dateSeen", event.target.value)} className="mt-1 rounded-xl" /></label>
              </div>
              <label className="block text-xs font-bold">Last seen location<Input value={data.lastSeen} onChange={(event) => update("lastSeen", event.target.value)} placeholder="E Olive Ave & N Van Ness Ave" className="mt-1 rounded-xl" /></label>
              <div className="grid gap-3 sm:grid-cols-2">
                <label className="text-xs font-bold">Collar<Input value={data.collarDescription} onChange={(event) => update("collarDescription", event.target.value)} placeholder="Pink collar, heart tag" className="mt-1 rounded-xl" /></label>
                <label className="text-xs font-bold">Reward<Input value={data.reward} onChange={(event) => update("reward", event.target.value)} placeholder="$200" className="mt-1 rounded-xl" /></label>
              </div>
              <label className="flex items-center gap-3 text-sm"><input type="checkbox" checked={data.microchipped} onChange={(event) => update("microchipped", event.target.checked)} className="h-4 w-4" /> Microchipped</label>
              <label className="block text-xs font-bold">Description<textarea value={data.description} onChange={(event) => update("description", event.target.value)} rows={3} placeholder="Temperament, physical description, and circumstances…" className="mt-1 w-full resize-none rounded-xl border border-input bg-background px-3 py-2 text-sm" /></label>
            </div>

            <div className="glass-card space-y-3 rounded-3xl p-5">
              <h2 className="font-heading text-lg font-extrabold">Contact information</h2>
              <div className="grid gap-3 sm:grid-cols-3">
                <label className="text-xs font-bold">Name<Input value={data.contactName} onChange={(event) => update("contactName", event.target.value)} placeholder="Your name" className="mt-1 rounded-xl" /></label>
                <label className="text-xs font-bold">Phone<Input value={data.contactPhone} onChange={(event) => update("contactPhone", event.target.value)} placeholder="(559) 555-0000" className="mt-1 rounded-xl" /></label>
                <label className="text-xs font-bold">Email<Input type="email" value={data.contactEmail} onChange={(event) => update("contactEmail", event.target.value)} placeholder="you@email.com" className="mt-1 rounded-xl" /></label>
              </div>
            </div>

            <div className="glass-card space-y-3 rounded-3xl p-5">
              <h2 className="font-heading text-lg font-extrabold">Photo and search tags</h2>
              <button
                type="button"
                onClick={() => fileRef.current?.click()}
                className="flex w-full flex-col items-center gap-2 rounded-2xl border-2 border-dashed border-[#789FBE]/55 bg-[#CAE7FF]/25 p-5 transition-colors hover:bg-[#CAE7FF]/45"
              >
                {data.photoBase64 ? (
                  <img src={data.photoBase64} alt="Uploaded pet" className="max-h-36 rounded-xl object-contain" />
                ) : (
                  <>
                    <AnimalArt variant={artForPet(data.petType)} size={88} decorative />
                    <span className="text-sm font-semibold text-muted-foreground">Upload a clear pet photo</span>
                  </>
                )}
              </button>
              <input ref={fileRef} type="file" accept="image/*" className="hidden" onChange={handlePhoto} />

              <div className="flex gap-2">
                <Input value={tagInput} onChange={(event) => setTagInput(event.target.value)} onKeyDown={(event) => { if (event.key === "Enter") { event.preventDefault(); addTag(); } }} placeholder="Add a tag (shy, indoor-only…)" className="rounded-xl" />
                <Button type="button" variant="outline" className="rounded-xl px-3" onClick={addTag}><Plus size={14} /></Button>
              </div>
              <div className="flex flex-wrap gap-2">
                {data.tags.map((tag) => (
                  <span key={tag} className="flex items-center gap-1 rounded-full bg-[#CAE7FF]/70 px-3 py-1 text-xs font-bold text-[#345F8C]">
                    {tag}
                    <button type="button" onClick={() => update("tags", data.tags.filter((candidate) => candidate !== tag))}><X size={11} /></button>
                  </span>
                ))}
              </div>
            </div>

            <div className="flex flex-wrap gap-3">
              <Button onClick={handlePrint} className="flex-1 gap-2 rounded-xl bg-[#426F9D] text-white hover:bg-[#345F8C]">
                <Printer size={15} /> Print flyer
              </Button>
              <Button onClick={handleCopyText} variant="outline" className="flex-1 gap-2 rounded-xl">
                {copied ? <CheckCircle2 size={15} /> : <Copy size={15} />}
                {copied ? "Copied" : "Copy text"}
              </Button>
            </div>
          </section>

          <aside className="self-start xl:sticky xl:top-24">
            <div className="mb-3 flex items-center justify-between">
              <div>
                <p className="text-xs font-extrabold uppercase tracking-[.14em] text-primary">Live preview</p>
                <p className="mt-1 text-sm text-muted-foreground">The printed version preserves this layout.</p>
              </div>
              <Button onClick={handlePrint} size="sm" variant="outline" className="gap-2 rounded-xl">
                <Download size={13} /> Print / Save PDF
              </Button>
            </div>
            <div className="overflow-x-auto pb-4">
              <PrintFlyer data={data} />
            </div>
          </aside>
        </div>
      </div>
    </main>
  );
}
