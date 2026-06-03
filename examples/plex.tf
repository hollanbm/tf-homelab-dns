locals {
  proxy_address      = "10.254.1.50"
  domain_name        = "domain.tld"
  domain_tld_zone_id = "your_cloudflare_zone_id_here"
}

module "plex" {
  source = "../"

  proxy = {
    ip_address  = local.proxy_address
    subdomains  = ["plex"]
    domain_name = local.domain_name
  }

  # This is optional, remove if not using Cloudflare for DNS
  cloudflare = {
    zone_id : local.domain_tld_zone_id
    source : "plex.${local.domain_name}"
    target : local.domain_name
  }
}
