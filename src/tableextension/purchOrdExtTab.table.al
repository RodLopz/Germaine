namespace germaine.Pruebas2025;

tableextension 75902 purchOrderExtTab extends Microsoft.Purchases.Document."Purchase Line"
{
    fields
    {
        modify("Item Reference No.")
        {
            trigger OnAfterValidate()
            begin
                abrirPaginaComentarios(Rec."Item Reference No.");

            end;
        }
    }

    local procedure abrirPaginaComentarios(pSourceNo: Code[20])
    var
        commentLine: Record Microsoft.Foundation.Comment."Comment Line";
    begin
        commentLine.SetCurrentKey("Table Name", "No.");
        commentLine.SetRange("Table Name", commentLine."Table Name"::Item);
        commentLine.SetRange("No.", pSourceNo);
        if commentLine.IsEmpty then
            exit;
        Page.Run(Page::Microsoft.Foundation.Comment."Comment List", commentLine);
    end;
}
