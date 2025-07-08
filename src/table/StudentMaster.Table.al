/// <summary>
/// Table StudentMaster (ID 50000).
/// </summary>
table 50000 StudentMaster
{
    DataClassification = CustomerContent;
    DataCaptionFields = "Roll-No.", "Student-Name";
    LookupPageId = "Student Masters";
    Caption = 'Student Master';

    fields
    {
        field(1; "Roll-No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Roll-No.';

            trigger OnValidate()
            begin
                if "Roll-No." <> xRec."Roll-No." then begin
                    LibrarySetupRec.Get();
                    NoSeries.TestManual(LibrarySetupRec."Student No");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Student-Name"; Text[250])
        {
            DataClassification = ToBeClassified;
            Caption = 'Student-Name';
        }
        field(3; "Department-Code"; code[20])
        {
            TableRelation = Department;
            Caption = 'Department-Code';

            trigger OnValidate()
            var
                DeptRec: Record Department;
            begin
                DeptRec.SetRange("Dept-Code", "Department-Code");
                if DeptRec.FindFirst() then
                    Rec.Validate("Department-Name", DeptRec."Dept-Name");
            end;
        }
        field(4; "Department-Name"; Text[250])
        {
            DataClassification = ToBeClassified;
            Caption = 'Department-Name';
        }
        field(5; "Address"; Text[250])
        {
            DataClassification = ToBeClassified;
            Caption = 'Address';
        }
        field(6; "Phone-No"; Text[14])
        {
            DataClassification = ToBeClassified;
            Caption = 'Phone-No';
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
            Caption = 'No-of-Book-Taken';
        }
        field(8; "No-of-Book-Pending"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'No-of-Book-Pending';
        }
        field(9; "Document-No"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Document-No';
        }
        field(10; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
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

    trigger OnInsert()
    begin
        InsertNoSeries();
    end;


    local procedure InsertNoSeries()
    begin
        if "Roll-No." = '' then begin
            LibrarySetupRec.Get();
            LibrarySetupRec.TestField("Student No");

            if NoSeries.AreRelated(LibrarySetupRec."Student No", xRec."No. Series") then
                "No. Series" := "No. Series"
            else
                "No. Series" := LibrarySetupRec."Student No";

            "Roll-No." := NoSeries.GetNextNo("No. Series");
            StudentMasterRec.readIsolation(IsolationLevel::ReadUncommitted);
            StudentMasterRec.SetLoadFields("Roll-No.");
            while StudentMasterRec.Get("Roll-No.") do
                "Roll-No." := NoSeries.GetNextNo("No. Series");
        end;
    end;

    procedure AssistEdit() Result: Boolean
    begin
        LibrarySetupRec.Get();
        LibrarySetupRec.TestField("Student No");
        if NoSeries.LookupRelatedNoSeries(LibrarySetupRec."Student No", xRec."No. Series", "No. Series") then begin
            "Roll-No." := NoSeries.GetNextNo("No. Series");
            exit(true);
        end;
    end;


    var
        LibrarySetupRec: Record "Library Setup";
        StudentMasterRec: Record StudentMaster;
        NoSeries: Codeunit "No. Series";

}