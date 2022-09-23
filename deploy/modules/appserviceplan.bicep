@description('The datacenter to use for the deployment.')
param location string
param projectName string
param appServicePlanName string

@minLength(3)
@maxLength(24)
param storageName string
param kind string = 'StorageV2'
param skuName string = 'Standard_LRS'

resource storageName_resource 'Microsoft.Storage/storageAccounts@2021-09-01' = {
  sku: {
    name: skuName
  }
  kind: kind
  name: storageName
  location: location
  tags: {
    Project: projectName
    AppServicePlanName: appServicePlanName
  }
}

resource appServicePlanName_resource 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: appServicePlanName
  location: location
  tags: {
    Project: projectName
  }
  sku: {
    name: 'WS1'
    tier: 'WorkflowStandard'
  }
  kind: 'windows'
  properties: {}
}
