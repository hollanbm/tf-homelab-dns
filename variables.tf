variable "nginxproxymanager" {
  type = object({
    certificate = object({
      id = number
    })
    subdomains      = list(string)
    domain_name     = string
    forward_scheme  = optional(string, "http")
    forward_host    = string
    forward_port    = number
    caching_enabled = optional(bool, true)

    advanced_config = optional(string, "")

    locations = optional(
      list(
        object(
          {
            path            = string
            forward_scheme  = string
            forward_host    = string
            forward_port    = number
            advanced_config = optional(string, "")
          }
        )
      ),
      []
    )
  })
}

variable "pfsense" {
  type = object({
    dest_addresses = list(string)
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
