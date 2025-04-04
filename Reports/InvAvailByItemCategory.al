report 50101 InventoryAvailByItemCategory
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Inventory Availability By Item Category';
    RDLCLayout = './src/InvAvailByItemCat.rdl';
    ExcelLayout = './src/InvAvailByItemCat.xlsx'; 

    dataset
    {
        dataitem(Item; Item)
        {
            DataItemTableView = where("Blocked" = const(false));
            column(Item_No; "No.")
            {
                IncludeCaption = true;
            }
            column(Description; Description)
            {
                IncludeCaption = true;
            }
            column(Item_Category; "Item Category Code")
            {
                IncludeCaption = true;
            }
            column(Inventory; Inventory)
            {
                IncludeCaption = true;
            }
            column(Availability; Inventory - "Qty. on Sales Order" + "Qty. on Purch. Order")
            {
            }

            dataitem(ItemCategory; "Item Category")
            {
                DataItemLink = Code = field("Item Category Code");
                column(ItemCategoryDescription; Description)

                {

                    IncludeCaption = true;

                }
            }
        }
    }

    labels
    {
        ItemInventoryAvailabilityLbl = 'Inventory and Availability, by Item Category';
        AvailabilityLbl = 'Availability';
    }
}