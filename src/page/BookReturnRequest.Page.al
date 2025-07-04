/// <summary>
/// Page Book Return Request (ID 50008).
/// </summary>
page 50008 "Book Return Request"
{
    Caption = 'Book Return Request';
    PageType = Card;
    SourceTable = BookRequestHeader;
    SourceTableView = where("Document-Type" = const(Return));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("Student-No"; Rec."Student-No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Student-No field.';
                }
                field("Student-Name"; Rec."Student-Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Student-Name field.';
                }
                field("Return-Date"; Rec."Return-Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Return-Date field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
            part(BookReturn; "Book Return Request Subform")
            {
                SubPageLink = "Document-No" = field("Document-No");
            }
        }
        area(FactBoxes)
        {
            part(StudentMaster; "Student Master FactBox")
            {
                SubPageLink = "Roll-No." = field("Student-No");
            }
            part(BookMaster; "Book Master FactBox")
            {
                Provider = BookReturn;
                SubPageLink = Code = field("Book-Code");
            }

        }
    }
}
