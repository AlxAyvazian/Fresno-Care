import type { Report } from "@/lib/storage";

export function buildFlyerText(report: Report) {
  return [
    "VOICE MAP FRESNO ALERT",
    `Neighborhood: ${report.neighborhood}`,
    `Location: ${report.location}`,
    `Animal: ${report.animalType} x ${report.count}`,
    `Observed: ${report.dateObserved} ${report.timeObserved}`,
    `Danger: ${report.inDanger}`,
    `Concerns: ${report.concernTypes.join(", ")}`,
    `Notes: ${report.description}`,
    `Report ID: ${report.id}`,
  ].join("\n");
}
