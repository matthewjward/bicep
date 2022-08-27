@description('The Azure region into which the resources should be deployed.')
param location string = resourceGroup().location
param environmentName string
param projectName string
param logicAppName string
param appServicePlanName string

@minLength(3)
@maxLength(24)
param storageName string
param kind string = 'StorageV2'
param skuName string = 'Standard_LRS'
param skuTier string = 'Standard'

module logicAppStandard 'modules/logicappstandard.bicep' = {
  name: 'logicAppStandard'
  params: {
    location: location
    environmentName: environmentName
    projectName: projectName
    logicAppName: logicAppName
    appServicePlanName: appServicePlanName
    storageName: storageName
    kind: kind
    skuName: skuName
    skuTier: skuTier
  }
}
