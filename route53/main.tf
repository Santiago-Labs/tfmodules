data "aws_route53_zone" "zone" {
  name = var.top_level_domain
}

resource "aws_route53_record" "main_subdomain" {
  zone_id = data.aws_route53_zone.zone.zone_id
  type    = "A"
  ttl     = 300
  records = [var.github_enterprise_ip]

  name = "${var.sub_domain}.${var.top_level_domain}"
}

resource "aws_route53_record" "wild_card_subdomain" {
  zone_id = data.aws_route53_zone.zone.zone_id
  type    = "A"
  ttl     = 300
  records = [var.github_enterprise_ip]

  name = "*.${var.sub_domain}.${var.top_level_domain}"
}

resource "aws_route53_record" "mx" {
  zone_id = data.aws_route53_zone.zone.zone_id
  type    = "MX"
  ttl     = 300
  records = [var.github_enterprise_ip]

  name = "reply.${var.sub_domain}.${var.top_level_domain}"
}
