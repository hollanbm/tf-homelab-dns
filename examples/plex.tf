locals {
  nginxproxymanager_address = ["10.254.1.50"]
  domain_name               = "domain.tld"
  domain_tld_zone_id        = "your_cloudflare_zone_id_here"
}

data "nginxproxymanager_certificate" "domain_tld" {
  id = 1
}

module "plex" {
  source = "github.com/hollanbm/tf-homelab-dns?ref=v1.0.3"

  nginxproxymanager = {
    certificate = data.nginxproxymanager_certificate.domain_tld

    forward_scheme = "https"
    forward_host   = "plex"
    forward_port   = 32400

    subdomains  = ["plex"]
    domain_name = local.domain_name
  }

  pfsense = {
    dest_addresses = local.nginxproxymanager_address
  }

  # This is optional, remove if not using Cloudflare for DNS
  cloudflare = {
    zone_id : local.domain_tld_zone_id
    source : "plex.${local.domain_name}"
    target : local.domain_name
  }
}
