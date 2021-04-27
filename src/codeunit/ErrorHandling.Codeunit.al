codeunit 50101 "AIR Error Handling"
{
    TableNo = "AIR MyItemEntity";

    trigger OnRun()
    begin
        LogError(Rec);
        ClearLastError();
    end;

    procedure LogError(var MyItemEntity: Record "AIR MyItemEntity")
    var
        ErrorLogEntry: Record "AIR Error Log Entry";
        RecRef: RecordRef;
    begin
        RecRef.GetTable(MyItemEntity);
        ErrorLogEntry.LogError(MyItemEntity.SystemId);
    end;
}
