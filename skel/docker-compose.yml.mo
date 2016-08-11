build:
  build: containers/build/.
  volumes_from:
    - source
{{#DEVELOPMENT}}
  tty: true
{{/DEVELOPMENT}}
  command: bash -c "{{#DEVELOPMENT}}cd {{PROJECT_BUILD_PATH}}/build/hakyll; ./site watch --no-server{{/DEVELOPMENT}}{{#PRODUCTION}}echo 'Production build. Do nothing'{{/PRODUCTION}}"
source:
  build: containers/source/.
  command: echo "Source container. Do nothing."
  volumes:
    - {{PROJECT_NAMESPACE}}_build:{{PROJECT_BUILD_PATH}}/build
    - {{PROJECT_NAMESPACE}}_releases:{{PROJECT_RELEASES_PATH}}
    {{#DEVELOPMENT}}
    - ./containers/source/hakyll:{{PROJECT_BUILD_PATH}}/build/hakyll
    {{/DEVELOPMENT}}
web:
  build: containers/web/.
  volumes_from:
    - source
  environment:
    - VIRTUAL_HOST={{PROJECT_NGINX_PROXY_VIRTUAL_HOSTS}}
{{#PRODUCTION}}
  restart: always
{{/PRODUCTION}}

# vim:syntax=yaml
