/// <summary>
/// Unknown germaine.
/// </summary>
namespace germaine.Pruebas2025;
using Microsoft.Foundation.Comment;


pageextension 75901 purchOrderExt extends Microsoft.Purchases.Document."Purchase Order Subform"
{
    layout
    {
        modify("Item Reference No.")
        {
            trigger OnLookup(var Text: Text): Boolean
            var
                ItemReference: Record Microsoft.Inventory.Item.Catalog."Item Reference";
            begin
                if Page.RunModal(5735, ItemReference) = Action::LookupOK then begin
                    // Primero asignamos el valor antes de la validación
                    Rec."Item Reference No." := ItemReference."Reference No.";

                    // Luego validamos para aplicar cualquier lógica de Business Central
                    Rec.Validate("Item Reference No.");

                    // Asegurar que la página se actualiza después del cambio
                    CurrPage.Update();
                end;
                exit(true);
            end;

            //         trigger OnAfterValidate()
            //         var
            //             CommentLine: Record "Comment Line";
            //         begin
            //             if Rec."Item Reference No." <> '' then begin
            //                 CommentLine.SetRange("No.", Rec."No.");

            //                 if not CommentLine.IsEmpty() then begin
            //                     // Guardar antes de abrir
            //                     Rec.Modify(true);
            //                     Page.Run(Page::"Comment List", CommentLine);

            //                 end;
            //             end;
            //         end;
        }
    }
}
