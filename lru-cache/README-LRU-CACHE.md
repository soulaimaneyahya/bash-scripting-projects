# lru-cache.sh

LRU (Least Recently Used):
Cache policy that removes the item // not used (first line*) for the longest time when space is full.

- evict LRU if capacity exceeded
- drop first line

```sh
source lru-cache.sh

lru_set username1 "soulaimaneyh1"
lru_set username2 "soulaimaneyh2"
lru_set username3 "soulaimaneyh3" # cache full: username1,username2,username3

lru_set username4 "soulaimaneyh4" # evict username1 → username2,username3,username4

lru_get username3 # returns "soulaimaneyh3"
```
