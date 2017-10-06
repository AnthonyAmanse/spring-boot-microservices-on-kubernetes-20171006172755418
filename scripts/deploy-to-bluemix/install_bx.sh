#!/bin/bash -e

echo "Installing Bluemix CLI"
curl -L http://public.dhe.ibm.com/cloud/bluemix/cli/bluemix-cli/latest/Bluemix_CLI_amd64.tar.gz > Bluemix_CLI.tar.gz
tar -xvf Bluemix_CLI.tar.gz
sudo ./Bluemix_CLI/install_bluemix_cli

echo "Installing Bluemix container-service plugin"
bx plugin install container-service -r Bluemix

echo "Installing kubectl"
curl -LO https://storage.googleapis.com/kubernetes-release/release/"$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)"/bin/linux/amd64/kubectl
chmod 0755 kubectl
sudo mv kubectl /usr/local/bin


if [ -n "$DEBUG" ]; then
  bx --version
  bx plugin list
fi
