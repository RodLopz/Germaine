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
                begin
                    if Rec.FindSet() then begin
                        if Rec.Get(Rec.IDPagina, Rec."User ID") then begin
                            Message('El usuario ya tiene acceso a esta página.');
                        end else begin
                            Rec.Insert();
                            Message('Acceso concedido al usuario.');
                        end;
                    end;
                end;
            }
        }
    }
}