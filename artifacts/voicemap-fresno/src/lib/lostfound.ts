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
    return raw ? JSON.parse(raw) : getDemoPosts();
  } catch {
    return getDemoPosts();
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
    return raw ? JSON.parse(raw) : getDemoFeed();
  } catch {
    return getDemoFeed();
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

function getDemoPosts(): LostFoundPost[] {
  const ago = (days: number) =>
    new Date(Date.now() - days * 864e5).toISOString();
  return [
    {
      id: "lf-demo-1",
      createdAt: ago(1),
      status: "lost",
      petType: "cat",
      petName: "Luna",
      breed: "Domestic Shorthair",
      color: "Grey tabby with white chest",
      neighborhood: "Tower District",
      lastSeenAddress: "Near E Olive Ave & N Van Ness Ave",
      dateSeen: new Date(Date.now() - 1 * 864e5).toISOString().slice(0, 10),
      description:
        "Luna escaped through an open window. She is shy and may hide. She has a pink collar with a heart tag. Very friendly once she trusts you.",
      contactName: "Maria G.",
      contactPhone: "(559) 555-0142",
      tags: ["microchipped", "indoor-only", "shy"],
      microchipped: true,
      collarDescription: "Pink collar, small heart charm",
      reward: "$200",
      source: "community",
    },
    {
      id: "lf-demo-2",
      createdAt: ago(3),
      status: "found",
      petType: "dog",
      petName: undefined,
      breed: "Lab mix, medium size",
      color: "Brown with tan patches",
      neighborhood: "Fresno High",
      lastSeenAddress: "Floradora Ave near Wishon Ave",
      dateSeen: new Date(Date.now() - 3 * 864e5).toISOString().slice(0, 10),
      description:
        "Found a friendly male dog wandering alone. No collar. Very gentle and good with people. Currently being fostered. Please reach out if this is your dog.",
      contactName: "James T.",
      contactEmail: "james.t.fresno@email.com",
      tags: ["male", "friendly", "no-collar"],
      microchipped: false,
      source: "community",
    },
    {
      id: "lf-demo-3",
      createdAt: ago(5),
      status: "lost",
      petType: "dog",
      petName: "Biscuit",
      breed: "Golden Retriever",
      color: "Golden / light cream",
      neighborhood: "Fig Garden",
      lastSeenAddress: "W Bullard Ave & N Maroa Ave",
      dateSeen: new Date(Date.now() - 5 * 864e5).toISOString().slice(0, 10),
      description:
        "Biscuit got spooked by fireworks and ran. He is 5 years old, neutered, very friendly. Blue collar with ID tag. Please call if spotted.",
      contactName: "The Nguyen Family",
      contactPhone: "(559) 555-0287",
      contactEmail: "nguyen.fresno@email.com",
      tags: ["neutered", "friendly", "blue-collar", "microchipped"],
      microchipped: true,
      collarDescription: "Blue nylon collar with silver tag",
      reward: "$500",
      source: "facebook",
      externalLink: "https://www.facebook.com/groups/fresnolostfoundpets",
      externalSource: "Facebook: Lost and Found Pets – Fresno CA",
    },
    {
      id: "lf-demo-4",
      createdAt: ago(7),
      status: "reunited",
      petType: "cat",
      petName: "Shadow",
      breed: "Black domestic shorthair",
      color: "All black",
      neighborhood: "Downtown",
      lastSeenAddress: "Fulton St",
      dateSeen: new Date(Date.now() - 7 * 864e5).toISOString().slice(0, 10),
      description:
        "UPDATE: Shadow has been found and reunited with his family! Thank you to everyone who shared. He was hiding in a neighbor's garage two blocks away.",
      contactName: "Anon",
      tags: ["reunited"],
      microchipped: false,
      source: "nextdoor",
    },
    {
      id: "lf-demo-5",
      createdAt: ago(2),
      status: "found",
      petType: "cat",
      petName: undefined,
      breed: "Siamese mix",
      color: "Cream with dark points, blue eyes",
      neighborhood: "Woodward Park",
      lastSeenAddress: "E Nees Ave & N Millbrook Ave",
      dateSeen: new Date(Date.now() - 2 * 864e5).toISOString().slice(0, 10),
      description:
        "Found a Siamese-mix cat sitting in front of our home for two days. She is very vocal and friendly — seems like someone's pet. No microchip found at the vet.",
      contactName: "Sandra K.",
      contactPhone: "(559) 555-0391",
      tags: ["female", "vocal", "friendly", "possible-indoor"],
      source: "community",
    },
  ];
}

function getDemoFeed(): CommunityFeedPost[] {
  const ago = (h: number) =>
    new Date(Date.now() - h * 36e5).toISOString();
  return [
    {
      id: "feed-demo-1",
      createdAt: ago(2),
      source: "facebook",
      groupName: "Lost and Found Pets – Fresno CA",
      authorName: "Diane R.",
      content:
        "LOST CAT 🐱 Tower District area. Grey tabby named Luna, missing since yesterday evening. Pink collar. Very shy. Please check under porches and in garages. Contact me if spotted! Sharing is caring 💕",
      neighborhood: "Tower District",
      petType: "cat",
      status: "lost",
      reactions: 47,
      comments: 23,
      externalLink: "https://www.facebook.com/groups/fresnolostfoundpets",
    },
    {
      id: "feed-demo-2",
      createdAt: ago(5),
      source: "nextdoor",
      groupName: "Fresno – Tower District",
      authorName: "Kevin M.",
      content:
        "Found a brown Lab mix this morning on Floradora Ave. Very sweet dog, no collar. He's currently safe at my house. Has he been scanned for a chip — visiting PetSmart today. Anyone recognize him?",
      neighborhood: "Fresno High",
      petType: "dog",
      status: "found",
      reactions: 31,
      comments: 18,
      externalLink: "https://nextdoor.com",
    },
    {
      id: "feed-demo-3",
      createdAt: ago(8),
      source: "facebook",
      groupName: "Fresno County Lost & Found Pets",
      authorName: "The Nguyen Family",
      content:
        "⚠️ MISSING DOG – $500 REWARD ⚠️ Our Golden Retriever 'Biscuit' got scared during fireworks and ran from the Fig Garden area. Blue collar, microchipped, 5 years old. PLEASE SHARE. We are heartbroken. Calling (559) 555-0287 day or night.",
      neighborhood: "Fig Garden",
      petType: "dog",
      status: "lost",
      reactions: 214,
      comments: 87,
      externalLink: "https://www.facebook.com/groups/FresnoCountyLostFoundPets",
    },
    {
      id: "feed-demo-4",
      createdAt: ago(14),
      source: "nextdoor",
      groupName: "Fresno – Downtown",
      authorName: "Alicia V.",
      content:
        "UPDATE: Shadow is HOME! 🥹 After 6 days of searching and posting, our black cat Shadow was found hiding in a neighbor's garage 2 blocks away. Thank you to everyone who shared. This community is the best 💙",
      neighborhood: "Downtown",
      petType: "cat",
      status: "reunited",
      reactions: 183,
      comments: 54,
      externalLink: "https://nextdoor.com",
    },
    {
      id: "feed-demo-5",
      createdAt: ago(18),
      source: "facebook",
      groupName: "Lost and Found Pets – Fresno CA",
      authorName: "Sandra K.",
      content:
        "Found this beautiful Siamese mix in Woodward Park area (Nees & Millbrook). She's been sitting outside our house for 2 days — very friendly and vocal, seems like someone's beloved pet. Took her to vet, no microchip found. Anyone missing her?",
      neighborhood: "Woodward Park",
      petType: "cat",
      status: "found",
      reactions: 62,
      comments: 29,
      externalLink: "https://www.facebook.com/groups/fresnolostfoundpets",
    },
    {
      id: "feed-demo-6",
      createdAt: ago(30),
      source: "facebook",
      groupName: "Fresno Animal Lovers",
      authorName: "Fresno Animal Center",
      content:
        "📢 This week at Fresno Animal Center: We currently have 47 stray dogs and 31 stray cats available for adoption or owner claim. If you've lost a pet, please come in person to check. Animals held 72 hours before becoming available for adoption. Visit us at 7172 N San Pablo Ave.",
      neighborhood: "Northwest Fresno",
      status: "info",
      reactions: 108,
      comments: 15,
      externalLink: "https://www.fresno.gov/animal-center",
    },
  ];
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
