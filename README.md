# Cluster setup for demo app

## Creting the kubernetes cluster

cd terraform

terraform apply

## Installing MySQL Database


kubectl apply -f create_mysql.yaml -n demoapp

mysql --user=root --password

@setup_mysql.sql
