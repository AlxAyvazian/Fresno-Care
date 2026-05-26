import React, { useMemo, useState } from "react";
import { Link } from "wouter";
import { useListProviders } from "@workspace/api-client-react";
import { Card, CardContent } from "@/components/ui/card";
import { Input } from "@/components/ui/input";
import { Skeleton } from "@/components/ui/skeleton";
import { Activity, ArrowUpRight, Building2, CheckCircle2, CreditCard, Database, Globe2, MapPin, Search, Sparkles, Stethoscope } from "lucide-react";

type ProviderRecord = {
  id: number;
  clinicName: string;
  clinicType?: string | null;
  city?: string | null;
  state?: string | null;
  servicesOffered?: string | null;
  pricingNotes?: string | null;
  employerAccountClues?: string | null;
  corporateBillingClues?: string | null;
  netTermsClues?: string | null;
  tpaFriendlyClues?: string | null;
  verificationStatus?: string | null;
  sourceCount?: number | string | null;
};

function clean(value: unknown): string {
  return String(value ?? "").toLowerCase().trim();
}

function sourceCount(provider: ProviderRecord): number {
  const value = Number(provider.sourceCount ?? 0);
  return Number.isFinite(value) ? value : 0;
}

function tags(provider: ProviderRecord): string[] {
  return String(provider.servicesOffered ?? "").split(",").map((item) => item.trim()).filter(Boolean).slice(0, 4);
}

function hasBilling(provider: ProviderRecord): boolean {
  return Boolean(provider.employerAccountClues || provider.corporateBillingClues || provider.netTermsClues || provider.tpaFriendlyClues);
}

export default function ProvidersV2() {
  const [searchTerm, setSearchTerm] = useState("");
  const { data, isLoading, isError } = useListProviders();
  const providers = (Array.isArray(data) ? data : []) as ProviderRecord[];

  const filteredProviders = useMemo(() => {
    const search = clean(searchTerm);
    return providers.filter((provider) => {
      const searchable = [provider.clinicName, provider.clinicType, provider.city, provider.state, provider.servicesOffered, provider.pricingNotes, provider.verificationStatus].map(clean).join(" ");
      return search === "" || searchable.includes(search);
    });
  }, [providers, searchTerm]);

  const verifiedCount = providers.filter((provider) => provider.verificationStatus === "Verified").length;
  const billingReadyCount = providers.filter(hasBilling).length;
  const mappedStates = new Set(providers.map((provider) => provider.state).filter(Boolean)).size;

  return (
    <div className="space-y-8 pb-10">
      <section className="liquid-panel p-7 md:p-9">
        <div className="relative z-10 grid gap-8 xl:grid-cols-[1.1fr_.9fr] xl:items-end">
          <div className="space-y-5">
            <span className="liquid-chip text-xs font-black uppercase tracking-[0.22em] text-cyan-100"><Sparkles className="h-4 w-4" /> Provider Intelligence</span>
            <div>
              <h1 className="liquid-title text-5xl font-black leading-none md:text-7xl">Provider Database</h1>
              <p className="mt-4 max-w-3xl text-lg font-medium leading-8 text-slate-200/78">Search, filter, and review clinic records, services, billing signals, source confidence, and operational readiness.</p>
            </div>
          </div>
          <div className="grid gap-3 sm:grid-cols-2">
            <Metric label="Providers" value={providers.length} icon={Building2} />
            <Metric label="Verified" value={verifiedCount} icon={CheckCircle2} />
            <Metric label="Billing Signals" value={billingReadyCount} icon={CreditCard} />
            <Metric label="States" value={mappedStates} icon={Globe2} />
          </div>
        </div>
      </section>

      <section className="liquid-panel p-5 md:p-6">
        <div className="relative z-10">
          <Search className="pointer-events-none absolute left-4 top-1/2 h-5 w-5 -translate-y-1/2 text-cyan-100/70" />
          <Input value={searchTerm} onChange={(event) => setSearchTerm(event.target.value)} placeholder="Search clinic name, city, state, service, status, or pricing notes..." className="h-14 rounded-[22px] border-white/18 bg-black/24 pl-12 text-base font-bold text-white placeholder:text-slate-300/45 focus-visible:border-cyan-200/60 focus-visible:ring-cyan-200/30" />
        </div>
      </section>

      {isError && <Card className="liquid-panel border-rose-200/25 bg-rose-300/10"><CardContent className="relative z-10 p-5 text-sm font-bold text-rose-50">Provider data could not be loaded. Confirm the backend is deployed and VITE_API_BASE_URL points to the API service.</CardContent></Card>}

      <section className="grid gap-4">
        {isLoading ? Array.from({ length: 6 }).map((_, index) => <ProviderSkeleton key={index} />) : filteredProviders.length ? filteredProviders.map((provider) => <ProviderCard key={provider.id} provider={provider} />) : <EmptyState />}
      </section>
    </div>
  );
}

function Metric({ label, value, icon: Icon }: { label: string; value: number; icon: React.ElementType }) {
  return <div className="rounded-[26px] border border-white/16 bg-white/[0.075] p-5 shadow-[inset_0_1px_0_rgba(255,255,255,.24)] backdrop-blur-xl"><div className="mb-4 flex items-center justify-between"><div className="rounded-2xl border border-white/14 bg-black/20 p-3"><Icon className="h-5 w-5 text-cyan-100" /></div><ArrowUpRight className="h-4 w-4 text-white/45" /></div><div className="text-4xl font-black leading-none text-white luminous-title">{value}</div><div className="mt-2 text-xs font-black uppercase tracking-[0.2em] text-slate-300/65">{label}</div></div>;
}

function ProviderCard({ provider }: { provider: ProviderRecord }) {
  const providerTags = tags(provider);
  return <Link href={`/providers/${provider.id}`} className="group block no-underline"><Card className="liquid-panel transition-all duration-300 group-hover:border-cyan-200/45"><CardContent className="relative z-10 grid gap-0 p-0 xl:grid-cols-[1.1fr_.9fr_auto]"><div className="flex min-w-0 gap-5 p-6 md:p-7"><div className="flex h-16 w-16 shrink-0 items-center justify-center rounded-[26px] border border-white/18 bg-white/[0.08]"><Building2 className="h-7 w-7 text-cyan-100" /></div><div className="min-w-0 flex-1"><div className="mb-3 flex flex-wrap items-center gap-2"><h3 className="truncate text-2xl font-black text-white group-hover:luminous-title">{provider.clinicName}</h3><span className="rounded-full border border-cyan-200/30 bg-cyan-300/12 px-3 py-1 text-[10px] font-black uppercase tracking-[0.18em] text-cyan-100">{provider.verificationStatus || "Needs Review"}</span></div><div className="flex flex-wrap gap-2 text-sm font-semibold text-slate-200/70"><span className="liquid-chip px-3 py-1 text-xs"><MapPin className="h-3.5 w-3.5" /> {provider.city || "Unknown"}, {provider.state || "--"}</span><span className="liquid-chip px-3 py-1 text-xs"><Stethoscope className="h-3.5 w-3.5" /> {provider.clinicType || "Clinic"}</span></div></div></div><div className="border-t border-white/10 bg-white/[0.025] p-6 md:p-7 xl:border-l xl:border-t-0"><div className="flex flex-wrap gap-2">{providerTags.length ? providerTags.map((tag) => <span key={tag} className="rounded-full border border-white/14 bg-white/[0.07] px-3 py-1.5 text-[10px] font-black uppercase tracking-[0.16em] text-slate-100/78">{tag}</span>) : <span className="rounded-full border border-white/12 bg-black/18 px-3 py-1.5 text-[10px] font-black uppercase tracking-[0.16em] text-slate-300/55">Services not documented</span>}</div>{hasBilling(provider) && <div className="mt-4 inline-flex items-center gap-2 rounded-full border border-cyan-200/25 bg-cyan-300/10 px-3 py-1.5 text-[10px] font-black uppercase tracking-[0.16em] text-cyan-100"><CreditCard className="h-3.5 w-3.5" /> Billing signal</div>}</div><div className="flex items-center justify-between gap-6 border-t border-white/10 bg-black/10 p-6 md:p-7 xl:w-48 xl:flex-col xl:items-end xl:justify-center xl:border-l xl:border-t-0"><div className="text-left xl:text-right"><div className="text-4xl font-black leading-none text-white luminous-title">{sourceCount(provider)}</div><div className="mt-1 text-[10px] font-black uppercase tracking-[0.2em] text-slate-300/60">Sources</div></div><ArrowUpRight className="h-6 w-6 text-white" /></div></CardContent></Card></Link>;
}

function EmptyState() {
  return <Card className="liquid-panel"><CardContent className="relative z-10 flex min-h-[280px] flex-col items-center justify-center p-10 text-center"><Database className="mb-4 h-12 w-12 text-cyan-100/45" /><h3 className="text-3xl font-black text-white">No providers found</h3><p className="mt-3 max-w-xl text-sm font-semibold leading-6 text-slate-300/72">Adjust the search or upload/import provider data after the backend and database are connected.</p></CardContent></Card>;
}

function ProviderSkeleton() {
  return <Card className="liquid-panel"><CardContent className="relative z-10 p-6"><div className="flex items-center gap-5"><Skeleton className="h-16 w-16 rounded-[26px] bg-white/10" /><div className="flex-1 space-y-3"><Skeleton className="h-7 w-72 rounded-xl bg-white/10" /><Skeleton className="h-4 w-96 max-w-full rounded-xl bg-white/10" /></div></div></CardContent></Card>;
}
