# GitHub Actions OIDC Wizard

Azure subscription: 7a3c6854-0fe1-42eb-b5b9-800af1e53d70
Azure tenant: 6980af2f-acfc-4513-ac50-552bcfdb01a0
Azure bruker: kristian.p.granrud@tisipfagskole.no
GitHub bruker: sone12

Steg utført:
- App Registration
- Federated Credential
- Key Vault
- Repo-variabler
- Environment
- Branch protection
- Workflow YAML

## Kjørte kommandoer (for manuell gjentakelse)

```sh
az account show --output json
gh api user
az ad app create --display-name github-oidc-app --enable-id-token-issuance true --query appId -o tsv
az ad app credential reset --id eb6875ba-1c2e-4eb2-a87a-d2bfe9bd25f2 --display-name github-oidc-secret --years 1 --query password -o tsv
az ad app federated-credential create --id eb6875ba-1c2e-4eb2-a87a-d2bfe9bd25f2 --parameters {"name": "github-actions-oidc", "issuer": "https://token.actions.githubusercontent.com", "subject": "repo:granruds/iac:environment:prod", "description": "GitHub Actions OIDC", "audiences": ["api://AzureADTokenExchange"]}
az keyvault create --name kv-iac-kristiang --resource-group rg-oving_7_kristiang-prod --location westeurope
az role assignment create --role Key Vault Secrets Officer --assignee 402dd8b4-d1d8-4d84-b951-5bce084448e1 --scope /subscriptions/7a3c6854-0fe1-42eb-b5b9-800af1e53d70/resourceGroups/rg-oving_7_kristiang-prod/providers/Microsoft.KeyVault/vaults/kv-iac-kristiang
az keyvault secret set --vault-name kv-iac-kristiang --name azure-client-secret --value [REDACTED]
az keyvault secret set --vault-name kv-iac-kristiang --name prod-env --value abc
gh api repos/granruds/iac/environments --method POST --field name=main
gh api repos/granruds/iac/branches/main/protection --method PUT --field required_status_checks=null --field enforce_admins=true --field required_pull_request_reviews=null --field restrictions=null
```
