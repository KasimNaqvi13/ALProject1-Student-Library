/// <summary>
/// Page Book Master FactBox (ID 50011).
/// </summary>
page 50011 "Book Master FactBox"
{
    Caption = 'Book Master FactBox';
    PageType = CardPart;
    SourceTable = BookMaster;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

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
            }
        }
    }
}
