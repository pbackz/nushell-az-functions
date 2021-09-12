# Nushell MS Azure functions

## Build project with rust toolchain
```bash
git clone https://github.com/pbackz/nushell-az-functions
cargo build --release
```

## Use docker image 
```bash
docker run -it docker.io/pbackz/nushell-az-functions:1.0

Welcome to Nushell 0.21.0 (type 'help' for more info)
/opt/nushell-az-functions(main)>
```

## CLI functions usage
```nu
# Set recurrent variables
> with-env [myStorageAccountName "myStorageAccountName"] { echo $nu.env.myStorageAccountName }
myStorageAccountName
> with-env [myStorageAccountKey "myStorageAccountKey"] { echo $nu.env.myStorageAccountKey }
myStorageAccountKey
> with-env [myStorageContainerName "myStorageContainerName"] { echo $nu.env.myStorageContainerName }
myStorageContainerName

# Return current subscription
> az_cws
214a8153-2485-4e24-b2a6-137c574a3a41

# Return true if image string pattern exists in azure container registry
> az_acr_contains? myAcrExample alpine
true

# Return true if image string container pattern exists in storage account
> az_storage_container_exists? $nu.env.myStorageAccountName $nu.env.myStorageAccountKey $nu.env.myStorageContainerName
true

# Return true if image string blob pattern exists in storage account container
> az_storage_blob_exists? $nu.env.myStorageAccountName $nu.env.myStorageAccountKey $nu.env.myStorageContainerName blobToto
false

# Return list of containers existing in storage account
> az_storage_container_list! $nu.env.myStorageAccountName $nu.env.myStorageAccountKey
data
data2
```