export interface RegisteredPet {
  id: string;
  createdAt: string;
  petName: string;
  petType: "cat" | "dog" | "rabbit" | "bird" | "other";
  breed: string;
  color: string;
  sex: "male" | "female" | "unknown";
  age: string;
  microchipId: string;
  licenseNumber: string;
  vetName: string;
  vetPhone: string;
  ownerName: string;
  ownerPhone: string;
  ownerEmail: string;
  ownerAddress: string;
  photoBase64?: string;
  vaccinations: string[];
  notes: string;
  tags: string[];
}

const REGISTRY_KEY = "voicemap_pet_registry";

export function getPets(): RegisteredPet[] {
  try {
    const raw = localStorage.getItem(REGISTRY_KEY);
    return raw ? JSON.parse(raw) : [];
  } catch {
    return [];
  }
}

export function savePet(pet: RegisteredPet): void {
  const pets = getPets();
  const idx = pets.findIndex((p) => p.id === pet.id);
  if (idx >= 0) {
    pets[idx] = pet;
  } else {
    pets.unshift(pet);
  }
  localStorage.setItem(REGISTRY_KEY, JSON.stringify(pets));
}

export function deletePet(id: string): void {
  const pets = getPets().filter((p) => p.id !== id);
  localStorage.setItem(REGISTRY_KEY, JSON.stringify(pets));
}

export function generatePetId(): string {
  return `pet-${Date.now()}-${Math.random().toString(36).slice(2, 6)}`;
}
