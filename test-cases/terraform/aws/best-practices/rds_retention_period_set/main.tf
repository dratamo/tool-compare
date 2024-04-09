resource "aws_rds_cluster" "default" {
  # Drata: Specify [aws_rds_cluster.backup_retention_period] to ensure sensitive data is only available when necessary. Setting backup retention to 0 will disable automatic backups
  cluster_identifier      = "aurora-cluster-demo"
  engine                  = "aurora-mysql"
  engine_version          = "5.7.mysql_aurora.2.03.2"
  availability_zones      = ["us-west-2a", "us-west-2b", "us-west-2c"]
  database_name           = "mydb"
  master_username         = "foo"
  master_password         = "bar"
  preferred_backup_window = "07:00-09:00"
}
