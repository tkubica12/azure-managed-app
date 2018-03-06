#!/bin/bash
rm app.zip
zip app.zip createUiDefinition.json mainTemplate.json
git add -A
git commit -m auto
git push
roleid=$(az role definition list --name Owner --query [].name --output tsv)
userid="afa49e36-cf61-46e1-b74f-e2fa9b5d48cd"
az managedapp definition delete -g catalog -n mojeTestAppka
az managedapp definition create -g catalog \
        -n myManagedApp \
        -l westeurope \
        --display-name "My Managed App" \
        --description "This is demo of application managed by central IT team" \
        -a "$userid:$roleid" \
        --lock-level ReadOnly \
        --package-file-uri "https://raw.githubusercontent.com/tkubica12/azure-managed-app/master/app.zip"
