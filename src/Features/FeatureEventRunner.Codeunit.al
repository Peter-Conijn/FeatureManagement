namespace RedRabbit.FeatureManagement.Features;

/// <summary>
/// This codeunit is used to run the feature enabled and disabled events.
/// You can subscribe to these events to run your own code when a feature is enabled or disabled.
/// </summary>
codeunit 50104 "Feature Event Runner"
{
    Access = Public;

    procedure RunFeatureEnabledEvent(FeatureId: Text[50])
    begin
        OnFeatureEnabled(FeatureId);
    end;

    procedure RunFeatureDisabledEvent(FeatureId: Text[50])
    begin
        OnFeatureDisabled(FeatureId);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnFeatureEnabled(FeatureId: Text[50])
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnFeatureDisabled(FeatureId: Text[50])
    begin
    end;
}
