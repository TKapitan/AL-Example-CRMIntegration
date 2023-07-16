tableextension 50000 "TKA CRM Account" extends "CRM Account"
{
    fields
    {
        field(50000; TKA_Blocked; Option)
        {
            ExternalName = 'tka_blocked';
            ExternalType = 'Picklist';
            Description = '';
            Caption = 'Blocked';
            OptionMembers = " ",Ship,Invoice,Payment,All;
            OptionOrdinalValues = 0, 350000000, 350000001, 350000002, 350000003;
            DataClassification = CustomerContent;
        }
    }
}