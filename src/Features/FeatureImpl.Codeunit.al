namespace RedRabbit.FeatureManagement.Features;

codeunit 50101 "Feature Impl."
{
    Access = Internal;

    InherentEntitlements = X;
    InherentPermissions = X;

    Permissions = tabledata Feature = RIMD;

    procedure AddNewFeature(FeatureId: Text[50]; Description: Text[250]; DefaultState: Enum "Feature Status"; CanTry: Boolean; DataUpdateRequired: Boolean; MandatoryBy: Text[2048]);
    var
        Feature: Record Feature;
        FeatureTok: Label 'Feature: %1', Locked = true;
    begin
        if not Feature.Get(FeatureId) then begin
            Feature.Init();
            Feature."ID" := FeatureId;
            Feature.Insert(true);
        end;

        Feature.Description := StrSubstNo(FeatureTok, Description);
        Feature.Enabled := DefaultState;
        Feature."Can Try" := CanTry;
        Feature."Data Update Required" := DataUpdateRequired;
        Feature."Mandatory By" := MandatoryBy;
        Feature.Modify(true);
    end;

    procedure AddFeatureUpdate(FeatureId: Text[50]; Description: Text[250]; DefaultState: Enum "Feature Status"; CanTry: Boolean; DataUpdateRequired: Boolean; MandatoryBy: Text[2048]);
    var
        Feature: Record Feature;
        FeatureUpdateTok: Label 'Feature Update: %1', Locked = true;
    begin
        if not Feature.Get(FeatureId) then
            exit;

        Feature.Description := StrSubstNo(FeatureUpdateTok, Description);
        Feature.Enabled := DefaultState;
        Feature."Can Try" := CanTry;
        Feature."Data Update Required" := DataUpdateRequired;
        Feature."Mandatory By" := MandatoryBy;
        Feature.Modify(true);
    end;

    procedure RemoveFeature(FeatureId: Text[50]);
    var
        Feature: Record Feature;
    begin
        if Feature.Get(FeatureId) then
            Feature.Delete(true);
    end;
}