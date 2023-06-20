#!/bin/bash
service_name="$1"
shift
echo "Installing solargraph LSP in application container..."
docker-compose exec "$service_name" gem install solargraph
docker-compose exec "$service_name" solargraph download-core
docker-compose exec "$service_name" solargraph bundle
docker-compose exec "$service_name" yard gems
echo "Finished installing solargraph LSP in application container..."
