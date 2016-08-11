FROM nginx:latest
MAINTAINER David Parrish <daveparrish@tutanota.com>

# Link built site to nginx static hosting directory.
RUN rm -rf /usr/share/nginx/html && ln -s /app/releases/current /usr/share/nginx/html

# Copy nginx conf files
COPY default.conf /etc/nginx/conf.d/default.conf
