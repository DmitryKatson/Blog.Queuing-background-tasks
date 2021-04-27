table 50101 "AIR Error Log Entry"
{
    Caption = 'Error Log Entry';

    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = true;
        }
        field(6; "DateTime"; DateTime)
        {
            Caption = 'Date/Time';
        }
        field(10; "Source SystemId"; Guid) { }
        field(12; "Error Message"; Text[1024]) { }
    }

    keys
    {
        key(PK; "Entry No.") { }
        key(DateTime; DateTime) { }
    }

    procedure LogError(SystemId: Guid)
    begin
        InsertLogEntry(SystemId);
    end;

    local procedure InsertLogEntry(SystemId: Guid)
    begin
        Rec.Init();
        Rec."Entry No." := 0;
        Rec.DateTime := CurrentDateTime;
        Rec."Source SystemId" := SystemId;
        Rec."Error Message" := CopyStr(GetLastErrorText, 1, MaxStrLen(Rec."Error Message"));
        Rec.Insert(true);
    end;
}