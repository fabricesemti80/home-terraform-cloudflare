#------------------------------------------------------------------------------
# General Variables
#------------------------------------------------------------------------------

variable "cf_account_id" {
  description = "Cloudflare account ID"
  sensitive = true
  type        = string
}

variable "cf_zone_id" {
  description = "Cloudflare zone ID"
  type        = string
}

variable "cf_domain" {
  description = "Base domain for Cloudflare"
  type        = string
}

variable "cf_api_token" {
  description = "Cloudflare API token"
  type        = string
}

variable "tunnel_secret" {
  description = "Secret for the Cloudflare tunnel"
  type        = string
}

#------------------------------------------------------------------------------
# Tunnel Configuration Variables
#------------------------------------------------------------------------------

variable "tunnel_name" {
  description = "Name of the Cloudflare tunnel"
  type        = string
  default     = "terraformed-docker-tunnel"
}

variable "credentials_file_path" {
  description = "Path to store tunnel credentials files"
  type        = string
  default     = "~/.cloudflared"
}

#------------------------------------------------------------------------------
# Zero Trust Variables
#------------------------------------------------------------------------------

variable "tf_token_app_terraform_io" {
  description = "Token for Terraform Cloud or Enterprise"
  type        = string
}
