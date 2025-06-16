#!/bin/bash
set -euo pipefail

mkdir -p ./app

wget https://dl.google.com/cloudsql/cloud_sql_proxy.linux.amd64 -O ./app/cloud_sql_proxy
chmod +x ./app/cloud_sql_proxy
./app/cloud_sql_proxy -ip_address_types=PRIVATE -instances=${db_instance_name}=tcp:0.0.0.0:5432