#!/bin/sh
# SPDX-FileCopyrightText: 2026 Cristian Cezar Moisés
# SPDX-License-Identifier: GPL-3.0-or-later
set -eu

if [ ! -f haunt.scm ]; then
    printf '%s\n' 'Run this script from the repository root.' >&2
    exit 1
fi

if [ -d site ]; then
    find site -mindepth 1 -delete
fi

haunt build

# Root HTML is the committed static deployment output. Remove only files and
# directories owned by Haunt before copying a fresh build.
find . -maxdepth 1 -type f \( -name '*.html' -o -name 'robots.txt' \
    -o -name 'sitemap.xml' -o -name 'favicon.svg' \) -delete
if [ -d pt-br ]; then
    find pt-br -mindepth 1 -delete
    rmdir pt-br
fi

cp -R site/. ./
