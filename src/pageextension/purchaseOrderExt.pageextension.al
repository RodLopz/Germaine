namespace germaine.Pruebas2025;



pageextension 75901 purchOrderExt extends Microsoft.Purchases.Document."Purchase Order Subform"
{
    layout
    {
        modify("Item Reference No.")
        {
            ShowMandatory = not IsCommentLine;
        }
    }
}