$RESOURCE_GROUP="devqaprodappnv-rg"
$LOCATION ="eastus"
$VNET_NAME="devqaappenv-vnet"
$Subnet_Name="devqaappenv-subnet"
$CONTAINERAPPS_ENVIRONMENT= "vamdevenv"
$workloadprofilename= "myprofile"
$Environmenttype= "Workload Profile"
az group create --name $RESOURCE_GROUP --location $LOCATION
az network vnet create --resource-group $RESOURCE_GROUP --name $VNET_NAME --location $LOCATION --address-prefix 125.11.0.0/16
az network vnet subnet create --resource-group $RESOURCE_GROUP --vnet-name $VNET_NAME --name $Subnet_Name --address-prefixes 125.11.0.0/27
az network vnet subnet update --resource-group $RESOURCE_GROUP --name $Subnet_Name --vnet-name $VNET_NAME --delegations Microsoft.App/environments
$subneid = az network vnet subnet list --resource-group $RESOURCE_GROUP --vnet-name $VNET_NAME --query "[?name=='$Subnet_Name'].id"
echo $subneid[1]
$subneid2=  $(az network vnet subnet list --resource-group $RESOURCE_GROUP --vnet-name $VNET_NAME --query "[?name=='$Subnet_Name'].id" --output tsv)
echo $subneid2
az account set --subscription "Visual Studio Professional Subscription"

az containerapp env create --name $CONTAINERAPPS_ENVIRONMENT --resource-group $RESOURCE_GROUP --location "$LOCATION" --enable-workload-profiles --infrastructure-subnet-resource-id $subneid2
az containerapp env workload-profile add -g $RESOURCE_GROUP -n $CONTAINERAPPS_ENVIRONMENT --workload-profile-name $workloadprofilename --workload-profile-type D4 --min-nodes 1 --max-nodes 2

