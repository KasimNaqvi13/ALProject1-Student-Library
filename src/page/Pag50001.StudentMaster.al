/// <summary>
/// Page StudentMaster (ID 50001).
/// </summary>
page 50001 "Student Master"
{
    Caption = 'Student Master';
    PageType = Card;
    SourceTable = StudentMaster;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("Roll-No."; Rec."Roll-No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Roll-No. field.';
                }
                field("Student-Name"; Rec."Student-Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Student-Name field.';
                }
                field("Department-Code"; Rec."Department-Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Department-Code field.';
                }
                field("Department-Name"; Rec."Department-Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Department-Name field.';
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Address field.';
                }
                field("Phone-No"; Rec."Phone-No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Phone-No field.';
                }
                field("No-of-Book-Taken"; Rec."No-of-Book-Taken")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No-of-Book-Taken field.';
                }
                field("No-of-Book-Pending"; Rec."No-of-Book-Pending")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No-of-Book-Pending field.';
                }
                field("Document-No"; Rec."Document-No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document-No field.';
                }
                field("No-Series"; Rec."No-Series")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No-Series field.';
                }
            }
        }
    }
}
