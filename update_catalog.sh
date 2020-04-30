#! /usr/bin/env bash
# https://github.com/idelsink/ampache-docker/blob/master/root/scripts/catalog_update.sh

LOCKDIR=/var/lock/ampache
mkdir -p "${LOCKDIR}"
LF="${LOCKDIR}/.$(basename $0).lock"

(
    # stop if lock exists
    flock -x -n 200 || exit 1
    echo "~~ updating catalog ~~"
    php /var/www/html/ampache/bin/catalog_update.inc

) 200>$LF