#!/bin/sh
set -e
echo "Trying to set /etc permissions"
sudo chmod 777 /etc

echo "Generating envoy.yaml config file..."
sudo cat /tmpl/envoy.yaml.tmpl | envsubst \$ENVOY_CATALOG_API_ADDRESS,\$ENVOY_ORDERING_API_ADDRESS > /etc/envoy.yaml

echo "Starting Envoy..."
/usr/local/bin/envoy -c /etc/envoy.yaml