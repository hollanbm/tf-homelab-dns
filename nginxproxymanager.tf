
resource "nginxproxymanager_proxy_host" "proxy_host" {
  domain_names = [for subdomain in var.nginxproxymanager.subdomains : "${subdomain}.${var.nginxproxymanager.domain_name}"]

  forward_scheme = var.nginxproxymanager.forward_scheme
  forward_host   = var.nginxproxymanager.forward_host
  forward_port   = var.nginxproxymanager.forward_port

  caching_enabled         = var.nginxproxymanager.caching_enabled
  allow_websocket_upgrade = true
  block_exploits          = true

  certificate_id = var.nginxproxymanager.certificate.id

  ssl_forced      = true
  hsts_enabled    = true
  hsts_subdomains = true
  http2_support   = true
}
