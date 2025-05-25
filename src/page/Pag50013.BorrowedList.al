/// <summary>
/// Page Borrowed List (ID 50013).
/// </summary>
page 50013 "Borrowed List"
{
    PageType = List;
    ApplicationArea = All;
    Caption = 'Borrowed list';
    UsageCategory = Lists;
    SourceTable = BookLedgerEntry;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(select; select)
                {
                    ApplicationArea = All;

                }
                field("Roll-No"; Rec."Roll-No")
                {
                    ApplicationArea = all;
                }
                field("Book-Category"; Rec."Book-Category")
                {
                    ApplicationArea = all;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = all;
                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
            }
        }
    }
    var
        select: Boolean;
}