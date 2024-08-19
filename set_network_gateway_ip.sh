#!/bin/bash

# Retrieve the network name
NETWORK_NAME=$(docker network ls --filter driver=bridge --format "{{.Name}}" | grep 'wordpress-network' | head -n 1)

# Output the network name for debugging
echo "Network Name is: $NETWORK_NAME"

# Check if NETWORK_NAME is set
if [ -z "$NETWORK_NAME" ]; then
  echo "Network not found!"
  exit 1
fi

# Fetch the Gateway IP using Docker network inspect
GATEWAY_IP=$(docker network inspect "$NETWORK_NAME" --format '{{range .IPAM.Config}}{{.Gateway}}{{end}}')

# Check if the gateway IP was found
if [ -z "$GATEWAY_IP" ]; then
  echo "Error: Could not retrieve gateway IP for network $NETWORK_NAME."
  exit 1
fi

# Output the Gateway IP for debugging
echo "Gateway IP is: $GATEWAY_IP"

# Update the acceptance suite configuration file
if [ -f "./tests/Acceptance.suite.yml" ]; then
  sed -i "s/{{GATEWAY_IP}}/$GATEWAY_IP/g" ./tests/Acceptance.suite.yml
  echo "Updated Acceptance.suite.yml with GATEWAY_IP: $GATEWAY_IP"
else
  echo "Acceptance.suite.yml not found!"
fi

