terraform {
  required_version = "~>1.9"
  required_providers {
    nginxproxymanager = {
      source  = "Sander0542/nginxproxymanager"
      version = "~> 1.2.0"
    }
    pfsense = {
      source  = "marshallford/pfsense"
      version = "0.20.0"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "5.8.2"
    }
  }
}
