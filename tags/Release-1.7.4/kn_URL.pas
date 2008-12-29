unit kn_URL;

(* ************************************************************
 KEYNOTE: MOZILLA PUBLIC LICENSE STATEMENT.
 -----------------------------------------------------------
 The contents of this file are subject to the Mozilla Public
 License Version 1.1 (the "License"); you may not use this file
 except in compliance with the License. You may obtain a copy of
 the License at http://www.mozilla.org/MPL/

 Software distributed under the License is distributed on an "AS
 IS" basis, WITHOUT WARRANTY OF ANY KIND, either express or
 implied. See the License for the specific language governing
 rights and limitations under the License.

 The Original Code is KeyNote 1.0.

 The Initial Developer of the Original Code is Marek Jedlinski
 <marekjed@pobox.com> (Poland).
 Portions created by Marek Jedlinski are
 Copyright (C) 2000, 2001. All Rights Reserved.
 -----------------------------------------------------------
 Contributor(s):
 -----------------------------------------------------------
 History:
 -----------------------------------------------------------
 Released: 30 June 2001
 -----------------------------------------------------------
 URLs:

 - for OpenSource development:
 http://keynote.sourceforge.net

 - original author's software site:
 http://www.lodz.pdi.net/~eristic/free/index.html
 http://go.to/generalfrenetics

 Email addresses (at least one should be valid)
 <eristic@lodz.pdi.net>
 <cicho@polbox.com>
 <cicho@tenbit.pl>

************************************************************ *)


interface

uses
  Windows, Messages, SysUtils,
  Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls,
  registry, gf_misc, kn_Info;

type
  TForm_URLAction = class(TForm)
    Button_Copy: TButton;
    Button_Cancel: TButton;
    Label1: TLabel;
    Button_Open: TButton;
    Button_OpenNew: TButton;
    Edit_URL: TEdit;
    Label2: TLabel;
    Edit_TextURL: TEdit;
    Button_Modify: TButton;
    procedure Edit_URLExit(Sender: TObject);
    procedure Button_ModifyClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button_CopyClick(Sender: TObject);
    procedure Button_OpenClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button_OpenNewClick(Sender: TObject);
    procedure Label_URLClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    URLAction : TURLAction;
    AllowURLModification: boolean;      // URL, not the text associated
  end;


function FileNameToURL( fn : string ) : string;
function HTTPDecode(const AStr: String): String;
function HTTPEncode(const AStr: String): String;

function StripFileURLPrefix( const AStr : string ) : string;

implementation
uses
  RxRichEd;

{$R *.DFM}

function FileNameToURL( fn : string ) : string;
var
  i : integer;
begin
  result := '';
  for i := 1 to length( fn ) do
  begin
    if  ( fn[i] in [' ', '%', '|'] ) then
    begin
      result := result + '%' + IntToHex( ord( fn[i] ), 2 );
    end
    else
    begin
      result := result + fn[i];
    end;
  end;
end; // FileNameToURL


function HTTPDecode(const AStr: String): String;
// source: Borland Delphi 5
var
  Sp, Rp, Cp: PChar;
begin
  SetLength(Result, Length(AStr));
  Sp := PChar(AStr);
  Rp := PChar(Result);
  while Sp^ <> #0 do
  begin
    if not (Sp^ in ['+','%']) then
      Rp^ := Sp^
    else
      begin
        inc(Sp);
        if Sp^ = '%' then
          Rp^ := '%'
        else
        begin
          Cp := Sp;
          Inc(Sp);
          Rp^ := Chr(StrToInt(Format('$%s%s',[Cp^, Sp^])));
        end;
      end;
    Inc(Rp);
    Inc(Sp);
  end;
  SetLength(Result, Rp - PChar(Result));
end;

function HTTPEncode(const AStr: String): String;
// source: Borland Delphi 5, **modified**
const
  NoConversion = ['A'..'Z','a'..'z','*','@','.','_','-', '/', '?',
                  '0'..'9','$','!','''','(',')'];
var
  Sp, Rp: PChar;
begin
  SetLength(Result, Length(AStr) * 3);
  Sp := PChar(AStr);
  Rp := PChar(Result);
  while Sp^ <> #0 do
  begin
    if Sp^ in NoConversion then
      Rp^ := Sp^
    else
      begin
        FormatBuf(Rp^, 3, '%%%.2x', 6, [Ord(Sp^)]);
        Inc(Rp,2);
      end;
    Inc(Rp);
    Inc(Sp);
  end;
  SetLength(Result, Rp - PChar(Result));
end;



procedure TForm_URLAction.FormCreate(Sender: TObject);
begin
  URLAction := low( urlOpen );
  // Label_URL.Font.Color := clBlue;
  // Label_URL.Font.Style := [fsUnderline];
  Edit_URL.Font.Name := 'Verdana';
  // Edit_URL.Font.Style := [fsBold];
  if ( Edit_URL.Font.Size < 10 ) then
      Edit_URL.Font.Size := 10;

  Edit_TextURL.Font.Name := 'Verdana';
  if ( Edit_TextURL.Font.Size < 10 ) then
      Edit_TextURL.Font.Size := 10;

  if RichEditVersion < 4 then begin
    Edit_TextURL.Enabled := false;
    label2.Enabled := false;
  end;
  AllowURLModification:= True;
end;

procedure TForm_URLAction.Button_CopyClick(Sender: TObject);
begin
  URLAction := urlCopy;
end;

procedure TForm_URLAction.Button_ModifyClick(Sender: TObject);
begin
     URLAction := urlCreateOrModify;
end;

procedure TForm_URLAction.Button_OpenClick(Sender: TObject);
begin
  URLAction := urlOpen;
end;

procedure TForm_URLAction.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    27 : if ( shift = [] ) then
    begin
      key := 0;
      Close;
    end;
  end;
end;

procedure TForm_URLAction.FormShow(Sender: TObject);
begin

   // Look to the default, initial action
     if URLAction = urlCreateOrModify then begin
        Button_Copy.Visible := false;
        Button_Open.Visible := false;
        Button_OpenNew.Visible := false;
        Button_Modify.Caption := 'OK';
        Button_Modify.Default := true;
        Caption:= 'Create Hyperlink';
     end
     else begin
        Button_Copy.Visible := true;
        Button_Open.Visible := true;
        Button_OpenNew.Visible := true;
        Button_Modify.Caption := 'Modify';
        Button_Open.Default := true;
        Caption:= 'Choose Action for Hyperlink';
     end;

      if AllowURLModification then begin
        Edit_URL.ReadOnly:= False;
        Edit_URL.SetFocus;
        Edit_URL.SelectAll;
      end
      else begin
        Edit_URL.Text:= '(KNT Location) ' + Edit_URL.Text;
        Edit_URL.ReadOnly:= True;
        Edit_TextURL.SetFocus;
        Edit_TextURL.SelectAll;
      end;

end;

// KEY DOWN


procedure TForm_URLAction.Button_OpenNewClick(Sender: TObject);
begin
  URLAction := urlOpenNew;
end;


procedure TForm_URLAction.Edit_URLExit(Sender: TObject);
var
  cad: string;
begin
 if Edit_TextURL.Text = '' then begin
    cad:= Edit_URL.Text;
    if ( pos('(KNT Location)', cad) = 1 ) then
        delete( cad, 1, length( '(KNT Location)' ));

    Edit_TextURL.Text := trim(cad);
 end;
end;

procedure TForm_URLAction.Label_URLClick(Sender: TObject);
begin
  if ShiftDown then
    URLAction := urlOpenNew
  else
    URLAction := urlOpen;
  ModalResult := mrOK;
end;

function StripFileURLPrefix( const AStr : string ) : string;
const
  FILEPREFIX = 'file:';
begin
  result := AStr;
  if ( pos( FILEPREFIX, lowercase( result )) = 1 ) then
  begin
    delete( result, 1, length( FILEPREFIX ));
    while ( result <> '' ) and ( result[1] = '/' ) do
      delete( result, 1, 1 );
  end;
end; // StripFileURLPrefix

end.
