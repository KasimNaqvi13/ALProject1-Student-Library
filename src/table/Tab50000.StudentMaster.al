/// <summary>
/// Table StudentMaster (ID 50000).
/// </summary>
table 50000 StudentMaster
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Roll-No."; Code[20])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if "Roll-No." <> xRec."Roll-No." then begin
                    LibrarySetupRec.Get();
                    NoSeriesMgt.TestManual(LibrarySetupRec."Student No");
                end;
            end;
        }
        field(2; "Student-Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Department-Code"; code[20])
        {
            TableRelation = Department;

            trigger OnValidate()
            var
            begin
                DeptRec.SetRange("Dept-Code", "Department-Code");
                if DeptRec.FindFirst() then
                    Rec.Validate("Department-Name", DeptRec."Dept-Name");
            end;
        }
        field(4; "Department-Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Address"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Phone-No"; Text[14])
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                if StrLen("Phone-No") <> 10 then
                    Error('Please enter valid 10 digit Phone as per indian standard');

                // Rec.Validate("Phone-No", ('+91-' + Rec."Phone-No"));
                // Rec.Validate("Phone-No", '+91-' + Rec."Phone-No");
                "Phone-No" := '+91-' + Rec."Phone-No";

                StudentMasterRec.SetRange("Phone-No", Rec."Phone-No");
                if StudentMasterRec.FindFirst() then
                    Error('The number you trying to enter is already in use, please enter valid Phone-No');
            end;
        }
        field(7; "No-of-Book-Taken"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "No-of-Book-Pending"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Document-No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "No-Series"; Code[20])
        {
            DataClassification = ToBeClassified;
        }


    }

    keys
    {
        key(Key1; "Roll-No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin
        GenStuNo();
    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

    var
        LibrarySetupRec: Record "Library Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        DeptRec: Record Department;
        StudentMasterRec: Record StudentMaster;

    /// <summary>
    /// GenStuNo.
    /// </summary>
    procedure GenStuNo()
    begin
        // generating student doc no number
        if rec."Roll-No." = '' then begin
            LibrarySetupRec.Get();
            LibrarySetupRec.TestField("Student No");
            NoSeriesMgt.InitSeries(LibrarySetupRec."Student No", xRec."No-Series", WorkDate(), "Roll-No.", "No-Series");
        end;
    end;


}