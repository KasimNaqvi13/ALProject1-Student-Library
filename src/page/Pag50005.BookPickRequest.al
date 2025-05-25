/// <summary>
/// Page BookRequest (ID 50005).
/// </summary>
page 50005 "Book Pick Request"
{
    Caption = 'Book Pick Request';
    PageType = Card;
    SourceTable = BookRequestHeader;
    SourceTableView = where("Document-Type" = filter(Pick));
    RefreshOnActivate = true;

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
                field("Pick-Date"; Rec."Pick-Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Pick-Date field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
            // Line Page
            part(BookPickUp; "Book Pick Request Subform")
            {
                SubPageLink = "Document-No" = field("Document-No");
                UpdatePropagation = Both;
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
                Provider = BookPickUp;
                SubPageLink = Code = field("Book-Code");
            }
        }
    }
}
