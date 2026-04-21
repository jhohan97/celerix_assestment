
# Separate rule resource with identical configuration
resource "aws_wafv2_web_acl_rule" "block_countries" {
  name        = "block-countries" # Must match existing rule name
  priority    = 1
  web_acl_arn = aws_wafv2_web_acl.example.arn

  action {
    block {}
  }

  statement {
    geo_match_statement {
      country_codes = ["CN", "RU"]
    }
  }

  visibility_config {
    cloudwatch_metrics_enabled = false
    metric_name                = "block-countries"
    sampled_requests_enabled   = false
  }
}