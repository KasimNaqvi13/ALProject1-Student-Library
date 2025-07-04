/// <summary>
/// Table BookMaster (ID 50001).
/// </summary>
table 50001 BookMaster
{
    Caption = 'BookMaster';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = '"Code"';
        }
        field(2; "Category"; Option)
        {
            Caption = '"Category"';
            OptionMembers = Fantasy,Horror,Fiction;

            trigger OnValidate()
            begin
                if Category = Category::Fantasy then
                    Rec.Validate("Max-Day-To-Return", 20)
                else
                    if Category = Category::Fiction then
                        Rec.Validate("Max-Day-To-Return", 10)
                    else
                        if Category = Category::Horror then
                            Rec.Validate("Max-Day-To-Return", 15);
            end;
        }
        field(3; "Description"; Text[250])
        {
            Caption = '"Description"';
        }
        field(4; "Max-Day-To-Return"; Integer)
        {
            Caption = '"Max-Day-To-Return"';
        }
        field(5; "Inventory"; Decimal)
        {
            Caption = '"Inventory"';
        }
        field(6; "Price"; Decimal)
        {
            Caption = '"Price"';
        }
        field(7; "Document-No"; Code[20])
        {
            Caption = '"Document-No"';
        }
        field(8; "No-Series"; Code[20])
        {
            Caption = '"No-Series"';
        }
    }
    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }



    var
        LibrarySetupRec: Record "Library Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;

    /// <summary>
    /// GenBookNo.
    /// </summary>
    procedure GenBookNo()
    begin
        if Code = '' then begin
            LibrarySetupRec.Get();
            LibrarySetupRec.TestField("Book No");
            NoSeriesMgt.InitSeries(LibrarySetupRec."Book No", xRec."No-Series", WorkDate(), Code, "No-Series");
        end;
    end;

    trigger OnInsert()
    begin
        GenBookNo();
    end;
}
