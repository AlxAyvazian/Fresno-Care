import cat1 from "@assets/CAT-1.png?url";
import cat2 from "@assets/CAT-2.png?url";
import cat3 from "@assets/CAT-3.png?url";
import cat4 from "@assets/CAT-4.png?url";
import dog1 from "@assets/DOG-1.png?url";
import dog2 from "@assets/DOG-2.png?url";
import dog3 from "@assets/DOG-3.png?url";
import dog4 from "@assets/DOG-4.png?url";
import pair1 from "@assets/PAIR-1.png?url";
import pair2 from "@assets/PAIR-2.png?url";
import pair3 from "@assets/PAIR-3.png?url";
import pair4 from "@assets/PAIR-4.png?url";
import { CAT_BLACK_ART } from "@/assets/catBlackArt";
import { CAT_GREY_ART } from "@/assets/catGreyArt";
import { DOG_BLACK_ART } from "@/assets/dogBlackArt";
import { DOG_CREAM_ART } from "@/assets/dogCreamArt";

export type AnimalArtVariant = "cat-black" | "cat-grey" | "dog-black" | "dog-cream" | "pair";

const FALLBACK_ART: Record<Exclude<AnimalArtVariant, "pair">, string> = {
  "cat-black": CAT_BLACK_ART,
  "cat-grey": CAT_GREY_ART,
  "dog-black": DOG_BLACK_ART,
  "dog-cream": DOG_CREAM_ART,
};

const ATTACHED_CAT_IMAGES = [cat1, cat2, cat3, cat4].filter(Boolean);
const ATTACHED_DOG_IMAGES = [dog1, dog2, dog3, dog4].filter(Boolean);
const ATTACHED_PAIR_IMAGES = [pair1, pair2, pair3, pair4].filter(Boolean);

export const ATTACHED_ANIMAL_IMAGES = [
  ...ATTACHED_CAT_IMAGES,
  ...ATTACHED_DOG_IMAGES,
  ...ATTACHED_PAIR_IMAGES,
].filter(Boolean);

const LABELS: Record<AnimalArtVariant, string> = {
  "cat-black": "Cat illustration",
  "cat-grey": "Cat illustration",
  "dog-black": "Dog illustration",
  "dog-cream": "Dog illustration",
  pair: "Cat and dog illustration",
};

function pickImage(images: string[], index: number): string | undefined {
  if (images.length === 0) return undefined;
  return images[Math.abs(index) % images.length];
}

function assetForVariant(variant: AnimalArtVariant): string {
  if (variant === "pair") return pickImage(ATTACHED_PAIR_IMAGES, 0) ?? pickImage(ATTACHED_ANIMAL_IMAGES, 0) ?? CAT_GREY_ART;
  if (variant === "cat-black") return pickImage(ATTACHED_CAT_IMAGES, 0) ?? FALLBACK_ART["cat-black"];
  if (variant === "cat-grey") return pickImage(ATTACHED_CAT_IMAGES, 1) ?? FALLBACK_ART["cat-grey"];
  if (variant === "dog-black") return pickImage(ATTACHED_DOG_IMAGES, 0) ?? FALLBACK_ART["dog-black"];
  return pickImage(ATTACHED_DOG_IMAGES, 1) ?? FALLBACK_ART["dog-cream"];
}

export function AnimalArt({
  variant,
  size = 120,
  className = "",
  decorative = false,
}: {
  variant: AnimalArtVariant;
  size?: number;
  className?: string;
  decorative?: boolean;
}) {
  return (
    <img
      src={assetForVariant(variant)}
      width={size}
      height={size}
      className={className}
      alt={decorative ? "" : LABELS[variant]}
      aria-hidden={decorative || undefined}
      loading="lazy"
      draggable={false}
      style={{ width: size, height: "auto", objectFit: "contain" }}
    />
  );
}

export function AnimalPhotoCloud({ className = "", limit = 12 }: { className?: string; limit?: number }) {
  const images = ATTACHED_ANIMAL_IMAGES.length > 0
    ? ATTACHED_ANIMAL_IMAGES.slice(0, limit)
    : Object.values(FALLBACK_ART).slice(0, Math.min(limit, 4));

  return (
    <div className={`animal-photo-cloud ${className}`} aria-hidden="true">
      {images.map((src, index) => (
        <img
          key={`${src}-${index}`}
          src={src}
          alt=""
          loading="lazy"
          draggable={false}
          className={`animal-photo-cloud__image animal-photo-cloud__image--${(index % 6) + 1}`}
        />
      ))}
    </div>
  );
}

export function artForPet(type: "cat" | "dog" | "other", alternate = false): AnimalArtVariant {
  if (type === "dog") return alternate ? "dog-black" : "dog-cream";
  if (type === "other") return "pair";
  return alternate ? "cat-black" : "cat-grey";
}
