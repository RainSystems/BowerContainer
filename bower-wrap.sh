#!/bin/sh

find /app > /tmp/files
find /app -type d > /tmp/dirs

bower $@

if [ -n "${BOWER_UID}" ] && [ -n "${BOWER_GID}" ]; then
    find /app > /tmp/files.2
    find /app -type d > /tmp/dirs.2

    diff /tmp/files /tmp/files.2 | grep -E '^>' | sed 's/> //' > /tmp/diff
    diff /tmp/dirs /tmp/dirs.2 | grep -E '^>' | sed 's/> //' >> /tmp/diff
    [ -n "$(cat /tmp/diff)" ] && cat /tmp/diff | xargs chown $BOWER_UID.$BOWER_GID
fi