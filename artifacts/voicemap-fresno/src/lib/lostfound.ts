export type PetStatus = "lost" | "found" | "reunited";
export type PetType = "cat" | "dog" | "rabbit" | "bird" | "other";

export interface LostFoundPost {
  id: string;
  createdAt: string;
  status: PetStatus;
  petType: PetType;
  petName?: string;
  breed?: string;
  color: string;
  neighborhood: string;
  lastSeenAddress: string;
  dateSeen: string;
  description: string;
  contactName: string;
  contactPhone?: string;
  contactEmail?: string;
  photoBase64?: string;
  tags: string[];
  microchipped?: boolean;
  collarDescription?: string;
  reward?: string;
  source: "community" | "facebook" | "nextdoor" | "local";
  externalLink?: string;
  externalSource?: string;
}

export interface CommunityFeedPost {
  id: string;
  createdAt: string;
  source: "facebook" | "nextdoor" | "manual";
  groupName?: string;
  authorName: string;
  content: string;
  imageUrl?: string;
  externalLink?: string;
  neighborhood?: string;
  petType?: string;
  status: "lost" | "found" | "info" | "reunited";
  reactions?: number;
  comments?: number;
}

const LF_KEY = "voicemap_lostfound";
const FEED_KEY = "voicemap_community_feed";

export function getLostFoundPosts(): LostFoundPost[] {
  try {
    const raw = localStorage.getItem(LF_KEY);
    return raw ? JSON.parse(raw) : [];
  } catch {
    return [];
  }
}

export function saveLostFoundPost(post: LostFoundPost): void {
  const posts = getLostFoundPosts();
  const idx = posts.findIndex((p) => p.id === post.id);
  if (idx >= 0) {
    posts[idx] = post;
  } else {
    posts.unshift(post);
  }
  localStorage.setItem(LF_KEY, JSON.stringify(posts));
}

export function updatePostStatus(id: string, status: PetStatus): void {
  const posts = getLostFoundPosts();
  const p = posts.find((p) => p.id === id);
  if (p) {
    p.status = status;
    localStorage.setItem(LF_KEY, JSON.stringify(posts));
  }
}

export function getCommunityFeed(): CommunityFeedPost[] {
  try {
    const raw = localStorage.getItem(FEED_KEY);
    return raw ? JSON.parse(raw) : [];
  } catch {
    return [];
  }
}

export function saveCommunityPost(post: CommunityFeedPost): void {
  const posts = getCommunityFeed();
  posts.unshift(post);
  localStorage.setItem(FEED_KEY, JSON.stringify(posts));
}

export function generateLFId(): string {
  return `lf-${Date.now()}-${Math.random().toString(36).slice(2, 7)}`;
}

export const FRESNO_FB_GROUPS = [
  {
    name: "Lost and Found Pets – Fresno CA",
    url: "https://www.facebook.com/groups/fresnolostfoundpets",
    members: "28,000+",
    desc: "Largest Fresno lost/found pet group",
  },
  {
    name: "Fresno County Lost & Found Pets",
    url: "https://www.facebook.com/groups/FresnoCountyLostFoundPets",
    members: "12,000+",
    desc: "Covers greater Fresno County area",
  },
  {
    name: "Fresno Animal Lovers",
    url: "https://www.facebook.com/groups/fresnoanimallovers",
    members: "9,500+",
    desc: "General animal welfare and lost/found",
  },
  {
    name: "Nextdoor – Fresno",
    url: "https://nextdoor.com",
    members: "Community app",
    desc: "Post in your Fresno neighborhood",
  },
];
