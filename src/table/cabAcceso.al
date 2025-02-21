namespace germaine.Pruebas2025;

/// <summary>
/// Table cabAcceso (ID 75900).
/// </summary>
table 75900 cabAcceso
{
    Caption = 'Accesos';
    DataClassification = SystemMetadata;

    fields
    {
        field(1; "IDPagina"; Integer)
        {
            Caption = 'ID de Pagina';
            ToolTip = '';
        }

        field(2; "User ID"; Code[50])
        {
            Caption = 'ID Usuario';
            ToolTip = '';
            TableRelation = System.Security.AccessControl.User."User Security ID";

            trigger OnValidate()
            var
                User: Record System.Security.AccessControl.User;
            begin
                //rellena nombre userid
                if Rec."User ID" <> xRec."User ID" then begin
                    if User.Get(Rec."User ID") then
                        Rec.Validate(Nombre, User."User Name");
                end;
            end;
        }
        field(3; "Nombre"; Text[100])
        {
            Caption = 'Nombre';
            ToolTip = '';

        }
    }

    keys
    {
        key(PK; "User ID", IDPagina)
        {
            Clustered = true;
        }
    }
}