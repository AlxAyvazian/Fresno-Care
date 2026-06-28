BOT_NAME = "network_sources"

SPIDER_MODULES = ["network_sources.spiders"]
NEWSPIDER_MODULE = "network_sources.spiders"

ROBOTSTXT_OBEY = True
CONCURRENT_REQUESTS = 8
DOWNLOAD_DELAY = 0.5
DOWNLOAD_TIMEOUT = 25
RETRY_ENABLED = True
RETRY_TIMES = 2

FEED_EXPORT_ENCODING = "utf-8"
LOG_LEVEL = "INFO"

DEFAULT_REQUEST_HEADERS = {
    "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8",
    "Accept-Language": "en-US,en;q=0.9",
}

ITEM_PIPELINES = {
    "network_sources.pipelines.CleanClinicLocationPipeline": 300,
}
