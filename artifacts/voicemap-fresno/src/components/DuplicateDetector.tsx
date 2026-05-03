import type { Report } from "@/lib/storage";

export function findDuplicateReports(reports: Report[]) {
  const dupes: Array<{ key: string; reports: Report[] }> = [];
  const map = new Map<string, Report[]>();
  for (const report of reports) {
    const key = `${report.neighborhood.toLowerCase()}|${report.location.toLowerCase()}|${report.animalType}`;
    const list = map.get(key) ?? [];
    list.push(report);
    map.set(key, list);
  }
  for (const [key, items] of map.entries()) {
    if (items.length > 1) dupes.push({ key, reports: items });
  }
  return dupes;
}
