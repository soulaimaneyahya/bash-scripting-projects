#!/bin/bash

# chmod +x lfu-cache.sh

# LFU cache using flat-file DB

DB="lfu.db"
CAP=3   # max items in cache

lfu_get() {
  key="$1"
  hit=0

  # update frequency & capture value
  tmp=$(awk -F, -v k="$key" '
    $1==k { $3++; print $1","$2","$3; hit=1; next }
    { print }
    END { if(hit==0) exit 1 }
  ' "$DB")

  # write back updated DB
  echo "$tmp" > "$DB"

  # print only requested key
  awk -F, -v k="$key" '$1==k {print $1, $2, $3}' "$DB"
}

lfu_set() {
  key="$1"; val="$2"

  # key exists → update value, keep frequency
  if grep -q "^$key," "$DB" 2>/dev/null; then
    awk -F, -v k="$key" -v v="$val" '
      $1==k { print k","v","$3; next }
      { print }
    ' "$DB" > "$DB.tmp" && mv "$DB.tmp" "$DB"
    return
  fi

  # cache full → evict least frequently used
  if [ "$(wc -l < "$DB" 2>/dev/null)" -ge "$CAP" ]; then
    sort -t, -k3 -n "$DB" | sed '1d' > "$DB.tmp"
    mv "$DB.tmp" "$DB"
  fi

  # insert new key with freq = 1
  echo "$key,$val,1" >> "$DB"
}
