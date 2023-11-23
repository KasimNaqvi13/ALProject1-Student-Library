/// <summary>
/// Page Book Pick Request Subform (ID 50006).
/// </summary>
page 50006 "Book Pick Request Subform"
{
    Caption = 'Book Pick Request Subform';
    PageType = ListPart;
    SourceTable = BookRequestLine;

    layout
    {
        area(content)
        {
            repeater(General)
            {


                field("Book-Code"; Rec."Book-Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Book-Code field.';
                }
                field(Category; Rec.Category)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Category field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Available-Stock"; Rec."Available-Stock")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Available-Stock field.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Quantity field.';
                }
                field(Price; Rec.Price)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Price field.';
                }
                field("Expected-Return-Date"; Rec."Expected-Return-Date")
                {
                    ApplicationArea = all;
                }
            }
        }
    }
}
