import { useState } from "react";
import { useForm } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod";
import { z } from "zod";
import { useLocation } from "wouter";
import { CheckCircle2, ArrowRight, Camera, MapPin, Clock, AlertTriangle, PawPrint, User } from "lucide-react";
import { Form, FormControl, FormField, FormItem, FormLabel, FormMessage } from "@/components/ui/form";
import { Input } from "@/components/ui/input";
import { Textarea } from "@/components/ui/textarea";
import { Button } from "@/components/ui/button";
import { Checkbox } from "@/components/ui/checkbox";
import { KurzgesagtCat } from "@/components/KurzgesagtCat";
import { KurzgesagtDog } from "@/components/KurzgesagtDog";
import { saveReport, generateId, CONCERN_TYPES, type Report } from "@/lib/storage";

const schema = z.object({
  animalType: z.enum(["cat", "dog", "other"]),
  count: z.coerce.number().min(1),
  location: z.string().min(3, "Please describe the location"),
  neighborhood: z.string().min(2, "Please enter a neighborhood"),
  dateObserved: z.string().min(1, "Date is required"),
  timeObserved: z.string().optional().default(""),
  inDanger: z.enum(["yes", "no", "unsure"]),
  concernTypes: z.array(z.string()).min(1, "Select at least one concern type"),
  description: z.string().min(10, "Please provide a description (at least 10 characters)"),
  evidenceNotes: z.string().optional().default(""),
  agenciesContacted: z.string().optional().default(""),
  responseReceived: z.string().optional().default(""),
  contactInfo: z.string().optional().default(""),
  anonymous: z.boolean(),
  consent: z.literal(true, { errorMap: () => ({ message: "You must agree to continue" }) }),
});

type FormData = z.infer<typeof schema>;

const SECTION_STYLES: Record<string, { accent: string; light: string; icon: string }> = {
  animal:   { accent: "#028391", light: "rgba(2,131,145,0.08)",   icon: "#028391" },
  location: { accent: "#FAA968", light: "rgba(250,169,104,0.10)", icon: "#D4883A" },
  concern:  { accent: "#F85525", light: "rgba(248,85,37,0.07)",   icon: "#F85525" },
  evidence: { accent: "#01204E", light: "rgba(1,32,78,0.06)",     icon: "#01204E" },
  agency:   { accent: "#028391", light: "rgba(2,131,145,0.07)",   icon: "#028391" },
  contact:  { accent: "#FAA968", light: "rgba(250,169,104,0.08)", icon: "#D4883A" },
};

function SectionCard({
  id,
  title,
  icon,
  children,
}: {
  id: keyof typeof SECTION_STYLES;
  title: string;
  icon: React.ReactNode;
  children: React.ReactNode;
}) {
  const s = SECTION_STYLES[id];
  return (
    <div
      className="rounded-3xl p-6"
      style={{
        background: `rgba(255,252,243,0.94)`,
        borderLeft: `4px solid ${s.accent}`,
        boxShadow: "0 2px 12px rgba(1,32,78,0.07), 0 6px 24px rgba(1,32,78,0.06)",
      }}
    >
      <div
        className="inline-flex items-center gap-2 px-3 py-1.5 rounded-xl mb-5"
        style={{ background: s.light }}
      >
        <span style={{ color: s.icon }}>{icon}</span>
        <span className="font-heading font-bold text-sm" style={{ color: s.icon }}>{title}</span>
      </div>
      {children}
    </div>
  );
}

export default function SubmitReport() {
  const [, setLocation] = useLocation();
  const [submitted, setSubmitted] = useState(false);
  const [savedId, setSavedId] = useState<string | null>(null);

  const form = useForm<FormData>({
    resolver: zodResolver(schema),
    defaultValues: {
      animalType: "cat",
      count: 1,
      location: (() => {
        try { return JSON.parse(sessionStorage.getItem("voicemap_prefill") ?? "{}").location ?? ""; } catch { return ""; }
      })(),
      neighborhood: (() => {
        try { return JSON.parse(sessionStorage.getItem("voicemap_prefill") ?? "{}").neighborhood ?? ""; } catch { return ""; }
      })(),
      dateObserved: new Date().toISOString().split("T")[0],
      timeObserved: "",
      inDanger: "unsure",
      concernTypes: [],
      description: "",
      evidenceNotes: "",
      agenciesContacted: "",
      responseReceived: "",
      contactInfo: "",
      anonymous: false,
      consent: undefined as unknown as true,
    },
  });

  const animalType = form.watch("animalType");

  function onSubmit(data: FormData) {
    const id = generateId();
    const report: Report = {
      id,
      createdAt: new Date().toISOString(),
      animalType: data.animalType,
      count: data.count,
      location: data.location,
      neighborhood: data.neighborhood,
      dateObserved: data.dateObserved,
      timeObserved: data.timeObserved ?? "",
      inDanger: data.inDanger,
      concernTypes: data.concernTypes,
      description: data.description,
      evidenceNotes: data.evidenceNotes ?? "",
      agenciesContacted: data.agenciesContacted ?? "",
      responseReceived: data.responseReceived ?? "",
      contactInfo: data.contactInfo || undefined,
      anonymous: data.anonymous,
      status: "submitted",
    };
    saveReport(report);
    setSavedId(id);
    setSubmitted(true);
    sessionStorage.removeItem("voicemap_prefill");
  }

  if (submitted) {
    return (
      <div className="min-h-screen pt-28 pb-16 px-4">
        <div className="max-w-xl mx-auto text-center">
          <div
            className="rounded-3xl p-10"
            style={{
              background: "rgba(255,252,243,0.95)",
              boxShadow: "0 4px 24px rgba(1,32,78,0.10), 0 8px 40px rgba(1,32,78,0.08)",
            }}
          >
            <div
              className="w-16 h-16 rounded-full flex items-center justify-center mx-auto mb-5"
              style={{ background: "rgba(2,131,145,0.12)" }}
            >
              <CheckCircle2 size={32} style={{ color: "#028391" }} />
            </div>
            <h2 className="font-heading text-3xl font-bold mb-3">Concern Documented</h2>
            <p className="text-muted-foreground mb-2">
              Saved locally with reference ID:
            </p>
            <code
              className="text-xs px-3 py-1.5 rounded-lg font-mono inline-block"
              style={{ background: "rgba(2,131,145,0.1)", color: "#028391" }}
            >
              {savedId}
            </code>
            <p className="text-sm text-muted-foreground mt-4 mb-8">
              This is a submitted concern awaiting review. It has not been reviewed by any
              government agency at this time.
            </p>
            <div className="flex flex-col sm:flex-row gap-3 justify-center">
              <Button
                data-testid="button-generate-after-submit"
                className="rounded-xl gap-2"
                style={{ background: "#028391", color: "white" }}
                onClick={() => setLocation("/generate")}
              >
                Generate a Report Packet <ArrowRight size={16} />
              </Button>
              <Button
                data-testid="button-submit-another"
                variant="outline"
                className="rounded-xl"
                onClick={() => { setSubmitted(false); form.reset(); }}
              >
                Submit Another Concern
              </Button>
            </div>
          </div>
          <div className="mt-8 flex justify-center gap-4">
            <KurzgesagtCat size={90} />
            <KurzgesagtDog size={80} />
          </div>
        </div>
      </div>
    );
  }

  return (
    <div className="min-h-screen pt-24 pb-16 px-4">
      <div className="max-w-3xl mx-auto">

        {/* ── Page header with mascot ── */}
        <div
          className="rounded-3xl px-8 py-6 mb-8 flex items-center gap-6"
          style={{
            background: "rgba(255,252,243,0.92)",
            boxShadow: "0 2px 12px rgba(1,32,78,0.07)",
          }}
        >
          <div className="flex-1 min-w-0">
            <div
              className="inline-flex items-center gap-1.5 px-3 py-1 rounded-full text-xs font-semibold mb-3"
              style={{ background: "rgba(2,131,145,0.12)", color: "#028391" }}
            >
              <PawPrint size={11} /> Document a Concern
            </div>
            <h1 className="font-heading text-3xl font-bold mb-1.5">Report a Stray Animal</h1>
            <p className="text-sm text-muted-foreground leading-relaxed max-w-md">
              Provide as much detail as possible. Use factual language — describe only what you
              directly observed. No speculation, no accusations.
            </p>
          </div>
          <div className="hidden sm:flex items-end gap-2 flex-shrink-0">
            {animalType === "dog"
              ? <KurzgesagtDog size={90} />
              : <KurzgesagtCat size={90} />}
          </div>
        </div>

        <Form {...form}>
          <form onSubmit={form.handleSubmit(onSubmit)} className="space-y-5">

            {/* ── 1. Animal info ── */}
            <SectionCard id="animal" title="Animal Information" icon={<PawPrint size={14} />}>
              <div className="grid sm:grid-cols-2 gap-4">
                <FormField control={form.control} name="animalType" render={({ field }) => (
                  <FormItem>
                    <FormLabel className="font-semibold text-sm">Animal Type</FormLabel>
                    <FormControl>
                      <select
                        data-testid="select-animal-type"
                        {...field}
                        className="w-full h-11 px-3 rounded-xl border border-input bg-background text-sm focus:outline-none focus:ring-2 focus:ring-ring"
                      >
                        <option value="cat">Cat</option>
                        <option value="dog">Dog</option>
                        <option value="other">Other</option>
                      </select>
                    </FormControl>
                    <FormMessage />
                  </FormItem>
                )} />
                <FormField control={form.control} name="count" render={({ field }) => (
                  <FormItem>
                    <FormLabel className="font-semibold text-sm">Number of Animals</FormLabel>
                    <FormControl>
                      <Input data-testid="input-animal-count" type="number" min={1} {...field} className="rounded-xl h-11" />
                    </FormControl>
                    <FormMessage />
                  </FormItem>
                )} />
              </div>

              <div className="mt-5">
                <p className="text-sm font-semibold mb-3">Is the animal currently in immediate danger?</p>
                <FormField control={form.control} name="inDanger" render={({ field }) => (
                  <FormItem>
                    <FormControl>
                      <div className="flex gap-2.5 flex-wrap">
                        {([
                          { v: "yes",    label: "Yes — Immediate Concern", bg: "#F85525", fg: "#fff" },
                          { v: "no",     label: "Not in Danger",           bg: "#028391", fg: "#fff" },
                          { v: "unsure", label: "Unsure",                  bg: "#FAA968", fg: "#01204E" },
                        ] as const).map(({ v, label, bg, fg }) => (
                          <button
                            key={v}
                            type="button"
                            data-testid={`button-danger-${v}`}
                            onClick={() => field.onChange(v)}
                            className="px-4 py-2 rounded-xl text-sm font-semibold transition-all"
                            style={
                              field.value === v
                                ? { background: bg, color: fg, boxShadow: `0 3px 12px ${bg}55` }
                                : { background: "rgba(1,32,78,0.05)", color: "inherit", border: "1.5px solid rgba(1,32,78,0.12)" }
                            }
                          >
                            {label}
                          </button>
                        ))}
                      </div>
                    </FormControl>
                    <FormMessage />
                  </FormItem>
                )} />
              </div>
            </SectionCard>

            {/* ── 2. Location & time ── */}
            <SectionCard id="location" title="Location & Time" icon={<MapPin size={14} />}>
              <div className="grid sm:grid-cols-2 gap-4">
                <FormField control={form.control} name="location" render={({ field }) => (
                  <FormItem>
                    <FormLabel className="font-semibold text-sm">Location / Cross Streets <span className="text-destructive">*</span></FormLabel>
                    <FormControl>
                      <Input data-testid="input-location" placeholder="e.g. Blackstone Ave & Shields Ave" {...field} className="rounded-xl h-11" />
                    </FormControl>
                    <FormMessage />
                  </FormItem>
                )} />
                <FormField control={form.control} name="neighborhood" render={({ field }) => (
                  <FormItem>
                    <FormLabel className="font-semibold text-sm">Neighborhood <span className="text-destructive">*</span></FormLabel>
                    <FormControl>
                      <Input data-testid="input-neighborhood" placeholder="e.g. Tower District" {...field} className="rounded-xl h-11" />
                    </FormControl>
                    <FormMessage />
                  </FormItem>
                )} />
                <FormField control={form.control} name="dateObserved" render={({ field }) => (
                  <FormItem>
                    <FormLabel className="font-semibold text-sm">Date Observed <span className="text-destructive">*</span></FormLabel>
                    <FormControl>
                      <Input data-testid="input-date" type="date" {...field} className="rounded-xl h-11" />
                    </FormControl>
                    <FormMessage />
                  </FormItem>
                )} />
                <FormField control={form.control} name="timeObserved" render={({ field }) => (
                  <FormItem>
                    <FormLabel className="font-semibold text-sm">Time Observed <span className="text-muted-foreground font-normal">(optional)</span></FormLabel>
                    <FormControl>
                      <Input data-testid="input-time" type="time" {...field} className="rounded-xl h-11" />
                    </FormControl>
                    <FormMessage />
                  </FormItem>
                )} />
              </div>
            </SectionCard>

            {/* ── 3. Concern types ── */}
            <SectionCard id="concern" title="Type of Concern" icon={<AlertTriangle size={14} />}>
              <FormField control={form.control} name="concernTypes" render={({ field }) => (
                <FormItem>
                  <p className="text-sm text-muted-foreground mb-4">
                    Select all that apply — based on direct observation only:
                  </p>
                  <div className="grid sm:grid-cols-2 gap-2.5">
                    {CONCERN_TYPES.map((type) => {
                      const checked = field.value?.includes(type);
                      return (
                        <label
                          key={type}
                          className="flex items-center gap-3 px-4 py-2.5 rounded-xl cursor-pointer transition-all"
                          style={
                            checked
                              ? { background: "rgba(248,85,37,0.10)", border: "1.5px solid rgba(248,85,37,0.35)" }
                              : { background: "rgba(1,32,78,0.04)", border: "1.5px solid transparent" }
                          }
                        >
                          <Checkbox
                            data-testid={`checkbox-concern-${type.replace(/\s+/g, "-")}`}
                            checked={checked}
                            onCheckedChange={(c) => {
                              const cur = field.value ?? [];
                              field.onChange(c ? [...cur, type] : cur.filter((v) => v !== type));
                            }}
                          />
                          <span className="text-sm font-medium capitalize">{type}</span>
                        </label>
                      );
                    })}
                  </div>
                  <FormMessage />
                </FormItem>
              )} />
            </SectionCard>

            {/* ── 4. Description & evidence ── */}
            <SectionCard id="evidence" title="Description & Evidence" icon={<Camera size={14} />}>
              <div className="space-y-4">
                <FormField control={form.control} name="description" render={({ field }) => (
                  <FormItem>
                    <FormLabel className="font-semibold text-sm">
                      Describe what you observed <span className="text-destructive">*</span>
                    </FormLabel>
                    <FormControl>
                      <Textarea
                        data-testid="textarea-description"
                        placeholder="Describe what you directly observed. Use factual language. Do not speculate about intent or make accusations."
                        className="rounded-xl min-h-[110px]"
                        {...field}
                      />
                    </FormControl>
                    <FormMessage />
                  </FormItem>
                )} />
                <FormField control={form.control} name="evidenceNotes" render={({ field }) => (
                  <FormItem>
                    <FormLabel className="font-semibold text-sm">
                      Evidence Notes <span className="text-muted-foreground font-normal">(optional)</span>
                    </FormLabel>
                    <FormControl>
                      <Textarea
                        data-testid="textarea-evidence"
                        placeholder="Note any photos taken, videos, dates of repeated sightings, or witnesses."
                        className="rounded-xl min-h-[80px]"
                        {...field}
                      />
                    </FormControl>
                    <p className="text-xs text-muted-foreground mt-1.5">
                      Photo upload coming soon. Note filenames here for reference.
                    </p>
                  </FormItem>
                )} />
              </div>
            </SectionCard>

            {/* ── 5. Agency contact history ── */}
            <SectionCard id="agency" title="Agency Contact History" icon={<Clock size={14} />}>
              <div className="grid sm:grid-cols-2 gap-4">
                <FormField control={form.control} name="agenciesContacted" render={({ field }) => (
                  <FormItem>
                    <FormLabel className="font-semibold text-sm">Agencies Already Contacted</FormLabel>
                    <FormControl>
                      <Input data-testid="input-agencies" placeholder="e.g. Fresno Animal Center" {...field} className="rounded-xl h-11" />
                    </FormControl>
                  </FormItem>
                )} />
                <FormField control={form.control} name="responseReceived" render={({ field }) => (
                  <FormItem>
                    <FormLabel className="font-semibold text-sm">Did Anyone Respond?</FormLabel>
                    <FormControl>
                      <Input data-testid="input-response" placeholder="e.g. No response yet" {...field} className="rounded-xl h-11" />
                    </FormControl>
                  </FormItem>
                )} />
              </div>
            </SectionCard>

            {/* ── 6. Contact & consent ── */}
            <SectionCard id="contact" title="Your Information & Consent" icon={<User size={14} />}>
              <div className="space-y-4">
                <FormField control={form.control} name="anonymous" render={({ field }) => (
                  <FormItem className="flex items-center gap-3 space-y-0">
                    <FormControl>
                      <Checkbox
                        data-testid="checkbox-anonymous"
                        checked={field.value}
                        onCheckedChange={field.onChange}
                      />
                    </FormControl>
                    <FormLabel className="text-sm font-normal cursor-pointer">
                      Submit anonymously — contact info will not be saved
                    </FormLabel>
                  </FormItem>
                )} />

                {!form.watch("anonymous") && (
                  <FormField control={form.control} name="contactInfo" render={({ field }) => (
                    <FormItem>
                      <FormLabel className="font-semibold text-sm">
                        Contact Information <span className="text-muted-foreground font-normal">(optional, not shared publicly)</span>
                      </FormLabel>
                      <FormControl>
                        <Input
                          data-testid="input-contact"
                          placeholder="Email or phone"
                          {...field}
                          className="rounded-xl h-11"
                        />
                      </FormControl>
                    </FormItem>
                  )} />
                )}

                <FormField control={form.control} name="consent" render={({ field }) => (
                  <FormItem>
                    <div
                      className="flex items-start gap-3 p-4 rounded-2xl"
                      style={{ background: "rgba(2,131,145,0.06)", border: "1.5px solid rgba(2,131,145,0.18)" }}
                    >
                      <FormControl>
                        <Checkbox
                          data-testid="checkbox-consent"
                          checked={field.value === true}
                          onCheckedChange={(c) => field.onChange(c === true ? true : undefined)}
                        />
                      </FormControl>
                      <FormLabel className="text-sm font-normal cursor-pointer leading-relaxed">
                        <span className="font-semibold">I understand</span> this tool helps organize reported concerns
                        and does not make legal findings. I am submitting information based on my direct observations.{" "}
                        <span className="font-semibold">I agree to submit responsibly.</span>
                      </FormLabel>
                    </div>
                    <FormMessage />
                  </FormItem>
                )} />
              </div>
            </SectionCard>

            <button
              type="submit"
              data-testid="button-submit-report"
              className="w-full h-13 rounded-2xl text-base font-bold flex items-center justify-center gap-2 transition-all"
              style={{
                background: "#028391",
                color: "white",
                boxShadow: "0 4px 16px rgba(2,131,145,0.35)",
                height: "52px",
              }}
            >
              Submit Reported Concern <ArrowRight size={18} />
            </button>

            <p className="text-center text-xs text-muted-foreground pb-2">
              Saved locally on your device. No data is sent to external servers.
              Each concern receives a unique tracking ID.
            </p>
          </form>
        </Form>
      </div>
    </div>
  );
}
