# tf-homelab-dns

tf module for configuration of proxy, pfsense dns, and cloudflare dns

Prevents repetitive web configuration, and having to set the same values in multiple places

## QuickStart

See [examples](examples/)

## proxy

Defines the proxy hostnames used by pfsense DNS records.

## pfsense

Creates an A record in the pfsense unbound dns resolver

## cloudflare

Optionally creates a CNAME record in your domain

---

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~>1.9 |
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement\_cloudflare) | >= 5, < 6 |
| <a name="requirement_pfsense"></a> [pfsense](#requirement\_pfsense) | >= 0, < 1 |

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_cloudflare"></a> [cloudflare](#provider\_cloudflare) | >= 5, < 6 |
| <a name="provider_pfsense"></a> [pfsense](#provider\_pfsense) | >= 0, < 1 |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [cloudflare_dns_record.cname](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/dns_record) | resource |
| [pfsense_dnsresolver_hostoverride.dns_entry](https://registry.terraform.io/providers/marshallford/pfsense/latest/docs/resources/dnsresolver_hostoverride) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_cloudflare"></a> [cloudflare](#input\_cloudflare) | Cloudflare CNAME configuration | <pre>object({<br/>    zone_id = string<br/>    source  = string<br/>    target  = string<br/>  })</pre> | <pre>{<br/>  "source": "",<br/>  "target": "",<br/>  "zone_id": ""<br/>}</pre> | no |
| <a name="input_proxy"></a> [proxy](#input\_proxy) | Proxy DNS names to publish. | <pre>object({<br/>    ip_address  = string<br/>    subdomains  = list(string)<br/>    domain_name = string<br/>  })</pre> | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
