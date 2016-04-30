#!/bin/sh

find /app > /tmp/files
find /app -type d > /tmp/dirs

bower $@

find /app > /tmp/files.2
find /app -type d > /tmp/dirs.2

diff /tmp/files /tmp/files.2 | grep -E '^>' | sed 's/> //' | xargs chown $BOWER_UID.$BOWER_GID
diff /tmp/dirs /tmp/dirs.2 | grep -E '^>' | sed 's/> //' | xargs chown $BOWER_UID.$BOWER_GID
