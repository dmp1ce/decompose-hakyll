FROM haskell
MAINTAINER David Parrish <daveparrish@gmail.com>

# Create user to run service as 
RUN useradd -m -s /bin/bash hakyll

# Run as user 'hakyll'
USER hakyll

# Make sure 'hakyll' user has access to installed hakyll binaries
ENV PATH /home/hakyll/.cabal/bin:$PATH

# Get Hakyll installed
RUN cabal update && cabal install hakyll

# Build site
WORKDIR /home/hakyll/hakyll

# Add start script
COPY start_hakyll.sh /home/hakyll/start_hakyll.sh
