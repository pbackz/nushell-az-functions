def az_cws [] { az account list | from json | each { echo $it | where $it.isDefault == $true | get id } }

def az_acr_contains? [ACR: string PATTERN: string] {
    az acr repository list --name $ACR | from json | each {
        echo $it | where $it =~ $PATTERN }
}

#def az_blob_break_lease! [storage_account connection_string container blob] {
#    az storage blob lease break --account-name $storage_account --connection-string $connection_string --blob-name $blob --container-name $container 
#}

def az_storage_container_exists? [STORAGE_ACCOUNT: string ACCOUNT_KEY: string CONTAINER: string] {
    az storage container exists --account-name $STORAGE_ACCOUNT --subscription $"(az_cws)" --account-key $ACCOUNT_KEY --name $CONTAINER_NAME |
    from json |
    get exists 
}

def az_storage_blob_exists? [STORAGE_ACCOUNT: string ACCOUNT_KEY: string CONTAINER: string BLOB: string] {
    az storage blob exists --account-name $STORAGE_ACCOUNT --account-key $ACCOUNT_KEY --container-name $CONTAINER --name $BLOB |
    from json |
    get exists
}

def az_storage_container_list! [STORAGE_ACCOUNT: string ACCOUNT_KEY: string] {
    az storage container list --account-name $STORAGE_ACCOUNT --subscription $"(az_cws)" --account-key $ACCOUNT_KEY |
    from json | 
    get name
}