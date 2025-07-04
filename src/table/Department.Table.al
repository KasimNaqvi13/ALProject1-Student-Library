/// <summary>
/// Table Department (ID 50005).
/// </summary>
table 50005 Department
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Dept-Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Dept-Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Dept-Code")
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

}