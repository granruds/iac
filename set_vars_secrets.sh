KV="kv-iac-kristiang"
NAME="oving_7_kristiang"
ENV="prod"

RG="rg-${NAME}-${ENV}"          # blir rg-oving_7_kristiang-prod
LOCATION="westeurope"          # normalisert fra "West Europe"
STORAGE_ACCOUNT="sakristiang"
APP_NAME="test"                    # sett hvis du har et faktisk app service navn

# Sett secrets
az keyvault secret set --vault-name "$KV" --name terraform-resource-group-name --value "$RG"
az keyvault secret set --vault-name "$KV" --name terraform-location --value "$LOCATION"
az keyvault secret set --vault-name "$KV" --name terraform-app-service-name --value "$APP_NAME"
# valgfritt: lagre storage account i KV hvis du vil
az keyvault secret set --vault-name "$KV" --name terraform-storage-account-name --value "$STORAGE_ACCOUNT"

