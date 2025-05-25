/// <summary>
/// Table Library Setup (ID 50006).
/// </summary>
table 50006 "Library Setup"
{
    Caption = 'Library Setup';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Primary Key"; Code[20])
        {
            Caption = 'Primary Key';
            TableRelation = "No. Series";
        }
        field(2; "Student No"; Code[20])
        {
            Caption = 'Student No';
            TableRelation = "No. Series";
        }
        field(3; "Book No"; Code[20])
        {
            Caption = 'Book No';
            TableRelation = "No. Series";
        }
        field(4; "Book Pick No"; Code[20])
        {
            Caption = 'Book Pick No';
            TableRelation = "No. Series";
        }
        field(5; "Book Return No"; Code[20])
        {
            Caption = 'Book Return No';
            TableRelation = "No. Series";
        }
        field(6; "No Series"; Code[20])
        {
            Caption = 'No Series';
            TableRelation = "No. Series";
        }
    }
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}
