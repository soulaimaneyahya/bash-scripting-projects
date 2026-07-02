# simple LSM DB

Write-optimized architecture:
- Writes → Memtable (in-mem)
- Flush → SSTable (L0)
- Background compaction merges `SSTables` across levels, removes duplicates/tombstones (dead-segments) ⌛
- WAL ⌛

```sh
# load LSM functions into current shell
source lsm-db.sh

# set values
put username1 "soulaimaneyh1"
put username2 "soulaimaneyh2"
put username3 "soulaimaneyh3" # cache full: username1,username2,username3
```
