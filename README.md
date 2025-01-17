#

## Update - 30/10/2024

- Moved state to [Terraform Cloud back end](https://app.terraform.io/app/homelab-fsemti/workspaces/homelab-fsemti)
- note: variables added as env vars on the workspace with `TF_VAR_` prefix

## Getting Cloudflare tunnel details

- `cloudflared login` - log in to cloudflared
- `cat ~/.cloudflared/ <file name>` - check the files, if there is one for the tunnel in question (use `cloudflared tunnel list` to view exiting tunels)