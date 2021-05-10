resource "aws_route53_zone" "personal_domain" {
  name    = "ericgoedtel.com"
  comment = "Personal domain"
}

resource "aws_route53_record" "apex" {
  zone_id = aws_route53_zone.personal_domain.zone_id
  name    = "ericgoedtel.com"
  type    = "A"
  ttl     = 3600
  records = [ # GitHub Pages
    "185.199.108.153",
    "185.199.109.153",
    "185.199.110.153",
    "185.199.111.153"
  ]
}

resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.personal_domain.zone_id
  name    = "www.ericgoedtel.com"
  type    = "CNAME"
  ttl     = 3600
  records = [
    "ericgoedtel.github.io"
  ]
}
