terraform {
  required_version = "~>1.12"
  required_providers {
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
