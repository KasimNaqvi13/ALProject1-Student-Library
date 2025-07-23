/// <summary>
/// Table StudentMaster (ID 50000).
/// </summary>
table 50000 StudentMaster
{
    DataClassification = CustomerContent;
    DataCaptionFields = "Student ID", "Student-Name";
    LookupPageId = "Student Masters";
    Caption = 'Student Master';

    fields
    {
        field(1; "Student ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            OptimizeForTextSearch = true;
            Caption = 'Roll-No.';

            trigger OnValidate()
            begin
                this.TestNoSeries();
            end;
        }
        field(2; "Student-Name"; Text[250])
        {
            OptimizeForTextSearch = true;
            DataClassification = CustomerContent;
            Caption = 'Student-Name';
        }

        field(3; "Date of Birth"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Date of Birth';
        }
        field(4; "Department-Code"; code[20])
        {
            TableRelation = Department;
            ValidateTableRelation = true;
            Caption = 'Department-Code';
            DataClassification = CustomerContent;
            trigger OnValidate()
            var
                DeptRec: Record Department;
            begin
                DeptRec.SetRange("Dept-Code", "Department-Code");
                if DeptRec.FindFirst() then
                    Rec.Validate("Department-Name", DeptRec."Dept-Name");
            end;
        }
        field(5; "Department-Name"; Text[250])
        {
            DataClassification = CustomerContent;
            Caption = 'Department-Name';
        }
        field(6; "Address"; Text[250])
        {
            DataClassification = CustomerContent;
            Caption = 'Address';
        }
        field(7; "Phone-No"; Text[14])
        {
            DataClassification = CustomerContent;
            Caption = 'Contact Number';
            OptimizeForTextSearch = true;
            ExtendedDatatype = PhoneNo;
            trigger OnValidate()
            var
                i: Integer;
                PhoneNoCannotContainLettersErr: Label 'must not contain letters';
                PhoneNoAlreadyInUseErr: Label 'you are trying to enter is already in use, please enter a valid Phone-No';
            begin
                for i := 1 to StrLen("Phone-No") do
                    if ("Phone-No"[i] in ['A' .. 'Z', 'a' .. 'z']) then
                        FieldError("Phone-No", PhoneNoCannotContainLettersErr);
                // Clear(RegEX);
                // Clear(Pattern);
                // Pattern := '^[0-9]{10}';
                // if RegEX.IsMatch(Rec."Phone-No", Pattern, 0) then begin
                //     "Phone-No" := '+91-' + Rec."Phone-No"; //--> need to take out this line cause this one brings diffrence by postcodes loctions
                StudentMasterRec.Reset();
                StudentMasterRec.SetRange("Phone-No", Rec."Phone-No");
                if StudentMasterRec.FindFirst() then
                    FieldError("Phone-No", PhoneNoAlreadyInUseErr);
            end;
        }
        field(8; "Registration Date"; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Registration Date';//workdate
        }
        // field(7; "No-of-Book-Taken"; Decimal)
        // {
        //     FieldClass = FlowField;
        //     CalcFormula = - sum(BookLedgerEntry.Quantity where("Roll-No" = field("Roll-No."), Quantity = filter(< 0)));
        // }
        // field(8; "No-of-Book-Pending"; Decimal)
        // {
        //     FieldClass = FlowField;
        //     CalcFormula = - sum(BookLedgerEntry.Quantity where("Roll-No" = field("Roll-No.")));
        // }
        field(11; "Document-No"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Document-No';
        }
        field(12; "No. Series"; Code[20])
        {
            OptimizeForTextSearch = true;
            DataClassification = SystemMetadata;
            Caption = 'No. Series';
            ToolTip = 'Specifies the number series used for student numbering.';
            TableRelation = "No. Series";
        }

        field(13; Image; Media)
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = Person; // around struture
        }

        field(14; "Country/Region"; Code[250])
        {
            DataClassification = ToBeClassified;
            Caption = 'Country/Region';
            TableRelation = "Country/Region";
            trigger OnValidate()
            begin
            end;
        }
        field(15; "State"; Code[20])
        {
            Caption = 'State';
            // TableRelation = "State/Province";
            DataClassification = ToBeClassified;
        }
        field(16; "PostCode"; Code[250])
        {
            DataClassification = ToBeClassified;
            TableRelation = if ("Country/Region" = const()) "Post Code" else
            if ("Country/Region" = filter(<> '')) "Post Code" where("Country/Region Code" = field("Country/Region"));
            trigger OnValidate()
            begin
                // PostCodeRec.ValidatePostCode(City, PostCode, "Student-Name", "Country/Region", false);
                // if PostCode = '' then begin
                //     Clear(City);
                //     Clear("Country/Region");
                //     Clear(state);
                // end;
                // PostCodeRec.Reset();
                // PostCodeRec.SetRange(Code, Rec.PostCode);
                // if PostCodeRec.FindSet() then
                //     Rec.state := PostCodeRec.State;
            end;
        }
        field(17; "City"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Student ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }
    #region triggers
    trigger OnInsert()
    begin
        InsertNoSeries();
    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;
    #endregion triggers


    #region No series
    local procedure InsertNoSeries()
    begin
        if "Student ID" = '' then begin
            LibrarySetupRec.Get();
            LibrarySetupRec.TestField("Student No");

            if NoSeries.AreRelated(LibrarySetupRec."Student No", xRec."No. Series") then
                "No. Series" := "No. Series"
            else
                "No. Series" := LibrarySetupRec."Student No";

            "Student ID" := NoSeries.GetNextNo("No. Series");
            StudentMasterRec.readIsolation(IsolationLevel::ReadUncommitted);
            StudentMasterRec.SetLoadFields("Student ID");
            while StudentMasterRec.Get("Student ID") do
                "Student ID" := NoSeries.GetNextNo("No. Series");
        end;
    end;

    procedure AssistEdit() Result: Boolean
    begin
        LibrarySetupRec.Get();
        LibrarySetupRec.TestField("Student No");
        if NoSeries.LookupRelatedNoSeries(LibrarySetupRec."Student No", xRec."No. Series", "No. Series") then begin
            "Student ID" := NoSeries.GetNextNo("No. Series");
            exit(true);
        end;
    end;

    local procedure TestNoSeries()
    begin
        if "Student ID" <> xRec."Student ID" then begin
            LibrarySetupRec.Get();
            NoSeries.TestManual(LibrarySetupRec."Student No");
            "No. Series" := '';
        end;
    end;
    #endregion No series


    #region Global Variables
    var
        LibrarySetupRec: Record "Library Setup";
        StudentMasterRec: Record StudentMaster;
        NoSeries: Codeunit "No. Series";
    #endregion Global Variables

}