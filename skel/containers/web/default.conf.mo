server {
  listen       80;
  server_name  {{PROJECT_NGINX_VIRTUAL_HOST}};

  location / {
      root   /usr/share/nginx/html;
      index  index.html index.htm;
  }

  # Redirect 301 /contact /contact.html
  location ~* "^/contact[/]{0,1}$" {
    return 301 /contact.html;
  }
  # Redirect 301 /sitemap.xml /drupal_archive/sitemap.xml
  location = /sitemap.xml {
    return 301 /drupal_archive/sitemap.xml;
  }
  # Redirect 301 /mybtcprice https://dmp1ce.github.io/Dave-s-BTC-Price
  location ~* "^/mybtcprice$" {
    return 301 https://dmp1ce.github.io/Dave-s-BTC-Price;
  }
  # RedirectMatch 301 ^/([\w-/]+)$ /drupal_archive/$1.html
  location ~ "^/([\w-/]+)$" {
    return 301 /drupal_archive/$1.html;
  }

  # redirect server error pages to the static page /50x.html
  #
  error_page   500 502 503 504  /50x.html;
  location = /50x.html {
      root   /usr/share/nginx/html;
  }
}

# Redirect alternative domain names.
server {
  listen 80;
  server_name {{PROJECT_NGINX_VIRTUAL_HOST_ALTS}};
  # $scheme will get the http protocol
  # and 301 is best practice for tablet, phone, desktop and seo
  return 301 $scheme://{{PROJECT_NGINX_VIRTUAL_HOST}}$request_uri;
}

# vim:syntax=nginx
