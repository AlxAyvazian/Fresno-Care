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
  UploadCloud,
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

const PHOTO_INPUT_ID = "lost-found-flyer-photo-upload";
const MAX_PHOTO_BYTES = 8 * 1024 * 1024;

const STATUS_STYLE = {
  lost: {
    label: "LOST PET",
    shortLabel: "Lost",
    accent: "#B85F55",
    soft: "#F8E2AA",
    message: "Please help bring this pet home",
    locationLabel: "Last seen",
  },
  found: {
    label: "FOUND PET",
    shortLabel: "Found",
    accent: "#426F9D",
    soft: "#CAE7FF",
    message: "Help identify this pet's family",
    locationLabel: "Found near",
  },
  reunited: {
    label: "REUNITED",
    shortLabel: "Reunited",
    accent: "#4D8066",
    soft: "#E9F2E8",
    message: "This pet has returned home",
    locationLabel: "Location",
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

function makeTearStrips(phone: string, name: string, count = 9) {
  return Array.from({ length: count }, (_, index) => ({ id: index, phone, name }));
}

function DetailRow({ label, value }: { label: string; value: string }) {
  return (
    <div style={{ display: "grid", gridTemplateColumns: "118px 1fr", gap: 12, borderBottom: "1px solid #DCE7EE", padding: "8px 0", fontSize: 13 }}>
      <strong style={{ color: "#48647E" }}>{label}</strong>
      <span style={{ color: "#1F3650", fontWeight: 650 }}>{value}</span>
    </div>
  );
}

function PrintFlyer({ data }: { data: FlyerData }) {
  const status = STATUS_STYLE[data.status];
  const strips = makeTearStrips(data.contactPhone, data.petName || "Pet");
  const fallbackVariant = artForPet(data.petType, data.status === "found");
  const primaryContact = data.contactPhone || data.contactEmail || "Contact information not provided";
  const petTitle = data.petName || `${data.petType === "other" ? "Pet" : data.petType} needs help`;

  const detailRows = [
    ["Breed", data.breed || "Not specified"],
    ["Color", data.color || "Not specified"],
    ["Date", formatDate(data.dateSeen)],
    ["Microchip", data.microchipped ? "Yes — please scan" : "Unknown"],
    ["Collar", data.collarDescription || "Not specified"],
  ];

  return (
    <div
      id="print-flyer"
      style={{
        width: 720,
        overflow: "hidden",
        border: "1px solid #C9DCE9",
        borderRadius: 24,
        background: "linear-gradient(180deg, #FFFFFF 0%, #FDFAE0 100%)",
        color: "#1F3650",
        fontFamily: "'DM Sans', Arial, sans-serif",
        boxShadow: "0 18px 48px rgba(31, 54, 80, .14)",
      }}
    >
      <header style={{ padding: "28px 32px 20px", background: "linear-gradient(135deg, #FFFFFF 0%, #FDFAE0 52%, #CAE7FF 100%)" }}>
        <div style={{ display: "flex", alignItems: "center", justifyContent: "space-between", gap: 20 }}>
          <div>
            <div
              style={{
                display: "inline-flex",
                alignItems: "center",
                borderRadius: 999,
                padding: "7px 12px",
                background: status.soft,
                color: "#1F3650",
                fontSize: 12,
                fontWeight: 900,
                letterSpacing: 1.8,
              }}
            >
              {status.label}
            </div>
            <div style={{ marginTop: 12, fontFamily: "Manrope, Arial, sans-serif", fontSize: 44, fontWeight: 900, lineHeight: 1 }}>
              {petTitle}
            </div>
            <div style={{ marginTop: 9, color: "#55718B", fontSize: 16, fontWeight: 700 }}>{status.message}</div>
          </div>
          {data.reward && (
            <div
              style={{
                minWidth: 128,
                border: `2px solid ${status.accent}`,
                borderRadius: 20,
                padding: "14px 18px",
                textAlign: "center",
                background: "#FFFFFF",
                color: "#1F3650",
              }}
            >
              <div style={{ fontSize: 10, fontWeight: 900, letterSpacing: 1.6, color: "#5A7084" }}>REWARD</div>
              <div style={{ marginTop: 3, fontSize: 27, fontWeight: 900 }}>{data.reward}</div>
            </div>
          )}
        </div>
      </header>

      <main style={{ padding: "24px 30px 26px" }}>
        <div style={{ display: "grid", gridTemplateColumns: "290px 1fr", gap: 22, alignItems: "stretch" }}>
          <div
            style={{
              minHeight: 310,
              overflow: "hidden",
              border: "1px solid #C6DCEB",
              borderRadius: 22,
              background: "linear-gradient(145deg, #F9FCFF, #FDFAE0)",
              display: "flex",
              alignItems: "center",
              justifyContent: "center",
            }}
          >
            {data.photoBase64 ? (
              <img src={data.photoBase64} alt="Pet" style={{ width: "100%", height: 310, objectFit: "cover" }} />
            ) : (
              <div style={{ display: "grid", placeItems: "center", padding: 18, textAlign: "center" }}>
                <AnimalArt variant={fallbackVariant} size={190} />
                <div style={{ marginTop: 10, color: "#627A91", fontSize: 12, fontWeight: 800 }}>Add a clear recent photo when possible</div>
              </div>
            )}
          </div>

          <section style={{ border: "1px solid #D8E5ED", borderRadius: 22, padding: "18px 20px", background: "rgba(255,255,255,.74)" }}>
            <div style={{ marginBottom: 8, fontFamily: "Manrope, Arial, sans-serif", fontSize: 20, fontWeight: 900 }}>Identifying information</div>
            <div>
              {detailRows.map(([label, value]) => (
                <DetailRow key={label} label={label} value={value} />
              ))}
            </div>
            {data.tags.length > 0 && (
              <div style={{ display: "flex", flexWrap: "wrap", gap: 6, marginTop: 14 }}>
                {data.tags.map((tag) => (
                  <span key={tag} style={{ borderRadius: 999, padding: "5px 9px", background: "#E8F2FA", color: "#426F9D", fontSize: 10, fontWeight: 900 }}>
                    {tag}
                  </span>
                ))}
              </div>
            )}
          </section>
        </div>

        <section style={{ display: "grid", gridTemplateColumns: "auto 1fr", alignItems: "center", gap: 12, marginTop: 20, borderRadius: 18, padding: "16px 20px", color: "#FFFFFF", background: status.accent }}>
          <MapPin size={26} />
          <div>
            <div style={{ fontSize: 10, fontWeight: 900, letterSpacing: 1.6, opacity: .82 }}>{status.locationLabel.toUpperCase()}</div>
            <div style={{ marginTop: 2, fontSize: 19, fontWeight: 900 }}>{data.lastSeen || data.neighborhood || "Location not provided"}</div>
            {data.neighborhood && data.lastSeen && <div style={{ marginTop: 3, fontSize: 12, opacity: .88 }}>{data.neighborhood}, Fresno, California</div>}
          </div>
        </section>

        {data.description && (
          <section style={{ marginTop: 18, border: "1px solid #E7D0CC", borderLeft: `5px solid ${status.accent}`, borderRadius: 16, padding: "14px 17px", background: "#FFF3F0", fontSize: 13, lineHeight: 1.55 }}>
            <strong style={{ display: "block", marginBottom: 5 }}>Important details</strong>
            {data.description}
          </section>
        )}

        <section style={{ display: "grid", gridTemplateColumns: "1fr auto", alignItems: "center", gap: 16, marginTop: 18, border: "2px solid #426F9D", borderRadius: 18, padding: "17px 20px", background: "#FDFAE0" }}>
          <div>
            <div style={{ display: "flex", alignItems: "center", gap: 7, color: "#426F9D", fontSize: 11, fontWeight: 900, letterSpacing: 1.25 }}>
              <Phone size={14} /> CONTACT WITH INFORMATION
            </div>
            <div style={{ marginTop: 4, fontSize: 23, fontWeight: 900 }}>{primaryContact}</div>
            {data.contactName && <div style={{ marginTop: 3, fontSize: 13 }}>{data.contactName}</div>}
            {data.contactPhone && data.contactEmail && <div style={{ marginTop: 3, fontSize: 11 }}>{data.contactEmail}</div>}
          </div>
          <div style={{ color: "#5B7187", fontSize: 10, textAlign: "right" }}>Please do not chase.<br />Photograph and report direction of travel.</div>
        </section>
      </main>

      {data.contactPhone && (
        <div style={{ borderTop: "2px dashed #9BB5C8", padding: "10px 12px 12px", background: "#FAEDCD" }}>
          <div style={{ marginBottom: 7, textAlign: "center", color: "#587087", fontSize: 9, fontWeight: 900, letterSpacing: 1.2 }}>TEAR-OFF CONTACT STRIPS</div>
          <div style={{ display: "flex", justifyContent: "center", gap: 4 }}>
            {strips.map((strip) => (
              <div key={strip.id} style={{ minHeight: 82, border: "1px solid #426F9D", borderRadius: 6, padding: "7px 4px", color: "#294866", fontSize: 9, fontWeight: 800, writingMode: "vertical-rl", transform: "rotate(180deg)" }}>
                {status.shortLabel} · {strip.name} · {strip.phone}
              </div>
            ))}
          </div>
        </div>
      )}

      <footer style={{ borderTop: "1px solid #D5E2EA", padding: "9px 20px 11px", textAlign: "center", color: "#6D8294", fontSize: 9 }}>
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
  const [photoError, setPhotoError] = useState("");
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
    setPhotoError("");
    if (fileRef.current) fileRef.current.value = "";
  }

  function handlePhoto(event: React.ChangeEvent<HTMLInputElement>) {
    const file = event.target.files?.[0];
    if (!file) return;

    if (!file.type.startsWith("image/")) {
      setPhotoError("Choose an image file, such as JPG, PNG, or WebP.");
      event.target.value = "";
      return;
    }

    if (file.size > MAX_PHOTO_BYTES) {
      setPhotoError("Choose an image under 8 MB.");
      event.target.value = "";
      return;
    }

    const reader = new FileReader();
    reader.onload = (loadEvent) => {
      const result = loadEvent.target?.result;
      if (typeof result === "string") {
        update("photoBase64", result);
        setPhotoError("");
      } else {
        setPhotoError("The photo could not be read. Try a different image.");
      }
    };
    reader.onerror = () => setPhotoError("The photo could not be read. Try a different image.");
    reader.readAsDataURL(file);
  }

  function removePhoto() {
    update("photoBase64", "");
    setPhotoError("");
    if (fileRef.current) fileRef.current.value = "";
  }

  function addTag() {
    const tag = tagInput.trim().toLowerCase().replace(/\s+/g, "-");
    if (tag && !data.tags.includes(tag)) update("tags", [...data.tags, tag]);
    setTagInput("");
  }

  function handlePrint() {
    const flyer = document.getElementById("print-flyer");
    if (!flyer) return;
    const printWindow = window.open("", "_blank", "width=820,height=980");
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
            <p className="mt-2 text-muted-foreground">Build a clear flyer that prioritizes the animal, location, and contact information.</p>
          </div>
        </header>

        <div className="grid gap-8 xl:grid-cols-[minmax(420px,.85fr)_minmax(720px,1.15fr)]">
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
              <div className="flex items-center justify-between gap-3">
                <h2 className="font-heading text-lg font-extrabold">Photo and search tags</h2>
                {data.photoBase64 && (
                  <Button type="button" variant="outline" size="sm" onClick={removePhoto} className="rounded-xl gap-2">
                    <X size={13} /> Remove photo
                  </Button>
                )}
              </div>

              <input ref={fileRef} id={PHOTO_INPUT_ID} type="file" accept="image/*" className="sr-only" onChange={handlePhoto} />
              <label htmlFor={PHOTO_INPUT_ID} className="flex w-full cursor-pointer flex-col items-center gap-3 rounded-2xl border-2 border-dashed border-[#789FBE]/55 bg-[#CAE7FF]/25 p-5 text-center transition-colors hover:bg-[#CAE7FF]/45 focus-within:ring-2 focus-within:ring-[#426F9D]">
                {data.photoBase64 ? (
                  <img src={data.photoBase64} alt="Uploaded pet preview" className="max-h-48 rounded-xl object-contain shadow-lg" />
                ) : (
                  <AnimalArt variant={artForPet(data.petType)} size={88} decorative />
                )}
                <span className="inline-flex items-center gap-2 rounded-xl bg-[#426F9D] px-4 py-2 text-sm font-bold text-white shadow-md">
                  <UploadCloud size={16} /> {data.photoBase64 ? "Replace photo" : "Upload photo"}
                </span>
                <span className="text-xs leading-relaxed text-muted-foreground">JPG, PNG, WebP, or HEIC from your device. The preview updates immediately after selection.</span>
              </label>
              {photoError && <p className="rounded-xl bg-red-500/10 px-3 py-2 text-sm text-red-800 dark:text-red-200">{photoError}</p>}

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
              <p className="text-sm font-bold text-muted-foreground">Live flyer preview</p>
              <Button onClick={handlePrint} size="sm" variant="outline" className="rounded-xl gap-2">
                <Download size={13} /> Print / Save PDF
              </Button>
            </div>
            <div className="overflow-x-auto rounded-3xl bg-white/40 p-3 shadow-inner">
              <PrintFlyer data={data} />
            </div>
          </aside>
        </div>
      </div>
    </main>
  );
}
