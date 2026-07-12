import { AnimalArt } from "@/components/AnimalArt";

interface KurzgesagtCatProps {
  size?: number;
  className?: string;
}

export function KurzgesagtCat({ size = 120, className = "" }: KurzgesagtCatProps) {
  const variant = size >= 96 ? "cat-grey" : "cat-black";
  return <AnimalArt variant={variant} size={size} className={className} decorative />;
}
