terraform {
  required_version = "~>1.9"
  required_providers {
    nginxproxymanager = {
      source  = "Sander0542/nginxproxymanager"
      version = ">= 1, < 2"
    }
    pfsense = {
      source  = "marshallford/pfsense"
      version = ">= 0, < 1"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = ">= 5, < 6"
    }
  }
}
