import { useMemo, useState } from "react";
import { useLocation } from "wouter";
import {
  CheckCircle2,
  Circle,
  ClipboardList,
  FileText,
  MapPin,
  PawPrint,
  Shield,
} from "lucide-react";
import { Button } from "@/components/ui/button";

const CHECKLIST = [
  "Stay in a safe public location and do not confront anyone.",
  "Record the date, time, nearest cross streets, and neighborhood.",
  "Document only what you directly observed—avoid assumptions or accusations.",
  "Note the animal type, count, condition, behavior, and immediate hazards.",
  "Keep original photos or videos with timestamps when it is safe to take them.",
  "Record agencies contacted, the time of contact, and any response received.",
];

const QUICK_ACTIONS = [
  {
    title: "Document a concern",
    description: "Create a structured report with a private/public data boundary.",
    icon: <PawPrint size={20} />,
    path: "/submit",
  },
  {
    title: "Generate a report packet",
    description: "Turn a saved concern into clear, responsible written documentation.",
    icon: <FileText size={20} />,
    path: "/generate",
  },
  {
    title: "Review documented concerns",
    description: "Open the dashboard and review reports available to this device.",
    icon: <MapPin size={20} />,
    path: "/dashboard",
  },
  {
    title: "Escalation resources",
    description: "Prepare careful follow-up language and locate reporting contacts.",
    icon: <Shield size={20} />,
    path: "/escalate",
  },
];

export default function CoreToolsPage() {
  const [, navigate] = useLocation();
  const [completed, setCompleted] = useState<Set<number>>(new Set());

  const completion = useMemo(
    () => Math.round((completed.size / CHECKLIST.length) * 100),
    [completed],
  );

  function toggle(index: number) {
    setCompleted((current) => {
      const next = new Set(current);
      if (next.has(index)) next.delete(index);
      else next.add(index);
      return next;
    });
  }

  return (
    <main className="min-h-screen px-4 pb-16 pt-24">
      <div className="mx-auto max-w-5xl space-y-8">
        <section className="glass-card rounded-3xl p-7 sm:p-9">
          <div className="mb-4 inline-flex items-center gap-2 rounded-full bg-primary/10 px-3 py-1 text-xs font-semibold text-primary">
            <ClipboardList size={14} /> Documentation tools
          </div>
          <h1 className="font-heading text-3xl font-bold sm:text-4xl">
            Prepare a clear, responsible animal concern report
          </h1>
          <p className="mt-3 max-w-3xl text-sm leading-relaxed text-muted-foreground sm:text-base">
            These tools help organize direct observations and follow-up records. They do not make legal findings, replace emergency services, or confirm government review.
          </p>
        </section>

        <section className="grid gap-4 sm:grid-cols-2">
          {QUICK_ACTIONS.map((action) => (
            <button
              key={action.path}
              type="button"
              onClick={() => navigate(action.path)}
              className="glass-card rounded-3xl p-6 text-left transition-transform hover:-translate-y-0.5"
            >
              <div className="mb-4 flex h-11 w-11 items-center justify-center rounded-2xl bg-primary/10 text-primary">
                {action.icon}
              </div>
              <h2 className="font-heading text-lg font-bold">{action.title}</h2>
              <p className="mt-2 text-sm leading-relaxed text-muted-foreground">
                {action.description}
              </p>
            </button>
          ))}
        </section>

        <section className="glass-card rounded-3xl p-6 sm:p-8">
          <div className="mb-5 flex flex-col gap-3 sm:flex-row sm:items-center sm:justify-between">
            <div>
              <h2 className="font-heading text-xl font-bold">Evidence checklist</h2>
              <p className="mt-1 text-sm text-muted-foreground">
                A device-only preparation checklist. Nothing here is submitted automatically.
              </p>
            </div>
            <div className="text-sm font-semibold text-primary">
              {completed.size}/{CHECKLIST.length} complete
            </div>
          </div>

          <div className="mb-6 h-2 overflow-hidden rounded-full bg-muted">
            <div
              className="h-full rounded-full bg-primary transition-all"
              style={{ width: `${completion}%` }}
            />
          </div>

          <div className="space-y-2">
            {CHECKLIST.map((item, index) => {
              const checked = completed.has(index);
              return (
                <button
                  key={item}
                  type="button"
                  onClick={() => toggle(index)}
                  className="flex w-full items-start gap-3 rounded-2xl p-3 text-left transition-colors hover:bg-primary/5"
                >
                  {checked ? (
                    <CheckCircle2 className="mt-0.5 shrink-0 text-primary" size={18} />
                  ) : (
                    <Circle className="mt-0.5 shrink-0 text-muted-foreground" size={18} />
                  )}
                  <span className={checked ? "text-sm text-muted-foreground line-through" : "text-sm"}>
                    {item}
                  </span>
                </button>
              );
            })}
          </div>

          <div className="mt-6 flex flex-wrap gap-3">
            <Button onClick={() => navigate("/submit")} className="rounded-xl">
              Start a report
            </Button>
            <Button
              variant="outline"
              onClick={() => setCompleted(new Set())}
              className="rounded-xl"
            >
              Reset checklist
            </Button>
          </div>
        </section>
      </div>
    </main>
  );
}
