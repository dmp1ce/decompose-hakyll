FROM busybox
MAINTAINER David Parrish <daveparrish@gmail.com>

{{#PRODUCTION}}
# Copy static files for production
RUN mkdir -p /home/hakyll/hakyll/_site
COPY hakyll/_site /home/hakyll/hakyll/_site
{{/PRODUCTION}}
{{#DEVELOPMENT}}
# Copy entire hakyll source directory for development
COPY hakyll /home/hakyll/hakyll
{{/PRODUCTION}}
