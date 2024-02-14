namespace RedRabbit.FeatureManagement.DataUpgrade;

codeunit 50106 "Data Upgrade Impl."
{
    Access = Internal;

    InherentEntitlements = X;
    InherentPermissions = X;

    Permissions = tabledata "Data Upgrade" = RIMD;

    procedure InsertDataUpgradeRule(FeatureId: Text[50]; SourceTableId: Integer; SourceFieldId: Integer; SourceDataType: Enum "Field Datatype"; DestinationTableId: Integer; DestinationFieldId: Integer; DestinationDataType: Enum "Field Datatype");
    var
        DataUpgrade: Record "Data Upgrade";
    begin
        if not DataUpgrade.Get(FeatureId, SourceTableId, SourceFieldId) then begin
            DataUpgrade.Init;
            DataUpgrade."Feature ID" := FeatureId;
            DataUpgrade."Source Table" := SourceTableId;
            DataUpgrade."Source Field" := SourceFieldId;
            DataUpgrade."Source Data Datatype" := SourceDataType;
            DataUpgrade.Insert(true);
        end;

        DataUpgrade."Destination Table" := DestinationTableId;
        DataUpgrade."Destination Field" := DestinationFieldId;
        DataUpgrade."Destination Datatype" := DestinationDataType;
        DataUpgrade.Modify(true);
    end;
}
