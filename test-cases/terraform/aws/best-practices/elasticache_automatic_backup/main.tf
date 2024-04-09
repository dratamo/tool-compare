resource "aws_elasticache_cluster" "default" {
  # Drata: Specify [aws_elasticache_cluster.snapshot_retention_limit] to ensure sensitive data is only available when necessary. Setting snapshot retention to 0 will disable automatic backups
  cluster_id           = "cluster"
  engine               = "redis"
  node_type            = "cache.m5.large"
  num_cache_nodes      = 1
  parameter_group_name = "default.redis6.x"
}

resource "aws_elasticache_cluster" "disabled" {
  # Drata: Default network security groups allow broader access than required. Specify [aws_elasticache_cluster.security_group_ids] to configure more granular access control
  cluster_id           = "cluster"
  engine               = "redis"
  node_type            = "cache.m5.large"
  num_cache_nodes      = 1
  parameter_group_name = "default.redis6.x"

  snapshot_retention_limit = 0
  # Drata: Specify [aws_elasticache_cluster.snapshot_retention_limit] to ensure sensitive data is only available when necessary. Setting snapshot retention to 0 will disable automatic backups
}
