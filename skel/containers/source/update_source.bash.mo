#!/bin/bash

# Include '.*' pattern in globbing. http://unix.stackexchange.com/a/6397/55139
shopt -s dotglob nullglob

{{#PRODUCTION}}
# Update all the souce in the build volume
echo "Updating source in shared build volume"

rm -rf {{PROJECT_BUILD_PATH}}/build/*
cp -r {{PROJECT_BUILD_PATH}}/build_context/* {{PROJECT_BUILD_PATH}}/build
{{/PRODUCTION}}

{{#DEVELOPMENT}}
echo "Updating source from docker_build_context."
echo "Configure 'exclude_build_sync.txt' to avoid overwriting"
rsync -r --exclude-from={{PROJECT_BUILD_PATH}}/build_context/source/exclude_build_sync.txt \
  {{PROJECT_BUILD_PATH}}/docker_build_context/ {{PROJECT_BUILD_PATH}}/build/
{{/DEVELOPMENT}}

# vim: syntax=sh
