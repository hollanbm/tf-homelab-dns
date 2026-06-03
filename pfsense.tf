resource "pfsense_dnsresolver_hostoverride" "dns_entry" {
  for_each = toset(var.proxy.subdomains)

  host         = each.key
  domain       = var.proxy.domain_name
  ip_addresses = [var.proxy.ip_address]
}
