#!/bin/bash

cd /home/hakyll/hakyll
ghc --make site.hs
./site watch --no-server
