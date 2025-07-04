/// <summary>
/// Table BookLedgerEntry (ID 50004).
/// </summary>
table 50004 BookLedgerEntry
{
    Caption = 'BookLedgerEntry';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry-No"; Integer)
        {
            Caption = 'Entry-No';
        }
        field(2; "Roll-No"; Code[20])
        {
            Caption = 'Roll-No';
        }
        field(3; "Student-Name"; Text[250])
        {
            Caption = 'Student-Name';
        }
        field(4; "Department-Code"; Code[20])
        {
            Caption = 'Department-Code';
        }
        field(5; "Department-Name"; Text[250])
        {
            Caption = 'Department-Name';
        }
        field(6; "Book-Category"; Date)
        {
            Caption = 'Book-Category';
        }
        field(7; "Borrowed-Date"; Date)
        {
            Caption = 'Borrowed-Date';
        }
        field(8; "Excepted-Return-Date"; Date)
        {
            Caption = 'Excepted-Return-Date';
        }
        field(9; "Actual-Return-Date"; Date)
        {
            Caption = 'Actual-Return-Date';
        }
        field(10; Quantity; Decimal)
        {
            Caption = 'Quantity';
        }
        field(11; "Reference-No"; Code[20])
        {
            Caption = 'Reference-No';
        }
        field(12; Select; Boolean)
        {
            Caption = 'Select';
        }
        field(13; "Document-No"; Code[20])
        {
            Caption = 'Document-No';
        }
        field(14; "Book-Code"; Code[20])
        {
            Caption = 'Book-Code';
        }
        field(15; "Book-Description"; Text[250])
        {
            Caption = 'Book-Description';
        }
    }
    keys
    {
        key(PK; "Entry-No")
        {
            Clustered = true;
        }
    }
}
