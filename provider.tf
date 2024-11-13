terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = ">= 4"
    }
  }

	backend "remote" {
		organization = "homelab-fsemti" # org name from step 2.
		workspaces {
			name = "homelab-fsemti" # name for your app's state.
		}
	}  
  
}
provider "cloudflare" {
  api_token = var.cf_api_token
}
