data "azurerm_subscription" "primary" {}

resource "azurerm_role_definition" "cp_pipeline_role" {
  name        = "CodePipesPipelineRole"
  scope       = data.azurerm_subscription.primary.id
  description = "Role with permissions required to use Code Pipes"

  permissions {
    actions = [
      "Microsoft.Storage/storageAccounts/write",
      "Microsoft.Storage/storageAccounts/blobServices/containers/delete",
      "Microsoft.Storage/storageAccounts/blobServices/containers/read",
      "Microsoft.Storage/storageAccounts/blobServices/containers/write",
      "Microsoft.Storage/storageAccounts/blobServices/generateUserDelegationKey/action",
      "Microsoft.ServiceBus/checkNamespaceAvailability/action",
      "Microsoft.ServiceBus/checkNameAvailability/action",
      "Microsoft.ServiceBus/register/action",
      "Microsoft.ServiceBus/unregister/action",
      "Microsoft.ServiceBus/namespaces/write",
      "Microsoft.ServiceBus/namespaces/read",
      "Microsoft.ServiceBus/namespaces/Delete",
      "Microsoft.ServiceBus/namespaces/authorizationRules/action",
      "Microsoft.ServiceBus/namespaces/migrate/action",
      "Microsoft.ServiceBus/namespaces/removeAcsNamepsace/action",
      "Microsoft.ServiceBus/namespaces/privateEndpointConnectionsApproval/action",
      "Microsoft.ServiceBus/namespaces/authorizationRules/write",
      "Microsoft.ServiceBus/namespaces/authorizationRules/read",
      "Microsoft.ServiceBus/namespaces/authorizationRules/delete",
      "Microsoft.ServiceBus/namespaces/authorizationRules/listkeys/action",
      "Microsoft.ServiceBus/namespaces/authorizationRules/regenerateKeys/action",
      "Microsoft.ServiceBus/namespaces/disasterrecoveryconfigs/checkNameAvailability/action",
      "Microsoft.ServiceBus/namespaces/disasterRecoveryConfigs/write",
      "Microsoft.ServiceBus/namespaces/disasterRecoveryConfigs/read",
      "Microsoft.ServiceBus/namespaces/disasterRecoveryConfigs/delete",
      "Microsoft.ServiceBus/namespaces/disasterRecoveryConfigs/breakPairing/action",
      "Microsoft.ServiceBus/namespaces/disasterRecoveryConfigs/failover/action",
      "Microsoft.ServiceBus/namespaces/disasterRecoveryConfigs/authorizationRules/read",
      "Microsoft.ServiceBus/namespaces/disasterRecoveryConfigs/authorizationRules/listkeys/action",
      "Microsoft.ServiceBus/namespaces/eventGridFilters/write",
      "Microsoft.ServiceBus/namespaces/eventGridFilters/read",
      "Microsoft.ServiceBus/namespaces/eventGridFilters/delete",
      "Microsoft.ServiceBus/namespaces/eventhubs/read",
      "Microsoft.ServiceBus/namespaces/ipFilterRules/read",
      "Microsoft.ServiceBus/namespaces/ipFilterRules/write",
      "Microsoft.ServiceBus/namespaces/ipFilterRules/delete",
      "Microsoft.ServiceBus/namespaces/migrationConfigurations/write",
      "Microsoft.ServiceBus/namespaces/migrationConfigurations/read",
      "Microsoft.ServiceBus/namespaces/migrationConfigurations/delete",
      "Microsoft.ServiceBus/namespaces/migrationConfigurations/revert/action",
      "Microsoft.ServiceBus/namespaces/migrationConfigurations/upgrade/action",
      "Microsoft.ServiceBus/namespaces/messagingPlan/read",
      "Microsoft.ServiceBus/namespaces/messagingPlan/write",
      "Microsoft.ServiceBus/namespaces/operationresults/read",
      "Microsoft.ServiceBus/namespaces/skus/read",
      "Microsoft.ServiceBus/namespaces/providers/Microsoft.Insights/diagnosticSettings/read",
      "Microsoft.ServiceBus/namespaces/providers/Microsoft.Insights/diagnosticSettings/write",
      "Microsoft.ServiceBus/namespaces/providers/Microsoft.Insights/logDefinitions/read",
      "Microsoft.ServiceBus/namespaces/providers/Microsoft.Insights/metricDefinitions/read",
      "Microsoft.ServiceBus/namespaces/networkruleset/read",
      "Microsoft.ServiceBus/namespaces/networkruleset/write",
      "Microsoft.ServiceBus/namespaces/networkruleset/delete",
      "Microsoft.ServiceBus/namespaces/networkrulesets/read",
      "Microsoft.ServiceBus/namespaces/networkrulesets/write",
      "Microsoft.ServiceBus/namespaces/networkrulesets/delete",
      "Microsoft.ServiceBus/namespaces/privateEndpointConnections/read",
      "Microsoft.ServiceBus/namespaces/privateEndpointConnections/write",
      "Microsoft.ServiceBus/namespaces/privateEndpointConnections/delete",
      "Microsoft.ServiceBus/namespaces/privateEndpointConnections/operationstatus/read",
      "Microsoft.ServiceBus/namespaces/privateEndpointConnectionProxies/validate/action",
      "Microsoft.ServiceBus/namespaces/privateEndpointConnectionProxies/read",
      "Microsoft.ServiceBus/namespaces/privateEndpointConnectionProxies/write",
      "Microsoft.ServiceBus/namespaces/privateEndpointConnectionProxies/delete",
      "Microsoft.ServiceBus/namespaces/privateEndpointConnectionProxies/operationstatus/read",
      "Microsoft.ServiceBus/namespaces/privateLinkResources/read",
      "Microsoft.ServiceBus/namespaces/queues/write",
      "Microsoft.ServiceBus/namespaces/queues/read",
      "Microsoft.ServiceBus/namespaces/queues/Delete",
      "Microsoft.ServiceBus/namespaces/queues/authorizationRules/action",
      "Microsoft.ServiceBus/namespaces/queues/authorizationRules/write",
      "Microsoft.ServiceBus/namespaces/queues/authorizationRules/read",
      "Microsoft.ServiceBus/namespaces/queues/authorizationRules/delete",
      "Microsoft.ServiceBus/namespaces/queues/authorizationRules/listkeys/action",
      "Microsoft.ServiceBus/namespaces/queues/authorizationRules/regenerateKeys/action",
      "Microsoft.ServiceBus/namespaces/topics/write",
      "Microsoft.ServiceBus/namespaces/topics/read",
      "Microsoft.ServiceBus/namespaces/topics/Delete",
      "Microsoft.ServiceBus/namespaces/topics/authorizationRules/action",
      "Microsoft.ServiceBus/namespaces/topics/authorizationRules/write",
      "Microsoft.ServiceBus/namespaces/topics/authorizationRules/read",
      "Microsoft.ServiceBus/namespaces/topics/authorizationRules/delete",
      "Microsoft.ServiceBus/namespaces/topics/authorizationRules/listkeys/action",
      "Microsoft.ServiceBus/namespaces/topics/authorizationRules/regenerateKeys/action",
      "Microsoft.ServiceBus/namespaces/topics/subscriptions/write",
      "Microsoft.ServiceBus/namespaces/topics/subscriptions/read",
      "Microsoft.ServiceBus/namespaces/topics/subscriptions/Delete",
      "Microsoft.ServiceBus/namespaces/topics/subscriptions/rules/write",
      "Microsoft.ServiceBus/namespaces/topics/subscriptions/rules/read",
      "Microsoft.ServiceBus/namespaces/topics/subscriptions/rules/Delete",
      "Microsoft.ServiceBus/namespaces/virtualNetworkRules/read",
      "Microsoft.ServiceBus/namespaces/virtualNetworkRules/write",
      "Microsoft.ServiceBus/namespaces/virtualNetworkRules/delete",
      "Microsoft.ServiceBus/operations/read",
      "Microsoft.ServiceBus/locations/deleteVirtualNetworkOrSubnets/action",
      "Microsoft.ServiceBus/sku/read",
      "Microsoft.ServiceBus/sku/regions/read",
      "Microsoft.Resources/subscriptions/resourceGroups/read",
      "Microsoft.Resources/subscriptions/resourceGroups/write",
    ]
    not_actions = []
    data_actions = [
      "Microsoft.Storage/storageAccounts/blobServices/containers/blobs/read",
      "Microsoft.Storage/storageAccounts/blobServices/containers/blobs/delete",
      "Microsoft.Storage/storageAccounts/blobServices/containers/blobs/write",
      "Microsoft.Storage/storageAccounts/blobServices/containers/blobs/add/action",
      "Microsoft.Storage/storageAccounts/blobServices/containers/blobs/move/action",
      "Microsoft.ServiceBus/namespaces/messages/send/action",
      "Microsoft.ServiceBus/namespaces/messages/receive/action",
    ]
    not_data_actions = []
  }

  assignable_scopes = [
    data.azurerm_subscription.primary.id,
  ]
}

resource "azurerm_role_assignment" "cp_pipeline_role_assignment" {
  #   name               = "00000000-0000-0000-0000-000000000000"
  scope              = data.azurerm_subscription.primary.id
  role_definition_id = azurerm_role_definition.cp_pipeline_role.role_definition_resource_id
  principal_id       = azuread_service_principal.cp_service_principal.object_id
}