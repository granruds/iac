#!/usr/bin/env bash
set -euo pipefail

# ----- KONFIGURASJON (endre hvis nødvendig) -----
SUBSCRIPTION_ID="7a3c6854-0fe1-42eb-b5b9-800af1e53d70"
RG="rg-oving_7_kristiang-prod"
SA="sakristiang"
KV="kv-iac-kristiang"
SP_OBJECT_ID="9a600e67-8f10-4f71-a20b-397ea402c013"

# ----- SCOPE -----
STORAGE_SCOPE="/subscriptions/${SUBSCRIPTION_ID}/resourceGroups/${RG}/providers/Microsoft.Storage/storageAccounts/${SA}"
KV_SCOPE="/subscriptions/${SUBSCRIPTION_ID}/resourceGroups/${RG}/providers/Microsoft.KeyVault/vaults/${KV}"

echo "Subscription: ${SUBSCRIPTION_ID}"
echo "Resource group: ${RG}"
echo "Storage account: ${SA}"
echo "Key Vault: ${KV}"
echo "Service principal objectId: ${SP_OBJECT_ID}"
echo

# Sjekk at variablene ikke er tomme
for v in SUBSCRIPTION_ID RG SA KV SP_OBJECT_ID; do
  val="${!v}"
  if [[ -z "$val" ]]; then
    echo "Feil: variabel $v er tom. Sett riktig verdi i toppen av scriptet." >&2
    exit 2
  fi
done

# Gi SP tilgang til å lese/skriv blob (Terraform state)
echo "Oppretter role assignment: Storage Blob Data Contributor på $STORAGE_SCOPE ..."
az role assignment create \
  --assignee "$SP_OBJECT_ID" \
  --role "Storage Blob Data Contributor" \
  --scope "$STORAGE_SCOPE"

# Gi SP tilgang til å lese Key Vault secrets (RBAC)
echo "Oppretter role assignment: Key Vault Secrets User på $KV_SCOPE ..."
az role assignment create \
  --assignee "$SP_OBJECT_ID" \
  --role "Key Vault Secrets User" \
  --scope "$KV_SCOPE"

echo "Ferdig. Sjekk med 'az role assignment list' hvis du vil verifisere."
