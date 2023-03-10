## Provision AWS RDS instance using Terraform

### Steps to provision aws rds instance with terraform :

- Clone repository
```
git clone https://github.com/rizkypanz16/terraform-aws-rds-instance.git
```
- Change the configuration below with the aws configuration you have made 
```
<access_key>
<secret_key>
<db-user>
<db-password>
default-vpc-<db_subnet_group_name>
sg-<security_group_id>
```
- Init - Initialized terraform provider
```
terraform init
```
- Plan - Preview changes before applying.
```
terraform plan
```
- Apply - Provision reproducible infrastructure.
```
terraform apply
```
