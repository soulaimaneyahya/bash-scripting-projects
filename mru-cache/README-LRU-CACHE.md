# mru-cache.sh

## !rarely-used

MRU (Most Recently Used):
Cache policy that removes // Evicts the *most recently accessed* item when space is full.

- evict MRU if capacity exceeded
- drop latest line

```sh
source mru-cache.sh

mru_set username1 "soulaimaneyh1"
mru_set username2 "soulaimaneyh2"
mru_set username3 "soulaimaneyh3" # cache full: username1,username2,username3

# evict soulaimaneyh3 → username1,username2,username4
mru_set username4 "soulaimaneyh4"

mru_get username3 # returns "soulaimaneyh3"
```
