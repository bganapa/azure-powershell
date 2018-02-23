
$ServicePrincipal="134d0d9b-9825-4129-b5bd-594d04383c8d"
$ServicePrincipalSecret="User@123"
$SubscriptionId="b7a57872-f429-4eb3-b26a-5108178380a5"
$AADTenant="6ca57aaf-0074-498a-9c96-2b097515e8cb"

#Playback or Record
$HttpRecorderMode="Record"
$AADTokenAudienceUri="https://adminmanagement.azurestackci08.onmicrosoft.com/96ed9507-2f9f-4ef5-b92f-53c14f0141ff"
$AADAuthEndpoint="https://login.windows.net/"
$BaseUri="https://adminmanagement.local.azurestack.external"
$ManagementResource="https://adminmanagement.azurestackci08.onmicrosoft.com/96ed9507-2f9f-4ef5-b92f-53c14f0141ff"

$env:TEST_CSM_ORGID_AUTHENTICATION="SubscriptionId=$SubscriptionId;AADTenant=$AADTenant;HttpRecorderMode=$HttpRecorderMode;AADTokenAudienceUri=$AADTokenAudienceUri;BaseUri=$BaseUri;AADAuthEndpoint=$AADAuthEndpoint;ServicePrincipal=$ServicePrincipal;password=$ServicePrincipalSecret;ManagementResource=$ManagementResource;password=$ServicePrincipalSecret"
$env:AZURE_TEST_MODE="$HttpRecorderMode"