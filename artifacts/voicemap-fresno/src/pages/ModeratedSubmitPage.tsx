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
  MapPin,
  PawPrint,
  ShieldCheck,
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
import { createReport } from "@/lib/reportsApi";
import { CONCERN_TYPES, generateId, saveReport, type Report } from "@/lib/storage";

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

export default function ModeratedSubmitPage() {
  const [, navigate] = useLocation();
  const [result, setResult] = useState<SubmissionResult | null>(null);

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
    if (anonymous && form.getValues("contactInfo")) {
      form.setValue("contactInfo", "", { shouldDirty: true });
    }
  }, [anonymous, form]);

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

    try {
      const receipt = await createReport(report);
      saveReport({
        ...report,
        publicId: receipt.publicId,
        createdAt: receipt.createdAt,
        status: receipt.status,
      });
      setResult({ mode: "review", localId, publicId: receipt.publicId });
    } catch (error) {
      saveReport(report);
      setResult({
        mode: "device",
        localId,
        error: error instanceof Error ? error.message : "The reporting service was unavailable.",
      });
    }

    sessionStorage.removeItem("voicemap_prefill");
  }

  if (result) {
    const submittedForReview = result.mode === "review";

    return (
      <main className="min-h-screen px-4 pb-16 pt-28">
        <div className="mx-auto max-w-xl">
          <section className="glass-card rounded-3xl p-8 text-center sm:p-10">
            {submittedForReview ? (
              <Clock3 size={52} className="mx-auto text-primary" />
            ) : (
              <AlertCircle size={52} className="mx-auto text-amber-600" />
            )}

            <h1 className="mt-5 font-heading text-3xl font-bold">
              {submittedForReview ? "Submitted for review" : "Saved on this device"}
            </h1>
            <p className="mt-3 text-sm leading-relaxed text-muted-foreground">
              {submittedForReview
                ? "The report was received and remains private while an authorized reviewer evaluates it. It will not appear on the public dashboard or at a share link unless publication is explicitly approved."
                : "The reporting service was unavailable. This report exists only in this browser and has not entered the moderation queue."}
            </p>

            {result.error && (
              <p className="mt-5 rounded-2xl bg-amber-500/10 p-4 text-left text-sm text-amber-900 dark:text-amber-200">
                Service response: {result.error}
              </p>
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
                      I am submitting direct observations responsibly and understand that this report does not make a legal finding.
                    </FormLabel>
                  </div>
                  <FormMessage />
                </FormItem>
              )} />
            </Section>

            <Button type="submit" disabled={form.formState.isSubmitting} className="h-[52px] w-full rounded-2xl text-base font-bold gap-2">
              {form.formState.isSubmitting ? "Submitting…" : "Submit for review"}
              {!form.formState.isSubmitting && <ArrowRight size={18} />}
            </Button>
            <p className="text-center text-xs leading-relaxed text-muted-foreground">
              Accepted reports enter a private moderation queue. Only approved reports appear publicly. If the service is unavailable, the report is saved on this device only.
            </p>
          </form>
        </Form>
      </div>
    </main>
  );
}
