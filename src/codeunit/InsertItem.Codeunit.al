codeunit 50100 "AIR InsertItem"
{
    TableNo = "AIR MyItemEntity";

    trigger OnRun()
    var
        Item: Record Item;
    begin
        SimulateHardWorkThatLocksTheItem();

        Item.Insert(true);

        Item.Description := Rec.Description;
        Item.Modify(true);

        Rec.Delete();

        FindNextBackgroundTaskAndMarkAsReady();
    end;

    local procedure FindNextBackgroundTaskAndMarkAsReady();
    var
        ScheduledTask: Record "Scheduled Task";
    begin
        ScheduledTask.SetRange(Company, CompanyName);
        ScheduledTask.SetRange("Run Codeunit", Codeunit::"AIR InsertItem");
        ScheduledTask.SetRange("Is Ready", false);
        if not ScheduledTask.FindFirst() then
            exit;

        TaskScheduler.SetTaskReady(ScheduledTask.ID);
    end;


    local procedure SimulateHardWorkThatLocksTheItem()
    var
        Item: Record Item;
    begin
        Item.LockTable();
        if Item.FindFirst() then
            Sleep(15000);

        if Item.FindSet() then
            repeat

            until Item.Next() = 0;
    end;
}