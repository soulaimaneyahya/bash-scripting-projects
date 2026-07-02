#!/bin/bash

# chmod +x lsm-db.sh

# 📦 SSTable file (persistent storage snapshot)
SSTABLE="sstable.db"

# 🚀 max in-memory entries before flush
CAPACITY=3

# 🧠 Memtable (RAM hash map)
declare -A MEMTABLE

# 🟢 PUT operation (write path)
put() {
    key="$1"
    value="$2"

    # store in memory (overwrite if key exists)
    MEMTABLE["$key"]="$value"

    # trigger flush when memtable is full
    if [ "${#MEMTABLE[@]}" -ge "$CAPACITY" ]; then
        flush
    fi
}

# 📦 FLUSH → convert RAM → SSTable (disk)
flush() {
    # dump memtable → key,value pairs
    for k in "${!MEMTABLE[@]}"; do
        echo "$k,${MEMTABLE[$k]}"
    done | sort > "$SSTABLE"   # sorted snapshot write

    # clear memtable (reset RAM state)
    unset MEMTABLE
    declare -A MEMTABLE
}
