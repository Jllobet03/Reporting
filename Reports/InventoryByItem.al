report 50100 InventoryByItem
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Inventory By Item 2';
    RDLCLayout = './src/CustomerList.rdl';

    dataset
    {
        dataitem(Item; Item)
        {
            column(ItemNo; "No.")
            {
                IncludeCaption = true;
            }
            column(Description; Description)
            {
                IncludeCaption = true;
            }
            column(Inventory; Inventory)
            {
                IncludeCaption = true;
            }
        }
    }
}