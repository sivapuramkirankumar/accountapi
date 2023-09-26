[int]$MinReplica = 0
[int]$MaxReplica = 30
$ContainerRegistry = "acrtestpoc"
$RegistryPassword = "CSvdDR/VJRki0dWgukZ4r0TKVSx/lt+AxjZE7sDM22+ACRCxxwgp"

az account set --subscriptionid "c49dd695-d270-4c17-a735-1aebee5dcfd6"

az containerapp create -n conapppocjemjjm -g Container-app-rg --image acrtestpoc.azurecr.io/studente:one --environment container-app-env --ingress external --target-port 80 --registry-server acrtestpoc.azurecr.io --registry-username $ContainerRegistry --registry-password $RegistryPassword --query properties.configuration.ingress.fqdn --cpu 0.25 --memory 0.5Gi --min-replicas $MinReplica --max-replicas $MaxReplica --scale-rule-name azure-http-rule --scale-rule-type http --scale-rule-http-concurrency 20


