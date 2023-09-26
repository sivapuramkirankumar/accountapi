$CONTAINERAPPS_ENVIRONMENT= "tesappone"
$RESOURCE_GROUP= "Container-app-rg"
$LOCATION= "East US"
$workloadprofilename= "myprofile"
$Environmenttype= "Workload Profile"

az account set --subscription "Visual Studio Professional Subscription"
az containerapp env create --name $CONTAINERAPPS_ENVIRONMENT --resource-group $RESOURCE_GROUP --location "$LOCATION" --enable-workload-profiles

az containerapp env workload-profile add -g $RESOURCE_GROUP -n $CONTAINERAPPS_ENVIRONMENT --workload-profile-name $workloadprofilename --workload-profile-type D4 --min-nodes 1 --max-nodes 2