param serviceBusName string
param location string

resource serviceBus_resource 'Microsoft.ServiceBus/namespaces@2022-01-01-preview' = {
  name: serviceBusName
  location: location
}


/*
resource symbolicname 'Microsoft.ServiceBus/namespaces@2022-01-01-preview' = {
  name: 'string'
  location: 'string'
  tags: {
    tagName1: 'tagValue1'
    tagName2: 'tagValue2'
  }
  sku: {
    capacity: int
    name: 'string'
    tier: 'string'
  }
  identity: {
    type: 'string'
    userAssignedIdentities: {}
  }
  properties: {
    alternateName: 'string'
    disableLocalAuth: bool
    encryption: {
      keySource: 'Microsoft.KeyVault'
      keyVaultProperties: [
        {
          identity: {
            userAssignedIdentity: 'string'
          }
          keyName: 'string'
          keyVaultUri: 'string'
          keyVersion: 'string'
        }
      ]
      requireInfrastructureEncryption: bool
    }
    minimumTlsVersion: 'string'
    privateEndpointConnections: [
      {
        properties: {
          privateEndpoint: {
            id: 'string'
          }
          privateLinkServiceConnectionState: {
            description: 'string'
            status: 'string'
          }
          provisioningState: 'string'
        }
      }
    ]
    publicNetworkAccess: 'string'
    zoneRedundant: bool
  }
}
*/
