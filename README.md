# lab-dns-tf

tf module for configuration of nginxproxymanager, pfsense dns, and cloudflare dns

Prevents repetitive web configuration, and having to set the same values in multiple places

## nginxproxymanager

Creates proxy record with the following properties

```hcl
  allow_websocket_upgrade = true
  block_exploits          = true

  certificate_id = var.nginxproxymanager.certificate.id

  ssl_forced      = true
  hsts_enabled    = true
  hsts_subdomains = true
  http2_support   = true
```

## pfsense

Creates an A record in the pfsense unbound dns resolver

## cloudflare

Optionally creates a CNAME record in your domain

---

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~>1.9 |
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement\_cloudflare) | 5.8.2 |
| <a name="requirement_nginxproxymanager"></a> [nginxproxymanager](#requirement\_nginxproxymanager) | ~> 1.2.0 |
| <a name="requirement_pfsense"></a> [pfsense](#requirement\_pfsense) | 0.20.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_cloudflare"></a> [cloudflare](#provider\_cloudflare) | 5.8.2 |
| <a name="provider_nginxproxymanager"></a> [nginxproxymanager](#provider\_nginxproxymanager) | ~> 1.2.0 |
| <a name="provider_pfsense"></a> [pfsense](#provider\_pfsense) | 0.20.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [cloudflare_dns_record.cname](https://registry.terraform.io/providers/cloudflare/cloudflare/5.8.2/docs/resources/dns_record) | resource |
| [nginxproxymanager_proxy_host.proxy_host](https://registry.terraform.io/providers/Sander0542/nginxproxymanager/latest/docs/resources/proxy_host) | resource |
| [pfsense_dnsresolver_hostoverride.dns_entry](https://registry.terraform.io/providers/marshallford/pfsense/0.20.0/docs/resources/dnsresolver_hostoverride) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloudflare"></a> [cloudflare](#input\_cloudflare) | Cloudflare CNAME configuration | <pre>object({<br/>    zone_id = string<br/>    source  = string<br/>    target  = string<br/>  })</pre> | <pre>{<br/>  "source": "",<br/>  "target": "",<br/>  "zone_id": ""<br/>}</pre> | no |
| <a name="input_nginxproxymanager"></a> [nginxproxymanager](#input\_nginxproxymanager) | n/a | <pre>object({<br/>    certificate = object({<br/>      id = number<br/>    })<br/>    subdomains      = list(string)<br/>    domain_name     = string<br/>    forward_scheme  = optional(string, "http")<br/>    forward_host    = string<br/>    forward_port    = number<br/>    caching_enabled = optional(bool, true)<br/>  })</pre> | n/a | yes |
| <a name="input_pfsense"></a> [pfsense](#input\_pfsense) | n/a | <pre>object({<br/>    dest_addresses = list(string)<br/>  })</pre> | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
