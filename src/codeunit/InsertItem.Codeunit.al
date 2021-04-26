codeunit 50100 "AIR InsertItem"
{
    TableNo = "AIR MyItemEntity";

    trigger OnRun()
    var
        Item: Record Item;
    begin
        Item.Insert(true);
        Item.Description := Rec.Description;
        Item.Modify(true);

        Rec.Delete();

        Sleep(10000);
    end;
}