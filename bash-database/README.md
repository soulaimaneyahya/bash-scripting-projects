# bash-database.sh

simplest database, simple API functions, implemented as Bash functions, *key-value* store; setting, getting, and removing keys from a flat-file database

- You can call **db_set** key value, which will store *key-value* in the database.

- You can then call **db_get** key, which looks up the most recent value associated with that particular *key* and returns it.
line-by-line scan → O(n), linear-search

```sh
source bash-database.sh

db_set username soulaimaneyahya
db_get username
db_rm username
```

