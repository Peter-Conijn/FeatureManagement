table 50100 "Data Upgrade"
{
    Access = Internal;
    Caption = 'Data Upgrade';
    DataClassification = SystemMetadata;

    fields
    {
        field(1; "Feature ID"; Text[50])
        {
            Caption = 'Feature ID';
        }
        field(2; "Source Table"; Integer)
        {
            Caption = 'Source Table';
        }
        field(3; "Source Field"; Integer)
        {
            Caption = 'Source Field';
        }
        field(4; "Source Data Datatype"; Enum "Field Datatype")
        {
            Caption = 'Source Data Datatype';
        }
        field(10; "Destination Table"; Integer)
        {
            Caption = 'Destination Table';
        }
        field(11; "Destination Field"; Integer)
        {
            Caption = 'Destination Field';
        }
        field(12; "Destination Datatype"; Enum "Field Datatype")
        {
            Caption = 'Destination Datatype';
        }
    }
    keys
    {
        key(PK; "Feature ID", "Source Table", "Source Field")
        {
            Clustered = true;
        }
    }
    local procedure MyProcedure()
    var
        myInt: Record Field;
    begin

    end;
}
