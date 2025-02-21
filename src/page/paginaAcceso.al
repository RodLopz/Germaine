/// <summary>
/// Unknown germaine.
/// </summary>
namespace germaine.Pruebas2025;
/// <summary>
/// Page cabAccesoList (ID 75900).
/// </summary>
page 75900 "cabAccesoList"
{
    ApplicationArea = All;
    PageType = List;
    Caption = 'Accesos';
    SourceTable = cabAcceso;
    UsageCategory = Administration;
    AdditionalSearchTerms = 'AccesoPrueba';

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Page ID"; Rec.IDPagina)
                {

                }
                field("User ID"; Rec."User ID")
                {

                }
                field("Page Name"; Rec.Nombre)
                {

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
                Caption = 'Grant Access';
                ApplicationArea = All;
                trigger OnAction()
                begin
                    Message('Acceso autorizado al usuario');
                end;
            }
        }
    }
}