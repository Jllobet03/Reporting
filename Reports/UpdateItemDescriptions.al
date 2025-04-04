report 50104 UpdateItemDescription
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Update Item Descriptions';
    ProcessingOnly = true;

    dataset
    {
        dataitem(Item; Item)
        {
            RequestFilterHeading = 'Item Selection';
            RequestFilterFields = "No.";

            trigger OnPreDataItem()
            begin
                Clear(UpdatedRecordsCount);
            end;

            trigger OnAfterGetRecord()
            begin
                UpdateDescription2(Item);
            end;

            /*             trigger OnPostDataItem()
                        begin
                            Message('%1 records were updated.', UpdatedRecordsCount);
                        end; */
        }
    }
    var
        UpdatedRecordsCount: Integer;

    procedure UpdateDescription2(var Item: Record Item)
    begin
        Item."Description 2" := CopyStr(Item.Description + ' [' + Item."No." + ']', 1, MaxStrLen(Item."Description 2"));
        Item.Modify(true);
        UpdatedRecordsCount += 1;
    end;

    trigger OnPostReport()
    begin
        Message('%1 records were updated.', UpdatedRecordsCount);
    end;
}