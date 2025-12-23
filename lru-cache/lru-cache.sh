#!/bin/bash

# chmod +x lru-cache.sh
# format: key,value (ordered by recency; bottom = most recent)

CACHE_FILE="lru.db"
CAPACITY=3

# set key = insert/update recency
lru_set() {
    key="$1"; value="$2"

    # remove older same-key entries
    grep -v "^$key," "$CACHE_FILE" 2>/dev/null > "$CACHE_FILE.tmp"
    mv "$CACHE_FILE.tmp" "$CACHE_FILE"

    # add as newest (MRU)
    echo "$key,$value" >> "$CACHE_FILE"

    # evict LRU if capacity exceeded
    if [ "$(wc -l < "$CACHE_FILE")" -gt "$CAPACITY" ]; then
        tail -n +2 "$CACHE_FILE" > "$CACHE_FILE.tmp"  # drop first line
        mv "$CACHE_FILE.tmp" "$CACHE_FILE"
    fi
}

# get key = return value only
lru_get() {
    grep "^$1," "$CACHE_FILE" | sed "s/^$1,//" | tail -n 1
}
