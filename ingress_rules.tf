# Add DNS records for each domain specified in locals
resource "cloudflare_dns_record" "dns_records" {
  for_each = { for domain in local.domains : domain.name => domain }
  zone_id  = var.cf_zone_id
  name     = each.value.name
  content  = "${cloudflare_zero_trust_tunnel_cloudflared.tunnel.id}.cfargotunnel.com"
  type     = "CNAME"
  proxied  = true
  ttl      = 1 # Auto-managed when proxied is true
  comment  = "Managed by Terraform"
}
# Configure tunnel ingress rules dynamically based on locals
resource "cloudflare_zero_trust_tunnel_cloudflared_config" "tunnel_config" {
  account_id = var.cf_account_id
  tunnel_id  = cloudflare_zero_trust_tunnel_cloudflared.tunnel.id

  config = {
    ingress = concat(
      [
        for domain in local.domains : {
          hostname = domain.hostname
          service  = "${domain.protocol}://${domain.host}:${domain.port}"
        }
      ],
      [
        {
          service = "http_status:404"
        }
      ]
    )
  }
}
