/// <summary>
/// Page Library Setup (ID 50012).
/// </summary>
page 50012 "Library Setup"
{
    ApplicationArea = All;
    Caption = 'Library Setup';
    PageType = Card;
    SourceTable = "Library Setup";
    UsageCategory = Administration;
    InsertAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'Student and Book Setup';
                field("Student No"; Rec."Student No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Student No field.';
                }
                field("Book No"; Rec."Book No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Book No field.';
                }
                field("Book Pick No"; Rec."Book Pick No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Book Pick No field.';
                }
                field("Book Return No"; Rec."Book Return No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Book Return No field.';
                }
                field("No Series"; Rec."No Series")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No Series field.';
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.Reset();
        if not rec.Get() then begin
            Rec.Init();
            rec.Insert();
        end;
    end;
}
