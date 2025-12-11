#!/bin/bash

echo "==============================="
echo " SAMLER INFO FOR GITHUB WORKFLOW"
echo "==============================="
echo

###
# 1 — Azure konto-info
###
echo "=== AZURE ACCOUNT INFO ==="
az account show --output json
echo


###
# 2 — Service Principal (OIDC)
###
read -p "Skriv inn AZURE_CLIENT_ID (appId til service principal): " APPID
echo "=== SERVICE PRINCIPAL INFO ==="
az ad sp show --id $APPID --output json
echo


###
# 3 — Terraform backend: Storage Account + Container
###
read -p "Skriv inn navnet på Resource Group for Terraform backend: " RG
read -p "Skriv inn navnet på Storage Account: " SA
read -p "Skriv inn navnet på Container for Terraform state (f.eks. tfstate): " CONT

echo "=== STORAGE ACCOUNT INFO ==="
az storage account show --name $SA --resource-group $RG --output json
echo

echo "=== STORAGE CONTAINER INFO ==="
az storage container show --account-name $SA --name $CONT --output json
echo


###
# 4 — Key Vault (valgfritt, men anbefalt)
###
read -p "Bruker du Key Vault? (ja/nei): " USE_KV

if [[ "$USE_KV" == "ja" ]]; then
    read -p "Skriv inn Key Vault-navn: " KV
    echo "=== KEY VAULT INFO ==="
    az keyvault show --name $KV --output json
    echo
else
    echo "Hopper over Key Vault-info."
fi


###
# 5 — GitHub repo-info
###
echo "=== GITHUB REPO INFO ==="
gh repo view --json name,owner,defaultBranch,visibility,url
echo


echo "==============================="
echo " FERDIG! Kopier output-en og lim den inn til ChatGPT."
echo "==============================="

