page 50101 "AIR Error Log Entries"
{
    Caption = 'Emydex Error Log Entries';
    PageType = List;
    SourceTable = "AIR Error Log Entry";
    SourceTableView = order(descending);
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                }
                field("DateTime"; Rec.DateTime)
                {
                    ApplicationArea = All;
                }

                field("Error Message"; Rec."Error Message")
                {
                    ApplicationArea = All;
                    Style = Attention;
                }
            }
        }
    }
}
