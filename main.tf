## membuat aws rds instance dengan terraform

terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "4.49.0"
        }
    }
}

# mendefinisikan provider setting
provider "aws" {
    access_key = "<secret_key>"						# rubah <access_key> dengan aws api access_key milik anda
    secret_key = "<secret_key>"						# rubah <secret_key> dengan aws api secret_key milik anda
    region     = "us-east-1"						# rubah region dengan region yang anda inginkan
}


# rubah region dengan region yang anda inginkan
resource "aws_db_instance" "aws-rds" {
    identifier                  = "tf-dbrds"		# nama aws rds instance
    engine                      = "mariadb"			# database engine
    engine_version              = "10.6.10"			# database version
    username                    = "<db_user>"       # rubah dengan database user yang ingin anda buat
    password                    = "<db_password>"   # rubah dengan password database untuk user yang anda buat diatas
    port                        = "3306"			# database port
    instance_class              = "db.t2.micro"		# aws rds type instance
    allocated_storage           = 20				# ukuran storage aws rds
    storage_type                = "gp2"				# storage type Salah satu dari 'standar' (magnetik), 'gp2' (SSD tujuan umum), atau 'io1' (SSD IOPS yang disediakan)
    skip_final_snapshot         = true				# Jika true (default), snapshot tidak akan dibuat sebelum menghapus DB
    publicly_accessible         = true				# Menentukan apakah database dapat tersedia untuk umum (TIDAK disarankan)
    db_subnet_group_name        = "default-vpc-<db_subnet_group_name>"		# rubah default-vpc-<db_subnet_group_name> dengan db subnet group yang telah dibuat sebelumnya
    vpc_security_group_ids      = ["sg-<security_group_id>"]				# rubah sg-<security_group_id> dengan security group yang telah dibuat sebelumnya
    tags = {
        Name	= "tf-dbrds"
    }
}

