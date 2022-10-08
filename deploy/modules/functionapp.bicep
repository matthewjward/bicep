param location string
param projectName string
param functionAppName string
param functionWorkerRuntime string
param appServicePlanName string
param appInsightsName string

@description('Name of the Service Bus resource that we connect to')
param serviceBusNamespaceName string

var storageName = toLower(functionAppName)

resource storageAccount 'Microsoft.Storage/storageAccounts@2021-09-01' = {
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  name: storageName
  location: location
  tags: {
    Project: projectName
    AppServicePlanName: appServicePlanName
  }
}

resource appServicePlan 'Microsoft.Web/serverfarms@2022-03-01' existing = {
  name: appServicePlanName
}

resource appInsights 'microsoft.insights/components@2015-05-01' existing = {
  name: appInsightsName
}

resource serviceBusNamespace 'Microsoft.ServiceBus/namespaces@2022-01-01-preview' existing = {
  name: '${serviceBusNamespaceName}${uniqueString(resourceGroup().id)}'
}

var serviceBusEndpoint = '${serviceBusNamespace.id}/AuthorizationRules/RootManageSharedAccessKey'
var serviceBusConnectionString = listKeys(serviceBusEndpoint, serviceBusNamespace.apiVersion).primaryConnectionString


resource functionApp 'Microsoft.Web/sites@2021-03-01' = {
  name: functionAppName
  location: location
  kind: 'functionapp'
  identity: {
    type: 'SystemAssigned'
  }
  tags: {
    Project: projectName
  }
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      appSettings: [
        {
          name: 'AzureWebJobsStorage'
          value: 'DefaultEndpointsProtocol=https;AccountName=${storageName};EndpointSuffix=${environment().suffixes.storage};AccountKey=${listKeys('${resourceGroup().id}/providers/Microsoft.Storage/storageAccounts/${storageName}', '2019-06-01').keys[0].value}'
        }
        {
          name: 'WEBSITE_CONTENTAZUREFILECONNECTIONSTRING'
          value: 'DefaultEndpointsProtocol=https;AccountName=${storageName};EndpointSuffix=${environment().suffixes.storage};AccountKey=${listKeys('${resourceGroup().id}/providers/Microsoft.Storage/storageAccounts/${storageName}', '2019-06-01').keys[0].value}'
        }
        {
          name: 'WEBSITE_CONTENTSHARE'
          value: toLower(functionAppName)
        }
        {
          name: 'FUNCTIONS_EXTENSION_VERSION'
          value: '~2'
        }
        {
          name: 'WEBSITE_NODE_DEFAULT_VERSION'
          value: '~10'
        }
        {
          name: 'FUNCTIONS_WORKER_RUNTIME'
          value: functionWorkerRuntime
        }
        {
          name: 'APPINSIGHTS_INSTRUMENTATIONKEY'
          value: appInsights.properties.InstrumentationKey
        }
        {
          name: 'APPLICATIONINSIGHTS_CONNECTION_STRING'
          value: appInsights.properties.ConnectionString
        }
        {
          name: 'BicepServiceBusrzxuv5l3zdimq_SERVICEBUS'
          value: serviceBusConnectionString
        }
      ]
      ftpsState: 'FtpsOnly'
      minTlsVersion: '1.2'
    }
    httpsOnly: true
  }
}
