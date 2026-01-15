#!/bin/bash

# chmod +x bash-database.sh

db_set () {
    echo "$1,$2" >> database
}

db_get () {
    grep "^$1," database | sed -e "s/^$1,//" | tail -n 1
}

db_rm () {
    grep -v "^$1," database > database.tmp && mv database.tmp database
}
