# Add this at the top of the file
resource "random_password" "tunnel_secret" {
  length  = 32
  special = false
  upper   = true
  lower   = true
  numeric = true
}

resource "cloudflare_zero_trust_tunnel_cloudflared" "tunnel" {
  account_id    = var.cf_account_id
  name          = "terraformed-docker-tunnel"
  tunnel_secret = random_password.tunnel_secret.result
}

output "tunnel_id" {
  description = "ID of the Cloudflare Tunnel"
  value       = cloudflare_zero_trust_tunnel_cloudflared.tunnel.id
}

output "tunnel_name" {
  description = "Name of the Cloudflare Tunnel"
  value       = cloudflare_zero_trust_tunnel_cloudflared.tunnel.name
}



resource "local_file" "tunnel_credentials" {
  count = terraform.workspace == "default" ? 1 : 0 #! Add a condition to only create them when running locally using the terraform.workspace check
  content = jsonencode({
    AccountTag   = var.cf_account_id
    TunnelID     = cloudflare_zero_trust_tunnel_cloudflared.tunnel.id
    TunnelName   = cloudflare_zero_trust_tunnel_cloudflared.tunnel.name
    TunnelSecret = random_password.tunnel_secret.result
  })
  filename = pathexpand("~/.cloudflared/${cloudflare_zero_trust_tunnel_cloudflared.tunnel.id}.json")
}




resource "local_file" "tunnel_config" {
  count = terraform.workspace == "default" ? 1 : 0 #! Add a condition to only create them when running locally using the terraform.workspace check
  content = yamlencode({
    tunnel           = cloudflare_zero_trust_tunnel_cloudflared.tunnel.id
    credentials-file = "~/.cloudflared/${cloudflare_zero_trust_tunnel_cloudflared.tunnel.id}.json"
  })
  filename = pathexpand("~/.cloudflared/config.yaml")
}

# output "tunnel_token" {
#   description = "Tunnel token for cloudflared"
#   sensitive   cloudflare_zero_trust_tunnel_cloudflared.tunnel.tunnel_token= true
#   value       = 
# }
