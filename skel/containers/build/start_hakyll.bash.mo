#!/bin/bash

cd {{PROJECT_BUILD_PATH}}/build/hakyll

# Rebuild site program
rm -f site && rm -f site.o && rm -f site.hi
ghc --make site.hs

# Rebuild project
./site clean
./site build

# vim:syntax=sh
