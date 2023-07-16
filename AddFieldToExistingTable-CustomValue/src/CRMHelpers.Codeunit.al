codeunit 50050 "TKA CRM Helpers"
{
    var
        SourceDestinationCodeLbl: Label '%1-%2', Locked = true;

    procedure GetSourceDestinationCode(SourceRecordRef: RecordRef; DestinationRecordRef: RecordRef): Text
    var
    begin
        if (SourceRecordRef.Number <> 0) and (DestinationRecordRef.Number <> 0) then
            exit(StrSubstNo(SourceDestinationCodeLbl, SourceRecordRef.Name(), DestinationRecordRef.Name()));
        exit('');
    end;

    procedure GetCRMAccountToCustomerCode(): Text
    var
        Customer: Record Customer;
        CRMAccount: Record "CRM Account";
    begin
        exit(StrSubstNo(SourceDestinationCodeLbl, CRMAccount.TableName(), Customer.TableName()));
    end;

    procedure GetCustomerToCRMAccountCode(): Text
    var
        Customer: Record Customer;
        CRMAccount: Record "CRM Account";
    begin
        exit(StrSubstNo(SourceDestinationCodeLbl, Customer.TableName(), CRMAccount.TableName()));
    end;

    procedure GetCRMAccountToVendorCode(): Text
    var
        Vendor: Record Vendor;
        CRMAccount: Record "CRM Account";
    begin
        exit(StrSubstNo(SourceDestinationCodeLbl, CRMAccount.TableName(), Vendor.TableName()));
    end;

    procedure GetVendorToCRMAccountCode(): Text
    var
        Vendor: Record Vendor;
        CRMAccount: Record "CRM Account";
    begin
        exit(StrSubstNo(SourceDestinationCodeLbl, Vendor.TableName(), CRMAccount.TableName()));
    end;
}