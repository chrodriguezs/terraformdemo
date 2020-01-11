resource "aws_db_subnet_group" "mariadb-subnet" {
  name        = "mariadb-subnet"
  description = "RDS subnet group"
  subnet_ids  = [aws_subnet.main-private-1.id, aws_subnet.main-private-2.id]
}

resource "aws_db_parameter_group" "mariadb-parameters" {
  name        = "mariadb-params"
  family      = "mariadb10.1"
  description = "MariaDB parameter group"

  parameter {
    name  = "max_allowed_packet"
    value = "16777216"
  }
}

resource "aws_db_instance" "mariadb" {
  allocated_storage         = 5 # 100 GB of storage, gives us more IOPS than a lower number
  engine                    = "mariadb"
  engine_version            = "10.1.14"
  instance_class            = "db.t2.micro" # use micro if you want to use the free tier
  identifier                = "mariadb"
  name                      = var.RDS_DBName     # database name
  username                  = var.RDS_USRName           # username
  password                  = var.RDS_Password # password
  db_subnet_group_name      = aws_db_subnet_group.mariadb-subnet.name
  parameter_group_name      = aws_db_parameter_group.mariadb-parameters.name
  multi_az                  = "false" # set to true to have high availability: 2 instances synchronized with each other
  vpc_security_group_ids    = [aws_security_group.allow-mariadb.id]
  storage_type              = "gp2"
  backup_retention_period   = 30                                          # how long you’re going to keep your backups
  availability_zone         = aws_subnet.main-private-1.availability_zone # prefered AZ
  final_snapshot_identifier = "mariadb-final-snapshot"                    # final snapshot when executing terraform destroy
  tags = {
    Name = "mariadb-instance",
    Project = "DEMO_Ene20"
  }
}

output "mariadb_endpoint" {
    value = aws_db_instance.mariadb.endpoint
}

output "mariadb_port" {
    value = aws_db_instance.mariadb.port
}