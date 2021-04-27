page 50100 "AIR MyItemEntity"
{
    PageType = API;
    Caption = 'MyItemEntity';
    APIPublisher = 'DmitryKatson';
    APIGroup = 'myItems';
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
        Rec.Insert(true); //save request to the staging table

        if TaskScheduler.CanCreateTask() then //run background task to create item
            TaskScheduler.CreateTask(Codeunit::"AIR InsertItem", Codeunit::"AIR Error Handling", true, CompanyName, 0DT, Rec.RecordId);

        exit(false);
    end;
}