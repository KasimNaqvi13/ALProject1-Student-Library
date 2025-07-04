/// <summary>
/// Table BookRequestHeader (ID 50002).
/// </summary>
table 50002 BookRequestHeader
{
    Caption = 'BookRequestHeader';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document-No"; Code[20])
        {
            Caption = 'Document-No';
        }
        field(2; "Document-Type"; Option)
        {
            Caption = 'Document-Type';
            OptionMembers = Pick,Return;
        }
        field(3; "Student-No"; Code[20])
        {
            Caption = 'Student-No';
            TableRelation = StudentMaster;

            trigger OnValidate()
            begin
                StuMast.SetRange("Roll-No.", "Student-No");
                if StuMast.FindFirst() then
                    Rec.Validate("Student-Name", StuMast."Student-Name");
            end;
        }
        field(4; "Student-Name"; Text[100])
        {
            Caption = 'Student-Name';
        }
        field(5; "Pick-Date"; Date)
        {
            Caption = 'Pick-Date';
        }
        field(6; "Return-Date"; Date)
        {
            Caption = 'Return-Date';
        }
        field(7; Status; Option)
        {
            Caption = 'Status';
            OptionMembers = Open,Closed;
        }
        field(8; "No-Series"; Code[20])
        {
            Caption = 'No-Series';
        }
    }
    keys
    {
        key(PK; "Document-No")
        {
            Clustered = true;
        }
    }

    var
        StuMast: Record StudentMaster;
        LibrarySetupRec: Record "Library Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;

    /// <summary>
    /// InitSeries.
    /// </summary>
    /// Genrating Pick and return document no 
    procedure InitSeries()
    begin
        if "Document-No" = '' then begin
            LibrarySetupRec.TestField("Book Pick No");
            LibrarySetupRec.TestField("Book Return No");
            NoSeriesMgt.InitSeries(GetNoSeries(), xRec."No-Series", WorkDate(), Rec."Document-No", "No-Series");
        end;
    end;

    /// <summary>
    /// GetNoSeries.
    /// </summary>
    /// <returns>Return value of type Code[20].</returns>
    procedure GetNoSeries(): Code[20]
    begin
        case "Document-Type" of
            rec."Document-Type"::Pick:
                exit(LibrarySetupRec."Book Pick No");
            Rec."Document-Type"::Return:
                exit(LibrarySetupRec."Book Return No");
        end;
    end;


    trigger OnInsert()
    var
    begin

        InitSeries();

        rec.Validate("Pick-Date", WorkDate());
        Rec.Validate("Return-Date", WorkDate());
    end;


}
