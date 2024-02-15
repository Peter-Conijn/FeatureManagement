/// <summary>
/// The data transformation interface
/// </summary>
interface "Data Transformation"
{
    /// <summary>
    /// Transforms the data for the given feature
    /// </summary>
    /// <param name="FeatureId">The feature id</param>
    procedure TransformData(FeatureId: Text[50]);
}
