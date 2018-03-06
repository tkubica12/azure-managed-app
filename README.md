# Managed app example

az ad app create --display-name managedServicesAdmin --homepage http://managedServicesAdmin --identifier-uris http://managedServicesAdmin
az ad sp create --id managedServicesAdmin

userid=$(az ad user show --upn-or-object-id managedServicesAdmin --query objectId --output tsv)

roleid=$(az role definition list --name Owner --query [].name --output tsv)
userid="afa49e36-cf61-46e1-b74f-e2fa9b5d48cd"
az managedapp definition create -g catalog \
        -n myManagedApp \
        -l westeurope \
        --display-name "Moje super appka" \
        --description "My Managed App Def description" \
        -a "$userid:$roleid" \
        --lock-level ReadOnly \
        --package-file-uri "https://raw.githubusercontent.com/tkubica12/azure-managed-app/master/app.zip"

az managedapp definition delete -g catalog -n mojeTestAppka