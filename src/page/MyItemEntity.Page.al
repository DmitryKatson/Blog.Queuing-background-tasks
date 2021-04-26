page 50100 "AIR MyItemEntity"
{
    PageType = API;
    Caption = 'MyItemEntity';
    APIPublisher = 'DmitryKatson';
    APIGroup = 'DmitryKatson';
    APIVersion = 'v1.0';
    EntityName = 'myItem';
    EntitySetName = 'myItems';
    SourceTable = "AIR MyItemEntity";
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
        Rec.Insert(true);

        if TaskScheduler.CanCreateTask() then
            TaskScheduler.CreateTask(Codeunit::"AIR InsertItem", 0, true, CompanyName, 0DT, Rec.RecordId);

        exit(false);
    end;
}