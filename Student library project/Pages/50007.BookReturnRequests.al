/// <summary>
/// Page Book Return Request (ID 50007).
/// </summary>
page 50007 "Book Return Requests"
{
    ApplicationArea = All;
    Caption = 'Book Return Requests';
    PageType = List;
    SourceTable = BookRequestHeader;
    UsageCategory = Lists;
    CardPageId = 50008;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Document-No"; Rec."Document-No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document-No field.';
                }
                field("Document-Type"; Rec."Document-Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document-Type field.';
                }
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
                field("No-Series"; Rec."No-Series")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No-Series field.';
                }
            }
        }
    }
}
