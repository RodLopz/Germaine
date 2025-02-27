/// <summary>
/// Unknown germaine.
/// </summary>
namespace germaine.Pruebas2025;

report 75903 IVAReport
///
/// <summary>
/// Gestión de accesos a páginas.
/// </summary>
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Lista entrada IVA';
    DefaultLayout = Excel;
    ExcelLayout = 'listaIVA.xlsx';

    dataset
    {
        dataitem("VAT Entry"; Microsoft.Finance.VAT.Ledger."VAT Entry")
        {
            DataItemTableView = sorting("Type", "Bill-to/Pay-to No.", "Posting Date");
            RequestFilterFields = "Posting Date";

            column(CIF; CIF) { }
            column(Nombre; Nombre) { }
            column(Trimestre; Trimestre) { }
            column(TotalFacturaAbono; TotalFacturaAbono) { }
            column(VATProdPostingGroup_VATEntry; "VAT Prod. Posting Group") { }

            trigger OnPreDataItem()
            begin
                SETFILTER("VAT Prod. Posting Group", 'IGIC*');
            end;

            trigger OnAfterGetRecord()
            var
                CustomerRec: Record Microsoft.Sales.Customer.Customer;
                VendorRec: Record Microsoft.Purchases.Vendor.Vendor;
                VATEntryAux: Record Microsoft.Finance.VAT.Ledger."VAT Entry";
                TotalAmountAux: Decimal;
            begin
                if CustomerRec.Get("Bill-to/Pay-to No.") then begin
                    CIF := CustomerRec."VAT Registration No.";
                    Nombre := CustomerRec.Name;
                end
                else if VendorRec.Get("Bill-to/Pay-to No.") then begin
                    CIF := VendorRec."VAT Registration No.";
                    Nombre := VendorRec.Name;
                end;

                case Date2DMY("Posting Date", 2) of
                    1 .. 3:
                        Trimestre := 'Q1';
                    4 .. 6:
                        Trimestre := 'Q2';
                    7 .. 9:
                        Trimestre := 'Q3';
                    10 .. 12:
                        Trimestre := 'Q4';
                end;

                if lastCIF = CIF then
                    CurrReport.SKIP()
                else begin
                    lastCIF := CIF;
                    VATEntryAux.RESET();
                    VATEntryAux.SETRANGE("Bill-to/Pay-to No.", "Bill-to/Pay-to No.");
                    VATEntryAux.SETFILTER("VAT Prod. Posting Group", 'IGIC*');
                    VATEntryAux.CalcSums(Amount);
                    TotalFacturaAbono := VATEntryAux.Amount;
                end;
            end;
        }
    }

    requestpage
    {
        Caption = 'Parámetros del Reporte';
        layout
        {
            area(content)
            {
                field(DateFilter; DateFilter)
                {
                    ApplicationArea = All;
                    Caption = 'Filtrar por Fecha';
                }
            }
        }
        trigger OnOpenPage()
        begin
            DateFilter := Today;
        end;
    }

    var
        DateFilter: Date;
        CIF: Code[20];
        Nombre: Text[100];
        Trimestre: Text[2];
        TotalFacturaAbono: Decimal;
        lastCIF: Code[20];
}