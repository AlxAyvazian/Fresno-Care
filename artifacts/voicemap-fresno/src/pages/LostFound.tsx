import { useState, useRef } from "react";
import {
  Search, Plus, Heart, MapPin, Phone, Mail, ExternalLink,
  Facebook, Users, CheckCircle2, AlertCircle, Clock,
  Camera, Tag, X, ChevronDown, Share2, ArrowUpRight, MessageCircle, ThumbsUp,
} from "lucide-react";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { AnimatedBackground } from "@/components/AnimatedBackground";
import { KurzgesagtCat } from "@/components/KurzgesagtCat";
import { KurzgesagtDog } from "@/components/KurzgesagtDog";
import {
  getLostFoundPosts, saveLostFoundPost, updatePostStatus,
  getCommunityFeed, saveCommunityPost,
  generateLFId, FRESNO_FB_GROUPS,
  type LostFoundPost, type CommunityFeedPost, type PetStatus,
} from "@/lib/lostfound";

const STATUS_CONFIG: Record<PetStatus, { label: string; color: string; icon: React.ReactNode }> = {
  lost: { label: "Lost", color: "bg-destructive/20 text-destructive border-destructive/30", icon: <AlertCircle size={12} /> },
  found: { label: "Found", color: "bg-primary/20 text-primary border-primary/30", icon: <CheckCircle2 size={12} /> },
  reunited: { label: "Reunited 🎉", color: "bg-green-500/20 text-green-700 dark:text-green-400 border-green-500/30", icon: <Heart size={12} /> },
};

function PetCard({ post, onStatusChange }: { post: LostFoundPost; onStatusChange: (id: string, s: PetStatus) => void }) {
  const [expanded, setExpanded] = useState(false);
  const cfg = STATUS_CONFIG[post.status];
  const daysAgo = Math.floor((Date.now() - new Date(post.createdAt).getTime()) / 864e5);

  return (
    <div className={`glass-card rounded-2xl overflow-hidden transition-shadow hover:shadow-lg ${post.status === "reunited" ? "opacity-75" : ""}`}>
      {post.photoBase64 ? (
        <div className="h-44 w-full overflow-hidden bg-muted">
          <img src={post.photoBase64} alt={post.petName || "Pet"} className="w-full h-full object-cover" />
        </div>
      ) : (
        <div className="h-24 w-full flex items-center justify-center" style={{ background: "rgba(2,131,145,0.08)" }}>
          {post.petType === "cat" ? <KurzgesagtCat size={60} /> : post.petType === "dog" ? <KurzgesagtDog size={60} /> : <Heart size={32} className="text-primary/30" />}
        </div>
      )}
      <div className="p-4">
        <div className="flex items-start justify-between gap-2 mb-2">
          <div>
            <div className="flex items-center gap-2 flex-wrap">
              <span className={`inline-flex items-center gap-1 px-2 py-0.5 rounded-full text-xs font-semibold border ${cfg.color}`}>
                {cfg.icon} {cfg.label}
              </span>
              <span className="text-xs text-muted-foreground capitalize">{post.petType}</span>
            </div>
            <h3 className="font-heading font-bold text-base mt-1">
              {post.petName ? post.petName : `${post.color} ${post.petType}`}
            </h3>
            {post.breed && <p className="text-xs text-muted-foreground">{post.breed}</p>}
          </div>
          <div className="text-right flex-shrink-0">
            <p className="text-xs text-muted-foreground">{daysAgo === 0 ? "Today" : `${daysAgo}d ago`}</p>
            {post.reward && (
              <p className="text-xs font-bold text-accent mt-0.5">💰 {post.reward} reward</p>
            )}
          </div>
        </div>

        <div className="flex items-center gap-1 text-xs text-muted-foreground mb-2">
          <MapPin size={11} /> <span>{post.neighborhood} — {post.lastSeenAddress}</span>
        </div>

        <p className="text-sm text-foreground/80 leading-relaxed line-clamp-2">{post.description}</p>

        {post.tags.length > 0 && (
          <div className="flex flex-wrap gap-1 mt-2">
            {post.tags.slice(0, 4).map((t) => (
              <span key={t} className="text-xs bg-muted rounded-full px-2 py-0.5 text-muted-foreground">{t}</span>
            ))}
          </div>
        )}

        <button
          className="flex items-center gap-1 text-xs text-primary mt-2 hover:underline"
          onClick={() => setExpanded(!expanded)}
        >
          {expanded ? "Show less" : "Show more"} <ChevronDown size={12} className={`transition-transform ${expanded ? "rotate-180" : ""}`} />
        </button>

        {expanded && (
          <div className="mt-3 space-y-2 border-t border-border/30 pt-3">
            {post.collarDescription && (
              <p className="text-xs"><span className="font-medium">Collar:</span> {post.collarDescription}</p>
            )}
            {post.microchipped !== undefined && (
              <p className="text-xs"><span className="font-medium">Microchipped:</span> {post.microchipped ? "Yes" : "No / Unknown"}</p>
            )}
            <p className="text-xs text-muted-foreground">{post.description}</p>
            {post.contactName && (
              <div className="mt-2 p-3 rounded-xl bg-primary/5 border border-primary/10 space-y-1">
                <p className="text-xs font-semibold">Contact: {post.contactName}</p>
                {post.contactPhone && (
                  <a href={`tel:${post.contactPhone.replace(/\D/g, "")}`} className="flex items-center gap-1 text-xs text-primary hover:underline">
                    <Phone size={11} /> {post.contactPhone}
                  </a>
                )}
                {post.contactEmail && (
                  <a href={`mailto:${post.contactEmail}`} className="flex items-center gap-1 text-xs text-primary hover:underline">
                    <Mail size={11} /> {post.contactEmail}
                  </a>
                )}
              </div>
            )}
            {post.externalLink && (
              <a href={post.externalLink} target="_blank" rel="noopener noreferrer"
                className="flex items-center gap-1 text-xs text-primary hover:underline mt-1">
                <ExternalLink size={11} /> View on {post.externalSource || "External Source"}
              </a>
            )}
            {post.status !== "reunited" && (
              <button
                onClick={() => onStatusChange(post.id, "reunited")}
                className="w-full mt-2 py-2 px-3 rounded-xl text-xs font-medium border border-green-500/40 text-green-700 dark:text-green-400 hover:bg-green-500/10 transition-colors"
              >
                ✅ Mark as Reunited
              </button>
            )}
          </div>
        )}
      </div>
    </div>
  );
}

function FeedCard({ post }: { post: CommunityFeedPost }) {
  const hoursAgo = Math.floor((Date.now() - new Date(post.createdAt).getTime()) / 36e5);
  const timeLabel = hoursAgo < 1 ? "Just now" : hoursAgo < 24 ? `${hoursAgo}h ago` : `${Math.floor(hoursAgo / 24)}d ago`;

  const sourceColor = post.source === "facebook" ? "bg-blue-500/15 text-blue-600 dark:text-blue-400 border-blue-400/30"
    : post.source === "nextdoor" ? "bg-green-600/15 text-green-700 dark:text-green-400 border-green-500/30"
    : "bg-primary/10 text-primary border-primary/30";

  const sourceLabel = post.source === "facebook" ? "Facebook" : post.source === "nextdoor" ? "Nextdoor" : "Community";
  const statusColors: Record<string, string> = {
    lost: "border-l-destructive",
    found: "border-l-primary",
    reunited: "border-l-green-500",
    info: "border-l-accent",
  };

  return (
    <div className={`glass-card rounded-2xl p-4 border-l-4 ${statusColors[post.status] || "border-l-primary"}`}>
      <div className="flex items-start justify-between gap-3 mb-3">
        <div className="flex items-center gap-2 flex-wrap">
          <span className={`text-xs px-2 py-0.5 rounded-full font-medium border ${sourceColor}`}>
            {sourceLabel}
          </span>
          {post.groupName && (
            <span className="text-xs text-muted-foreground truncate max-w-[160px]">{post.groupName}</span>
          )}
        </div>
        <span className="text-xs text-muted-foreground flex-shrink-0">{timeLabel}</span>
      </div>

      <p className="text-xs font-semibold mb-1 text-foreground/70">{post.authorName}</p>
      <p className="text-sm text-foreground/85 leading-relaxed">{post.content}</p>

      {(post.reactions !== undefined || post.comments !== undefined) && (
        <div className="flex items-center gap-4 mt-3 pt-2 border-t border-border/20">
          {post.reactions !== undefined && (
            <span className="flex items-center gap-1 text-xs text-muted-foreground">
              <ThumbsUp size={11} /> {post.reactions}
            </span>
          )}
          {post.comments !== undefined && (
            <span className="flex items-center gap-1 text-xs text-muted-foreground">
              <MessageCircle size={11} /> {post.comments}
            </span>
          )}
          {post.externalLink && (
            <a
              href={post.externalLink}
              target="_blank"
              rel="noopener noreferrer"
              className="ml-auto flex items-center gap-1 text-xs text-primary hover:underline"
            >
              View post <ArrowUpRight size={11} />
            </a>
          )}
        </div>
      )}
    </div>
  );
}

function PostForm({ onClose }: { onClose: () => void }) {
  const [form, setForm] = useState({
    status: "lost" as PetStatus,
    petType: "cat" as LostFoundPost["petType"],
    petName: "", breed: "", color: "", neighborhood: "",
    lastSeenAddress: "", dateSeen: new Date().toISOString().slice(0, 10),
    description: "", contactName: "", contactPhone: "", contactEmail: "",
    reward: "", collarDescription: "", microchipped: false,
  });
  const [photo, setPhoto] = useState<string | undefined>();
  const [tags, setTags] = useState<string[]>([]);
  const [tagInput, setTagInput] = useState("");
  const fileRef = useRef<HTMLInputElement>(null);

  function handlePhoto(e: React.ChangeEvent<HTMLInputElement>) {
    const file = e.target.files?.[0];
    if (!file) return;
    const reader = new FileReader();
    reader.onload = (ev) => setPhoto(ev.target?.result as string);
    reader.readAsDataURL(file);
  }

  function addTag() {
    const t = tagInput.trim().toLowerCase().replace(/\s+/g, "-");
    if (t && !tags.includes(t)) setTags([...tags, t]);
    setTagInput("");
  }

  function handleSubmit(e: React.FormEvent) {
    e.preventDefault();
    const post: LostFoundPost = {
      ...form,
      id: generateLFId(),
      createdAt: new Date().toISOString(),
      tags,
      photoBase64: photo,
      source: "community",
    };
    saveLostFoundPost(post);
    onClose();
    window.location.reload();
  }

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center p-4 bg-black/50 backdrop-blur-sm">
      <div className="glass-card rounded-3xl p-6 w-full max-w-2xl max-h-[90vh] overflow-y-auto">
        <div className="flex items-center justify-between mb-5">
          <h2 className="font-heading font-bold text-xl">Post a Lost or Found Pet</h2>
          <button onClick={onClose} className="p-2 rounded-xl hover:bg-muted transition-colors"><X size={18} /></button>
        </div>
        <form onSubmit={handleSubmit} className="space-y-4">
          <div className="grid grid-cols-2 gap-3">
            <div>
              <label className="text-xs font-medium block mb-1">Status</label>
              <select value={form.status} onChange={(e) => setForm({ ...form, status: e.target.value as PetStatus })}
                className="w-full h-10 px-3 rounded-xl border border-input bg-background text-sm focus:outline-none focus:ring-2 focus:ring-ring">
                <option value="lost">Lost</option>
                <option value="found">Found</option>
              </select>
            </div>
            <div>
              <label className="text-xs font-medium block mb-1">Animal Type</label>
              <select value={form.petType} onChange={(e) => setForm({ ...form, petType: e.target.value as LostFoundPost["petType"] })}
                className="w-full h-10 px-3 rounded-xl border border-input bg-background text-sm focus:outline-none focus:ring-2 focus:ring-ring">
                <option value="cat">Cat</option>
                <option value="dog">Dog</option>
                <option value="rabbit">Rabbit</option>
                <option value="bird">Bird</option>
                <option value="other">Other</option>
              </select>
            </div>
          </div>

          <div className="grid sm:grid-cols-2 gap-3">
            <div>
              <label className="text-xs font-medium block mb-1">Pet Name (if known)</label>
              <Input value={form.petName} onChange={(e) => setForm({ ...form, petName: e.target.value })}
                placeholder="e.g. Luna" className="rounded-xl" />
            </div>
            <div>
              <label className="text-xs font-medium block mb-1">Breed</label>
              <Input value={form.breed} onChange={(e) => setForm({ ...form, breed: e.target.value })}
                placeholder="e.g. Domestic Shorthair" className="rounded-xl" />
            </div>
          </div>

          <div>
            <label className="text-xs font-medium block mb-1">Color / Markings <span className="text-destructive">*</span></label>
            <Input required value={form.color} onChange={(e) => setForm({ ...form, color: e.target.value })}
              placeholder="e.g. Grey tabby with white chest" className="rounded-xl" />
          </div>

          <div className="grid sm:grid-cols-2 gap-3">
            <div>
              <label className="text-xs font-medium block mb-1">Neighborhood <span className="text-destructive">*</span></label>
              <Input required value={form.neighborhood} onChange={(e) => setForm({ ...form, neighborhood: e.target.value })}
                placeholder="e.g. Tower District" className="rounded-xl" />
            </div>
            <div>
              <label className="text-xs font-medium block mb-1">Date Seen</label>
              <Input type="date" value={form.dateSeen} onChange={(e) => setForm({ ...form, dateSeen: e.target.value })}
                className="rounded-xl" />
            </div>
          </div>

          <div>
            <label className="text-xs font-medium block mb-1">Last Seen / Found At <span className="text-destructive">*</span></label>
            <Input required value={form.lastSeenAddress} onChange={(e) => setForm({ ...form, lastSeenAddress: e.target.value })}
              placeholder="e.g. Near E Olive Ave & N Van Ness Ave" className="rounded-xl" />
          </div>

          <div>
            <label className="text-xs font-medium block mb-1">Description <span className="text-destructive">*</span></label>
            <textarea required value={form.description} onChange={(e) => setForm({ ...form, description: e.target.value })}
              rows={3} placeholder="Physical description, behavior, circumstances..."
              className="w-full rounded-xl border border-input bg-background px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-ring resize-none" />
          </div>

          <div className="grid sm:grid-cols-2 gap-3">
            <div>
              <label className="text-xs font-medium block mb-1">Collar Description</label>
              <Input value={form.collarDescription} onChange={(e) => setForm({ ...form, collarDescription: e.target.value })}
                placeholder="e.g. Blue collar, heart tag" className="rounded-xl" />
            </div>
            <div>
              <label className="text-xs font-medium block mb-1">Reward (optional)</label>
              <Input value={form.reward} onChange={(e) => setForm({ ...form, reward: e.target.value })}
                placeholder="e.g. $200" className="rounded-xl" />
            </div>
          </div>

          <div className="flex items-center gap-3">
            <input type="checkbox" id="microchipped" checked={form.microchipped}
              onChange={(e) => setForm({ ...form, microchipped: e.target.checked })}
              className="w-4 h-4 rounded" />
            <label htmlFor="microchipped" className="text-sm">Microchipped</label>
          </div>

          {/* Tags */}
          <div>
            <label className="text-xs font-medium block mb-1">Tags</label>
            <div className="flex gap-2">
              <Input value={tagInput} onChange={(e) => setTagInput(e.target.value)}
                onKeyDown={(e) => { if (e.key === "Enter") { e.preventDefault(); addTag(); } }}
                placeholder="e.g. indoor-only, shy…" className="rounded-xl" />
              <Button type="button" variant="outline" className="rounded-xl px-3" onClick={addTag}><Plus size={14} /></Button>
            </div>
            <div className="flex flex-wrap gap-1.5 mt-2">
              {tags.map((t) => (
                <span key={t} className="flex items-center gap-1 text-xs bg-primary/10 text-primary rounded-full px-2.5 py-0.5">
                  {t} <button type="button" onClick={() => setTags(tags.filter((x) => x !== t))}><X size={10} /></button>
                </span>
              ))}
            </div>
          </div>

          {/* Photo Upload */}
          <div>
            <label className="text-xs font-medium block mb-1">Photo</label>
            <div
              className="rounded-xl border-2 border-dashed border-border/50 p-4 flex flex-col items-center gap-2 cursor-pointer hover:border-primary/50 transition-colors"
              onClick={() => fileRef.current?.click()}
            >
              {photo ? (
                <img src={photo} alt="preview" className="max-h-40 rounded-xl object-contain" />
              ) : (
                <>
                  <Camera size={24} className="text-muted-foreground" />
                  <p className="text-sm text-muted-foreground">Click to upload a photo</p>
                  <p className="text-xs text-muted-foreground">Stored locally in your browser</p>
                </>
              )}
            </div>
            <input ref={fileRef} type="file" accept="image/*" className="hidden" onChange={handlePhoto} />
          </div>

          {/* Contact */}
          <div className="space-y-3">
            <p className="text-xs font-semibold text-muted-foreground uppercase tracking-wide">Your Contact Info</p>
            <div className="grid sm:grid-cols-3 gap-3">
              <div>
                <label className="text-xs font-medium block mb-1">Name <span className="text-destructive">*</span></label>
                <Input required value={form.contactName} onChange={(e) => setForm({ ...form, contactName: e.target.value })}
                  placeholder="Your name" className="rounded-xl" />
              </div>
              <div>
                <label className="text-xs font-medium block mb-1">Phone</label>
                <Input value={form.contactPhone} onChange={(e) => setForm({ ...form, contactPhone: e.target.value })}
                  placeholder="(559) 555-0000" className="rounded-xl" />
              </div>
              <div>
                <label className="text-xs font-medium block mb-1">Email</label>
                <Input type="email" value={form.contactEmail} onChange={(e) => setForm({ ...form, contactEmail: e.target.value })}
                  placeholder="you@email.com" className="rounded-xl" />
              </div>
            </div>
          </div>

          <div className="flex gap-3 pt-2">
            <Button type="submit" className="flex-1 rounded-xl" style={{ background: "#028391", color: "white" }}>
              Post {form.status === "lost" ? "Lost" : "Found"} Pet
            </Button>
            <Button type="button" variant="outline" className="rounded-xl" onClick={onClose}>Cancel</Button>
          </div>
        </form>
      </div>
    </div>
  );
}

function AddFeedForm({ onClose }: { onClose: () => void }) {
  const [form, setForm] = useState({ content: "", authorName: "", neighborhood: "", externalLink: "", groupName: "" });
  const [status, setStatus] = useState<CommunityFeedPost["status"]>("lost");

  function handleSubmit(e: React.FormEvent) {
    e.preventDefault();
    const post: CommunityFeedPost = {
      ...form,
      id: `feed-${Date.now()}`,
      createdAt: new Date().toISOString(),
      source: "manual",
      status,
    };
    saveCommunityPost(post);
    onClose();
    window.location.reload();
  }

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center p-4 bg-black/50 backdrop-blur-sm">
      <div className="glass-card rounded-3xl p-6 w-full max-w-lg">
        <div className="flex items-center justify-between mb-4">
          <h2 className="font-heading font-bold text-lg">Add a Community Post</h2>
          <button onClick={onClose} className="p-2 rounded-xl hover:bg-muted"><X size={18} /></button>
        </div>
        <p className="text-sm text-muted-foreground mb-4">
          Share a post from Facebook, Nextdoor, or your own update. Include a link to the original if available.
        </p>
        <form onSubmit={handleSubmit} className="space-y-3">
          <div className="grid grid-cols-2 gap-3">
            <div>
              <label className="text-xs font-medium block mb-1">Type</label>
              <select value={status} onChange={(e) => setStatus(e.target.value as CommunityFeedPost["status"])}
                className="w-full h-10 px-3 rounded-xl border border-input bg-background text-sm focus:outline-none focus:ring-2 focus:ring-ring">
                <option value="lost">Lost Pet</option>
                <option value="found">Found Pet</option>
                <option value="reunited">Reunited 🎉</option>
                <option value="info">General Info</option>
              </select>
            </div>
            <div>
              <label className="text-xs font-medium block mb-1">Neighborhood</label>
              <Input value={form.neighborhood} onChange={(e) => setForm({ ...form, neighborhood: e.target.value })}
                placeholder="e.g. Tower District" className="rounded-xl" />
            </div>
          </div>
          <div>
            <label className="text-xs font-medium block mb-1">Your Name / Handle <span className="text-destructive">*</span></label>
            <Input required value={form.authorName} onChange={(e) => setForm({ ...form, authorName: e.target.value })}
              placeholder="e.g. Maria G." className="rounded-xl" />
          </div>
          <div>
            <label className="text-xs font-medium block mb-1">Group / Source</label>
            <Input value={form.groupName} onChange={(e) => setForm({ ...form, groupName: e.target.value })}
              placeholder="e.g. Lost and Found Pets – Fresno CA" className="rounded-xl" />
          </div>
          <div>
            <label className="text-xs font-medium block mb-1">Post Content <span className="text-destructive">*</span></label>
            <textarea required value={form.content} onChange={(e) => setForm({ ...form, content: e.target.value })}
              rows={4} placeholder="Paste the post text here or write your own..."
              className="w-full rounded-xl border border-input bg-background px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-ring resize-none" />
          </div>
          <div>
            <label className="text-xs font-medium block mb-1">Link to Original Post (optional)</label>
            <Input value={form.externalLink} onChange={(e) => setForm({ ...form, externalLink: e.target.value })}
              placeholder="https://facebook.com/..." className="rounded-xl" />
          </div>
          <div className="flex gap-3 pt-1">
            <Button type="submit" className="flex-1 rounded-xl" style={{ background: "#028391", color: "white" }}>Add to Feed</Button>
            <Button type="button" variant="outline" className="rounded-xl" onClick={onClose}>Cancel</Button>
          </div>
        </form>
      </div>
    </div>
  );
}

type Tab = "lost" | "found" | "reunited" | "feed";

export default function LostFound() {
  const [tab, setTab] = useState<Tab>("lost");
  const [search, setSearch] = useState("");
  const [typeFilter, setTypeFilter] = useState<string>("all");
  const [showPostForm, setShowPostForm] = useState(false);
  const [showFeedForm, setShowFeedForm] = useState(false);
  const [posts, setPosts] = useState<LostFoundPost[]>(() => getLostFoundPosts());
  const feed = getCommunityFeed();

  function handleStatusChange(id: string, status: PetStatus) {
    updatePostStatus(id, status);
    setPosts(getLostFoundPosts());
  }

  const filtered = posts.filter((p) => {
    if (tab !== "feed" && p.status !== tab) return false;
    if (typeFilter !== "all" && p.petType !== typeFilter) return false;
    if (search) {
      const q = search.toLowerCase();
      return (
        p.petName?.toLowerCase().includes(q) ||
        p.neighborhood.toLowerCase().includes(q) ||
        p.color.toLowerCase().includes(q) ||
        p.description.toLowerCase().includes(q) ||
        p.breed?.toLowerCase().includes(q)
      );
    }
    return true;
  });

  const counts = {
    lost: posts.filter((p) => p.status === "lost").length,
    found: posts.filter((p) => p.status === "found").length,
    reunited: posts.filter((p) => p.status === "reunited").length,
  };

  const tabs: { id: Tab; label: string; count?: number; color: string }[] = [
    { id: "lost", label: "Lost Pets", count: counts.lost, color: "text-destructive" },
    { id: "found", label: "Found Pets", count: counts.found, color: "text-primary" },
    { id: "reunited", label: "Reunited", count: counts.reunited, color: "text-green-600 dark:text-green-400" },
    { id: "feed", label: "Community Feed", color: "text-foreground" },
  ];

  return (
    <div className="relative min-h-screen pt-28 pb-16 px-4">
      <AnimatedBackground />
      {showPostForm && <PostForm onClose={() => setShowPostForm(false)} />}
      {showFeedForm && <AddFeedForm onClose={() => setShowFeedForm(false)} />}

      <div className="relative z-10 max-w-7xl mx-auto">
        {/* Header */}
        <div className="flex items-end gap-6 mb-8">
          <div className="flex-1">
            <h1 className="font-heading text-4xl font-bold mb-2">Lost & Found</h1>
            <p className="text-muted-foreground max-w-2xl">
              Post a lost or found animal, browse community listings, and share sightings from Facebook and Nextdoor groups.
              All data is stored locally in your browser.
            </p>
          </div>
          <div className="hidden sm:flex gap-2 flex-shrink-0">
            <KurzgesagtCat size={70} />
            <KurzgesagtDog size={70} />
          </div>
        </div>

        {/* Facebook / Nextdoor Groups Banner */}
        <div className="glass-card rounded-2xl p-5 mb-6">
          <div className="flex items-center gap-2 mb-3">
            <Users size={16} className="text-primary" />
            <h3 className="font-heading font-bold text-sm">Join Fresno Facebook & Nextdoor Groups</h3>
          </div>
          <div className="grid sm:grid-cols-2 lg:grid-cols-4 gap-3">
            {FRESNO_FB_GROUPS.map((g) => (
              <a
                key={g.name}
                href={g.url}
                target="_blank"
                rel="noopener noreferrer"
                className="flex items-start gap-2.5 p-3 rounded-xl border border-border/40 hover:border-primary/40 hover:bg-primary/5 transition-all group"
              >
                <div className="w-7 h-7 rounded-lg flex items-center justify-center flex-shrink-0" style={{ background: g.url.includes("nextdoor") ? "#00B347" : "#1877F2" }}>
                  {g.url.includes("nextdoor") ? <span className="text-white text-xs font-bold">N</span> : <Facebook size={14} color="white" />}
                </div>
                <div>
                  <p className="text-xs font-semibold leading-snug group-hover:text-primary transition-colors">{g.name}</p>
                  <p className="text-xs text-muted-foreground">{g.members}</p>
                </div>
              </a>
            ))}
          </div>
        </div>

        {/* Action bar */}
        <div className="flex flex-wrap items-center gap-3 mb-6">
          <div className="relative flex-1 min-w-48">
            <Search size={14} className="absolute left-3 top-1/2 -translate-y-1/2 text-muted-foreground" />
            <Input
              className="pl-9 rounded-xl"
              placeholder="Search by name, neighborhood, color, breed…"
              value={search}
              onChange={(e) => setSearch(e.target.value)}
            />
          </div>
          <select value={typeFilter} onChange={(e) => setTypeFilter(e.target.value)}
            className="h-10 px-3 rounded-xl border border-input bg-background text-sm focus:outline-none focus:ring-2 focus:ring-ring">
            <option value="all">All Animals</option>
            <option value="cat">Cats</option>
            <option value="dog">Dogs</option>
            <option value="rabbit">Rabbits</option>
            <option value="bird">Birds</option>
            <option value="other">Other</option>
          </select>
          <Button onClick={() => setShowPostForm(true)} className="rounded-xl gap-2" style={{ background: "#028391", color: "white" }}>
            <Plus size={14} /> Post Lost / Found
          </Button>
          {tab === "feed" && (
            <Button variant="outline" onClick={() => setShowFeedForm(true)} className="rounded-xl gap-2">
              <Share2 size={14} /> Add to Feed
            </Button>
          )}
        </div>

        {/* Tabs */}
        <div className="flex gap-1 mb-6 p-1 glass-card rounded-2xl w-fit flex-wrap">
          {tabs.map((t) => (
            <button
              key={t.id}
              onClick={() => setTab(t.id)}
              className={`px-4 py-2 rounded-xl text-sm font-medium transition-all ${
                tab === t.id ? "bg-primary text-primary-foreground shadow" : "hover:bg-primary/10 text-foreground/70"
              }`}
            >
              {t.label}
              {t.count !== undefined && (
                <span className={`ml-1.5 text-xs ${tab === t.id ? "opacity-80" : t.color}`}>({t.count})</span>
              )}
            </button>
          ))}
        </div>

        {/* Tab content */}
        {tab === "feed" ? (
          <div className="space-y-4 max-w-2xl">
            <div className="flex items-center gap-2 mb-2">
              <p className="text-sm text-muted-foreground">
                Aggregated from Fresno Facebook groups and Nextdoor. Posts are added manually — we respect platform privacy policies.
              </p>
            </div>
            {feed.map((post) => (
              <FeedCard key={post.id} post={post} />
            ))}
          </div>
        ) : (
          <>
            {filtered.length === 0 ? (
              <div className="text-center py-20">
                <div className="flex justify-center gap-4 mb-4 opacity-40">
                  <KurzgesagtCat size={60} /> <KurzgesagtDog size={60} />
                </div>
                <p className="text-muted-foreground font-medium">
                  {search ? "No results match your search." : `No ${tab} pets posted yet.`}
                </p>
                <Button onClick={() => setShowPostForm(true)} className="mt-4 rounded-xl gap-2" style={{ background: "#028391", color: "white" }}>
                  <Plus size={14} /> Be the first to post
                </Button>
              </div>
            ) : (
              <div className="grid sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-4">
                {filtered.map((p) => (
                  <PetCard key={p.id} post={p} onStatusChange={handleStatusChange} />
                ))}
              </div>
            )}
          </>
        )}
      </div>
    </div>
  );
}
