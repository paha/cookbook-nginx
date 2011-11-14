default.nginx.version = "1.0.5"

default.nginx.dir = "/etc/nginx"
default.nginx.log_dir = "/var/log/nginx"
default.nginx.user = "www-data"

default.nginx.gzip = "off"
default.nginx.gzip_http_version = "1.0"
default.nginx.gzip_comp_level = 4
default.nginx.gzip_proxied = "any"
default.nginx.gzip_types = [
  "text/plain",
  "text/html",
  "text/css",
  "application/x-javascript",
  "text/xml",
  "application/xml",
  "application/xml+rss",
  "text/javascript"
]

default.nginx.keepalive = "on"
default.nginx.keepalive_timeout = 65
default.nginx.worker_processes = cpu[:total]
default.nginx.worker_connections = 2048
default.nginx.server_names_hash_bucket_size = 64
