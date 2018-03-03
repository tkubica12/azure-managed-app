# Managed app example

export userid="57cb5bd3-1a09-462f-8d3a-6c3ba52befac"
export roleid="/subscriptions/a0f4a733-4fce-4d49-b8a8-d30541fc1b45/providers/Microsoft.Authorization/roleDefinitions/8e3af657-a8ff-443c-a75c-2fe8c4bcb635"
az managedapp definition create -g catalog \
        -n mojeTestAppka \
        -l westeurope \
        --display-name "MyManMoje super appka" \
        --description "My Managed App Def description" \
        -a "$userid:$roleid" \
        --lock-level None \
        --package-file-uri "https://github.com/tkubica12/azure-managed-app/raw/master/app.zip"