/// <summary>
/// The Data Transformation Factory is responsible for selecting the transformation method and returning an instance of the IDataTransformation interface.
/// </summary>
codeunit 50108 "Data Transformation Factory"
{
    Access = Public;

    InherentEntitlements = X;
    InherentPermissions = X;

    /// <summary>
    /// Selects the transformation method and returns an instance of the IDataTransformation interface.
    /// </summary>
    /// <returns>An instance of the IDataTransformation interface.</returns>
    procedure SelectTransformationMethod() IDataTransformation: Interface "Data Transformation"
    var
        DefaultDataTransformation: Codeunit "Default Data Transformation";
    begin
        IDataTransformation := DefaultDataTransformation;
        Initialized := true;

        OnAfterSelectTransformationMethod(IDataTransformation, Initialized);
    end;

    /// <summary>
    /// Checks if the data transformation factory has been initialized.
    /// </summary>
    /// <returns>True if the factory has been initialized, otherwise false.</returns>
    procedure IsInitalized(): Boolean
    begin
        exit(initialized);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterSelectTransformationMethod(var IDataTransformation: Interface "Data Transformation"; var Initialized: Boolean)
    begin
    end;

    var
        Initialized: Boolean;
}
