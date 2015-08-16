{{#DEVELOPMENT}}
build:
  build: containers/build/.
  volumes_from:
    - source
  command: /home/hakyll/start_hakyll.sh
{{/DEVELOPMENT}}
source:
  build: containers/source/.
  command: "true"
  volumes:
    - {{#DEVELOPMENT}}containers/source/hakyll:{{/DEVELOPMENT}}/home/hakyll/hakyll
web:
  build: containers/web/.
  volumes_from:
    - source
  environment:
    - VIRTUAL_HOST={{PROJECT_NGINX_VIRTUAL_HOST}}

# vim:syntax=yaml
