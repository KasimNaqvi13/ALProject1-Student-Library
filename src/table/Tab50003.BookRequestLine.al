/// <summary>
/// Table BookRequestLine (ID 50003).
/// </summary>
table 50003 BookRequestLine
{
    Caption = 'BookRequestLine';
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
        field(3; "Line-No"; Integer)
        {
            Caption = 'Line-No';
        }
        field(4; "Student-No"; Code[20])
        {
            Caption = 'Student-No';
        }
        field(5; "Book-Code"; Code[20])
        {
            Caption = 'Book-Code';
            trigger OnValidate()
            begin
                BooKMas.SetRange(Code, "Book-Code");
                if BooKMas.FindFirst() then begin
                    Rec.Validate(Rec.Category, BooKMas.Category);
                    Rec.Validate(Rec.Description, BooKMas.Description);
                    Rec.Validate(Rec.Price, BooKMas.Price);
                end;
                ExpectedReturnDateFun();
            end;
        }
        field(6; Category; Option)
        {
            Caption = 'Category';
            OptionMembers = Fantasy,Horror,Fiction;
        }
        field(7; Description; Text[250])
        {
            Caption = 'Description';
        }
        field(8; Quantity; Decimal)
        {
            Caption = 'Quantity';
        }
        field(9; "Expected-Return-Date"; Date)
        {
            Caption = 'Expected-Return-Date';
        }
        field(10; "No-Series"; Code[20])
        {
            Caption = 'No-Series';
        }
        field(11; Price; Decimal)
        {
            Caption = 'Price';
        }
        field(12; "Borrowed-Date"; Date)
        {
            Caption = 'Borrowed-Date';
        }
        field(13; "Actual-Return-Date"; Date)
        {
            Caption = 'Actual-Return-Date';
        }
        field(14; "Available-Stock"; Decimal)
        {
            Caption = 'Available-Stock';
        }
    }
    keys
    {
        key(PK; "Document-No", "Document-Type", "Line-No")
        {
            Clustered = true;
        }
    }

    var
        BooKMas: Record BookMaster;
        BookReqHeader: Record BookRequestHeader;

    /// <summary>
    /// ExpectedReturnDateFun.
    /// </summary>
    Procedure ExpectedReturnDateFun()
    begin
        BookReqHeader.Reset();
        BookReqHeader.SetRange("Document-No", Rec."Document-No");
        if BookReqHeader.FindFirst() then begin
            BooKMas.Reset();
            BooKMas.SetRange(Code, "Book-Code");
            if BooKMas.FindFirst() then
                Rec.Validate("Expected-Return-Date", (BookReqHeader."Pick-Date" + BooKMas."Max-Day-To-Return"));
        end;
    end;
}
