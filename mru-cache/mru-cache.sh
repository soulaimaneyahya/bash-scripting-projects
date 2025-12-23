#!/bin/bash

# !rarely-used

# chmod +x mru-cache.sh
# format: key,value (ordered by recency; bottom = most recent)

CACHE_FILE="mru.db"
CAPACITY=3

# set key = insert/update recency
mru_set() {
    key="$1"; value="$2"

    # remove older same-key entries
    grep -v "^$key," "$CACHE_FILE" 2>/dev/null > "$CACHE_FILE.tmp"
    mv "$CACHE_FILE.tmp" "$CACHE_FILE"

    # evict mru if eached capacity
    if [ "$(wc -l < "$CACHE_FILE")" -eq "$CAPACITY" ]; then
        head -n -1 "$CACHE_FILE" > "$CACHE_FILE.tmp"
        mv "$CACHE_FILE.tmp" "$CACHE_FILE"
    fi

    # add as newest (MRU)
    echo "$key,$value" >> "$CACHE_FILE"
}

# get key = return value only
mru_get() {
    grep "^$1," "$CACHE_FILE" | sed "s/^$1,//" | tail -n 1
}
