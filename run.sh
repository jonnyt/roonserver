#!/bin/bash

# Check folder existence
if test ! -w /app; then
    echo "Application folder /app not present or not writable"
    exit 1
fi
if test ! -w /data; then
    echo "Data folder /data not present or not writable"
    exit 1
fi

# Check for shared folders which cause all kinds of weird errors on core updates
rm -f /data/check-for-shared-with-data
touch /app/check-for-shared-with-data
if test -f /data/check-for-shared-with-data; then
    echo "Application folder /app and Data folder /data are shared. Please fix this."
    exit 1
fi
rm -f /app/check-for-shared-with-data

# Run the app
if test -z "$ROON_DATAROOT" -o -z "$ROON_ID_DIR"; then
    echo "Dataroot ROON_DATAROOT and/or ID dir ROON_ID_DIR not set"
    exit 1
fi
/app/RoonServer/start.sh