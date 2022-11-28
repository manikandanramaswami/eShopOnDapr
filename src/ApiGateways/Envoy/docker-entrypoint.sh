#!/bin/sh
set -e

echo "Generating envoy.yaml config file..."
cat /tmpl/envoy.yaml.tmpl | envsubst \$ENVOY_CATALOG_API_ADDRESS,\$ENVOY_ORDERING_API_ADDRESS > /etc/envoy.yaml

echo "Changing permissions for /etc/envoy.yaml"
chmod 777 /etc/envoy.yaml

echo "Creating user 1111"
useradd 1111 -ms /bin/bash

echo "switching user 1111"
su 1111

echo "Starting Envoy..."
/usr/local/bin/envoy -c /etc/envoy.yaml