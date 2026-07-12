import { CAT_BLACK_ART } from "@/assets/catBlackArt";
import { CAT_GREY_ART } from "@/assets/catGreyArt";
import { DOG_BLACK_ART } from "@/assets/dogBlackArt";
import { DOG_CREAM_ART } from "@/assets/dogCreamArt";

export type AnimalArtVariant = "cat-black" | "cat-grey" | "dog-black" | "dog-cream";

const FALLBACK_ART: Record<AnimalArtVariant, string> = {
  "cat-black": CAT_BLACK_ART,
  "cat-grey": CAT_GREY_ART,
  "dog-black": DOG_BLACK_ART,
  "dog-cream": DOG_CREAM_ART,
};

const LABELS: Record<AnimalArtVariant, string> = {
  "cat-black": "Animal illustration",
  "cat-grey": "Animal illustration",
  "dog-black": "Animal illustration",
  "dog-cream": "Animal illustration",
};

const VARIANT_INDEX: Record<AnimalArtVariant, number> = {
  "cat-black": 0,
  "cat-grey": 1,
  "dog-black": 2,
  "dog-cream": 3,
};

const uploadedAnimalModules = import.meta.glob("../assets/*.{png,jpg,jpeg,webp,avif}", {
  eager: true,
  import: "default",
  query: "?url",
}) as Record<string, string>;

export const UPLOADED_ANIMAL_IMAGES = Object.entries(uploadedAnimalModules)
  .sort(([left], [right]) => left.localeCompare(right))
  .map(([, src]) => src)
  .filter(Boolean);

function assetForVariant(variant: AnimalArtVariant): string {
  if (UPLOADED_ANIMAL_IMAGES.length === 0) return FALLBACK_ART[variant];
  const index = VARIANT_INDEX[variant] % UPLOADED_ANIMAL_IMAGES.length;
  return UPLOADED_ANIMAL_IMAGES[index] ?? FALLBACK_ART[variant];
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
  const images = UPLOADED_ANIMAL_IMAGES.length > 0
    ? UPLOADED_ANIMAL_IMAGES.slice(0, limit)
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
  return alternate ? "cat-black" : "cat-grey";
}
