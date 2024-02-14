namespace RedRabbit.FeatureManagement.Features;

/// <summary>
/// This codeunit is used to handle various feature management operations.
/// </summary>
codeunit 50102 "Feature Management"
{
    Access = Public;

    InherentEntitlements = X;
    InherentPermissions = X;

    /// <summary>
    /// Retrieves the enabled status of a feature.
    /// </summary>
    /// <param name="FeatureId">The ID of the feature.</param>
    /// <returns>True if the feature is enabled, False otherwise.</returns>
    procedure GetFeatureEnabled(FeatureId: Text[50]): Boolean
    begin
        exit(FeatureManagementImpl.GetFeatureEnabled(FeatureId));
    end;

    /// <summary>
    /// Changes the status of a feature.
    /// </summary>
    /// <param name="FeatureId">The ID of the feature.</param>
    /// <param name="NewFeatureStatus">The new status of the feature.</param>
    procedure ChangeFeatureStatus(FeatureId: Text[50]; NewFeatureStatus: Enum "Feature Status")
    begin
        FeatureManagementImpl.ChangeFeatureStatus(FeatureId, NewFeatureStatus);
    end;

    var
        FeatureManagementImpl: Codeunit "Feature Management Impl.";
}
