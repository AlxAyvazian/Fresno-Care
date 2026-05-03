import { useState } from "react";
import { ChevronDown, ChevronUp, Camera, Phone, AlertTriangle, Shield, BookOpen, Users, Mail, Building2 } from "lucide-react";
import { AnimatedBackground } from "@/components/AnimatedBackground";
import { CONTACTS, CATEGORY_LABELS, CATEGORY_COLORS, type Contact } from "@/lib/contacts";

interface ResourceSection {
  id: string;
  icon: React.ReactNode;
  title: string;
  color: string;
  items: string[];
}

const resources: ResourceSection[] = [
  {
    id: "document",
    icon: <Camera size={20} />,
    title: "What to Document",
    color: "border-primary",
    items: [
      "Date and time of observation",
      "Exact location or cross streets",
      "Number and type of animals",
      "Physical condition: weight, injuries, visible wounds",
      "Whether the animal has a collar, tags, or appears owned",
      "Food and water availability",
      "Shelter from weather (heat/cold/rain)",
      "Any human interaction you observed (without speculation)",
      "Frequency of sightings — note repeated patterns",
      "Names of any witnesses (with consent)",
    ],
  },
  {
    id: "emergency",
    icon: <AlertTriangle size={20} />,
    title: "When to Call Emergency Services (911)",
    color: "border-destructive",
    items: [
      "Animal is severely injured and in immediate distress",
      "Animal is trapped in a life-threatening situation (car, fire, extreme heat)",
      "Animal is posing a direct safety threat to people",
      "You witness a crime being committed",
      "Your own safety is at risk",
      "Deceased animal blocking traffic or creating a public health hazard",
    ],
  },
  {
    id: "nonemergency",
    icon: <Phone size={20} />,
    title: "When to Use Police Non-Emergency / Animal Control",
    color: "border-accent",
    items: [
      "Animal appears ill or injured but is not in immediate life-threatening danger",
      "Stray animal needs capture but is not aggressive",
      "Animal has been at the same location for several days with no owner visible",
      "You've documented a pattern of welfare concerns at a specific address",
      "Animal control has not responded to a previous report within 48 hours",
      "Fresno Animal Center: (559) 621-5795",
      "Fresno Police Non-Emergency: (559) 621-7000",
    ],
  },
  {
    id: "photography",
    icon: <Camera size={20} />,
    title: "How to Photograph Safely",
    color: "border-primary",
    items: [
      "Stay at a safe distance — do not approach or corner the animal",
      "Use your phone's zoom — never get close to an unknown animal",
      "Photograph from public property only",
      "Capture wide-angle shots showing the environment and context",
      "Close-up shots of visible injuries or conditions (from a safe distance)",
      "Photograph signage, addresses, and landmarks for location context",
      "Note the date and time in your photos — enable automatic geotagging if safe",
      "Do not photograph people without their consent",
      "Do not trespass onto private property to photograph",
    ],
  },
  {
    id: "notdo",
    icon: <Shield size={20} />,
    title: "What NOT to Do",
    color: "border-destructive",
    items: [
      "Do NOT trespass on private property",
      "Do NOT confront or accuse anyone of animal abuse without evidence",
      "Do NOT share unverified information publicly or name individuals",
      "Do NOT attempt to rescue an animal yourself unless it is safe to do so",
      "Do NOT interfere with an active animal control or law enforcement response",
      "Do NOT touch or move a deceased animal",
      "Do NOT approach a potentially aggressive or frightened animal",
      "Do NOT assume intent — document what you observe, not what you believe",
    ],
  },
  {
    id: "confrontation",
    icon: <Users size={20} />,
    title: "How to Avoid Confrontation",
    color: "border-muted",
    items: [
      "Document from a distance — you do not need to approach anyone",
      "If questioned, you can say: 'I'm documenting a concern for animal services'",
      "You are not obligated to explain yourself while on public property",
      "If you feel unsafe, leave immediately and call police non-emergency",
      "Do not engage in arguments — your documentation speaks for itself",
      "Work with neighbors or community members who share your concerns",
      "Report any harassment or threats to Fresno Police Non-Emergency",
    ],
  },
];

function AccordionItem({ section }: { section: ResourceSection }) {
  const [open, setOpen] = useState(false);
  return (
    <div className={`glass-card rounded-2xl overflow-hidden border-l-4 ${section.color}`}>
      <button
        data-testid={`button-accordion-${section.id}`}
        className="w-full flex items-center justify-between p-5 text-left hover:bg-primary/5 transition-colors"
        onClick={() => setOpen(!open)}
      >
        <div className="flex items-center gap-3">
          <div className="w-8 h-8 rounded-xl bg-primary/15 text-primary flex items-center justify-center flex-shrink-0">
            {section.icon}
          </div>
          <span className="font-heading font-bold text-base">{section.title}</span>
        </div>
        {open ? <ChevronUp size={18} className="text-muted-foreground" /> : <ChevronDown size={18} className="text-muted-foreground" />}
      </button>
      {open && (
        <div className="px-5 pb-5">
          <ul className="space-y-2">
            {section.items.map((item, i) => (
              <li key={i} className="flex items-start gap-2 text-sm text-muted-foreground leading-relaxed">
                <span className="w-1.5 h-1.5 rounded-full bg-primary flex-shrink-0 mt-2" />
                {item}
              </li>
            ))}
          </ul>
        </div>
      )}
    </div>
  );
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

const CATEGORY_ORDER: Contact["category"][] = ["animal", "mayor", "council", "police", "media", "nonprofit"];

export default function ResourceLibrary() {
  const [openCategory, setOpenCategory] = useState<string | null>("animal");

  const grouped = CATEGORY_ORDER.reduce<Record<string, Contact[]>>((acc, cat) => {
    acc[cat] = CONTACTS.filter((c) => c.category === cat);
    return acc;
  }, {});

  return (
    <div className="relative min-h-screen pt-28 pb-16 px-4">
      <AnimatedBackground />
      <div className="relative z-10 max-w-4xl mx-auto">

        <div className="mb-8">
          <h1 className="font-heading text-4xl font-bold mb-2">Resource Library</h1>
          <p className="text-muted-foreground max-w-2xl">
            Guidance for documenting animal welfare concerns safely and responsibly in Fresno,
            plus a full directory of city agencies, council members, and community contacts.
          </p>
        </div>

        {/* Quick emergency strip */}
        <div className="glass-card rounded-3xl p-5 mb-8 border-l-4 border-destructive/60 bg-destructive/5">
          <div className="flex items-center gap-2 mb-3">
            <AlertTriangle size={16} className="text-destructive" />
            <h3 className="font-heading font-bold text-sm text-destructive">Immediate Emergency? Call 911</h3>
          </div>
          <div className="flex flex-wrap gap-4">
            <div>
              <p className="text-xs text-muted-foreground">Fresno Animal Center</p>
              <a href="tel:5596215795" className="font-mono text-primary text-sm font-semibold hover:underline">(559) 621-5795</a>
            </div>
            <div>
              <p className="text-xs text-muted-foreground">Police Non-Emergency</p>
              <a href="tel:5596217000" className="font-mono text-primary text-sm font-semibold hover:underline">(559) 621-7000</a>
            </div>
            <div>
              <p className="text-xs text-muted-foreground">Mayor's Office</p>
              <a href="tel:5596218000" className="font-mono text-primary text-sm font-semibold hover:underline">(559) 621-8000</a>
            </div>
            <div>
              <p className="text-xs text-muted-foreground">Animal Center Email</p>
              <a href="mailto:FCAnimalCenter@fresno.gov" className="font-mono text-primary text-sm font-semibold hover:underline">FCAnimalCenter@fresno.gov</a>
            </div>
          </div>
        </div>

        {/* Full Directory */}
        <div className="mb-10">
          <h3 className="font-heading font-bold text-lg mb-4 flex items-center gap-2">
            <Building2 size={18} className="text-primary" /> Full Contact Directory
            <span className="text-xs font-normal text-muted-foreground">({CONTACTS.length} contacts)</span>
          </h3>
          <div className="space-y-3">
            {CATEGORY_ORDER.map((cat) => {
              const isOpen = openCategory === cat;
              return (
                <div key={cat} className={`glass-card rounded-2xl overflow-hidden border-l-4 ${CATEGORY_COLORS[cat]}`}>
                  <button
                    className="w-full flex items-center justify-between p-4 text-left hover:bg-primary/5 transition-colors"
                    onClick={() => setOpenCategory(isOpen ? null : cat)}
                  >
                    <span className="font-heading font-bold text-sm">
                      {CATEGORY_LABELS[cat]}
                      <span className="text-xs font-normal text-muted-foreground ml-2">
                        {grouped[cat].length} contact{grouped[cat].length !== 1 ? "s" : ""}
                      </span>
                    </span>
                    {isOpen ? <ChevronUp size={16} className="text-muted-foreground" /> : <ChevronDown size={16} className="text-muted-foreground" />}
                  </button>
                  {isOpen && (
                    <div className="px-4 pb-4">
                      <div className="grid sm:grid-cols-2 gap-3">
                        {grouped[cat].map((c) => (
                          <ContactCard key={c.name} c={c} />
                        ))}
                      </div>
                    </div>
                  )}
                </div>
              );
            })}
          </div>
          <p className="text-xs text-muted-foreground mt-3 px-1">
            Verify current contacts at{" "}
            <a href="https://www.fresno.gov" target="_blank" rel="noopener noreferrer" className="underline text-primary">fresno.gov</a>.
            VoiceMap Fresno does not guarantee accuracy of third-party contact details.
          </p>
        </div>

        {/* Accordion guidance sections */}
        <div className="space-y-3">
          <h3 className="font-heading font-bold text-lg mb-2 flex items-center gap-2">
            <BookOpen size={18} className="text-primary" /> Guidance & Best Practices
          </h3>
          {resources.map((section) => (
            <AccordionItem key={section.id} section={section} />
          ))}
        </div>

        {/* Legal reminder */}
        <div className="mt-8 glass-card rounded-3xl p-6 border-l-4" style={{ borderLeftColor: '#028391' }}>
          <h4 className="font-heading font-bold text-base mb-2">Legal Reminder</h4>
          <p className="text-sm text-muted-foreground leading-relaxed">
            VoiceMap Fresno is a documentation tool. It does not provide legal advice.
            All information submitted should be based on direct observation.
            Documentation of concerns does not constitute filing a police report.
            For legal guidance, consult an attorney or contact the Fresno County Bar Association.
          </p>
        </div>
      </div>
    </div>
  );
}
