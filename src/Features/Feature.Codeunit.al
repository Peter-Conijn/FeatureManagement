namespace RedRabbit.FeatureManagement.Features;

/// <summary>
/// This codeunit is used to manage the features in the system.
/// </summary>
codeunit 50100 Feature
{
    Access = Public;

    InherentEntitlements = X;
    InherentPermissions = X;

    /// <summary>
    /// Adds a new feature with the specified parameters.
    /// </summary>
    /// <param name="FeatureId">The unique identifier of the feature.</param>
    /// <param name="Description">The description of the feature.</param>
    /// <param name="DefaultState">The default status of the feature.</param>
    /// <param name="CanTry">Specifies whether the feature can be tried.</param>
    /// <param name="DataUpdateRequired">Specifies whether data update is required for the feature.</param>
    /// <param name="MandatoryBy">The list of entities that make the feature mandatory.</param>
    procedure AddNewFeature(FeatureId: Text[50]; Description: Text[250]; DefaultState: Enum "Feature Status"; CanTry: Boolean; DataUpdateRequired: Boolean; MandatoryBy: Text[2048]);
    begin
        FeatureImpl.AddNewFeature(FeatureId, Description, DefaultState, CanTry, DataUpdateRequired, MandatoryBy);
    end;

    /// <summary>
    /// Adds an update to an existing feature with the specified parameters.
    /// </summary>
    /// <param name="FeatureId">The unique identifier of the feature.</param>
    /// <param name="Description">The description of the feature update.</param>
    /// <param name="DefaultState">The default status of the feature update.</param>
    /// <param name="CanTry">Specifies whether the feature update can be tried.</param>
    /// <param name="DataUpdateRequired">Specifies whether data update is required for the feature update.</param>
    /// <param name="MandatoryBy">The list of entities that make the feature update mandatory.</param>
    procedure AddFeatureUpdate(FeatureId: Text[50]; Description: Text[250]; DefaultState: Enum "Feature Status"; CanTry: Boolean; DataUpdateRequired: Boolean; MandatoryBy: Text[2048]);
    begin
        FeatureImpl.AddFeatureUpdate(FeatureId, Description, DefaultState, CanTry, DataUpdateRequired, MandatoryBy);
    end;

    /// <summary>
    /// Removes the feature with the specified identifier.
    /// </summary>
    /// <param name="FeatureId">The unique identifier of the feature to be removed.</param>
    procedure RemoveFeature(FeatureId: Text[50]);
    begin
        FeatureImpl.RemoveFeature(FeatureId);
    end;

    var
        FeatureImpl: Codeunit "Feature Impl.";
}