resource "pfsense_dnsresolver_hostoverride" "dns_entry" {
  for_each = var.nginxproxymanager.subdomains

  host         = each.key
  domain       = var.nginxproxymanager.domain_name
  ip_addresses = var.pfsense.dest_addresses
}
