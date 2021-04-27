codeunit 50100 "AIR InsertItem"
{
    TableNo = "AIR MyItemEntity";

    trigger OnRun()
    var
        Item: Record Item;
    begin
        Item.LockTable();
        Sleep(1000);

        Item.Insert(true);
        Item.Description := Rec.Description;
        Item.Modify(true);

        Rec.Delete();
    end;
}