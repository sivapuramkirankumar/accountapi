$ACR_NAME= "acrtestpoc"
$SERVICE_PRINCIPAL_NAME="14720a30-1fe7-48a9-8879-6c92c65a8298"
$ACR_REGISTRY_ID=$(az acr show --name $ACR_NAME --query "id" --output tsv)
$PASSWORD=$(az ad sp create-for-rbac --name $SERVICE_PRINCIPAL_NAME --scopes $ACR_REGISTRY_ID --role acrpull --query "password" --output tsv)
$USER_NAME=$(az ad sp list --display-name $SERVICE_PRINCIPAL_NAME --query "[].appId" --output tsv)

# Output the service principal's credentials; use these in your services and
# applications to authenticate to the container registry.
echo "Service principal ID: $USER_NAME"
echo "Service principal password: $PASSWORD"