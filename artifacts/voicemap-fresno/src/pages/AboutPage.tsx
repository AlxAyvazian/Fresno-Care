import { Shield, Heart, AlertTriangle, Users, Scale, MapPin } from "lucide-react";
import { AnimatedBackground } from "@/components/AnimatedBackground";
import { KurzgesagtCat } from "@/components/KurzgesagtCat";
import { KurzgesagtDog } from "@/components/KurzgesagtDog";

const principles = [
  {
    icon: <Shield size={20} />,
    title: "Public-Interest Documentation Tool",
    desc: "VoiceMap Fresno is a free, noncommercial tool designed to help Fresno residents document and organize animal welfare concerns. It is not affiliated with the City of Fresno, Fresno Animal Center, or any government agency.",
    color: "bg-primary/15 text-primary",
  },
  {
    icon: <AlertTriangle size={20} />,
    title: "Does Not Replace Emergency Services",
    desc: "If an animal is in immediate danger, call 911. If the situation is urgent but not immediately life-threatening, call Fresno Animal Center at (559) 621-5795 or Fresno Police Non-Emergency at (559) 621-7000. This tool is for documentation, not emergency response.",
    color: "bg-destructive/15 text-destructive",
  },
  {
    icon: <Scale size={20} />,
    title: "Does Not Make Legal Conclusions",
    desc: "All submissions are described as 'reported concerns' and 'alleged incidents.' VoiceMap does not determine guilt, confirm abuse, or make legal findings of any kind. Documentation does not constitute a formal complaint or legal report.",
    color: "bg-accent/30 text-foreground",
  },
  {
    icon: <Heart size={20} />,
    title: "Truthfulness & Direct Observation",
    desc: "Submitted concerns should be truthful and based on what you directly observed. Do not submit information you did not personally witness. Do not speculate about intent, ownership, or cause. Accurate documentation is the most powerful documentation.",
    color: "bg-primary/15 text-primary",
  },
  {
    icon: <Users size={20} />,
    title: "Safety First — No Confrontation",
    desc: "Users should not trespass, confront, harass, threaten, or interfere with any person or ongoing investigation. Document from public property. Your safety comes first. If you feel unsafe, leave and contact law enforcement.",
    color: "bg-destructive/15 text-destructive",
  },
  {
    icon: <MapPin size={20} />,
    title: "Community Accountability",
    desc: "This tool is designed to support accountability through legitimate channels: animal control, law enforcement, elected officials, and responsible journalism. It is not a platform for vigilante action or public shaming.",
    color: "bg-accent/30 text-foreground",
  },
];

export default function AboutPage() {
  return (
    <div className="relative min-h-screen pt-28 pb-16 px-4">
      <AnimatedBackground />
      <div className="relative z-10 max-w-4xl mx-auto">

        {/* Header */}
        <div className="text-center mb-12">
          <div className="flex justify-center gap-4 mb-6">
            <KurzgesagtCat size={90} />
            <KurzgesagtDog size={90} />
          </div>
          <h1 className="font-heading text-4xl font-bold mb-3">About VoiceMap Fresno</h1>
          <p className="text-muted-foreground max-w-xl mx-auto leading-relaxed">
            A free, public-interest tool for Fresno residents who care about the wellbeing
            of stray animals in their community.
          </p>
        </div>

        {/* Mission */}
        <div className="glass-card rounded-3xl p-8 mb-8 border-l-4" style={{ borderLeftColor: '#028391' }}>
          <h2 className="font-heading text-2xl font-bold mb-4">Our Mission</h2>
          <p className="text-muted-foreground leading-relaxed mb-4">
            Fresno has one of the highest rates of stray animal intake in California. Many residents
            witness animal welfare concerns but don't know how to document them effectively or
            who to contact. A single uncorroborated report is easy for agencies to deprioritize.
            A pattern of documented concerns from multiple sources is harder to ignore.
          </p>
          <p className="text-muted-foreground leading-relaxed">
            VoiceMap Fresno gives residents a structured way to document what they observe,
            generate responsible reports using careful legal language, and route those
            reports to the agencies and officials who can act on them.
          </p>
        </div>

        {/* Principles */}
        <div className="mb-8">
          <h2 className="font-heading text-2xl font-bold mb-5">Core Principles</h2>
          <div className="space-y-4">
            {principles.map((p) => (
              <div key={p.title} className="glass-card rounded-2xl p-5 flex gap-4">
                <div className={`w-10 h-10 rounded-xl flex items-center justify-center flex-shrink-0 ${p.color}`}>
                  {p.icon}
                </div>
                <div>
                  <h3 className="font-heading font-bold text-base mb-1">{p.title}</h3>
                  <p className="text-sm text-muted-foreground leading-relaxed">{p.desc}</p>
                </div>
              </div>
            ))}
          </div>
        </div>

        {/* Data & Privacy */}
        <div className="glass-card rounded-3xl p-7 mb-8">
          <h2 className="font-heading text-xl font-bold mb-3">Data & Privacy</h2>
          <ul className="space-y-2 text-sm text-muted-foreground">
            <li className="flex items-start gap-2">
              <span className="w-1.5 h-1.5 rounded-full bg-primary flex-shrink-0 mt-2" />
              All data is stored locally in your browser (localStorage). Nothing is sent to external servers in v1.
            </li>
            <li className="flex items-start gap-2">
              <span className="w-1.5 h-1.5 rounded-full bg-primary flex-shrink-0 mt-2" />
              Anonymous submission is always available — your contact information is optional and never required.
            </li>
            <li className="flex items-start gap-2">
              <span className="w-1.5 h-1.5 rounded-full bg-primary flex-shrink-0 mt-2" />
              No account, login, or personal information is required to use this tool.
            </li>
            <li className="flex items-start gap-2">
              <span className="w-1.5 h-1.5 rounded-full bg-primary flex-shrink-0 mt-2" />
              Future versions may offer optional cloud sync via Supabase for cross-device access.
            </li>
          </ul>
        </div>

        {/* Contact & Disclaimer */}
        <div className="glass-card rounded-3xl p-7 text-center">
          <p className="text-sm text-muted-foreground leading-relaxed max-w-xl mx-auto">
            VoiceMap Fresno is an independent, community-built tool. It is not affiliated with
            the City of Fresno, Fresno County, or any government agency. All contact information
            listed in this tool is provided as a public convenience and may change without notice.
            Always verify agency contact information before submitting a report.
          </p>
          <p className="text-xs text-muted-foreground mt-4 opacity-60">
            Built with care for Fresno's animals and community.
          </p>
        </div>
      </div>
    </div>
  );
}
