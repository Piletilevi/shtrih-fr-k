unit fmuDoc;

interface

uses
  // VCL
  Forms, ComCtrls, StdCtrls, Classes, Controls, ExtCtrls, SysUtils,
  // This
  untPages, fmuDocSp, fmuDocSpEx, fmuDocRg, fmuDocRgEx, fmuDocDs,
  fmuDocDsEx, fmuDocAd, fmuDocAdEx, fmuDocCc, fmuDocCcEx, fmuDocCfg, fmuDocCD,
  fmuDocFill, fmuDocCl, fmuDocCB, fmuDocPs, fmuDocEs, fmuDocReprint,untDriver,
  TestManager, Buttons;

type

  { TfmDoc }

  TfmDoc = class(TPage)
    Panel: TPanel;
    pnlData: TPanel;
    btnDefaults: TButton;
    lblCount: TLabel;
    edtCount: TEdit;
    udCount: TUpDown;
    lblPassword: TLabel;
    edtPassword: TEdit;
    Bevel1: TBevel;
    btnExecute: TBitBtn;
    procedure btnExecuteClick(Sender: TObject);
    procedure btnDefaultsClick(Sender: TObject);
  private
    procedure Execute;
    procedure CreatePages;
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.DFM}

{ TfmDoc }

constructor TfmDoc.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  CreatePages;
end;

procedure TfmDoc.CreatePages;

  procedure AddPage(PageClass: TPageClass);
  var
    Page: TPage;
  begin
    Page := PageClass.Create(nil);
    Page.SetOwner(Pages);
    Page.BorderStyle := bsNone;
    Page.Parent := pnlData;
  end;

begin
  AddPage(TfmDocSp);
  AddPage(TfmDocSpEx);
  AddPage(TfmDocRg);
  AddPage(TfmDocRgEx);
  AddPage(TfmDocAd);
  AddPage(TfmDocAdEx);
  AddPage(TfmDocDs);
  AddPage(TfmDocDsEx);
  AddPage(TfmDocCc);
  AddPage(TfmDocCcEx);
  AddPage(TfmDocCfg);
  AddPage(TfmDocCD);
  AddPage(TfmDocFill);
  AddPage(TfmDocCl);
  AddPage(TfmDocCB);
  AddPage(TfmDocPs);
  AddPage(TfmDocReprint);
  AddPage(TfmDocEs);
end;

procedure TfmDoc.Execute;

  function GetPage(PageType: TPageClass): TPage;
  var
    i: Integer;
  begin
    Result := nil;
    for i := 0 to Pages.Count-1 do
      if Pages[i] is PageType then
      begin
        Result := Pages[i];
        Break;
      end;
  end;

var
  Count: Integer;
  ResultCode: Integer;
  SavePassword: Integer;
begin
  ResultCode := 0;
  Count := StrToInt(edtCount.Text);
  SavePassword := Driver.Password;
  Driver.Password := StrToInt(edtPassword.Text);
  Driver.OperationBlockFirstString := StrToInt(edtCount.Text);
  if Pages.Page <> nil then
  begin
    Pages.Page.UpdateObject;
    if Pages.Page is TfmDocSpEx then
      GetPage(TfmDocSp).UpdateObject;
    if Pages.Page is TfmDocRgEx then
      GetPage(TfmDocRg).UpdateObject;
    if Pages.Page is TfmDocAdEx then
      GetPage(TfmDocAd).UpdateObject;
    if Pages.Page is TfmDocDsEx then
      GetPage(TfmDocDs).UpdateObject;
     if Pages.Page is TfmDocCcEx then
      GetPage(TfmDocCc).UpdateObject;

    Pages.Page.ExecuteCommand(ResultCode, Count);
  end;
  Driver.Password := SavePassword;
  if ResultCode = 0 then
    udCount.Position := Count;
end;

// Events

procedure TfmDoc.btnExecuteClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Execute;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmDoc.btnDefaultsClick(Sender: TObject);
var
  i: Integer;
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    for i := 0 to Pages.Count-1 do
    begin
      if not Pages[i].LoadDefaults then
        Break;
    end;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

end.
