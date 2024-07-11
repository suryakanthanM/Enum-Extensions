enumextension 50104 MyEnumExtension extends "Sales Line Type"
{
    value(50104; Greetings)
    {
        Caption = 'Set Job';
    }
}

codeunit 50105 "Sales Orders subline Subscribe"
{
    [EventSubscriber(ObjectType::Table, Database::"Option Lookup Buffer", 'OnBeforeIncludeOption', '', true, true)]
    local procedure OnBeforeIncludeOption(OptionLookupBuffer: Record "Option Lookup Buffer"; LookupType: Option; Option: Integer; var Handled: Boolean; var Result: Boolean; RecRef: RecordRef)
    begin
        if (LookupType = 0) or (Option = 50105) or (RecRef.Number = 37) then begin
            Handled := True;
            Result := True;
        end;
    end;
    
    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnBeforeValidateNo', '', True, True)]
   local procedure OnBeforeValidateNo(var SalesLine: Record "Sales Line"; xSalesLine: Record "Sales Line"; CurrentFieldNo: Integer; var IsHandled: Boolean)
    begin
        if SalesLine.Type = SalesLine.Type::Greetings then
            IsHandled := true;
    end;
}

tableextension 50107 Saleslineext extends "Sales Line"
{
    fields
    {
        modify("No.")
        {
            TableRelation = If (Type = const(Greetings)) Job."No.";
            trigger OnAfterValidate()
            var
                Job: Record Job;
            begin
                if Type = Type::Greetings Then begin
                    Job.get("No.");
                    Rec.Validate(Description,Job.Description);
                end;
                
            end;
        }
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
}
