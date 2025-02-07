resource "cloudflare_dns_record" "example_dns_record" {
  zone_id = var.fabricesemti_dev_zone_id
  comment = "Domain verification record"
  content = "1.2.3.4"
  name    = "example.fabricesemti.dev"
  proxied = true
  ttl     = 1
  type    = "A"
}
