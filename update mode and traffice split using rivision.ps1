az containerapp revision set-mode --name conapppocjhijjm --resource-group Container-app-rg --mode multiple
az containerapp update --name conapppocjhijjm --resource-group Container-app-rg --image acrtestpoc.azurecr.io/policyapi:6296055397		
		
az containerapp ingress traffic set --name conapppocjhijjm --resource-group Container-app-rg --revision-weight conapppocjhijjm--asr5twe=55 conapppocjhijjm--zl033hl=45