namespace RedRabbit.FeatureManagement.DataUpgrade;

/// <summary>
/// Codeunit for inserting data upgrade rules into the system.
/// </summary>
codeunit 50105 "Data Upgrade"
{
    Access = Public;

    InherentEntitlements = X;
    InherentPermissions = X;

    /// <summary>
    /// Inserts a data upgrade rule into the system.
    /// </summary>
    /// <param name="FeatureId">The ID of the feature associated with the data upgrade rule.</param>
    /// <param name="SourceTableId">The ID of the source table for the data upgrade rule.</param>
    /// <param name="SourceFieldId">The ID of the source field for the data upgrade rule.</param>
    /// <param name="SourceDataType">The data type of the source field.</param>
    /// <param name="DestinationTableId">The ID of the destination table for the data upgrade rule.</param>
    /// <param name="DestinationFieldId">The ID of the destination field for the data upgrade rule.</param>
    /// <param name="DestinationDataType">The data type of the destination field.</param>
    procedure InsertDataUpgradeRule(FeatureId: Text[50]; SourceTableId: Integer; SourceFieldId: Integer; SourceDataType: Enum "Field Datatype"; DestinationTableId: Integer; DestinationFieldId: Integer; DestinationDataType: Enum "Field Datatype");
    begin
        DataUpgradeImpl.InsertDataUpgradeRule(FeatureId, SourceTableId, SourceFieldId, SourceDataType, DestinationTableId, DestinationFieldId, DestinationDataType);
    end;

    // TODO: Add procedures for updating and deleting data upgrade rules.

    var
        DataUpgradeImpl: Codeunit "Data Upgrade Impl.";
}
