#!/bin/bash

readonly MEDIA_DIR="/media/entertainment"
readonly MEDIA_SUBDIRS=("audiobooks" "anime" "documentaries" "downloads" "movies" "music" "streams" "tv" "youtube" "comedy")

create_and_verify_directory() {
    local dir="$1"
    local dir_type="$2"

    if [ ! -d "$dir" ]; then
        echo "The directory \"$dir\" does not exist. Attempting to create..."
        if mkdir -p "$dir"; then
            echo "Directory $dir created ✅"
        else
            echo "Failed to create $dir_type directory at \"$dir\". Check permissions ❌"
        fi
    fi

    if [ ! -w "$dir" ] || [ ! -r "$dir" ]; then
        echo "Directory \"$dir\" is not writable or readable. Check permissions ❌"
    fi
}

setup_directory_structure() {
    local media_dir="$1"

    create_and_verify_directory "$media_dir" "media"

    for subdir in "${MEDIA_SUBDIRS[@]}"; do
        create_and_verify_directory "$media_dir/$subdir" "media subdirectory"
    done
}

setup_directory_structure "$MEDIA_DIR"
