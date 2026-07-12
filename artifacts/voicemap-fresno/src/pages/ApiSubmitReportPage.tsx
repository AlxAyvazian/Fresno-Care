import { useEffect, useState } from "react";
import { zodResolver } from "@hookform/resolvers/zod";
import { useForm } from "react-hook-form";
import { z } from "zod";
import { useLocation } from "wouter";
import { AlertCircle, ArrowRight, CheckCircle2, MapPin, PawPrint, ShieldCheck } from "lucide-react";
import { Button } from "@/components/ui/button";
import { Checkbox } from "@/components/ui/checkbox";
import { Form, FormControl, FormField, FormItem, FormLabel, FormMessage } from "@/components/ui/form";
import { Input } from "@/components/ui/input";
import { Textarea } from "@/components/ui/textarea";
import { createReport } from "@/lib/reportsApi";
import { CONCERN_TYPES, generateId, saveReport, type Report } from "@/lib/storage";

const formSchema = z.object({
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
  consent: z.boolean().refine((value) => value, "You must agree before submitting."),
});

type FormValues = z.infer<typeof formSchema>;

type SubmissionResult = {
  mode: "public" | "device";
  localId: string;
  publicId?: string;
};

export default function ApiSubmitReportPage() {
  const [, navigate] = useLocation();
  const [result, setResult] = useState<SubmissionResult | null>(null);
  const [submissionError, setSubmissionError] = useState<string | null>(null);

  const form = useForm<FormValues>({
    resolver: zodResolver(formSchema),
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
    setSubmissionError(null);

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
      const publicReport = await createReport(report);
      const savedReport: Report = {
        ...report,
        publicId: publicReport.publicId,
        createdAt: publicReport.createdAt,
        status: publicReport.status,
        anonymous: publicReport.anonymous,
      };
      saveReport(savedReport);
      setResult({ mode: "public", localId, publicId: publicReport.publicId });
    } catch (error) {
      saveReport(report);
      setSubmissionError(
        error instanceof Error
          ? `The public service could not accept the report: ${error.message}`
          : "The public service could not accept the report.",
      );
      setResult({ mode: "device", localId });
    }

    sessionStorage.removeItem("voicemap_prefill");
  }

  if (result) {
    return (
      <main className="min-h-screen px-4 pb-16 pt-28">
        <div className="mx-auto max-w-xl">
          <section className="glass-card rounded-3xl p-8 text-center sm:p-10">
            {result.mode === "public" ? (
              <CheckCircle2 size={48} className="mx-auto text-primary" />
            ) : (
              <AlertCircle size={48} className="mx-auto text-amber-600" />
            )}
            <h1 className="mt-5 font-heading text-3xl font-bold">
              {result.mode === "public" ? "Concern submitted" : "Saved on this device"}
            </h1>
            <p className="mt-3 text-sm leading-relaxed text-muted-foreground">
              {result.mode === "public"
                ? "The report was stored in the Fresno Care public reporting database. Private contact information is never included in the public response."
                : "The public reporting service was unavailable, so the report was preserved only in this browser. It is not visible to other people or reviewers."}
            </p>

            {submissionError && (
              <p className="mt-4 rounded-2xl bg-amber-500/10 p-4 text-left text-sm text-amber-900 dark:text-amber-200">
                {submissionError}
              </p>
            )}

            <div className="mt-6 rounded-2xl bg-muted/50 p-4 text-left text-xs text-muted-foreground">
              <p>Device reference: <span className="font-mono">{result.localId}</span></p>
              {result.publicId && <p className="mt-2">Public reference: <span className="font-mono">{result.publicId}</span></p>}
            </div>

            <div className="mt-7 flex flex-col gap-3 sm:flex-row sm:justify-center">
              {result.publicId && (
                <Button onClick={() => navigate(`/share/${result.publicId}`)} className="rounded-xl gap-2">
                  Open public report <ArrowRight size={15} />
                </Button>
              )}
              <Button
                variant="outline"
                onClick={() => {
                  setResult(null);
                  setSubmissionError(null);
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
      <div className="mx-auto max-w-3xl space-y-7">
        <section className="glass-card rounded-3xl p-7 sm:p-9">
          <div className="mb-3 inline-flex items-center gap-2 rounded-full bg-primary/10 px-3 py-1 text-xs font-semibold text-primary">
            <PawPrint size={14} /> Document a concern
          </div>
          <h1 className="font-heading text-3xl font-bold sm:text-4xl">Report a stray animal concern</h1>
          <p className="mt-3 text-sm leading-relaxed text-muted-foreground sm:text-base">
            Describe only what you directly observed. Do not identify or accuse a person. Submitted reports remain observations and are not legal findings.
          </p>
        </section>

        <Form {...form}>
          <form onSubmit={form.handleSubmit(onSubmit)} className="space-y-5">
            <section className="glass-card rounded-3xl p-6 sm:p-8">
              <h2 className="font-heading text-xl font-bold">Animal and urgency</h2>
              <div className="mt-5 grid gap-4 sm:grid-cols-2">
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
            </section>

            <section className="glass-card rounded-3xl p-6 sm:p-8">
              <h2 className="flex items-center gap-2 font-heading text-xl font-bold"><MapPin size={19} /> Location and time</h2>
              <div className="mt-5 grid gap-4 sm:grid-cols-2">
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
            </section>

            <section className="glass-card rounded-3xl p-6 sm:p-8">
              <h2 className="font-heading text-xl font-bold">Observed concerns</h2>
              <FormField control={form.control} name="concernTypes" render={({ field }) => (
                <FormItem className="mt-5">
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
            </section>

            <section className="glass-card rounded-3xl p-6 sm:p-8">
              <h2 className="font-heading text-xl font-bold">Contact history and privacy</h2>
              <div className="mt-5 grid gap-4 sm:grid-cols-2">
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
                      <ShieldCheck size={15} className="mr-1 inline text-primary" /> I am submitting direct observations responsibly and understand that this report does not make a legal finding.
                    </FormLabel>
                  </div>
                  <FormMessage />
                </FormItem>
              )} />
            </section>

            <Button type="submit" disabled={form.formState.isSubmitting} className="h-13 w-full rounded-2xl text-base font-bold gap-2">
              {form.formState.isSubmitting ? "Submitting…" : "Submit documented concern"}
              {!form.formState.isSubmitting && <ArrowRight size={18} />}
            </Button>
            <p className="text-center text-xs leading-relaxed text-muted-foreground">
              The app first attempts to store the report in the public Fresno Care database. If that service is unavailable, the report is saved only on this device and the confirmation page will say so.
            </p>
          </form>
        </Form>
      </div>
    </main>
  );
}
