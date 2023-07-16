tableextension 50000 "TKA CRM Account" extends "CRM Account"
{
    fields
    {
        field(50000; TKA_RegistrationNumber; Text[50])
        {
            ExternalName = 'tka_registrationnumber';
            ExternalType = 'String';
            Description = '';
            Caption = 'Registration No.';
            DataClassification = CustomerContent;
        }
    }
}