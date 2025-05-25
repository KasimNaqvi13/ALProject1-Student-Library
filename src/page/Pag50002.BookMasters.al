/// <summary>
/// Page BookMasters (ID 50002).
/// </summary>
page 50002 "Book Masters"
{
    ApplicationArea = All;
    Caption = 'Book Masters';
    PageType = List;
    SourceTable = BookMaster;
    UsageCategory = Lists;
    CardPageId = 50003;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the "Code" field.';
                }
                field(Category; Rec.Category)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the "Category" field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the "Description" field.';
                }
                field("Max-Day-To-Return"; Rec."Max-Day-To-Return")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the "Max-Day-To-Return" field.';
                }
                field(Inventory; Rec.Inventory)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the "Inventory" field.';
                }
                field(Price; Rec.Price)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the "Price" field.';
                }
                field("Document-No"; Rec."Document-No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the "Document-No" field.';
                }
                field("No-Series"; Rec."No-Series")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the "No-Series" field.';
                }
            }
        }
    }
}
