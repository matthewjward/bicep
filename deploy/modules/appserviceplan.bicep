@description('The datacenter to use for the deployment.')
param location string
param projectName string
param appServicePlanName string
param sku object
param kind string

resource appServicePlanName_resource 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: appServicePlanName
  location: location
  tags: {
    Project: projectName
  }
  sku: sku
  kind: kind
  properties: {}
}
