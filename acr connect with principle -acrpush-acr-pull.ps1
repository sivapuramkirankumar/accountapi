$ACR_NAME= "acrtestpoc"
$SERVICE_PRINCIPAL_NAME="14720a30-1fe7-48a9-8879-6c92c65a8298"
$ACR_REGISTRY_ID=$(az acr show --name $ACR_NAME --query "id" --output tsv)
$ACRPULLPASSWORD=$(az ad sp create-for-rbac --name $SERVICE_PRINCIPAL_NAME --scopes $ACR_REGISTRY_ID --role acrpull --query "password" --output tsv)
$ACRPULLUSER_NAME=$(az ad sp list --display-name $SERVICE_PRINCIPAL_NAME --query "[].appId" --output tsv)

# Output the service principal's credentials; use these in your services and
# applications to authenticate to the container registry.
echo "ACRPULL Service principal ID: $ACRPULLUSER_NAME"
echo "ACRPULL Service principal password: $ACRPULLPASSWORD"
$ACRPUSHPASSWORD=$(az ad sp create-for-rbac --name $SERVICE_PRINCIPAL_NAME --scopes $ACR_REGISTRY_ID --role acrpush --query "password" --output tsv)
$ACRPUSHUSER_NAME=$(az ad sp list --display-name $SERVICE_PRINCIPAL_NAME --query "[].appId" --output tsv)

# Output the service principal's credentials; use these in your services and
# applications to authenticate to the container registry.
echo "ACRPUSH Service principal ID: $ACRPUSHUSER_NAME"
echo "ACRPUSH Service principal password: $ACRPUSHPASSWORD"