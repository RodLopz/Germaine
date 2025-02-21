namespace germaine.Pruebas2025;
/// <summary>
/// Codeunit para gestionar suscripciones a accesos de páginas.
/// </summary>
codeunit 75901 "Suscripciones"
{
    Subtype = Normal;

    [EventSubscriber(ObjectType::Page, Page::"cabAccesoList", 'OnOpenPageEvent', '', false, false)]
    local procedure compruebaAccesos(var Rec: Record cabAcceso)
    var
        AccesoRec: Record cabAcceso;
    begin
        AccesoRec.SetRange("User ID", UserId);
        AccesoRec.SetRange(IDPagina, Rec.IDPagina);

        if not AccesoRec.FindFirst() then begin
            Error('No tiene acceso a esta página en cabAccesoList.');
        end;
    end;
}
