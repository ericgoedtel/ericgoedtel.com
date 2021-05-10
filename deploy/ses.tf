resource "aws_ses_domain_identity" "personal_domain" {
  domain = "ericgoedtel.com"
}

resource "aws_route53_record" "ses_txt" {
  zone_id = aws_route53_zone.personal_domain.id
  name    = "_amazonses.ericgoedtel.com"
  type    = "TXT"
  ttl     = 3600
  records = [aws_ses_domain_identity.personal_domain.verification_token]
}

resource "aws_ses_domain_dkim" "personal_domain" {
  domain = "ericgoedtel.com"
}

resource "aws_route53_record" "ses_dkim" {
  count   = 3
  zone_id = aws_route53_zone.personal_domain.id
  name    = "${element(aws_ses_domain_dkim.personal_domain.dkim_tokens, count.index)}._domainkey"
  type    = "CNAME"
  ttl     = 3600
  records = ["${element(aws_ses_domain_dkim.personal_domain.dkim_tokens, count.index)}.dkim.amazonses.com"]
}
