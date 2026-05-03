import { useState } from "react";
import { Copy, CheckCircle2, Send, Building2, Mic2, Shield, Mail, Phone, ChevronDown, ChevronUp } from "lucide-react";
import { Button } from "@/components/ui/button";
import { AnimatedBackground } from "@/components/AnimatedBackground";
import { getReports, type Report } from "@/lib/storage";
import { CONTACTS, CATEGORY_LABELS, CATEGORY_COLORS, type Contact } from "@/lib/contacts";

interface MessageTemplate {
  id: string;
  title: string;
  icon: React.ReactNode;
  color: string;
  description: string;
  defaultRecipients: string[];
  defaultSubjectFn: (r: Report | null) => string;
  generate: (r: Report | null) => string;
}

const templates: MessageTemplate[] = [
  {
    id: "animal-control",
    title: "Animal Control / Police Non-Emergency",
    icon: <Shield size={18} />,
    color: "border-primary bg-primary/5",
    description: "Send a documented welfare concern to Fresno Animal Center and/or Fresno Police Non-Emergency.",
    defaultRecipients: ["FCAnimalCenter@fresno.gov", "police@fresno.gov"],
    defaultSubjectFn: (r) => r
      ? `Submitted Animal Welfare Concern — Requires Review — ${r.neighborhood}`
      : "Submitted Animal Welfare Concern — Requires Review",
    generate: (r) => r
      ? `Dear Fresno Animal Services,

I am submitting a documented animal welfare concern for your review and requesting formal investigation.

I am reporting an alleged incident involving ${r.count} ${r.animalType}(s) observed at ${r.location}, in the ${r.neighborhood} neighborhood of Fresno, on ${new Date(r.dateObserved).toLocaleDateString("en-US", { year: "numeric", month: "long", day: "numeric" })}.

The reported concern includes: ${r.concernTypes.join(", ")}.

${r.inDanger === "yes" ? "⚠️ The reporting party indicated the animal appeared to be in immediate danger at the time of observation.\n\n" : ""}I am requesting:
1. Whether this location has previously received reports of animal welfare concerns.
2. That a trained officer or animal control officer review this submitted evidence at their earliest availability.
3. A response confirming what action, if any, has been taken or will be taken.

${r.description ? `Description of concern (direct observation only):\n"${r.description}"\n\n` : ""}This concern is documented as Report ID: ${r.id}.

Submitted responsibly via VoiceMap Fresno — a public-interest documentation tool for Fresno residents.

Thank you for your service to the animals and residents of Fresno.

Submitted by: ${r.anonymous ? "[Anonymous Submission]" : (r.contactInfo || "[Contact available upon request]")}`
      : `Dear Fresno Animal Services,

[Select a documented concern from the list to generate a personalized message.]

I am submitting a documented animal welfare concern for your review. I am requesting an investigation of an alleged incident. I am asking whether this location has received repeated reports. Please advise what action, if any, has been taken.

Fresno Animal Center: (559) 621-5795
Fresno Police Non-Emergency: (559) 621-7000`,
  },
  {
    id: "city-council",
    title: "City Council / Mayor Escalation",
    icon: <Building2 size={18} />,
    color: "border-accent/50 bg-accent/5",
    description: "Escalate a pattern of concerns to Fresno City Council members or the Mayor's Office.",
    defaultRecipients: [
      "jerry.dyer@fresno.gov",
      "miguel.arias@fresno.gov",
      "luis.chavez@fresno.gov",
      "tyler.maxwell@fresno.gov",
      "annalisa.perea@fresno.gov",
      "garry.bredefeld@fresno.gov",
      "nelson.esparza@fresno.gov",
    ],
    defaultSubjectFn: (r) => r
      ? `Pattern of Public Reports — Animal Welfare Concern Requiring City Response — ${r.neighborhood}`
      : "Pattern of Public Reports — Animal Welfare Concern — Requires City Response",
    generate: (r) => r
      ? `Dear Fresno City Council Members / Office of the Mayor,

I am a concerned Fresno resident writing to escalate a documented animal welfare concern that I believe requires city-level attention and response.

I am reporting a documented concern involving ${r.count} ${r.animalType}(s) observed at ${r.location} in the ${r.neighborhood} area of Fresno, California on ${new Date(r.dateObserved).toLocaleDateString("en-US", { year: "numeric", month: "long", day: "numeric" })}.

Type of concern documented: ${r.concernTypes.join(", ")}.

I am requesting:
1. Review of this submitted evidence (Report ID: ${r.id})
2. Confirmation of whether Fresno Animal Center has received prior reports from this area
3. Documentation of any follow-up action taken by city agencies
4. Clarification of what resources are available to address ongoing stray animal welfare concerns in ${r.neighborhood}

${r.agenciesContacted ? `Agencies I have already contacted: ${r.agenciesContacted}\nResponse received: ${r.responseReceived || "None documented"}\n\n` : ""}I understand that city staff manage many priorities. I am not making allegations of misconduct. I am asking for transparency about the city's response process for documented animal welfare concerns.

This concern is part of a pattern of public reports submitted via VoiceMap Fresno, a free public-interest documentation tool for Fresno residents.

I respectfully request a response at your earliest convenience.

Submitted by: ${r.anonymous ? "[Anonymous — contact available upon request]" : (r.contactInfo || "[Contact available upon request]")}
Report ID: ${r.id}`
      : `Dear Fresno City Council Members / Office of the Mayor,

[Select a documented concern from the list to generate a personalized message.]

I am a Fresno resident escalating a documented animal welfare concern. I am requesting review of submitted evidence and clarification on city agency response protocols.

Fresno City Council: (559) 621-8000
Mayor's Office: (559) 621-8000`,
  },
  {
    id: "media",
    title: "Local Media Tip",
    icon: <Mic2 size={18} />,
    color: "border-destructive/40 bg-destructive/5",
    description: "Submit a responsible media tip to local news organizations about a documented pattern.",
    defaultRecipients: [
      "newstips@fresnobee.com",
      "abc30tips@abc.com",
      "newstips@kmph.com",
      "tips@gvwire.com",
    ],
    defaultSubjectFn: (r) => r
      ? `Media Tip — Fresno Animal Welfare Concern — ${r.neighborhood}`
      : "Media Tip — Fresno Animal Welfare Concern",
    generate: (r) => r
      ? `Hello,

I am a Fresno resident reaching out to share a documented animal welfare concern that I believe may be of public interest.

Summary of Submitted Evidence:
- Location: ${r.location}, ${r.neighborhood}, Fresno CA
- Alleged Incident Date: ${new Date(r.dateObserved).toLocaleDateString("en-US", { year: "numeric", month: "long", day: "numeric" })}
- Animal Type: ${r.count} ${r.animalType}(s)
- Concern Types: ${r.concernTypes.join(", ")}
- Agencies Contacted: ${r.agenciesContacted || "None yet"}
- Response Received: ${r.responseReceived || "None documented"}

${r.description ? `Observer's documented notes:\n"${r.description}"\n\n` : ""}I am sharing this documented concern — not making allegations. I am asking whether your team has received similar reports from Fresno residents about stray animal welfare in the ${r.neighborhood} area.

I have documented this concern via VoiceMap Fresno (Report ID: ${r.id}), a free public-interest tool for Fresno residents to organize animal welfare evidence.

I am available to provide further documentation if your team is investigating this topic.

Submitted responsibly.

Contact: ${r.anonymous ? "[Available upon request]" : (r.contactInfo || "[Available upon request]")}`
      : `Hello,

[Select a documented concern from the list to generate a personalized message.]

I am a Fresno resident sharing a documented animal welfare concern. Multiple reports have been submitted. Agency response has been limited. I am available to provide further documentation.

Fresno Bee: newstips@fresnobee.com
ABC30 Fresno: abc30tips@abc.com
FOX26 Fresno: newstips@kmph.com
GV Wire: tips@gvwire.com`,
  },
];

function buildMailtoLink(to: string[], subject: string, body: string) {
  const toStr = to.join(",");
  return `mailto:${encodeURIComponent(toStr)}?subject=${encodeURIComponent(subject)}&body=${encodeURIComponent(body)}`;
}

function ContactCard({ c }: { c: Contact }) {
  const mailtoHref = c.email ? `mailto:${c.email}` : undefined;
  const telHref = c.phone ? `tel:${c.phone.replace(/\D/g, "")}` : undefined;
  return (
    <div className={`rounded-2xl p-4 border ${CATEGORY_COLORS[c.category]} transition-shadow hover:shadow-md`}>
      <p className="font-semibold text-sm leading-snug">{c.name}</p>
      <p className="text-xs text-muted-foreground mt-0.5 mb-2">{c.title}</p>
      {c.phone && (
        <a href={telHref} className="flex items-center gap-1.5 text-xs font-mono text-primary hover:underline mb-1">
          <Phone size={11} /> {c.phone}
        </a>
      )}
      {c.email && (
        <a href={mailtoHref} className="flex items-center gap-1.5 text-xs font-mono text-primary hover:underline break-all">
          <Mail size={11} /> {c.email}
        </a>
      )}
      {c.note && <p className="text-xs text-muted-foreground mt-2 leading-relaxed">{c.note}</p>}
    </div>
  );
}

export default function EscalationCenter() {
  const reports = getReports().filter((r) => r.status !== "draft");
  const [selectedReport, setSelectedReport] = useState<Report | null>(null);
  const [copied, setCopied] = useState<string | null>(null);
  const [dirOpen, setDirOpen] = useState(false);

  function handleCopy(id: string, text: string) {
    navigator.clipboard.writeText(text);
    setCopied(id);
    setTimeout(() => setCopied(null), 2200);
  }

  const categoryOrder: Contact["category"][] = ["animal", "mayor", "council", "police", "media", "nonprofit"];
  const grouped = categoryOrder.reduce<Record<string, Contact[]>>((acc, cat) => {
    acc[cat] = CONTACTS.filter((c) => c.category === cat);
    return acc;
  }, {});

  return (
    <div className="relative min-h-screen pt-28 pb-16 px-4">
      <AnimatedBackground />
      <div className="relative z-10 max-w-6xl mx-auto">

        <div className="mb-8">
          <h1 className="font-heading text-4xl font-bold mb-2">Escalation Center</h1>
          <p className="text-muted-foreground max-w-2xl">
            Generate professional messages and send them directly to Fresno agencies, city council,
            the Mayor, and local media — all pre-populated from your documented concern.
          </p>
        </div>

        {/* Legal reminder */}
        <div className="glass-card rounded-2xl p-4 flex gap-3 mb-8 border-l-4" style={{ borderLeftColor: '#028391' }}>
          <Shield size={18} className="text-primary flex-shrink-0 mt-0.5" />
          <p className="text-sm text-muted-foreground">
            All generated messages describe concerns as <strong>"submitted evidence"</strong> and <strong>"reported concerns requiring review."</strong>{" "}
            They do not make legal accusations, identify individuals, or claim certainty about outcomes.
            Send only messages based on documented, direct observations. Clicking <strong>Send Email</strong> opens your
            default email client with the message pre-filled — nothing is sent automatically.
          </p>
        </div>

        <div className="grid lg:grid-cols-4 gap-6">
          {/* Report picker */}
          <div className="lg:col-span-1">
            <h3 className="font-heading font-bold text-sm mb-3 flex items-center gap-2">
              <Send size={14} className="text-primary" /> Select a Concern
            </h3>
            <div
              className={`glass-card rounded-xl p-3 mb-2 cursor-pointer transition-all text-sm ${!selectedReport ? "ring-1 ring-primary/60" : ""}`}
              onClick={() => setSelectedReport(null)}
            >
              <span className="font-medium text-xs">General Template</span>
              <p className="text-xs text-muted-foreground">No specific report</p>
            </div>
            {reports.length === 0 ? (
              <p className="text-xs text-muted-foreground p-3">No submitted concerns yet. Submit a concern first to personalise messages.</p>
            ) : (
              reports.map((r) => (
                <div
                  key={r.id}
                  data-testid={`button-escalate-report-${r.id}`}
                  className={`glass-card rounded-xl p-3 mb-2 cursor-pointer transition-all ${selectedReport?.id === r.id ? "ring-1 ring-primary/60 shadow-[0_0_10px_rgba(2,131,145,0.25)]" : ""}`}
                  onClick={() => setSelectedReport(r)}
                >
                  <p className="font-medium text-xs capitalize">{r.animalType} — {r.neighborhood}</p>
                  <p className="text-xs text-muted-foreground">{r.location}</p>
                  <p className="text-xs text-muted-foreground">{new Date(r.dateObserved).toLocaleDateString()}</p>
                </div>
              ))
            )}
          </div>

          {/* Message cards */}
          <div className="lg:col-span-3 space-y-6">
            {templates.map((tmpl) => {
              const message = tmpl.generate(selectedReport);
              const subject = tmpl.defaultSubjectFn(selectedReport);
              const isCopied = copied === tmpl.id;
              const mailtoHref = buildMailtoLink(tmpl.defaultRecipients, subject, message);
              return (
                <div key={tmpl.id} className={`glass-card rounded-3xl p-6 border-l-4 ${tmpl.color}`}>
                  <div className="flex items-start justify-between gap-4 mb-4">
                    <div className="flex items-center gap-3">
                      <div className="w-8 h-8 rounded-xl bg-primary/15 text-primary flex items-center justify-center">
                        {tmpl.icon}
                      </div>
                      <div>
                        <h3 className="font-heading font-bold text-base">{tmpl.title}</h3>
                        <p className="text-xs text-muted-foreground">{tmpl.description}</p>
                      </div>
                    </div>
                    <div className="flex gap-2 flex-shrink-0">
                      <Button
                        data-testid={`button-copy-message-${tmpl.id}`}
                        size="sm"
                        variant="outline"
                        className="rounded-xl gap-2"
                        onClick={() => handleCopy(tmpl.id, message)}
                      >
                        {isCopied ? <CheckCircle2 size={13} className="text-primary" /> : <Copy size={13} />}
                        {isCopied ? "Copied!" : "Copy"}
                      </Button>
                      <Button
                        data-testid={`button-send-message-${tmpl.id}`}
                        size="sm"
                        className="rounded-xl gap-2"
                        style={{ background: "#028391", color: "white" }}
                        asChild
                      >
                        <a href={mailtoHref}>
                          <Mail size={13} /> Send Email
                        </a>
                      </Button>
                    </div>
                  </div>

                  {/* Recipient preview */}
                  <div className="mb-3 flex flex-wrap gap-1.5">
                    {tmpl.defaultRecipients.map((email) => (
                      <span key={email} className="text-xs bg-background/50 border border-border/50 rounded-full px-2 py-0.5 font-mono text-muted-foreground">
                        {email}
                      </span>
                    ))}
                  </div>

                  <pre className="text-xs font-mono leading-relaxed whitespace-pre-wrap text-foreground/80 bg-background/40 rounded-2xl p-4 max-h-64 overflow-auto">
                    {message}
                  </pre>
                </div>
              );
            })}
          </div>
        </div>

        {/* Full Contact Directory */}
        <div className="mt-12">
          <button
            onClick={() => setDirOpen(!dirOpen)}
            className="w-full flex items-center justify-between glass-card rounded-2xl p-5 hover:bg-primary/5 transition-colors"
          >
            <h3 className="font-heading font-bold text-lg flex items-center gap-3">
              <Building2 size={20} className="text-primary" />
              Full Fresno Contact Directory
              <span className="text-xs font-normal text-muted-foreground ml-1">({CONTACTS.length} contacts)</span>
            </h3>
            {dirOpen ? <ChevronUp size={18} className="text-muted-foreground" /> : <ChevronDown size={18} className="text-muted-foreground" />}
          </button>

          {dirOpen && (
            <div className="mt-4 space-y-8">
              {categoryOrder.map((cat) => (
                <div key={cat}>
                  <h4 className="font-heading font-bold text-sm mb-3 text-muted-foreground uppercase tracking-wide px-1">
                    {CATEGORY_LABELS[cat]}
                  </h4>
                  <div className="grid sm:grid-cols-2 lg:grid-cols-3 gap-3">
                    {grouped[cat].map((c) => (
                      <ContactCard key={c.name} c={c} />
                    ))}
                  </div>
                </div>
              ))}
              <p className="text-xs text-muted-foreground px-1 pt-2 pb-4 border-t border-border/30">
                Contact information is based on publicly available Fresno city records. Verify current contacts at{" "}
                <a href="https://www.fresno.gov" target="_blank" rel="noopener noreferrer" className="underline text-primary">fresno.gov</a>{" "}
                before sending. VoiceMap Fresno does not guarantee accuracy of third-party contact details.
              </p>
            </div>
          )}
        </div>
      </div>
    </div>
  );
}
