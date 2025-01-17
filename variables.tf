

variable "cf_api_token" {
  default   = ""
  type      = string
  sensitive = true
}

variable "cf_zone_id" {
  default = ""
  type    = string
}

variable "cf_account_id" {
  default   = ""
  type      = string
  sensitive = true
}

variable "cf_domain" {
  default = ""
  type    = string
}

variable "tunnel_id_docker" {
  default = ""
  type    = string

}
# variable "tunnel_secret" {
#   default   = ""
#   type      = string
#   sensitive = true

# }

