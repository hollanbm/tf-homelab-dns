
resource "nginxproxymanager_proxy_host" "proxy_host" {
  domain_names = [for subdomain in var.nginxproxymanager.subdomains : "${subdomain}.${var.nginxproxymanager.domain_name}"]

  forward_scheme = var.nginxproxymanager.forward_scheme
  forward_host   = var.nginxproxymanager.forward_host
  forward_port   = var.nginxproxymanager.forward_port

  caching_enabled         = var.nginxproxymanager.caching_enabled
  allow_websocket_upgrade = var.nginxproxymanager.allow_websocket_upgrade
  block_exploits          = var.nginxproxymanager.block_exploits
  advanced_config         = var.nginxproxymanager.advanced_config

  certificate_id = var.nginxproxymanager.certificate.id

  ssl_forced      = true
  hsts_enabled    = true
  hsts_subdomains = true
  http2_support   = true

  locations = var.nginxproxymanager.locations
}
