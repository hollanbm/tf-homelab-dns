variable "proxy" {
  description = "Proxy DNS names to publish."
  type = object({
    ip_address  = string
    subdomains  = list(string)
    domain_name = string
  })
}

variable "cloudflare" {
  description = "Cloudflare CNAME configuration"
  type = object({
    zone_id = string
    source  = string
    target  = string
  })
  default = {
    zone_id = ""
    source  = ""
    target  = ""
  }
}
