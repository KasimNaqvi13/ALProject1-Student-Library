/// <summary>
/// Page Library Setup (ID 50012).
/// </summary>
page 50012 "Library Setup"
{
    ApplicationArea = All;
    Caption = 'Library Setup';
    PageType = List;
    SourceTable = "Library Setup";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Primary Key"; Rec."Primary Key")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Primary Key field.';
                    Editable = false;
                }
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
}
