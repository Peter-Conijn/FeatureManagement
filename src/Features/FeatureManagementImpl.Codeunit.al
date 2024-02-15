namespace RedRabbit.FeatureManagement.Features;

codeunit 50103 "Feature Management Impl."
{
    Access = Internal;

    InherentEntitlements = X;
    InherentPermissions = X;

    procedure GetFeatureEnabled(FeatureId: Text[50]): Boolean
    var
        Feature: Record "Feature";
    begin
        Feature.SetLoadFields("Enabled");
        if Feature.Get(FeatureId) then
            exit(Feature.Enabled = Enum::"Feature Status"::"All Users");
    end;

    procedure ChangeFeatureStatus(FeatureId: Text[50]; NewFeatureStatus: Enum "Feature Status")
    var
        FeatureEventRunner: Codeunit "Feature Event Runner";
    begin
        case NewFeatureStatus of
            Enum::"Feature Status"::"All Users":
                FeatureEventRunner.RunFeatureEnabledEvent(FeatureId);
            Enum::"Feature Status"::"None":
                begin
                    CheckDisableIsPossible(FeatureId);
                    FeatureEventRunner.RunFeatureDisabledEvent(FeatureId);
                end;
        end;
    end;

    local procedure CheckDisableIsPossible(FeatureId: Text[50])
    var
        Feature: Record Feature;
        OneWayErr: Label 'This feature cannot be disabled.';
    begin
        Feature.SetLoadFields("Is One Way");
        if Feature.Get(FeatureId) then
            if Feature."Is One Way" then
                Error(OneWayErr);
    end;
}
