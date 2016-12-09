unit fmuMain;

interface

uses
  // VCL
  Windows, StdCtrls, Controls, ExtCtrls, Classes, Forms, SysUtils,
  Registry, ComCtrls, ImgList, ComObj,
  // This
  untPages, untUtil, fmuState, fmuPrint, fmuPrint2, fmuGraph, fmuReg,
  fmuRep, fmuECR, fmuProg, fmuFM, fmuEKLZRep, fmuEKLZRep2, fmuEKLZRep3,
  fmuEKLZRep4, fmuDoc, fmuEKLZ2, fmuEKLZ3, fmuBel, fmuNI, fmuLD, fmuTable,
  fmuConnect2, untVInfo, fmuAbout, fmuFont, ComSec, fmuRecpt, fmuSCPsw, fmuIBM,
  fmuCashControl, fmuTest, fmuServer, fmuPrintLine, fmuPrintBarcode,
  fmuLock, untDriver, TestManager, fmuState2, fmuECRReg;


type

  { TfmMain }

  TfmMain = class(TForm)
    pnlData: TPanel;
    Panel: TPanel;
    btnClose: TButton;
    btnShowProperties: TButton;
    btnAbout: TButton;
    gsStatus: TGroupBox;
    lblPassword: TLabel;
    lblOperator: TLabel;
    lblRxData: TLabel;
    lblTxData: TLabel;
    lblResult: TLabel;
    lblTime: TLabel;
    edtPassword: TEdit;
    edtOperator: TEdit;
    edtResult: TEdit;
    edtInput: TEdit;
    edtOutput: TEdit;
    edtTime: TEdit;
    ImageList: TImageList;
    Panel1: TPanel;
    ListBox: TListBox;
    procedure btnShowPropertiesClick(Sender: TObject);
    procedure btnAboutClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure ListViewChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure ListBoxClick(Sender: TObject);
    procedure ListBoxDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
  private
    FPages: TPages;
    procedure SaveParams;
    procedure LoadParams;
    procedure CreatePages;
    procedure ShowPage(APage: TPage);
    procedure PagesChanged(Sender: TObject; ChangeType: TChangeType);
    procedure NewPage(APage: TPage);
    procedure AddPage(PageClass: TPageClass);

    property Pages: TPages read FPages;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  fmMain: TfmMain;

implementation

{$R *.DFM}

const
  REGSTR_KEY_DRVFRTST = '\SOFTWARE\ShtrihM\Tests\DrvFR\A4\Param';

{ TfmMain }

constructor TfmMain.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  DriverManager.OnChange := PagesChanged;
  FPages := TPages.Create;
  CreatePages;
  LoadParams;
end;

destructor TfmMain.Destroy;
begin
  SaveParams;
  inherited Destroy;
  FPages.Free;
end;

// Занесение странички в список

procedure TfmMain.NewPage(APage: TPage);
var
  i: Integer;
begin
  if APage.Pages.Count = 0 then
  begin
    ListBox.Items.AddObject(APage.Caption, APage);
  end else
  begin
    // Добавляем подстраницы
    for i := 0 to APage.Pages.Count-1 do
      NewPage(APage.Pages[i]);
  end;
end;

// Создание странички

procedure TfmMain.AddPage(PageClass: TPageClass);
var
  Page: TPage;
begin
  try
    Page := PageClass.Create(nil);
    Page.SetOwner(Pages);
    Page.BorderStyle := bsNone;
    Page.Parent := pnlData;
    NewPage(Page);
  except
    on E: Exception do
      MessageBox(Handle, PChar(E.Message+'.'), PChar(Caption), MB_OK or MB_ICONERROR);
  end;
end;
// Создание всех страниц

procedure TfmMain.CreatePages;
begin
  AddPage(TfmState);
  AddPage(TfmState2);
  AddPage(TfmReg);
  AddPage(TfmRep);
  AddPage(TfmPrint);
  AddPage(TfmPrint2);
  AddPage(TfmConnect);
  AddPage(TfmServer);
  AddPage(TfmGraph);
  AddPage(TfmFont);
  AddPage(TfmPrintLine);
  AddPage(TfmPrintBarcode);
  AddPage(TfmEKLZRep);
  AddPage(TfmEKLZRep2);
  AddPage(TfmEKLZRep3);
  AddPage(TfmEKLZRep4);
  AddPage(TfmEKLZ2);
  AddPage(TfmEKLZ3);
  AddPage(TfmDoc);
  AddPage(TfmECR);
  AddPage(TfmECRReg);
  AddPage(TfmProg);
  AddPage(TfmTable);
  AddPage(TfmFM);
  AddPage(TfmBel);
  AddPage(TfmNI);
  AddPage(TfmLD);
  AddPage(TfmSCPsw);
  AddPage(TfmIBM);
  AddPage(TfmCashControl);
  AddPage(TfmRecpt);
  AddPage(TfmTest);
  AddPage(TfmLock);
end;

procedure TfmMain.SaveParams;
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  try
    if Reg.OpenKey(REGSTR_KEY_DRVFRTST, True) then
    begin
      Reg.WriteInteger('PageIndex', ListBox.ItemIndex);
      SaveControlParams(Name, Self, Reg);
    end;
  finally
    Reg.Free;
  end;
end;

procedure TfmMain.LoadParams;

  procedure SetDefaults(Control: TWinControl);
  var
    i: Integer;
    Item: TControl;
  begin
    for i := 0 to Control.ControlCount-1 do
    begin
      Item := Control.Controls[i];
      if Item is TWinControl then
      begin
        SetDefaults(Item as TWinControl);
        if Item.ClassNameIs('TComboBox') then
          TComboBox(Item).ItemIndex := 0;
      end;
    end;
  end;

  function ValidIndex(Index: Integer): Boolean;
  begin
    Result := (Index >= 0) and (Index < ListBox.Items.Count)
  end;

var
  Reg: TRegistry;
  PageIndex: Integer;
  APage: TPage;
begin
  Reg := TRegistry.Create;
  try
    if Reg.OpenKey(REGSTR_KEY_DRVFRTST, False) then
    begin
      LoadControlParams(Self.Name, Self, Reg);
      if Reg.ValueExists('PageIndex') then
      begin
        PageIndex := Reg.ReadInteger('PageIndex');
        if ValidIndex(PageIndex) then
        begin
          ListBox.ItemIndex := PageIndex;
          APage := TPage(ListBox.Items.Objects[ListBox.ItemIndex]);
          ShowPage(APage);
        end;
      end;
    end else
    begin
      SetDefaults(Self);
    end;
  finally
    Reg.Free;
  end;
end;

procedure TfmMain.PagesChanged(Sender: TObject; ChangeType: TChangeType);
var
  ResultCode: Integer;
  ResultCodeDescription: string;
begin
  case ChangeType of
    // обновление результата
    ctUpdate:
    begin
      edtTime.Text := IntToStr(GetTickCount - DriverManager.TickCount) + ' мс.';
      ResultCode := Driver.ResultCode;
      ResultCodeDescription := Driver.ResultCodeDescription;
      edtResult.Text := Format('(%d) %s', [ResultCode, ResultCodeDescription]);
      edtInput.Text := Driver.ECRInput;
      edtOutput.Text := Driver.ECROutput;
      edtOperator.Text := IntToStr(Driver.OperatorNumber);
    end;
    // получение пароля
    ctGetPassword: DriverManager.Password := StrToInt(edtPassword.Text);
  end;
end;

procedure TfmMain.ShowPage(APage: TPage);
begin
  if APage <> nil then
    Pages.ShowPage(APage);
end;

// Events

procedure TfmMain.btnShowPropertiesClick(Sender: TObject);
begin
  Driver.ShowProperties;
  edtPassword.Text := IntToStr(Driver.Password);
end;

procedure TfmMain.btnAboutClick(Sender: TObject);
begin
  ShowAboutBox(Handle, Application.Title,
    ['Версия теста: ' + GetModuleVersion]);
end;

procedure TfmMain.FormCreate(Sender: TObject);
begin
  Caption := Caption + ' ' + GetFileVersionInfoStr;
end;

procedure TfmMain.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmMain.ListViewChange(Sender: TObject; Item: TListItem;
  Change: TItemChange);
begin
  if Item <> nil then
    Pages.ShowPage(TPage(Item.Data));
end;

procedure TfmMain.ListBoxClick(Sender: TObject);
var
  Item: TObject;
begin
  Item := ListBox.Items.Objects[ListBox.ItemIndex];
  ShowPage(TPage(Item));
end;

procedure TfmMain.ListBoxDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
begin
  ListBox.Canvas.FillRect(Rect);
  ImageList.Draw(ListBox.Canvas, Rect.Left+3, Rect.Top, 0);
  ListBox.Canvas.TextOut(Rect.Left+ImageList.Width+8, Rect.Top+4, ListBox.Items[Index]);
end;

end.
