import { useEffect, useState, type ReactNode } from "react";
import { zodResolver } from "@hookform/resolvers/zod";
import { useForm } from "react-hook-form";
import { z } from "zod";
import { useLocation } from "wouter";
import {
  AlertCircle,
  ArrowRight,
  CheckCircle2,
  Clock3,
  FileUp,
  MapPin,
  PawPrint,
  ShieldCheck,
  X,
} from "lucide-react";
import { Button } from "@/components/ui/button";
import { Checkbox } from "@/components/ui/checkbox";
import {
  Form,
  FormControl,
  FormField,
  FormItem,
  FormLabel,
  FormMessage,
} from "@/components/ui/form";
import { Input } from "@/components/ui/input";
import { Textarea } from "@/components/ui/textarea";
import {
  createReport,
  finalizeReport,
  uploadReportEvidence,
  type DeliveryStatus,
} from "@/lib/reportsApi";
import { CONCERN_TYPES, generateId, saveReport, type Report } from "@/lib/storage";

const MAX_EVIDENCE_FILES = 5;
const MAX_EVIDENCE_FILE_BYTES = 20 * 1024 * 1024;
const MAX_EVIDENCE_TOTAL_BYTES = 30 * 1024 * 1024;
const ALLOWED_EVIDENCE_TYPES = new Set([
  "image/jpeg",
  "image/png",
  "image/webp",
  "application/pdf",
  "video/mp4",
]);

const schema = z.object({
  animalType: z.enum(["cat", "dog", "other"]),
  count: z.coerce.number().int().min(1).max(100),
  location: z.string().trim().min(3, "Describe the location or nearest cross streets."),
  neighborhood: z.string().trim().min(2, "Enter the neighborhood."),
  dateObserved: z.string().min(1, "Date is required."),
  timeObserved: z.string().optional().default(""),
  inDanger: z.enum(["yes", "no", "unsure"]),
  concernTypes: z.array(z.string()).min(1, "Select at least one concern type."),
  description: z.string().trim().min(10, "Provide at least 10 characters of factual detail."),
  evidenceNotes: z.string().optional().default(""),
  agenciesContacted: z.string().optional().default(""),
  responseReceived: z.string().optional().default(""),
  contactInfo: z.string().optional().default(""),
  anonymous: z.boolean().default(true),
  consent: z.boolean().refine(Boolean, "You must agree before submitting."),
});

type FormValues = z.infer<typeof schema>;

type SubmissionResult = {
  mode: "review" | "device";
  localId: string;
  publicId?: string;
  error?: string;
  deliveryStatus?: DeliveryStatus;
  deliveryError?: string | null;
  evidenceUploaded?: number;
  evidenceErrors?: string[];
};

type MapPrefill = {
  location?: string;
  neighborhood?: string;
};

function Section({ title, icon, children }: { title: string; icon: ReactNode; children: ReactNode }) {
  return (
    <section className="glass-card rounded-3xl p-6 sm:p-8">
      <h2 className="flex items-center gap-2 font-heading text-xl font-bold">
        {icon} {title}
      </h2>
      <div className="mt-5">{children}</div>
    </section>
  );
}

function formatBytes(bytes: number): string {
  if (bytes < 1024 * 1024) return `${Math.max(Math.round(bytes / 1024), 1)} KB`;
  return `${(bytes / (1024 * 1024)).toFixed(1)} MB`;
}

export default function ModeratedSubmitPage() {
  const [, navigate] = useLocation();
  const [result, setResult] = useState<SubmissionResult | null>(null);
  const [mapPrefill, setMapPrefill] = useState<MapPrefill | null>(null);
  const [evidenceFiles, setEvidenceFiles] = useState<File[]>([]);
  const [evidenceError, setEvidenceError] = useState<string | null>(null);

  const form = useForm<FormValues>({
    resolver: zodResolver(schema),
    defaultValues: {
      animalType: "cat",
      count: 1,
      location: "",
      neighborhood: "",
      dateObserved: new Date().toISOString().slice(0, 10),
      timeObserved: "",
      inDanger: "unsure",
      concernTypes: [],
      description: "",
      evidenceNotes: "",
      agenciesContacted: "",
      responseReceived: "",
      contactInfo: "",
      anonymous: true,
      consent: false,
    },
  });

  const anonymous = form.watch("anonymous");

  useEffect(() => {
    const params = new URLSearchParams(window.location.search);
    const selectedLocation = params.get("location")?.trim() || "";
    const selectedNeighborhood = params.get("neighborhood")?.trim() || "";

    if (!selectedLocation && !selectedNeighborhood) return;

    if (selectedLocation) {
      form.setValue("location", selectedLocation, { shouldDirty: true, shouldTouch: true, shouldValidate: true });
    }
    if (selectedNeighborhood) {
      form.setValue("neighborhood", selectedNeighborhood, { shouldDirty: true, shouldTouch: true, shouldValidate: true });
    }

    setMapPrefill({ location: selectedLocation || undefined, neighborhood: selectedNeighborhood || undefined });
  }, [form]);

  useEffect(() => {
    if (anonymous && form.getValues("contactInfo")) {
      form.setValue("contactInfo", "", { shouldDirty: true });
    }
  }, [anonymous, form]);

  function selectEvidence(files: FileList | null) {
    if (!files) return;
    const next = Array.from(files);
    const combined = [...evidenceFiles, ...next];
    const invalid = next.find((file) => !ALLOWED_EVIDENCE_TYPES.has(file.type));
    const tooLarge = next.find((file) => file.size > MAX_EVIDENCE_FILE_BYTES);
    const totalBytes = combined.reduce((sum, file) => sum + file.size, 0);

    if (combined.length > MAX_EVIDENCE_FILES) {
      setEvidenceError(`Add no more than ${MAX_EVIDENCE_FILES} files.`);
      return;
    }
    if (invalid) {
      setEvidenceError(`${invalid.name} is not a supported JPEG, PNG, WebP, PDF, or MP4 file.`);
      return;
    }
    if (tooLarge) {
      setEvidenceError(`${tooLarge.name} exceeds the 20 MB per-file limit.`);
      return;
    }
    if (totalBytes > MAX_EVIDENCE_TOTAL_BYTES) {
      setEvidenceError("Evidence exceeds the 30 MB total limit.");
      return;
    }

    setEvidenceError(null);
    setEvidenceFiles(combined);
  }

  async function onSubmit(values: FormValues) {
    const localId = generateId();
    const report: Report = {
      id: localId,
      createdAt: new Date().toISOString(),
      animalType: values.animalType,
      count: values.count,
      location: values.location,
      neighborhood: values.neighborhood,
      dateObserved: values.dateObserved,
      timeObserved: values.timeObserved ?? "",
      inDanger: values.inDanger,
      concernTypes: values.concernTypes,
      description: values.description,
      evidenceNotes: values.evidenceNotes ?? "",
      agenciesContacted: values.agenciesContacted ?? "",
      responseReceived: values.responseReceived ?? "",
      contactInfo: values.anonymous ? undefined : values.contactInfo.trim() || undefined,
      anonymous: values.anonymous,
      status: "submitted",
    };

    let receipt;
    try {
      receipt = await createReport(report);
    } catch (error) {
      saveReport(report);
      setResult({
        mode: "device",
        localId,
        error: error instanceof Error ? error.message : "The reporting service was unavailable.",
      });
      sessionStorage.removeItem("voicemap_prefill");
      return;
    }

    const evidenceErrors: string[] = [];
    let evidenceUploaded = 0;
    let deliveryStatus = receipt.deliveryStatus;
    let deliveryError: string | null = null;
    let finalStatus = receipt.status;

    if (!receipt.deduplicated && receipt.evidenceUploadToken) {
      for (const file of evidenceFiles) {
        try {
          await uploadReportEvidence(receipt.publicId, receipt.evidenceUploadToken, file);
          evidenceUploaded += 1;
        } catch (uploadError) {
          evidenceErrors.push(`${file.name}: ${uploadError instanceof Error ? uploadError.message : "upload failed"}`);
        }
      }

      try {
        const finalized = await finalizeReport(receipt.publicId, receipt.evidenceUploadToken);
        deliveryStatus = finalized.delivery.status;
        deliveryError = finalized.delivery.error;
        evidenceUploaded = finalized.receipt.evidenceUploaded;
        finalStatus = finalized.receipt.status;
      } catch (finalizeError) {
        deliveryStatus = "failed";
        deliveryError = finalizeError instanceof Error
          ? finalizeError.message
          : "The agency delivery request could not be completed.";
      }
    }

    saveReport({
      ...report,
      publicId: receipt.publicId,
      createdAt: receipt.createdAt,
      status: finalStatus,
    });
    setResult({
      mode: "review",
      localId,
      publicId: receipt.publicId,
      deliveryStatus,
      deliveryError,
      evidenceUploaded,
      evidenceErrors,
    });
    sessionStorage.removeItem("voicemap_prefill");
  }

  if (result) {
    const submittedForReview = result.mode === "review";
    const delivered = result.deliveryStatus === "sent";

    return (
      <main className="min-h-screen px-4 pb-16 pt-28">
        <div className="mx-auto max-w-xl">
          <section className="glass-card rounded-3xl p-8 text-center sm:p-10">
            {submittedForReview ? (
              delivered
                ? <CheckCircle2 size={52} className="mx-auto text-green-600" />
                : <Clock3 size={52} className="mx-auto text-primary" />
            ) : (
              <AlertCircle size={52} className="mx-auto text-amber-600" />
            )}

            <h1 className="mt-5 font-heading text-3xl font-bold">
              {submittedForReview ? "Report received" : "Saved on this device"}
            </h1>
            <p className="mt-3 text-sm leading-relaxed text-muted-foreground">
              {!submittedForReview
                ? "The reporting service was unavailable. This report exists only in this browser and has not entered the moderation queue."
                : delivered
                  ? "The private report was received and sent to the configured city and agency recipients. Public display still requires an authorized moderation decision."
                  : "The private report was received. Agency delivery is pending or needs moderator attention, and the report remains available in the review queue for retry and follow-up."}
            </p>

            {result.error && (
              <p className="mt-5 rounded-2xl bg-amber-500/10 p-4 text-left text-sm text-amber-900 dark:text-amber-200">
                Service response: {result.error}
              </p>
            )}

            {submittedForReview && (
              <div className="mt-5 space-y-3 text-left text-sm">
                <div className={`rounded-2xl p-4 ${delivered ? "bg-green-500/10 text-green-900 dark:text-green-200" : "bg-amber-500/10 text-amber-900 dark:text-amber-200"}`}>
                  <p className="font-semibold">Agency delivery: {result.deliveryStatus ?? "pending"}</p>
                  {result.deliveryError && <p className="mt-1 text-xs opacity-90">{result.deliveryError}</p>}
                </div>
                <div className="rounded-2xl bg-muted/50 p-4">
                  <p className="font-semibold">Private evidence stored: {result.evidenceUploaded ?? 0} file(s)</p>
                  {(result.evidenceErrors?.length ?? 0) > 0 && (
                    <ul className="mt-2 list-disc space-y-1 pl-5 text-xs text-amber-800 dark:text-amber-200">
                      {result.evidenceErrors?.map((message) => <li key={message}>{message}</li>)}
                    </ul>
                  )}
                </div>
              </div>
            )}

            <div className="mt-6 rounded-2xl bg-muted/50 p-4 text-left text-xs text-muted-foreground">
              <p>Device reference: <span className="font-mono">{result.localId}</span></p>
              {result.publicId && (
                <p className="mt-2">
                  Review reference: <span className="font-mono">{result.publicId}</span>
                </p>
              )}
            </div>

            <div className="mt-7 flex flex-col gap-3 sm:flex-row sm:justify-center">
              <Button type="button" onClick={() => navigate("/dashboard")} className="rounded-xl">
                View approved public reports
              </Button>
              <Button
                type="button"
                variant="outline"
                onClick={() => {
                  setResult(null);
                  form.reset();
                  setMapPrefill(null);
                  setEvidenceFiles([]);
                  setEvidenceError(null);
                }}
                className="rounded-xl"
              >
                Submit another concern
              </Button>
            </div>
          </section>
        </div>
      </main>
    );
  }

  return (
    <main className="min-h-screen px-4 pb-16 pt-24">
      <div className="mx-auto max-w-3xl space-y-6">
        <section className="glass-card rounded-3xl p-7 sm:p-9">
          <div className="mb-3 inline-flex items-center gap-2 rounded-full bg-primary/10 px-3 py-1 text-xs font-semibold text-primary">
            <PawPrint size={14} /> Document a concern
          </div>
          <h1 className="font-heading text-3xl font-bold sm:text-4xl">Report a stray animal concern</h1>
          <p className="mt-3 text-sm leading-relaxed text-muted-foreground sm:text-base">
            Describe only what you directly observed. New submissions remain private until an authorized reviewer makes a publication decision.
          </p>
        </section>

        {mapPrefill && (
          <section className="glass-card rounded-3xl p-5">
            <div className="flex items-start gap-3">
              <MapPin size={20} className="mt-0.5 text-primary" />
              <div>
                <p className="font-heading text-lg font-bold">Map selection added</p>
                <p className="mt-1 text-sm text-muted-foreground">
                  The selected map area was added to the private report fields. You can edit it before submitting.
                </p>
                <div className="mt-3 grid gap-2 text-xs text-muted-foreground sm:grid-cols-2">
                  {mapPrefill.location && <span className="rounded-xl bg-muted/45 px-3 py-2">Location: {mapPrefill.location}</span>}
                  {mapPrefill.neighborhood && <span className="rounded-xl bg-muted/45 px-3 py-2">Neighborhood: {mapPrefill.neighborhood}</span>}
                </div>
              </div>
            </div>
          </section>
        )}

        <Form {...form}>
          <form onSubmit={form.handleSubmit(onSubmit)} className="space-y-5">
            <Section title="Animal and urgency" icon={<PawPrint size={19} />}>
              <div className="grid gap-4 sm:grid-cols-2">
                <FormField control={form.control} name="animalType" render={({ field }) => (
                  <FormItem>
                    <FormLabel>Animal type</FormLabel>
                    <FormControl>
                      <select {...field} className="h-11 w-full rounded-xl border border-input bg-background px-3 text-sm">
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
                    <FormLabel>Number of animals</FormLabel>
                    <FormControl><Input type="number" min={1} max={100} {...field} className="rounded-xl" /></FormControl>
                    <FormMessage />
                  </FormItem>
                )} />
                <FormField control={form.control} name="inDanger" render={({ field }) => (
                  <FormItem className="sm:col-span-2">
                    <FormLabel>Immediate danger</FormLabel>
                    <FormControl>
                      <select {...field} className="h-11 w-full rounded-xl border border-input bg-background px-3 text-sm">
                        <option value="yes">Yes — immediate concern</option>
                        <option value="no">No immediate danger observed</option>
                        <option value="unsure">Unsure</option>
                      </select>
                    </FormControl>
                    <FormMessage />
                  </FormItem>
                )} />
              </div>
            </Section>

            <Section title="Location and time" icon={<MapPin size={19} />}>
              <div className="grid gap-4 sm:grid-cols-2">
                <FormField control={form.control} name="location" render={({ field }) => (
                  <FormItem>
                    <FormLabel>Location or nearest cross streets</FormLabel>
                    <FormControl><Input placeholder="Blackstone Ave & Shields Ave" {...field} className="rounded-xl" /></FormControl>
                    <FormMessage />
                  </FormItem>
                )} />
                <FormField control={form.control} name="neighborhood" render={({ field }) => (
                  <FormItem>
                    <FormLabel>Neighborhood</FormLabel>
                    <FormControl><Input placeholder="Tower District" {...field} className="rounded-xl" /></FormControl>
                    <FormMessage />
                  </FormItem>
                )} />
                <FormField control={form.control} name="dateObserved" render={({ field }) => (
                  <FormItem>
                    <FormLabel>Date observed</FormLabel>
                    <FormControl><Input type="date" {...field} className="rounded-xl" /></FormControl>
                    <FormMessage />
                  </FormItem>
                )} />
                <FormField control={form.control} name="timeObserved" render={({ field }) => (
                  <FormItem>
                    <FormLabel>Time observed <span className="font-normal text-muted-foreground">(optional)</span></FormLabel>
                    <FormControl><Input type="time" {...field} className="rounded-xl" /></FormControl>
                    <FormMessage />
                  </FormItem>
                )} />
              </div>
            </Section>

            <Section title="Observed concerns" icon={<AlertCircle size={19} />}>
              <FormField control={form.control} name="concernTypes" render={({ field }) => (
                <FormItem>
                  <div className="grid gap-2 sm:grid-cols-2">
                    {CONCERN_TYPES.map((concern) => {
                      const checked = field.value.includes(concern);
                      return (
                        <label key={concern} className="flex cursor-pointer items-center gap-3 rounded-xl border border-border/70 p-3 text-sm">
                          <Checkbox
                            checked={checked}
                            onCheckedChange={(value) => {
                              field.onChange(value ? [...field.value, concern] : field.value.filter((item) => item !== concern));
                            }}
                          />
                          <span className="capitalize">{concern}</span>
                        </label>
                      );
                    })}
                  </div>
                  <FormMessage />
                </FormItem>
              )} />

              <div className="mt-5 space-y-4">
                <FormField control={form.control} name="description" render={({ field }) => (
                  <FormItem>
                    <FormLabel>What did you directly observe?</FormLabel>
                    <FormControl><Textarea rows={5} placeholder="Use factual, specific language without speculation." {...field} className="rounded-xl" /></FormControl>
                    <FormMessage />
                  </FormItem>
                )} />
                <FormField control={form.control} name="evidenceNotes" render={({ field }) => (
                  <FormItem>
                    <FormLabel>Evidence notes <span className="font-normal text-muted-foreground">(optional)</span></FormLabel>
                    <FormControl><Textarea rows={3} placeholder="Photos, videos, repeated sightings, or witnesses." {...field} className="rounded-xl" /></FormControl>
                    <FormMessage />
                  </FormItem>
                )} />

                <div className="rounded-2xl border border-dashed border-primary/35 bg-primary/5 p-5">
                  <div className="flex items-start gap-3">
                    <FileUp size={22} className="mt-0.5 text-primary" />
                    <div className="min-w-0 flex-1">
                      <p className="font-semibold">Private evidence files</p>
                      <p className="mt-1 text-xs leading-relaxed text-muted-foreground">
                        Add up to five JPEG, PNG, WebP, PDF, or MP4 files. Files are stored privately and attached to the automatic agency notification when email size permits.
                      </p>
                      <label className="mt-4 inline-flex cursor-pointer items-center gap-2 rounded-xl bg-primary px-4 py-2 text-sm font-semibold text-primary-foreground">
                        <FileUp size={15} /> Choose evidence
                        <input
                          type="file"
                          multiple
                          accept="image/jpeg,image/png,image/webp,application/pdf,video/mp4"
                          onChange={(event) => {
                            selectEvidence(event.target.files);
                            event.target.value = "";
                          }}
                          className="sr-only"
                        />
                      </label>
                    </div>
                  </div>

                  {evidenceError && <p className="mt-3 text-sm text-destructive">{evidenceError}</p>}
                  {evidenceFiles.length > 0 && (
                    <ul className="mt-4 space-y-2">
                      {evidenceFiles.map((file, index) => (
                        <li key={`${file.name}-${file.size}-${index}`} className="flex items-center justify-between gap-3 rounded-xl bg-background/70 px-3 py-2 text-sm">
                          <span className="min-w-0 truncate">{file.name} <span className="text-xs text-muted-foreground">({formatBytes(file.size)})</span></span>
                          <button
                            type="button"
                            onClick={() => setEvidenceFiles((current) => current.filter((_, itemIndex) => itemIndex !== index))}
                            className="rounded-lg p-1 text-muted-foreground hover:bg-muted hover:text-foreground"
                            aria-label={`Remove ${file.name}`}
                          >
                            <X size={16} />
                          </button>
                        </li>
                      ))}
                    </ul>
                  )}
                </div>
              </div>
            </Section>

            <Section title="Contact history and privacy" icon={<ShieldCheck size={19} />}>
              <div className="grid gap-4 sm:grid-cols-2">
                <FormField control={form.control} name="agenciesContacted" render={({ field }) => (
                  <FormItem>
                    <FormLabel>Agencies already contacted <span className="font-normal text-muted-foreground">(optional)</span></FormLabel>
                    <FormControl><Input {...field} className="rounded-xl" /></FormControl>
                    <FormMessage />
                  </FormItem>
                )} />
                <FormField control={form.control} name="responseReceived" render={({ field }) => (
                  <FormItem>
                    <FormLabel>Response received <span className="font-normal text-muted-foreground">(optional)</span></FormLabel>
                    <FormControl><Input {...field} className="rounded-xl" /></FormControl>
                    <FormMessage />
                  </FormItem>
                )} />
              </div>

              <FormField control={form.control} name="anonymous" render={({ field }) => (
                <FormItem className="mt-5 flex items-center gap-3 space-y-0 rounded-2xl bg-muted/40 p-4">
                  <FormControl><Checkbox checked={field.value} onCheckedChange={(value) => field.onChange(value === true)} /></FormControl>
                  <FormLabel className="cursor-pointer font-normal">Submit anonymously. Contact information will not be stored.</FormLabel>
                </FormItem>
              )} />

              {!anonymous && (
                <FormField control={form.control} name="contactInfo" render={({ field }) => (
                  <FormItem className="mt-4">
                    <FormLabel>Contact information <span className="font-normal text-muted-foreground">(optional and never public)</span></FormLabel>
                    <FormControl><Input placeholder="Email or phone" {...field} className="rounded-xl" /></FormControl>
                    <FormMessage />
                  </FormItem>
                )} />
              )}

              <FormField control={form.control} name="consent" render={({ field }) => (
                <FormItem className="mt-5">
                  <div className="flex items-start gap-3 rounded-2xl border border-primary/20 bg-primary/5 p-4">
                    <FormControl><Checkbox checked={field.value} onCheckedChange={(value) => field.onChange(value === true)} /></FormControl>
                    <FormLabel className="cursor-pointer text-sm font-normal leading-relaxed">
                      I am submitting direct observations responsibly and understand that this report does not make a legal finding. I authorize VoiceMap Fresno to send this report and its evidence to the configured public agencies for review.
                    </FormLabel>
                  </div>
                  <FormMessage />
                </FormItem>
              )} />
            </Section>

            <Button type="submit" disabled={form.formState.isSubmitting || Boolean(evidenceError)} className="h-[52px] w-full rounded-2xl text-base font-bold gap-2">
              {form.formState.isSubmitting ? "Submitting and notifying agencies…" : "Submit report and notify agencies"}
              {!form.formState.isSubmitting && <ArrowRight size={18} />}
            </Button>
            <p className="text-center text-xs leading-relaxed text-muted-foreground">
              Successful submissions enter the private moderation queue and are automatically sent to the configured city and agency recipients. Only approved reports appear publicly.
            </p>
          </form>
        </Form>
      </div>
    </main>
  );
}
