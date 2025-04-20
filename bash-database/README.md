# bash-database.sh

simplest database, implemented as two Bash functions, *key-value* store.

- You can call **db_set** key value, which will store *key-value* in the database.
- You can then call **db_get** key, which looks up the most recent value associated with that particular *key* and returns it.

```sh
source bash-database.sh

db_set username soulaimaneyahya
db_get username
```
