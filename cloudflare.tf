resource "cloudflare_dns_record" "cname" {
  count = var.cloudflare.target != "" ? 1 : 0

  zone_id = var.cloudflare.zone_id
  name    = var.cloudflare.source
  ttl     = 1
  type    = "CNAME"
  content = var.cloudflare.target
  proxied = false
}
