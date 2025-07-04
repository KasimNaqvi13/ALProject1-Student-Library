/// <summary>
/// Page Book Return Request Subform (ID 50009).
/// </summary>
page 50009 "Book Return Request Subform"
{
    Caption = 'Book Return Request Subform';
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
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Quantity field.';
                }
                field("Borrowed-Date"; Rec."Borrowed-Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Borrowed-Date field.';
                }
                field("Expected-Return-Date"; Rec."Expected-Return-Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Expected-Return-Date field.';
                }
                field("Actual-Return-Date"; Rec."Actual-Return-Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Actual-Return-Date field.';
                }
            }
        }
    }
}
