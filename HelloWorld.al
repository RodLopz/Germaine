// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

/// <summary>
/// Unknown DefaultPublisher.
/// </summary>
namespace DefaultPublisher.Germaine;

using Microsoft.Sales.Customer;

pageextension 75900 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    begin
        Message('App published: Hello world');
    end;
}