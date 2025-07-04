/// <summary>
/// Page Departments (ID 50014).
/// </summary>
page 50014 Departments
{
    ApplicationArea = All;
    Caption = 'Departments';
    PageType = List;
    SourceTable = Department;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Dept-Code"; Rec."Dept-Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Dept-Code field.';
                }
                field("Dept-Name"; Rec."Dept-Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Dept-Name field.';
                }
            }
        }
    }
}
