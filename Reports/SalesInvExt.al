reportextension 50103 SalesInvExt extends "Standard Sales - Invoice"
{
    RDLCLayout = './src/StandardSalesInvoiceExtended.rdlc';
    dataset
    {
        add(Line)
        {
            column(Order_No_Line_lbl; Line.FieldCaption("Order No."))
            {}
            column(Order_No_Line; Line."Order No.")
            {}
            column(DisplayOrderInfo; DisplayOrderInfo)
            {}           
        }
        
    }
    
    requestpage
    {
        layout
        {
            addlast(Options)
            {
                field(DisplayOrderInfo;DisplayOrderInfo)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Show Order Information';
                    ToolTip = 'Specifies if you want Order Information to be shown on the document';
                }
            }
        }   
    }
     var
        DisplayOrderInfo: Boolean;
}