# Azure CLI 2.0 Cheat Sheet

Azure CLI 2.0 Cheat Sheet for Login, Resources, VMs, Resource groups, Storage, Batch, and Containers.

## | Azure CLI - PowerShell References

- [Azure CLI Reference](https://docs.microsoft.com/en-us/cli/azure/reference-index?view=azure-cli-latest)
- [Azure PowerShell Reference](https://docs.microsoft.com/en-us/powershell/azure/?view=azps-5.1.0)

 |  #  | Azure Product        | Azure CLI           | Example CLI | PowerShell Module | Example PS
 | --: | -------------------- |:------------------- | :---------- | :---------------- | :--------- |
 |  1  | Syntax               | **az**              |             | PowerShell uses a verb-noun pair for the names of cmdlets
 |  2  | Log in to Azure      | **az login**        | `az login -u johndoe@contoso.com -p VerySecret` | **Az.Accounts** | `Connect-AzAccount`
 |  2a | Log in to Azure without auto-browser launch | **az login** | `az login --use-device-code` | **Az.Accounts** | `Connect-AzAccount -UseDeviceAuthentication`
 |  3  | Manage Azure subscription information | **az account** | `az account list --o table` | **Az.Accounts** | `Get-AzSubscription`
 |  3a | Set a subscription to be the current active subscription | **az account** | `az account set --subscription "Azure Pass - Sponsorship"` | |
 |  3b | Gets the current metadata used to authenticate Azure Resource Manager requests | **az account** | `az account show` | **Az.Accounts** | `Get-AzContext | Format-List`
 |  4  | Manage private registries with Azure Container Registries | **az acr** | `az acr list -g MyResourceGroup -o table` | **Az.ContainerRegistry** | `Get-AzContainerRegistry -ResourceGroupName "MyResourceGroup"`
 |  5  | Manage Azure Container Services | **az acs** | `az acs list-locations --subscription` | **Az.Compute** | `Get-AzContainerService -ResourceGroupName "myRG"`
 |  6  | Manage Azure Active Directory | **az ad** | `az ad group show --group` | **Az.Resources** | `Get-AzADGroup -First 100`
 |  7  | Manage Azure Advisor | **az advisor** | `az advisor recommendation list --category Performance` | **Az.Advisor** | `Get-AzAdvisorRecommendation -Category Performance`
 |  8  | Manage Azure Kubernetes Services | **az aks** | `az aks get-versions --location westus2` | **Az.Aks** | `Get-AzAksVersion -Location westus`
 |  9  | Manage Azure Media Services resources | **az ams** | `az ams account list --resource-group --subscription` | **Az.Media** | `Get-AzMediaService -ResourceGroupName "myRG"`
 | 10  | Manage App Configurations | **az appconfig** | `az appconfig list -g MyResourceGroup` | **Az.AppConfiguration** | `Get-AzAppConfigurationStore`
 | 11  | Manage App Service plans | **az appservice** | `az appservice ase list` | **Az.Websites** | `Get-AzAppServicePlan -Location "West US"`
 | 12  | Manage Azure Backups | **az backup** | `az backup container show ...` | **Az.RecoveryServices** | `Get-AzRecoveryServicesBackupJob`
 | 13  | Manage Azure Batch | **az batch** | `az batch account list [--resource-group] [--subscription]` | **Az.Batch** | `Get-AzBatchAccount -AccountName "pfuller"`
 | 14  | Manage Azure Billing | **az billing** | `az billing period show --name --subscription` | **Az.Billing** | `Get-AzBillingInvoice -Latest`
 | 15  | Manage Azure Content Delivery Networks | **az cdn** | `az cdn origin list` | **Az.Cdn** | `Get-AzCdnOrigin`
 | 16  | Manage Azure Cognitive Services accounts | **az cognitiveservices** | `az cognitiveservices account list -g MyResourceGroup` | **Az.CognitiveServices** | `Get-AzCognitiveServicesAccount`
 | 17  | Manage Azure CLI configuration | **az configure** | `az configure --defaults group=myRG web=myweb vm=myvm` | **Az.Accounts** | `Set-AzContext -SubscriptionId "xxxx-xxxx-xxxx-xxxx"`
 | 18  | Manage Azure Container Instances. | **az container** | `az container logs --name MyContainerGroup --resource-group MyResourceGroup` | **Az.ContainerInstance** | `Get-AzContainerGroup -ResourceGroupName demo -Name mycontainer`
 | 19  | Manage Azure Cosmos DB database | **az cosmosdb** | `az cosmosdb list [--resource-group] [--subscription]` | **Az.CosmosDB** | `Get-AzCosmosDBAccount -ResourceGroupName {resourceGroupName} -Name {databaseAccountName}`
 | 20  | Manage ARM template deployment at subscription scope | **az deployment** | `az deployment group list -g testrg` | **Az.DeploymentManager** | `Get-AzDeploymentManagerArtifactSource -InputObject $artifactSourceObject`
 | 21  | Manage Azure Managed Disks | **az disk** | `az disk list [--resource-group] [--subscription]` | **Az.Compute** | `Get-AzDisk -ResourceGroupName 'ResourceGroup01' -DiskName 'Disk01'`
 | 22  | Manage Data Lake Analytics | **az dla** | `az dla account list [--resource-group] [--subscription]` | **Az.DataLakeAnalytics** | `Get-AzDataLakeAnalyticsAccount -Name "ContosoAdlAccount"`
 | 23  | Manage Data Lake Store | **az dls** | `az dls account list --resource-group myRG` | **Az.DataLakeStore** | `Get-AzDataLakeStoreAccount -Name "ContosoADL"`
 | 24  | Manage Azure Data Migration Service | **az dms** | `az dms check-name --location westus2 --name MyService` | **Az.DataMigration** | `Get-AzDataMigrationProject -InputObject $myService`
 | 25  | Manage Azure Event Grid | **az eventgrid** | `az ams account list --resource-group --subscription` | **Az.EventGrid** | `Get-AzEventGridDomain -ResourceGroup myRG -Name Domain1`
 | 26  | Manage Azure Event Hubs | **az eventhubs** | `az eventhubs eventhub list --resource-group myRG --namespace-name mynamespace` | **Az.EventHub** | `Get-AzEventHub -ResourceGroup myRG -NamespaceName MyNamespaceName`
 | 27  | Manage resource provider features | **az feature** | `az feature list` | **Az.Resources** | `Register-AzResourceProvider -ProviderNamespace Microsoft.Network`
 | 28  | Find commands | **az find** | `az find "az storage"` | **Az.Accounts** | `Get-Command -Verb Get -Noun AzVM* -Module Az.Compute`
 | 29  | Manage function apps | **az functionapp** | `az functionapp list --query "[?state=='Running']"` | **Az.Functions** | `Get-AzFunctionApp`
 | 30  | Manage resource groups and template deployments | **az group** | `az group create -l westus -n myRG` | **Az.Resources** | `Get-AzResourceGroup -Name "EngineerBlog"`
 |     |                                                 | **az group** | `az group delete --name ManagedPlatform --no-wait --yes` | **Az.Resources** | `Get-AzResourceGroup -Name 'ManagedPlatform' | Remove-AzResourceGroup -Force -AsJob`
 |     |                                                 | **az group** | `az group list --query "[?starts_with(name,'az104-09c')].name" --output tsv` | |
 |     |                                                 | **az group** | `az group list --query "[?starts_with(name,'az104-09c')].[name]" --output tsv | xargs -L1 bash -c 'az group delete --name $0 --no-wait --yes'` | **Az.Resources** | `Get-AzResourceGroup -Name 'az104-04*' | Remove-AzResourceGroup -Force -AsJob`
 | 31  | Manage HDInsight resources. | **az hdinsight** | `az hdinsight list [--resource-group] [--subscription]` | **Az.HDInsight** | `Get-AzHDInsightCluster`
 | 32  | Managed Service Identities. | **az identity** | `az identity list-operations [--subscription]` | **Az.ManagedServiceIdentity** | `Get-AzUserAssignedIdentity -ResourceGroupName PSRG -Name ID1`
 | 33  | Manage custom virtual machine images. | **az image** | `az image builder show --name mytemplate --resource-group my-group` | **Az.ManagedServiceIdentity** | `Get-AzImageBuilderTemplate`
 | 34  | Manage KeyVault | **az keyvault** | `az keyvault list [--resource-group] [--subscription]` | **Az.KeyVault** | `Get-AzKeyVault`
 | 35  | Manage Azure Kusto resources | **az kusto** | `az kusto cluster list --resource-group myRG` | **Az.Kusto** | `Get-AzKustoCluster -ResourceGroupName testrg`
 | 36  | Manage Azure locks | **az lock** | `az lock list` | **Az.Resources** | `Get-AzResourceLock -ResourceGroupName "myRG" -AtScope`
 | 37  | Manage assignments and definitions | **az managedservices** | `az managedservices definition list` | **Az.ManagedServices** | `Get-AzManagedServicesAssignment`
 | 38  | Manage Azure Maps | **az maps** | `az maps account show --name MyMapsAccount --resource-group myRG` | **Az.Maps** | `Get-AzMapsAccount -ResourceGroupName myRG`
 | 39  | Manage Azure Database for MariaDB servers | **az mariadb** | `az mariadb db list -g testgroup -s testsvr` | **Az.MariaDb** | `Get-AzMariaDbServer`
 | 40  | Manage the Azure Monitor Service. | **az monitor** | `az monitor action-group list [--resource-group] [--subscription]` | **Az.Monitor** | `Get-AzActionGroup`
 | 41  | Manage Azure Database for MySQL servers. | **az mysql** | `az mysql db list -g testgroup -s testsvr` | **Az.MySql** | `Get-AzMySqlServer`
 | 42  | Manage Azure Network resources. | **az network** | `az network nic list --query "[?dnsSettings.internalDomainNameSuffix=`{dnsSuffix}`]"` | **Az.Network** | `Get-AzNetworkInterface`
 | 43  | Manage resource policies. | **az policy** | `az policy definition show --name MyPolicyDefinition` | **Az.Resources** | `Get-AzPolicyDefinition`
 | 44  | Manage Azure Database for PostgreSQL servers. | **az postgres** | `az postgres db list -g testgroup -s testsvr` | **Az.PostgreSql** | `Get-AzPostgreSqlServer`
 | 45  | Manage dedicated Redis caches for your Azure applications. | **az redis** | `az redis list [--resource-group] [--subscription]` | **Az.RedisCache** | `Get-AzRedisCache -Name "myexists"`
 | 46  | Manage Azure Reservations | **az reservations** | `az reservations reservation list --reservation-order-id [--subscription]` | **Az.Reservations** | `Get-AzReservation -ReservationOrderId "1111aaaa"`
 | 47  | Manage Azure resources. | **az resource** | `az resource list --location westus` | **Az.Resources** | `Get-AzResource | ft`
 | 48  | Manage user roles for access control with AAD and service principals | **az role** | `az role assignment list [--all]` | **Az.Resources** | `Get-AzADServicePrincipal`
 | 49  | Manage Azure Search services | **az search** | `az search service list --resource-group [--subscription]` | **Az.Search** | `Get-AzSearchService -ResourceGroupName felixwa-01`
 | 50  | Manage security with Azure Security Center | **az security** | `az security alert list` | **Az.Security** | `Get-AzDiscoveredSecuritySolution`
 | 51  | Manage shared image gallery | **az sig** | `az sig list [--resource-group] [--subscription]` | **Az.ImageBuilder** | `Get-AzImageBuilderTemplate`
 | 52  | Manage snapshots | **az snapshot** | `az snapshot list [--resource-group] [--subscription]` | **Az.Compute** | `Get-AzSnapshot`
 | 53  | Manage Azure SQL Databases and Data Warehouses. | **az sql** | `az sql db list --resource-group myRG --server myserver` | **Az.Sql** | `Get-AzSqlDatabase -ResourceGroupName "myRG" -ServerName "server01"`
 | 54  | Manage Azure Storage resources | **az storage** | `az storage account list -g myRG` | **Az.Storage** | `Get-AzStorageAccount -ResourceGroupName "RG01"`
 | 55  | Manage resource tags | **az tag** | `az tag list [--subscription]` | **Az.Resources** | `Get-AzTag -Name "Department"`
 | 56  | Show the versions of Azure CLI modules | **az version** | `az version [--subscription]` | **PowerShellGet** | `Get-InstalledModule Azure -AllVersions`
 | 57  | Manage Linux or Windows virtual machines | **az vm** | `az vm list -g myRG` | **Az.Compute** | ``Get-AzVM -ResourceGroupName "myRG" -Name "VirtualMachine07"``
 | 58  | Manage Virtual Machine Scale Set (VMSS) | **az vmss** | `az vmss list --resource-group myRG` | **Az.Compute** | `Get-AzVmss -ResourceGroupName "Group001" -VMScaleSetName "VMSS001"`
 | 59  | Manage web apps | **az webapp** | `az webapp list --query "[?state=='Running']"` | **Az-WebApp** | `Get-AzWebApp -myRG "Default-Web-WestUS" -Name "ContosoSite"`

## AZ CLI Examples

### Logging in

### Login with web

```zsh
az login
```

### Login in CLI

```zsh
az login -u myemail@address.com
```

### List accounts

```zsh
az account list
```

### Set subscription

```zsh
az account set --subscription "xxx"
```

## Listing locations and resources / general

### List all locations

```zsh
az account list-locations
```

### List all my resource groups

```zsh
az resource list
```

### Get what version of the CLI you have

```zsh
azure --version
```

### Get help

```zsh
azure help
```

## Creating a basic VM / Resource Group / Storage Account

### Get all available VM sizes

```zsh
az vm list-sizes --location eastus
```

### Get all available VM images for Windows and Linux

```zsh
az vm image list --output table
```

### Create a Linux VM

```zsh
az vm create --resource-group myResourceGroup --name myVM --image ubuntults
```

### Create a Windows VM

```zsh
az vm create --resource-group myResourceGroup --name myVM --image win2016datacenter
```

### Create a Resource group

```zsh
az group create --name myresourcegroup --location eastus
```

### Create a Storage account

```zsh
az storage account create -g myresourcegroup -n mystorageaccount -l eastus --sku Standard_LRS
```

## DELETING A RESOURCE GROUP

### Permanently deletes a resource group

```zsh
az group delete --name myResourceGroup
```

## Managing VMs

### List your VMs

```zsh
az vm list
```

### Start a VM

```zsh
az vm start --resource-group myResourceGroup --name myVM
```

### Stop a VM

```zsh
az vm stop --resource-group myResourceGroup --name myVM
```

### De-allocate a VM

```zsh
az vm deallocate --resource-group myResourceGroup --name myVM
```

### Restart a VM

```zsh
az vm restart --resource-group myResourceGroup --name myVM
```

### Redeploy a VM

```zsh
az vm redeploy --resource-group myResourceGroup --name myVM
```

### Delete a VM

```zsh
az vm delete --resource-group myResourceGroup --name myVM
```

### Create image of a VM

```zsh
az image create --resource-group myResourceGroup --source myVM --name myImage
```

### Create VM from image

```zsh
az vm create --resource-group myResourceGroup --name myNewVM --image myImage
```

### List VM extensions

```zsh
az vm extension list --resource-group azure-playground-resources --vm-name azure-playground-vm
```

### Delete VM extensions

```zsh
az vm extension delete --resource-group azure-playground-resources --vm-name azure-playground-vm --name bootstrapper
```

## Managing Batch Account

### Create a Batch account

```zsh
az batch account create -g myresourcegroup -n mybatchaccount -l eastus
```

### Create a Storage account

```zsh
az storage account create -g myresourcegroup -n mystorageaccount -l eastus --sku Standard_LRS
```

### Associate Batch with storage account

```zsh
az batch account set -g myresourcegroup -n mybatchaccount --storage-account mystorageaccount
```

We can now authenticate directly against the account for further CLI interaction.

```zsh
az batch account login -g myresourcegroup -n mybatchaccount
```

### Display the details of our created account

```zsh
az batch account show -g myresourcegroup -n mybatchaccount
```

### Create a new application

```zsh
az batch application create --resource-group myresourcegroup --name mybatchaccount --application-id myapp --display-name "My Application"
```

### Add zip files to application

```zsh
az batch application package create --resource-group myresourcegroup --name mybatchaccount --application-id myapp --package-file my-application-exe.zip --version 1.0
```

### Assign the application package as the default version

```zsh
az batch application set --resource-group myresourcegroup --name mybatchaccount --application-id myapp --default-version 1.0
```

### Retrieve a list of available images and node agent SKUs

```zsh
az batch pool node-agent-skus list
```

### Create new Linux pool with VM config

```zsh
az batch pool create \
    --id mypool-linux \
    --vm-size Standard_A1 \
    --image canonical:ubuntuserver:16.04.0-LTS \
    --node-agent-sku-id “batch.node.ubuntu 16.04”
```

### Now let's resize the pool to start up some VMs

```zsh
az batch pool resize --pool-id mypool-linux --target-dedicated 5
```

### We can check the status of the pool to see when it has finished resizing

```zsh
az batch pool show --pool-id mypool-linux
```

### List the compute nodes running in a pool

```zsh
az batch node list --pool-id mypool-linux
```

If a particular node in the pool is having issues, it can be rebooted or reimaged.
A typical node ID will be in the format `tvm-xxxxxxxxxx_1-<timestamp>`.

```zsh
az batch node reboot --pool-id mypool-linux --node-id tvm-123_1-20170316t000000z
```

### Re-allocate work to another node

```zsh
az batch node delete \
    --pool-id mypool-linux \
    --node-list tvm-123_1-20170316t000000z tvm-123_2-20170316t000000z \
    --node-deallocation-option requeue
```

### Create a new job to encapsulate the tasks that we want to add

```zsh
az batch job create --id myjob --pool-id mypool
```

### Add tasks to the job

 …where `shell` is your preferred shell for execution (/bin/sh, /bin/bash, /bin/ksh etc.), and /path/to/script.sh is, of course, the full path of the shell script you’re invoking to get things started.

```zsh
az batch task create --job-id myjob --task-id task1 --application-package-references myapp#1.0 --command-line "/bin/shell -c /path/to/script.sh"
```

### Add many tasks at once

```zsh
az batch task create --job-id myjob --json-file tasks.json
```

Now that all the tasks are added - we can update the job so that it will automatically be marked as completed once all the tasks are finished.

```zsh
az batch job set --job-id myjob --on-all-tasks-complete terminateJob
```

### Monitor the status of the job

```zsh
az batch job show --job-id myjob
```

### Monitor the status of a task

```zsh
az batch task show --job-id myjob --task-id task1
```

### Delete a job

```zsh
az batch job delete --job-id myjob
```

## Managing Containers

If you HAVE AN SSH run this to create an Azure Container Service Cluster (~10 mins)

```zsh
az acs create -n acs-cluster -g acsrg1 -d applink789
```

If you DO NOT HAVE AN SSH run this to create an Azure Container Service Cluster (~10 mins)

```zsh
az acs create -n acs-cluster -g acsrg1 -d applink789 --generate-ssh-keys
```

### List clusters under your whole subscription

```zsh
az acs list --output table
```

### List clusters in a resource group

```zsh
az acs list -g acsrg1 --output table
```

### Display details of a container service cluster

```zsh
az acs show -g acsrg1 -n acs-cluster --output list
```

### Scale using ACS

```zsh
az acs scale -g acsrg1 -n acs-cluster --new-agent-count 4
```

### Delete a cluster

```zsh
az acs delete -g acsrg1 -n acs-cluster
```
