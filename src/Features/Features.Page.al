page 50100 Features
{
    ApplicationArea = All;
    Caption = 'Features';
    PageType = List;
    SourceTable = Feature;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies a description of the feature.';
                }
                field(Enabled; Rec.Enabled)
                {
                    ToolTip = 'Specifies whether the feature is active or disabled.';
                }
                field("Mandatory By"; Rec."Mandatory By")
                {
                    ToolTip = 'Specifies as of which version the feature is expected to be default.';
                }
            }
        }
    }
}
