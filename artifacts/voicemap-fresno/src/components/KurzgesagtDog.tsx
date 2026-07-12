import { AnimalArt } from "@/components/AnimalArt";

interface KurzgesagtDogProps {
  size?: number;
  className?: string;
}

export function KurzgesagtDog({ size = 120, className = "" }: KurzgesagtDogProps) {
  const variant = size >= 96 ? "dog-black" : "dog-cream";
  return <AnimalArt variant={variant} size={size} className={className} decorative />;
}
