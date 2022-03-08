output "health_data__bucket" {
    value = aws_s3_bucket.health_data
}

output "kms_key_arn" {
    value = aws_kms_key.kms_s3_key.arn
}

output "kms_key_id" {
    value = aws_kms_key.kms_s3_key.key_id
}

output "kms_key_alias_arn" {
    value = aws_kms_alias.kms_key_alias.arn
}

output "kms_key_alias_name" {
    value = aws_kms_alias.kms_key_alias.name
}