$RESOURCE_GROUP="devqaappnv-rg"
$LOCATION ="eastus"
$VNET_NAME="devqaappenv-vnet"
$Subnet_Name="devqaappenv-subnet"
$CONTAINERAPPS_ENVIRONMENT= "tesappone"
$workloadprofilename= "myprofile"
$Environmenttype= "Workload Profile"
az group create --name $RESOURCE_GROUP --location $LOCATION
az network vnet create --resource-group $RESOURCE_GROUP --name $VNET_NAME --location $LOCATION --address-prefix 10.0.0.0/16
az network vnet subnet create --resource-group $RESOURCE_GROUP --vnet-name $VNET_NAME --name $Subnet_Name --address-prefixes 10.0.0.0/21
$subneid = az network vnet subnet list --resource-group $RESOURCE_GROUP --vnet-name $VNET_NAME --query "[?name=='$Subnet_Name'].id"
echo $subneid

az account set --subscription "Visual Studio Professional Subscription"
az containerapp env create --name $CONTAINERAPPS_ENVIRONMENT --resource-group $RESOURCE_GROUP --location "$LOCATION" --enable-workload-profiles --infrastructure-subnet-resource-id $subneid
