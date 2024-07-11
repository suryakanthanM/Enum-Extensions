pageextension 50103 Webclient extends "Customer List"
{


    actions
    {
        addfirst(processing)
        {
            action(openExternal)
            {
                Caption = 'Open External';
                ApplicationArea = All;
                trigger OnAction()
                var
                    S: Text;
                begin
                    S := format(Rec);
                    Message('Parm Length %1', StrLen(S));
                    Hyperlink('runfrombc:' + S);
                end;
            }
        }
    }

    var
        myInt: Integer;
}