/// <summary>
/// Page StudentMaster (ID 50001).
/// </summary>
page 50001 "Student Master"
{
    Caption = 'Student Master';
    PageType = Card;
    SourceTable = StudentMaster;
    DataCaptionFields = "Student ID", "Student-Name";
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("Student ID"; Rec."Student ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Student ID field.';
                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit() then
                            CurrPage.Update();
                    end;
                }
                field("Student-Name"; Rec."Student-Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Student-Name field.';
                }
                field("Date of Birth"; Rec."Date of Birth")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date of Birth field.', Comment = '%';
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
                field("Registration Date"; Rec."Registration Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Registration Date field.', Comment = '%';
                }
                field("No. Series"; Rec."No. Series")
                {
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. Series field.', Comment = '%';
                }
                // field("No-of-Book-Taken"; Rec."No-of-Book-Taken")
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies the value of the No-of-Book-Taken field.';
                // }
                // field("No-of-Book-Pending"; Rec."No-of-Book-Pending")
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies the value of the No-of-Book-Pending field.';
                // }
            }
            group("address & Contact")
            {
                Caption = 'Address & Contact';
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
                field("Country/Region"; Rec."Country/Region")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Country/Region field.', Comment = '%';
                }
                field(State; Rec.State)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the State field.', Comment = '%';
                }
                field(City; Rec.City)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the City field.', Comment = '%';
                }
                field(PostCode; Rec.PostCode)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the PostCode field.', Comment = '%';
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        RegisterationDate();
    end;

    local procedure RegisterationDate()
    begin
        if Rec."Registration Date" = 0D then
            Rec."Registration Date" := WorkDate();
    end;
}
