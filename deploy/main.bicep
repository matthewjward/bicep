@description('The Azure region into which the resources should be deployed.')
param location string = resourceGroup().location

param projectName string
param logicAppServicePlanName string
param logicAppName string

param functionAppServicePlanName string
param functionAppName string

param serviceBusNamespaceName string
param serviceBusQueueName string

module logicAppServicePlan 'modules/appserviceplan.bicep' = {
  name: 'logicAppServicePlan'
  params: {
    location: location
    projectName: projectName
    appServicePlanName: logicAppServicePlanName
    sku: {
      name: 'WS1'
      tier: 'WorkflowStandard'
    }
    kind: 'windows'
  }
} 

module logicAppStandard 'modules/logicappstandard.bicep' = {
  name: 'logicAppStandard'
  params: {
    location: location
    projectName: projectName
    logicAppName: logicAppName
    appServicePlanName: logicAppServicePlanName
    serviceBusNamespaceName: serviceBusNamespaceName
  }
} 


module functionAppServicePlan 'modules/appserviceplan.bicep' = {
  name: 'functionAppServicePlan'
  params: {
    location: location
    projectName: projectName
    appServicePlanName: functionAppServicePlanName
    sku: {
      name: 'EP1'
      tier: 'ElasticPremium'
      family: 'EP'
    }
    kind: 'elastic'
  }
} 

module functionApp 'modules/functionapp.bicep' = {
  name: 'functionApp'
  params: {
    location: location
    projectName: projectName
    appServicePlanName: functionAppServicePlanName
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
