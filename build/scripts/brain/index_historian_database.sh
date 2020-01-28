#!/bin/bash

cd /app/daphne/historical_db || exit
scrapy crawl ceosdb_scraper

