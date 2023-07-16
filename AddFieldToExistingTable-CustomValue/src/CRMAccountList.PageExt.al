pageextension 50000 "TKA CRM Account List" extends "CRM Account List"
{
    layout
    {
        addbefore(Coupled)
        {
            field(TKA_Blocked; Rec.TKA_Blocked)
            {
                ToolTip = 'Specifies data from a corresponding field in a Dataverse entity. For more information about Dataverse, see Dataverse Help Center.';
                ApplicationArea = All;
            }
        }
    }
}