pagecustomization TheCEO_Custom customizes "Vendor List"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        moveafter(Orders; "Vendor - Top 10 List")
        modify(NewBlanketPurchaseOrder)
        {
            Visible = true;

        }
    }

    //Variables, procedures and triggers are not allowed on Page Customizations
}