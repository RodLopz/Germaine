/// <summary>
/// Unknown germaine.
/// </summary>
namespace germaine.Pruebas2025;
using Microsoft.Sales.Document;
/// <summary>
/// Codeunit para gestionar suscripciones a accesos de páginas.
/// </summary>
codeunit 75908 "ControlAccesoDinamico"
{
    // Subtype = Normal;

    // /// <summary>
    // /// Evento global que se ejecuta antes de acceder a cualquier tabla.
    // /// </summary>
    // [EventSubscriber(ObjectType::Table, Database::Any, 'OnAfterGetRecord', '', false, false)]
    // local procedure VerificaAccesoGenerico(var RecVariant: Variant)
    // var
    //     AccesoRec: Record cabAcceso;
    //     CurrentUserId: Code[50];
    //     TableID: Integer;
    //     RecRef: RecordRef;
    // begin
    //     // Obtener el usuario actual
    //     CurrentUserId := USERID;

    //     // Convertir el Variant a RecordRef para obtener la Tabla
    //     if not RecRef.GetTable(RecVariant) then
    //         exit;

    //     // Obtener el ID de la tabla actual
    //     TableID := RecRef.Number;

    //     // Buscar si el usuario tiene acceso a la tabla en cabAcceso
    //     AccesoRec.SetRange("User ID", CurrentUserId);
    //     AccesoRec.SetRange(IDPagina, TableID);

    //     if not AccesoRec.FindFirst() then begin
    //         Error('No tiene permisos para acceder a la tabla con ID %1.', TableID);
    //     end;
    // end;
}
