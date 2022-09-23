@description('The Azure region into which the resources should be deployed.')
param location string = resourceGroup().location

param projectName string
param appServicePlanName string

param logicAppName string
param functionAppName string

@minLength(3)
@maxLength(24)
param storageName string
param kind string = 'StorageV2'
param skuName string = 'Standard_LRS'

param serviceBusNamespaceName string
param serviceBusQueueName string

module appServicePlan 'modules/appserviceplan.bicep' = {
  name: 'appServicePlan'
  params: {
    location: location
    projectName: projectName
    appServicePlanName: appServicePlanName
    storageName: storageName
    kind: kind
    skuName: skuName
  }
} 

module logicAppStandard 'modules/logicappstandard.bicep' = {
  name: 'logicAppStandard'
  params: {
    location: location
    projectName: projectName
    logicAppName: logicAppName
    appServicePlanName: appServicePlanName
    storageName: storageName
    serviceBusNamespaceName: serviceBusNamespaceName
  }
} 

module functionApp 'modules/functionapp.bicep' = {
  name: 'functionApp'
  params: {
    location: location
    projectName: projectName
    appServicePlanName: appServicePlanName
    storageName: storageName
    functionAppName: functionAppName
    functionWorkerRuntime: 'dotnet'    
  }
}

module serviceBus 'modules/servicebus.bicep' = {
  name: 'serviceBus'
  params: {
    location: location
    serviceBusNamespaceName: serviceBusNamespaceName
    serviceBusQueueName: serviceBusQueueName
  }
}
