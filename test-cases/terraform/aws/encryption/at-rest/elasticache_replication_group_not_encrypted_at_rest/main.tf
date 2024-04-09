resource "aws_elasticache_replication_group" "example" {
  # Drata: Specify [aws_elasticache_replication_group.snapshot_retention_limit] to ensure sensitive data is only available when necessary. Setting snapshot retention to 0 will disable automatic backups
  automatic_failover_enabled    = true
  availability_zones            = ["us-west-2a", "us-west-2b"]
  replication_group_id          = "tf-rep-group-1"
  replication_group_description = "test description"
  node_type                     = "cache.m4.large"
  number_cache_clusters         = 2
  parameter_group_name          = "default.redis3.2"
  port                          = 6379
}
