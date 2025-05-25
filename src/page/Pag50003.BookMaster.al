/// <summary>
/// Page BookMaster (ID 50003).
/// </summary>
page 50003 "Book Master"
{
    Caption = 'Book Master';
    PageType = Card;
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
            }
        }
    }
}
