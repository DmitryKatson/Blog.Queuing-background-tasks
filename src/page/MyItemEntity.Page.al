page 50100 "AIR MyItemEntity"
{
    PageType = API;
    Caption = 'MyItemEntity';
    APIPublisher = 'DmitryKatson';
    APIGroup = 'myItems';
    APIVersion = 'v1.0';
    EntityName = 'myItem';
    EntitySetName = 'myItems';
    SourceTable = Item;
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            field(description; Rec.Description)
            {
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        DoInsertItemInRelaxMode();
        exit(false);
    end;

    local procedure DoInsertItemInRelaxMode()
    begin
        Rec.LockTable();
        Sleep(1000);

        Rec.Insert(true);
    end;
}