from itemadapter import ItemAdapter
from scrapy.exceptions import DropItem


class CleanClinicLocationPipeline:
    """Normalize clinic rows before feed export/import."""

    REQUIRED_FIELDS = ("name", "city", "state")

    def process_item(self, item, spider):
        adapter = ItemAdapter(item)

        for field_name in list(adapter.field_names()):
            value = adapter.get(field_name)
            if isinstance(value, list):
                value = " ".join(str(v).strip() for v in value if str(v).strip())
            if value is not None:
                adapter[field_name] = self._clean_string(value)

        if not adapter.get("address"):
            address = " ".join(
                part for part in [adapter.get("address1"), adapter.get("address2")] if part
            ).strip()
            if address:
                adapter["address"] = address

        if adapter.get("state"):
            adapter["state"] = str(adapter["state"]).strip().upper()[:2]

        if not adapter.get("sourceTag"):
            adapter["sourceTag"] = getattr(spider, "source_tag", "scrapy")

        if not adapter.get("internalStatus"):
            adapter["internalStatus"] = "candidate"

        evidence_parts = []
        if adapter.get("evidenceNote"):
            evidence_parts.append(adapter["evidenceNote"])
        if adapter.get("hours"):
            evidence_parts.append(f"Hours: {adapter['hours']}")
        if adapter.get("sourceUrl"):
            evidence_parts.append(f"Source URL: {adapter['sourceUrl']}")
        if evidence_parts:
            adapter["evidenceNote"] = " | ".join(dict.fromkeys(evidence_parts))

        missing = [field for field in self.REQUIRED_FIELDS if not adapter.get(field)]
        if missing:
            raise DropItem(f"Missing required fields {missing}: {dict(adapter)}")

        return item

    @staticmethod
    def _clean_string(value):
        return " ".join(str(value).replace("\xa0", " ").split()).strip()
