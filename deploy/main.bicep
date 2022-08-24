@description('The Azure region into which the resources should be deployed.')
param location string = resourceGroup().location

@description('Generated from /subscriptions/97b128ba-d538-479d-b93c-7b986ec53178/resourceGroups/makemake/providers/Microsoft.Logic/workflows/mysupersampleyo')
resource mysupersampleyo 'Microsoft.Logic/workflows@2019-05-01' = {
  properties: {
    state: 'Enabled'
    definition: {
      '$schema': 'https://schema.management.azure.com/providers/Microsoft.Logic/schemas/2016-06-01/workflowdefinition.json#'
      contentVersion: '1.0.0.0'
      parameters: {
      }
      triggers: {
      }
      actions: {
      }
      outputs: {
      }
    }
    parameters: {
    }
    endpointsConfiguration: {
      workflow: {
        outgoingIpAddresses: [
          {
            address: '13.75.149.4'
          }
          {
            address: '104.210.91.55'
          }
          {
            address: '104.210.90.241'
          }
          {
            address: '52.187.227.245'
          }
          {
            address: '52.187.226.96'
          }
          {
            address: '52.187.231.184'
          }
          {
            address: '52.187.229.130'
          }
          {
            address: '52.187.226.139'
          }
          {
            address: '20.53.93.188'
          }
          {
            address: '20.53.72.170'
          }
          {
            address: '20.53.107.208'
          }
          {
            address: '20.53.106.182'
          }
        ]
        accessEndpointIpAddresses: [
          {
            address: '13.75.153.66'
          }
          {
            address: '104.210.89.222'
          }
          {
            address: '104.210.89.244'
          }
          {
            address: '52.187.231.161'
          }
          {
            address: '20.53.94.103'
          }
          {
            address: '20.53.107.215'
          }
        ]
      }
      connector: {
        outgoingIpAddresses: [
          {
            address: '52.237.214.72'
          }
          {
            address: '13.72.243.10'
          }
          {
            address: '13.70.72.192/28'
          }
          {
            address: '13.70.78.224/27'
          }
          {
            address: '20.70.220.224/28'
          }
          {
            address: '20.70.220.192/27'
          }
          {
            address: '20.213.202.84'
          }
          {
            address: '20.213.202.51'
          }
        ]
      }
    }
  }
  name: 'mysupersampleyo'
  location: location
  tags: {
  }
}
