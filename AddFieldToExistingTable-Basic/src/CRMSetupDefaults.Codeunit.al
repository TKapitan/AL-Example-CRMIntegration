codeunit 50000 "TKA CRM Setup Defaults"
{
    SingleInstance = true;

    var
        IntegrationFieldMapping: Record "Integration Field Mapping";

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"CDS Setup Defaults", OnAfterResetCustomerAccountMapping, '', false, false)]
    local procedure OnAfterResetCustomerAccountMappingCDSSetupDefaults(IntegrationTableMappingName: Code[20])
    var
        Customer: Record Customer;
        CRMAccount: Record "CRM Account";
    begin
        IntegrationFieldMapping.CreateRecord(
            IntegrationTableMappingName, Customer.FieldNo("Registration Number"), CRMAccount.FieldNo(TKA_RegistrationNumber),
            IntegrationFieldMapping.Direction::Bidirectional, '', true, false
        );
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"CDS Setup Defaults", OnAfterResetVendorAccountMapping, '', false, false)]
    local procedure OnAfterResetVendorAccountMappingCDSSetupDefaults(IntegrationTableMappingName: Code[20])
    var
        Vendor: Record Vendor;
        CRMAccount: Record "CRM Account";
    begin
        IntegrationFieldMapping.CreateRecord(
            IntegrationTableMappingName, Vendor.FieldNo("Registration Number"), CRMAccount.FieldNo(TKA_RegistrationNumber),
            IntegrationFieldMapping.Direction::Bidirectional, '', true, false
        );
    end;
}