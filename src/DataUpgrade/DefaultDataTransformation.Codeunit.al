codeunit 50107 "Default Data Transformation" implements "Data Transformation"
{
    Access = Internal;

    InherentEntitlements = X;
    InherentPermissions = X;

    procedure TransformData(FeatureId: Text[50])
    var
        DataUpgrade: Record "Data Upgrade";
    begin
        if FeatureId = '' then
            exit;

        DataUpgrade.SetRange("Feature ID", FeatureId);
        DataUpgrade.SetFilter("Source Table", '<>%1', 0);
        if not DataUpgrade.FindSet() then
            exit;

        repeat
            TrasnferFieldValues(DataUpgrade);
        until DataUpgrade.Next() = 0;
    end;

    local procedure TrasnferFieldValues(var DataUpgrade: Record "Data Upgrade")
    var
        SourceRecordRef: RecordRef;
        SourceFieldRef: FieldRef;
        DestinationRecordRef: RecordRef;
        DestinationFieldRef: FieldRef;
    begin
        SourceRecordRef.Open(DataUpgrade."Source Table");
        SourceFieldRef := SourceRecordRef.Field(DataUpgrade."Source Field");

        DestinationRecordRef.Open(DataUpgrade."Destination Table");
        DestinationFieldRef := DestinationRecordRef.Field(DataUpgrade."Destination Field");

        if not SourceRecordRef.FindSet() then
            exit;

        repeat
        // TODO - Add code to transfer field values
        until SourceRecordRef.Next() = 0;
    end;

}
