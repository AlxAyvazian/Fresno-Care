import { CAT_BLACK_ART } from "@/assets/catBlackArt";
import { CAT_GREY_ART } from "@/assets/catGreyArt";
import { DOG_BLACK_ART } from "@/assets/dogBlackArt";
import { DOG_CREAM_ART } from "@/assets/dogCreamArt";

export type AnimalArtVariant = "cat-black" | "cat-grey" | "dog-black" | "dog-cream";

const ART: Record<AnimalArtVariant, string> = {
  "cat-black": CAT_BLACK_ART,
  "cat-grey": CAT_GREY_ART,
  "dog-black": DOG_BLACK_ART,
  "dog-cream": DOG_CREAM_ART,
};

const LABELS: Record<AnimalArtVariant, string> = {
  "cat-black": "Black cat illustration",
  "cat-grey": "Grey cat illustration",
  "dog-black": "Black dog illustration",
  "dog-cream": "Sleeping cream dog illustration",
};

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
      src={ART[variant]}
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

export function artForPet(type: "cat" | "dog" | "other", alternate = false): AnimalArtVariant {
  if (type === "dog") return alternate ? "dog-black" : "dog-cream";
  return alternate ? "cat-black" : "cat-grey";
}
