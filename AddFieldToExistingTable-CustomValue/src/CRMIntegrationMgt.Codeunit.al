codeunit 50001 "TKA CRM Integration Mgt."
{
    SingleInstance = true;

    var
        CRMHelpers: Codeunit "TKA CRM Helpers";

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Integration Record Synch.", OnTransferFieldData, '', false, false)]
    local procedure OnTransferFieldDataIntegrationRecordSynch(SourceFieldRef: FieldRef; DestinationFieldRef: FieldRef; var NewValue: Variant; var IsValueFound: Boolean; var NeedsConversion: Boolean)
    begin
        case CRMHelpers.GetSourceDestinationCode(SourceFieldRef.Record(), DestinationFieldRef.Record()) of
            CRMHelpers.GetCustomerToCRMAccountCode():
                UpdateCRMAccountFromCustomerOnTransferFieldData(SourceFieldRef, DestinationFieldRef, NewValue, IsValueFound, NeedsConversion);
            CRMHelpers.GetCRMAccountToCustomerCode():
                UpdateCustomerFromCRMAccountOnTransferFieldData(SourceFieldRef, DestinationFieldRef, NewValue, IsValueFound, NeedsConversion);
            CRMHelpers.GetVendorToCRMAccountCode():
                UpdateCRMAccountFromVendorOnTransferFieldData(SourceFieldRef, DestinationFieldRef, NewValue, IsValueFound, NeedsConversion);
            CRMHelpers.GetCRMAccountToVendorCode():
                UpdateVendorFromCRMAccountOnTransferFieldData(SourceFieldRef, DestinationFieldRef, NewValue, IsValueFound, NeedsConversion);
        end;
    end;

    local procedure UpdateCRMAccountFromCustomerOnTransferFieldData(SourceFieldRef: FieldRef; DestinationFieldRef: FieldRef; var NewValueVariant: Variant; var IsValueFound: Boolean; var NeedsConversion: Boolean)
    var
        Customer: Record Customer;
        CRMAccount: Record "CRM Account";
        TempOption: Integer;
    begin
        case true of
            (SourceFieldRef.Number() = Customer.FieldNo(Blocked)) and (DestinationFieldRef.Number() = CRMAccount.FieldNo(TKA_Blocked)):
                begin
                    TempOption := SourceFieldRef.Value();
                    case TempOption of
                        Customer.Blocked::All.AsInteger():
                            NewValueVariant := CRMAccount.TKA_Blocked::All;
                        Customer.Blocked::Invoice.AsInteger():
                            NewValueVariant := CRMAccount.TKA_Blocked::Invoice;
                        Customer.Blocked::Ship.AsInteger():
                            NewValueVariant := CRMAccount.TKA_Blocked::Ship;
                        else
                            NewValueVariant := CRMAccount.TKA_Blocked::" ";
                    end;
                    IsValueFound := true;
                    NeedsConversion := false;
                end;
        end;
    end;

    local procedure UpdateCustomerFromCRMAccountOnTransferFieldData(SourceFieldRef: FieldRef; DestinationFieldRef: FieldRef; var NewValueVariant: Variant; var IsValueFound: Boolean; var NeedsConversion: Boolean)
    var
        Customer: Record Customer;
        CRMAccount: Record "CRM Account";
        TempOption: Integer;
    begin
        case true of
            (SourceFieldRef.Number() = CRMAccount.FieldNo(TKA_Blocked)) and (DestinationFieldRef.Number() = Customer.FieldNo(Blocked)):
                begin
                    TempOption := SourceFieldRef.Value();
                    case TempOption of
                        CRMAccount.TKA_Blocked::All:
                            NewValueVariant := Customer.Blocked::All;
                        CRMAccount.TKA_Blocked::Invoice:
                            NewValueVariant := Customer.Blocked::Invoice;
                        CRMAccount.TKA_Blocked::Ship:
                            NewValueVariant := Customer.Blocked::Ship;
                        else
                            NewValueVariant := Customer.Blocked::" ";
                    end;
                    IsValueFound := true;
                    NeedsConversion := false;
                end;
        end;
    end;

    local procedure UpdateCRMAccountFromVendorOnTransferFieldData(SourceFieldRef: FieldRef; DestinationFieldRef: FieldRef; var NewValueVariant: Variant; var IsValueFound: Boolean; var NeedsConversion: Boolean)
    var
        Vendor: Record Vendor;
        CRMAccount: Record "CRM Account";
        TempOption: Integer;
    begin
        case true of
            (SourceFieldRef.Number() = Vendor.FieldNo(Blocked)) and (DestinationFieldRef.Number() = CRMAccount.FieldNo(TKA_Blocked)):
                begin
                    TempOption := SourceFieldRef.Value();
                    case TempOption of
                        Vendor.Blocked::All.AsInteger():
                            NewValueVariant := CRMAccount.TKA_Blocked::All;
                        Vendor.Blocked::Payment.AsInteger():
                            NewValueVariant := CRMAccount.TKA_Blocked::Payment;
                        else
                            NewValueVariant := CRMAccount.TKA_Blocked::" ";
                    end;
                    IsValueFound := true;
                    NeedsConversion := false;
                end;
        end;
    end;

    local procedure UpdateVendorFromCRMAccountOnTransferFieldData(SourceFieldRef: FieldRef; DestinationFieldRef: FieldRef; var NewValueVariant: Variant; var IsValueFound: Boolean; var NeedsConversion: Boolean)
    var
        Vendor: Record Vendor;
        CRMAccount: Record "CRM Account";
        TempOption: Integer;
    begin
        case true of
            (SourceFieldRef.Number() = CRMAccount.FieldNo(TKA_Blocked)) and (DestinationFieldRef.Number() = Vendor.FieldNo(Blocked)):
                begin
                    TempOption := SourceFieldRef.Value();
                    case TempOption of
                        CRMAccount.TKA_Blocked::All:
                            NewValueVariant := Vendor.Blocked::All;
                        CRMAccount.TKA_Blocked::Payment:
                            NewValueVariant := Vendor.Blocked::Payment;
                        else
                            NewValueVariant := Vendor.Blocked::" ";
                    end;
                    IsValueFound := true;
                    NeedsConversion := false;
                end;
        end;
    end;
}