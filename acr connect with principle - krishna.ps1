$ACR_NAME= "acraddtstst"
$SERVICE_PRINCIPAL_NAME="d05bbdd7-a4f6-4d31-987c-682bb0ac5ca0"
$ACR_REGISTRY_ID=$(az acr show --name $ACR_NAME --query "id" --output tsv)
$ACRPULLPASSWORD=$(az ad sp create-for-rbac --name $SERVICE_PRINCIPAL_NAME --scopes $ACR_REGISTRY_ID --role acrpull --query "password" --output tsv)
$ACRPULLUSER_NAME=$(az ad sp list --display-name $SERVICE_PRINCIPAL_NAME --query "[].appId" --output tsv)

# Output the service principal's credentials; use these in your services and
# applications to authenticate to the container registry.
echo "ACRPULL_Service principal ID: $ACRPULLUSER_NAME"
echo "ACRPULL_Service principal password: $ACRPULLPASSWORD"

$ACRPUSHPASSWORD=$(az ad sp create-for-rbac --name $SERVICE_PRINCIPAL_NAME --scopes $ACR_REGISTRY_ID --role acrpuSH --query "password" --output tsv)
$ACRPUSHUSER_NAME=$(az ad sp list --display-name $SERVICE_PRINCIPAL_NAME --query "[].appId" --output tsv)

# Output the service principal's credentials; use these in your services and
# applications to authenticate to the container registry.
echo "ACRPUSH_Service principal ID: $ACRPUSHUSER_NAME"
echo "ACRPUSH_Service principal password: $ACRPUSHPASSWORD"