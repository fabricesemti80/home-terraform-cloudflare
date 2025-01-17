terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "5.0.0-rc1"
    }
  }

  backend "remote" {
    organization = "homelab-fsemti"
    workspaces {
      name = "homelab-fsemti"
    }
  }  
}

# backend "remote" {
# 	organization = "homelab-fsemti" # org name from step 2.
# 	workspaces {
# 		name = "homelab-fsemti" # name for your app's state.
# 	}
# }  


provider "cloudflare" {
  api_token = var.cf_api_token
}
