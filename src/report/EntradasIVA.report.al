namespace germaine.Pruebas2025;

report 75903 IVAReport
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Lista entrada IVA';
    DefaultLayout = RDLC;
    RDLCLayout = 'listaIVA.rdlc';

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
            // column(EntryNo_VATEntry; "Entry No.") { }
            column(VATProdPostingGroup_VATEntry; "VAT Prod. Posting Group") { }
            // column(PostingDate_VATEntry; "Posting Date") { }
            // column(DocumentNo_VATEntry; "Document No.") { }
            // column(ExternalDocumentNo_VATEntry; "External Document No.") { }
            // column(Type_VATEntry; "Type") { }
            // column(BilltoPaytoNo_VATEntry; "Bill-to/Pay-to No.") { }
            // column(CountryRegionCode_VATEntry; "Country/Region Code") { }

            trigger OnPreDataItem()
            begin
                SETFILTER("VAT Prod. Posting Group", 'IGIC*');
            end;

            trigger OnAfterGetRecord()
            var
                CustomerRec: Record Microsoft.Sales.Customer.Customer;
                VendorRec: Record Microsoft.Purchases.Vendor.Vendor;
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


                TotalFacturaAbono += Amount;
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
}
