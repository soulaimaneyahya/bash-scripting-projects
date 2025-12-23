# lfu-cache.sh

LFU (Least Frequently Used):
Cache policy that removes the item with the lowest // access count (increase usage count*) when space is full.

```sh
# load LFU functions into current shell
source lfu-cache.sh

# set values
lfu_set username1 "soulaimaneyh1"
lfu_set username2 "soulaimaneyh2"
lfu_set username3 "soulaimaneyh3" # cache full: username1,username2,username3

# access (increments frequency)
lfu_get username1
lfu_get username1
lfu_get username2

# insert new → evicts least frequently used
lfu_set username4 "soulaimaneyh4"
```
