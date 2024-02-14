namespace RedRabbit.FeatureManagement.Features;

table 50101 Feature
{
    Access = Internal;
    Caption = 'Feature';
    DataClassification = SystemMetadata;

    fields
    {
        field(1; ID; Text[50])
        {
            Caption = 'ID';
        }
        field(2; Enabled; Enum "Feature Status")
        {
            Caption = 'Enabled';
        }
        field(3; Description; Text[2048])
        {
            Caption = 'Description';
        }
        field(4; "Learn More Link"; Text[2048])
        {
            Caption = 'Learn more';
        }
        field(5; "Mandatory By"; Text[2048])
        {
            Caption = 'Approximately Mandatory by Version';
        }
        field(6; "Can Try"; boolean)
        {
            Caption = 'Get started';
        }
        field(7; "Is One Way"; Boolean)
        {
            Caption = 'Is One Way';
        }
        field(8; "Data Update Required"; Boolean)
        {
            Caption = 'Data Update Required';
        }
    }
    keys
    {
        key(PK; "ID")
        {
            Clustered = true;
        }
    }

    trigger OnDelete()
    var
        DataUpgrade: Record "Data Upgrade";
    begin
        DataUpgrade.SetRange("Feature ID", ID);
        if not DataUpgrade.IsEmpty() then
            DataUpgrade.DeleteAll(true);
    end;
}
