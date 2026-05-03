import { useState, useRef } from "react";
import {
  ClipboardList, PawPrint, Phone, Printer, CheckCircle2, Circle,
  Plus, X, Trash2, Edit3, Camera, Save, Shield, AlertTriangle,
  Mail, FileText, Download, Star, ChevronDown, ChevronUp,
} from "lucide-react";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { AnimatedBackground } from "@/components/AnimatedBackground";
import { KurzgesagtCat } from "@/components/KurzgesagtCat";
import { KurzgesagtDog } from "@/components/KurzgesagtDog";
import { getPets, savePet, deletePet, generatePetId, type RegisteredPet } from "@/lib/registry";
import { getReports } from "@/lib/storage";
import { CONTACTS } from "@/lib/contacts";
import { useLocation } from "wouter";
import { buildFlyerText } from "@/components/PrintableFlyer";
import { findDuplicateReports } from "@/components/DuplicateDetector";
import { HotspotSummary } from "@/components/HotspotSummary";

// ─── Evidence Checklist ──────────────────────────────────────────────────────

const CHECKLIST_SECTIONS = [
  {
    id: "before",
    title: "Before You Document",
    icon: <Shield size={16} />,
    color: "border-primary",
    items: [
      { id: "safe", text: "I am in a safe location and not putting myself at risk" },
      { id: "public", text: "I am on public property and not trespassing" },
      { id: "calm", text: "I have not directly confronted or engaged anyone" },
      { id: "device", text: "My phone/camera has storage and is charged" },
      { id: "time", text: "I have noted the exact date and time" },
    ],
  },
  {
    id: "animal",
    title: "Animal Observations",
    icon: <PawPrint size={16} />,
    color: "border-accent",
    items: [
      { id: "type", text: "Animal type documented (cat / dog / other)" },
      { id: "count", text: "Number of animals observed" },
      { id: "condition", text: "Physical condition noted (weight, injuries, posture)" },
      { id: "collar", text: "Collar / tags / microchip status observed" },
      { id: "water", text: "Water and food access observed and documented" },
      { id: "shelter", text: "Shelter from heat/cold assessed and documented" },
      { id: "behavior", text: "Animal behavior noted (lethargic, distressed, etc.)" },
      { id: "danger", text: "Whether the animal appears to be in immediate danger assessed" },
    ],
  },
  {
    id: "location",
    title: "Location & Context",
    icon: <FileText size={16} />,
    color: "border-primary",
    items: [
      { id: "address", text: "Exact address or nearest cross streets noted" },
      { id: "neighborhood", text: "Neighborhood name documented" },
      { id: "landmarks", text: "Nearby landmarks / businesses photographed" },
      { id: "repeat", text: "Noted whether this is a first or repeat observation" },
      { id: "property", text: "Property type noted (vacant lot, residential, business, etc.)" },
    ],
  },
  {
    id: "evidence",
    title: "Evidence Gathered",
    icon: <Camera size={16} />,
    color: "border-secondary",
    items: [
      { id: "photos", text: "Photos taken from a safe distance (context + close-up)" },
      { id: "geotagged", text: "Photos are geotagged or location manually noted" },
      { id: "timestamp", text: "Photos/video have accurate date/time stamp" },
      { id: "description", text: "Written description uses direct observations only — no speculation" },
      { id: "witnesses", text: "Any witnesses noted (with their consent if identified)" },
    ],
  },
  {
    id: "reporting",
    title: "Reporting & Follow-Up",
    icon: <ClipboardList size={16} />,
    color: "border-muted",
    items: [
      { id: "submitted", text: "Report submitted to VoiceMap Fresno" },
      { id: "animal-center", text: "Fresno Animal Center notified (559) 621-5795" },
      { id: "police", text: "Fresno Police Non-Emergency notified if urgent (559) 621-7000" },
      { id: "followup", text: "Follow-up date set to check for agency response" },
      { id: "id-recorded", text: "Report ID recorded for escalation reference" },
    ],
  },
];

function EvidenceChecklist() {
  const [checked, setChecked] = useState<Set<string>>(new Set());
  const [openSection, setOpenSection] = useState<string | null>("before");

  const totalItems = CHECKLIST_SECTIONS.reduce((s, sec) => s + sec.items.length, 0);
  const pct = Math.round((checked.size / totalItems) * 100);

  function toggle(id: string) {
    setChecked((prev) => {
      const next = new Set(prev);
      next.has(id) ? next.delete(id) : next.add(id);
      return next;
    });
  }

  function resetAll() { setChecked(new Set()); }

  return (
    <div>
      <div className="flex items-center justify-between mb-3">
        <div className="flex items-center gap-3">
          <div className="text-sm font-semibold">{checked.size} / {totalItems} completed</div>
          {pct === 100 && <span className="text-xs text-green-600 dark:text-green-400 font-medium">✓ Ready to submit!</span>}
        </div>
        <button onClick={resetAll} className="text-xs text-muted-foreground hover:text-foreground transition-colors">Reset all</button>
      </div>
      <div className="h-2.5 rounded-full bg-muted mb-5 overflow-hidden">
        <div className="h-full rounded-full transition-all duration-500" style={{ width: `${pct}%`, background: pct === 100 ? "#22c55e" : "linear-gradient(90deg, #028391, #FAA968)" }} />
      </div>
      <div className="space-y-3">
        {CHECKLIST_SECTIONS.map((sec) => {
          const secChecked = sec.items.filter((item) => checked.has(item.id)).length;
          const isOpen = openSection === sec.id;
          return (
            <div key={sec.id} className={`glass-card rounded-2xl overflow-hidden border-l-4 ${sec.color}`}>
              <button onClick={() => setOpenSection(isOpen ? null : sec.id)} className="w-full flex items-center justify-between p-4 text-left hover:bg-primary/5 transition-colors">
                <div className="flex items-center gap-3">
                  <div className="w-7 h-7 rounded-lg bg-primary/15 text-primary flex items-center justify-center flex-shrink-0">{sec.icon}</div>
                  <span className="font-medium text-sm">{sec.title}</span>
                  <span className={`text-xs px-2 py-0.5 rounded-full font-medium ${secChecked === sec.items.length ? "bg-green-500/20 text-green-700 dark:text-green-400" : "bg-muted text-muted-foreground"}`}>
                    {secChecked}/{sec.items.length}
                  </span>
                </div>
                {isOpen ? <ChevronUp size={15} className="text-muted-foreground" /> : <ChevronDown size={15} className="text-muted-foreground" />}
              </button>
              {isOpen && (
                <div className="px-4 pb-4 space-y-2">
                  {sec.items.map((item) => (
                    <button key={item.id} onClick={() => toggle(item.id)} className="w-full flex items-start gap-3 text-left p-2 rounded-xl hover:bg-primary/5 transition-colors group">
                      {checked.has(item.id)
                        ? <CheckCircle2 size={16} className="text-primary mt-0.5 flex-shrink-0" />
                        : <Circle size={16} className="text-muted-foreground mt-0.5 flex-shrink-0 group-hover:text-primary/50 transition-colors" />}
                      <span className={`text-sm leading-relaxed ${checked.has(item.id) ? "line-through text-muted-foreground" : "text-foreground/85"}`}>{item.text}</span>
                    </button>
                  ))}
                </div>
              )}
            </div>
          );
        })}
      </div>
    </div>
  );
}

const BLANK_PET: Omit<RegisteredPet, "id" | "createdAt"> = {
  petName: "", petType: "cat", breed: "", color: "", sex: "unknown",
  age: "", microchipId: "", licenseNumber: "", vetName: "", vetPhone: "",
  ownerName: "", ownerPhone: "", ownerEmail: "", ownerAddress: "",
  photoBase64: undefined, vaccinations: [], notes: "", tags: [],
};

function PetRegistry() {
  const [pets, setPets] = useState<RegisteredPet[]>(() => getPets());
  const [editing, setEditing] = useState<RegisteredPet | null>(null);
  const [showForm, setShowForm] = useState(false);
  const [form, setForm] = useState({ ...BLANK_PET });
  const fileRef = useRef<HTMLInputElement>(null);
  const [, setLocation] = useLocation();

  function openNew() { setForm({ ...BLANK_PET }); setEditing(null); setShowForm(true); }
  function openEdit(pet: RegisteredPet) { setForm({ ...pet }); setEditing(pet); setShowForm(true); }

  function handlePhoto(e: React.ChangeEvent<HTMLInputElement>) {
    const file = e.target.files?.[0];
    if (!file) return;
    const reader = new FileReader();
    reader.onload = (ev) => setForm({ ...form, photoBase64: ev.target?.result as string });
    reader.readAsDataURL(file);
  }

  function handleSave() {
    const pet: RegisteredPet = { ...form, id: editing?.id ?? generatePetId(), createdAt: editing?.createdAt ?? new Date().toISOString() };
    savePet(pet);
    setPets(getPets());
    setShowForm(false);
  }

  function handleDelete(id: string) {
    deletePet(id);
    setPets(getPets());
  }

  function handlePrintCard(pet: RegisteredPet) {
    const win = window.open("", "_blank", "width=600,height=500");
    if (!win) return;
    const color = pet.petType === "cat" ? "#FAA968" : "#028391";
    win.document.write(`<!DOCTYPE html><html><head><title>Pet ID — ${pet.petName}</title><style>body{margin:20px;font-family:Arial,sans-serif;}@media print{@page{margin:0.5in;}}</style></head><body><div style="max-width:400px;border:3px solid ${color};border-radius:16px;overflow:hidden;font-family:Arial,sans-serif;"><div style="background:${color};color:white;padding:16px 20px;display:flex;align-items:center;justify-content:space-between;"><div><div style="font-size:10px;opacity:0.8;text-transform:uppercase;letter-spacing:1px;">Pet ID Card</div><div style="font-size:22px;font-weight:900;">${pet.petName}</div><div style="font-size:13px;opacity:0.85;text-transform:capitalize;">${pet.petType}${pet.breed ? " · " + pet.breed : ""}</div></div>${pet.photoBase64 ? `<img src="${pet.photoBase64}" style="width:72px;height:72px;border-radius:8px;object-fit:cover;border:2px solid white;" />` : ""}</div><div style="padding:16px 20px;"><table style="width:100%;font-size:13px;border-collapse:collapse;">${pet.color ? `<tr><td style="font-weight:700;padding-right:10px;padding-bottom:5px;color:#333;">Color:</td><td style="color:#555;">${pet.color}</td></tr>` : ""}${pet.sex !== "unknown" ? `<tr><td style="font-weight:700;padding-right:10px;padding-bottom:5px;color:#333;">Sex:</td><td style="color:#555;text-transform:capitalize;">${pet.sex}</td></tr>` : ""}${pet.age ? `<tr><td style="font-weight:700;padding-right:10px;padding-bottom:5px;color:#333;">Age:</td><td style="color:#555;">${pet.age}</td></tr>` : ""}${pet.microchipId ? `<tr><td style="font-weight:700;padding-right:10px;padding-bottom:5px;color:#333;">Microchip:</td><td style="color:#555;font-family:monospace;">${pet.microchipId}</td></tr>` : ""}${pet.licenseNumber ? `<tr><td style="font-weight:700;padding-right:10px;padding-bottom:5px;color:#333;">License:</td><td style="color:#555;font-family:monospace;">${pet.licenseNumber}</td></tr>` : ""}</table><div style="margin-top:12px;padding-top:10px;border-top:1px solid #eee;"><div style="font-size:11px;color:#aaa;text-transform:uppercase;letter-spacing:0.5px;margin-bottom:4px;">Owner</div><div style="font-size:13px;font-weight:700;">${pet.ownerName}</div>${pet.ownerPhone ? `<div style="font-size:13px;color:#555;">${pet.ownerPhone}</div>` : ""}${pet.ownerEmail ? `<div style="font-size:12px;color:#555;">${pet.ownerEmail}</div>` : ""}</div>${pet.vetName ? `<div style="margin-top:8px;padding-top:8px;border-top:1px solid #eee;font-size:11px;color:#aaa;">Vet: ${pet.vetName}${pet.vetPhone ? " · " + pet.vetPhone : ""}</div>` : ""}</div><div style="padding:8px 20px;background:#f9f9f9;font-size:10px;color:#bbb;text-align:center;">VoiceMap Fresno Pet Registry · If found please call above number</div></div><script>window.onload=()=>{window.print();}</script></body></html>`);
    win.document.close();
  }

  return (
    <div>
      <div className="flex items-center justify-between mb-4">
        <p className="text-sm text-muted-foreground">Register your pets to quickly generate flyers and ID cards.</p>
        <Button onClick={openNew} size="sm" className="rounded-xl gap-2" style={{ background: "#028391", color: "white" }}>
          <Plus size={14} /> Add Pet
        </Button>
      </div>

      {showForm && (
        <div className="fixed inset-0 z-50 flex items-center justify-center p-4 bg-black/50 backdrop-blur-sm">
          <div className="glass-card rounded-3xl p-6 w-full max-w-2xl max-h-[90vh] overflow-y-auto">
            <div className="flex items-center justify-between mb-4">
              <h3 className="font-heading font-bold text-lg">{editing ? "Edit Pet" : "Register a Pet"}</h3>
              <button onClick={() => setShowForm(false)} className="p-2 rounded-xl hover:bg-muted"><X size={18} /></button>
            </div>
            <div className="space-y-4">
              <div className="grid grid-cols-2 gap-3">
                <div><label className="text-xs font-medium block mb-1">Pet Name *</label><Input required value={form.petName} onChange={(e) => setForm({ ...form, petName: e.target.value })} placeholder="e.g. Luna" className="rounded-xl" /></div>
                <div><label className="text-xs font-medium block mb-1">Type</label><select value={form.petType} onChange={(e) => setForm({ ...form, petType: e.target.value as RegisteredPet["petType"] })} className="w-full h-10 px-3 rounded-xl border border-input bg-background text-sm focus:outline-none focus:ring-2 focus:ring-ring"><option value="cat">Cat</option><option value="dog">Dog</option><option value="rabbit">Rabbit</option><option value="bird">Bird</option><option value="other">Other</option></select></div>
              </div>
              <div className="grid sm:grid-cols-3 gap-3">
                <div><label className="text-xs font-medium block mb-1">Breed</label><Input value={form.breed} onChange={(e) => setForm({ ...form, breed: e.target.value })} placeholder="Domestic Shorthair" className="rounded-xl" /></div>
                <div><label className="text-xs font-medium block mb-1">Color</label><Input value={form.color} onChange={(e) => setForm({ ...form, color: e.target.value })} placeholder="Grey tabby" className="rounded-xl" /></div>
                <div><label className="text-xs font-medium block mb-1">Sex</label><select value={form.sex} onChange={(e) => setForm({ ...form, sex: e.target.value as RegisteredPet["sex"] })} className="w-full h-10 px-3 rounded-xl border border-input bg-background text-sm focus:outline-none focus:ring-2 focus:ring-ring"><option value="unknown">Unknown</option><option value="male">Male</option><option value="female">Female</option></select></div>
              </div>
              <div className="grid sm:grid-cols-3 gap-3">
                <div><label className="text-xs font-medium block mb-1">Age</label><Input value={form.age} onChange={(e) => setForm({ ...form, age: e.target.value })} placeholder="3 years" className="rounded-xl" /></div>
                <div><label className="text-xs font-medium block mb-1">Microchip ID</label><Input value={form.microchipId} onChange={(e) => setForm({ ...form, microchipId: e.target.value })} placeholder="981000012345678" className="rounded-xl" /></div>
                <div><label className="text-xs font-medium block mb-1">License No.</label><Input value={form.licenseNumber} onChange={(e) => setForm({ ...form, licenseNumber: e.target.value })} placeholder="FC-2024-XXXX" className="rounded-xl" /></div>
              </div>
              <div className="grid sm:grid-cols-2 gap-3">
                <div><label className="text-xs font-medium block mb-1">Vet Name</label><Input value={form.vetName} onChange={(e) => setForm({ ...form, vetName: e.target.value })} placeholder="Dr. Smith" className="rounded-xl" /></div>
                <div><label className="text-xs font-medium block mb-1">Vet Phone</label><Input value={form.vetPhone} onChange={(e) => setForm({ ...form, vetPhone: e.target.value })} placeholder="(559) 555-0000" className="rounded-xl" /></div>
              </div>
              <div className="border-t border-border/30 pt-3">
                <p className="text-xs font-semibold text-muted-foreground uppercase tracking-wide mb-3">Owner Info</p>
                <div className="grid sm:grid-cols-3 gap-3">
                  <div><label className="text-xs font-medium block mb-1">Your Name *</label><Input value={form.ownerName} onChange={(e) => setForm({ ...form, ownerName: e.target.value })} placeholder="Full name" className="rounded-xl" /></div>
                  <div><label className="text-xs font-medium block mb-1">Phone *</label><Input value={form.ownerPhone} onChange={(e) => setForm({ ...form, ownerPhone: e.target.value })} placeholder="(559) 555-0000" className="rounded-xl" /></div>
                  <div><label className="text-xs font-medium block mb-1">Email</label><Input value={form.ownerEmail} onChange={(e) => setForm({ ...form, ownerEmail: e.target.value })} placeholder="you@email.com" className="rounded-xl" /></div>
                </div>
              </div>
              <div><label className="text-xs font-medium block mb-1">Address</label><Input value={form.ownerAddress} onChange={(e) => setForm({ ...form, ownerAddress: e.target.value })} placeholder="123 Main St, Fresno, CA" className="rounded-xl" /></div>
              <div><label className="text-xs font-medium block mb-1">Notes / Medical Info</label><textarea value={form.notes} onChange={(e) => setForm({ ...form, notes: e.target.value })} rows={2} placeholder="Allergies, medications, distinguishing features…" className="w-full rounded-xl border border-input bg-background px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-ring resize-none" /></div>
              <div><label className="text-xs font-medium block mb-1">Photo</label><div className="rounded-xl border-2 border-dashed border-border/50 p-3 flex items-center gap-3 cursor-pointer hover:border-primary/50 transition-colors" onClick={() => fileRef.current?.click()}>{form.photoBase64 ? <img src={form.photoBase64} alt="pet" className="h-16 rounded-lg object-contain" /> : <><Camera size={20} className="text-muted-foreground" /><span className="text-sm text-muted-foreground">Click to upload photo</span></>}</div><input ref={fileRef} type="file" accept="image/*" className="hidden" onChange={handlePhoto} /></div>
              <div className="flex gap-3 pt-1">
                <Button onClick={handleSave} className="flex-1 rounded-xl gap-2" style={{ background: "#028391", color: "white" }}><Save size={14} /> Save Pet</Button>
                <Button variant="outline" className="rounded-xl" onClick={() => setShowForm(false)}>Cancel</Button>
              </div>
            </div>
          </div>
        </div>
      )}

      {pets.length === 0 ? (
        <div className="text-center py-10">
          <div className="flex justify-center gap-3 mb-3 opacity-40"><KurzgesagtCat size={52} /><KurzgesagtDog size={52} /></div>
          <p className="text-muted-foreground text-sm">No pets registered yet. Add your first pet to get started.</p>
        </div>
      ) : (
        <div className="grid sm:grid-cols-2 gap-4">
          {pets.map((pet) => (
            <div key={pet.id} className="glass-card rounded-2xl overflow-hidden">
              <div className="flex items-start gap-3 p-4">
                {pet.photoBase64 ? <img src={pet.photoBase64} alt={pet.petName} className="w-16 h-16 rounded-xl object-cover flex-shrink-0" /> : <div className="w-16 h-16 rounded-xl flex items-center justify-center flex-shrink-0" style={{ background: pet.petType === "cat" ? "rgba(250,169,104,0.15)" : "rgba(2,131,145,0.12)" }}>{pet.petType === "cat" ? <KurzgesagtCat size={48} /> : <KurzgesagtDog size={48} />}</div>}
                <div className="flex-1 min-w-0">
                  <p className="font-bold font-heading text-base leading-snug">{pet.petName}</p>
                  <p className="text-xs text-muted-foreground capitalize">{pet.petType}{pet.breed ? " · " + pet.breed : ""}</p>
                  <p className="text-xs text-muted-foreground mt-0.5">{pet.color}</p>
                  {pet.microchipId && <p className="text-xs font-mono text-primary mt-0.5">Chip: {pet.microchipId}</p>}
                </div>
              </div>
              <div className="flex gap-1.5 p-3 pt-0 flex-wrap">
                <Button size="sm" variant="outline" className="rounded-xl gap-1.5 text-xs flex-1" onClick={() => handlePrintCard(pet)}><Printer size={12} /> ID Card</Button>
                <Button size="sm" variant="outline" className="rounded-xl gap-1.5 text-xs flex-1" onClick={() => { const text = buildFlyerText({ id: pet.id, createdAt: pet.createdAt, animalType: pet.petType === "dog" ? "dog" : pet.petType === "cat" ? "cat" : "other", count: 1, location: pet.ownerAddress || "", neighborhood: "", dateObserved: new Date().toISOString().slice(0,10), timeObserved: "", inDanger: "no", concernTypes: ["pet registry"], description: pet.notes || "", evidenceNotes: "", agenciesContacted: "", responseReceived: "", contactInfo: pet.ownerPhone, anonymous: false, status: "submitted" } as any); navigator.clipboard.writeText(text); }}><Download size={12} /> Flyer</Button>
                <Button size="sm" variant="outline" className="rounded-xl gap-1.5 text-xs" onClick={() => openEdit(pet)}><Edit3 size={12} /></Button>
                <Button size="sm" variant="outline" className="rounded-xl gap-1.5 text-xs text-destructive hover:bg-destructive/10 hover:border-destructive" onClick={() => handleDelete(pet.id)}><Trash2 size={12} /></Button>
              </div>
            </div>
          ))}
        </div>
      )}

      <div className="mt-8 glass-card rounded-3xl p-5">
        <div className="flex items-center gap-2 mb-4">
          <Shield size={14} className="text-primary" />
          <h3 className="font-heading font-bold text-sm">Hotspot Summary</h3>
        </div>
        <HotspotSummary reports={getReports()} />
        <div className="mt-4 grid sm:grid-cols-2 gap-4">
          <div className="rounded-2xl p-4 bg-muted/40">
            <p className="text-xs uppercase tracking-wide text-muted-foreground mb-2">Duplicate detector</p>
            <p className="text-sm font-semibold mb-1">Likely duplicates: {findDuplicateReports(getReports()).length}</p>
            <p className="text-xs text-muted-foreground">Matches same neighborhood + location + animal type.</p>
          </div>
          <div className="rounded-2xl p-4 bg-muted/40">
            <p className="text-xs uppercase tracking-wide text-muted-foreground mb-2">Flyer helper</p>
            <p className="text-sm font-semibold mb-1">Copy a printable text summary from any pet card.</p>
            <p className="text-xs text-muted-foreground">Great for posting, sharing, or email.</p>
          </div>
        </div>
      </div>
    </div>
  );
}
