/// <summary>
/// Table TempVATReport (ID 75901).
/// </summary>
table 75901 TempVATReporta
{
    DataClassification = ToBeClassified;
    fields
    {
        field(1; CIF; Code[20]) { DataClassification = ToBeClassified; }
        field(2; Nombre; Text[100]) { DataClassification = ToBeClassified; }
        field(3; Trimestre; Text[2]) { DataClassification = ToBeClassified; }
        field(4; TotalFacturaAbono; Decimal) { DataClassification = ToBeClassified; }
    }
    Keys
    {
        key(PK; CIF, Trimestre) { Clustered = true; }
    }


}