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

module logicAppStandard 'modules/logicappstandard.bicep' = if (false) {
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
  }
} 

param serviceBusNamespaceName string
param serviceBusQueueName string

module serviceBus 'modules/servicebus.bicep' = {
  name: 'serviceBus'
  params: {
    location: location
    serviceBusNamespaceName: serviceBusNamespaceName
    serviceBusQueueName: serviceBusQueueName
  }
}
