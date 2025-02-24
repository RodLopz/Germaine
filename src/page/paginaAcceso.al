/// <summary>
/// Gestión de accesos a páginas.
/// </summary>
namespace germaine.Pruebas2025;

/// <summary>
/// Página de Lista para gestionar accesos a páginas (ID 75900).
/// </summary>
page 75900 "cabAccesoList"
{
    ApplicationArea = All;
    PageType = List;
    Caption = 'Accesos';
    SourceTable = cabAcceso;
    UsageCategory = Lists;
    AdditionalSearchTerms = 'AccesoPrueba, Permisos, Usuarios';

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Page ID"; Rec.IDPagina)
                {
                    Caption = 'ID de Página';
                }
                field("User ID"; Rec."User ID")
                {
                    Caption = 'ID de Usuario';
                }
                field("Page Name"; Rec.Nombre)
                {
                    Caption = 'Nombre de Página';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(GrantAccess)
            {
                Caption = 'Conceder Acceso';
                ApplicationArea = All;
                trigger OnAction()
                var
                    Acceso: Record cabAcceso;
                begin
                    // Verificamos si el acceso ya existe antes de insertarlo
                    Acceso.SetRange(IDPagina, Rec.IDPagina);
                    Acceso.SetRange("User ID", Rec."User ID");

                    if not Acceso.IsEmpty() then begin
                        Message('El usuario ya tiene acceso a esta página.');
                    end else begin
                        Acceso.Init();
                        Acceso.IDPagina := Rec.IDPagina;
                        Acceso."User ID" := Rec."User ID";
                        Acceso.Insert();
                        Message('Acceso concedido al usuario.');
                    end;
                end;
            }
        }
    }
}
