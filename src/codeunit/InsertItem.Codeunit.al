codeunit 50100 "AIR InsertItem"
{
    TableNo = "AIR MyItemEntity";

    trigger OnRun()
    var
        Item: Record Item;
    begin
        Item.LockTable(false);
        Sleep(10000);

        Item.Insert(true);

        Item.Description := Rec.Description;
        Item.Modify(true);

        Rec.Delete();

        Item.LockTable(false);
        Sleep(10000);
    end;
}