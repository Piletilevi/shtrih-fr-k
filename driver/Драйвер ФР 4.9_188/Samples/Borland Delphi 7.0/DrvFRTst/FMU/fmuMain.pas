unit fmuMain;

interface

uses
  // VCL
  Windows, Messages, StdCtrls, Controls, ExtCtrls, Classes, Forms, SysUtils, Dialogs,
  Registry, ComCtrls, ImgList, ComObj, Graphics, Menus, Shellapi, ToolWin, Clipbrd,
  // This
  untPages, untUtil, SizeableForm, fmuPrintText, fmuPrintHeader, fmuPrintImage,
  fmuPrintImage2, fmuReceipt, fmuSlipDiscountCharge, fmuSlipOpen,
  fmuSlipRegistration, fmuSlipClose, fmuSlipConfigure, fmuSlipBuffer,
  fmuSlipPrintEject, fmuReports, fmuReadDump, fmuWriteSerial, fmuFiscalMemory,
  fmuBelarus, fmuTaxOfficer, fmuLogicDevice, fmuTable, fmuConnection, fmuAbout,
  fmuFont, fmuPresenter, fmuIBMPrinter, fmuCashControl, fmuConnectionTest,
  fmuPrintServer, fmuPrintLine, fmuPrintBarcode, fmuPrintTest, fmuTotalizers,
  fmuDeviceStatus, fmuWorkTotalizer, fmuCashTotalizer, fmuPrintBuffer,
  fmuFindDevice, fmuDateTime, fmuResetSettings, fmuPrintAttribute,
  fmuEJDocument, fmuEJSession, fmuEJOperations, fmuEJStatus, fmuEJReportPrint,
  fmuEJReports, fmuEJActivizationResult, fmuTabbedPage, fmuPrintOperations,
  fmuFullStatus, fmuBillAcceptor, untTestParams, fmuTestReceipt, fmuCashDrawer,
  fmuPrintBarcodePrinter, fmuTestMultiReceipt, fmuTaxOfficer2,
  fmuMasterPayK,
  DrvFRLib_TLB, untVInfo, untDriver, GlobalConst;


type
  { TfmMain }

  TfmMain = class(TSizeableForm)
    pnlMain: TPanel;
    ListBox: TListBox;
    Splitter: TSplitter;
    MainMenu: TMainMenu;
    miFile: TMenuItem;
    miShowProperties: TMenuItem;
    N1: TMenuItem;
    miExit: TMenuItem;
    miHelp: TMenuItem;
    miAbout: TMenuItem;
    miMailto: TMenuItem;
    pnlSite: TPanel;
    pnlInfo: TPanel;
    Bevel2: TBevel;
    Bevel1: TBevel;
    lblRxData: TLabel;
    lblTxData: TLabel;
    lblResult: TLabel;
    lblTime: TLabel;
    lblOperator: TLabel;
    lblPassword: TLabel;
    edtInput: TEdit;
    edtOutput: TEdit;
    edtResult: TEdit;
    edtTime: TEdit;
    btnProperties: TButton;
    btnClose: TButton;
    edtOperator: TEdit;
    edtPassword: TEdit;
    procedure btnAboutClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure miAboutClick(Sender: TObject);
    procedure miExitClick(Sender: TObject);
    procedure miMailtoClick(Sender: TObject);
    procedure tbAboutClick(Sender: TObject);
    procedure tbMailtoClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure ListViewChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure ListBoxClick(Sender: TObject);
    procedure ListBoxDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure btnPropertiesClick(Sender: TObject);
    procedure edtPasswordChange(Sender: TObject);
    procedure edtPasswordKeyPress(Sender: TObject; var Key: Char);
    procedure miShowPropertiesClick(Sender: TObject);
    procedure SplitterCanResize(Sender: TObject; var NewSize: Integer;
      var Accept: Boolean);
    procedure edtPasswordExit(Sender: TObject);
  private
    FPage: TPage;
    FPages: TPages;
    FTickCount: DWORD;
    FOldEditWndProc: TWndMethod;
    procedure Mailto;
    procedure SaveParams;
    procedure LoadParams;
    procedure CreatePages;
    procedure InitializePages;
    procedure UpdateListBox;
    procedure ShowPage(APage: TPage; ACaption: string);
    procedure PagesChanged(Sender: TObject; ChangeType: TChangeType);
    function GetTabIndex: Integer;
    procedure SetTab(ATabIndex: Integer);
    procedure GetPageIndex(APage: TPage; var Index, TabIndex: Integer);
    procedure SetPageIndex(Index, TabIndex: Integer);
    procedure CheckPasswordText(const AStr: string);

    procedure NewEditWndProc(var Message: TMessage);
    property Pages: TPages read FPages;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure SetPage(APage: TPage);
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
end;

destructor TfmMain.Destroy;
begin
  SaveParams;
  FreeTestParams;
  FPage := nil;
  FPages.Free;
  FreeDriver;
  inherited Destroy;
end;

// Создание всех страниц

procedure TfmMain.CreatePages;

  procedure AddPage(PageClass: TPageClass);
  var
    Page: TPage;
  begin
    Page := PageClass.Create(Self);
    Page.SetOwner(Pages);
    Page.BorderStyle := bsNone;
    Page.Parent := pnlSite;
    ListBox.Items.AddObject(Page.Caption, Page);
  end;

  function AddTabbedPage(const AName: string): TfmTabbedPage;
  begin
    Result := TfmTabbedPage.Create(Self);
    Result.SetOwner(Pages);
    Result.BorderStyle := bsNone;
    Result.Parent := pnlSite;
    ListBox.Items.AddObject(AName, Result);
  end;

  procedure AddTabItem(TP: TfmTabbedPage; PageClass: TPageClass);
  var
    Page: TPage;
    TS: TTabSheet;
  begin
    if not Assigned(TP) then
      Exit;
    TS := TTabSheet.Create(TP);
    TS.PageControl := TP.PageControl;
    Page := PageClass.Create(Self);
    Page.SetOwner(Pages);
    Page.BorderStyle := bsNone;
    Page.Parent := TS;
    TS.Caption := Page.Caption;
    Page.Align := alClient;
    Page.Visible := True;
    Page.Width := TS.ClientWidth;
    Page.Height := TS.ClientHeight;
  end;

  var
    TP: TfmTabbedPage;
begin
  // Состояние
  TP:= AddTabbedPage('Состояние');
  AddTabItem(TP, TfmDeviceStatus);
  AddTabItem(TP, TfmFullStatus);
  // Регистрация
  TP := AddTabbedPage('Регистрация');
  AddTabItem(TP, TfmReceipt);
  AddTabItem(TP, TfmCashDrawer);
  AddTabItem(TP, TfmTestReceipt);
  AddTabItem(TP, TfmTestMultiReceipt);
  // Отчеты
  AddPage(TfmReports);
  // Печать текста
  TP := AddTabbedPage('Печать текста');
  AddTabItem(TP, TfmPrintText);
  AddTabItem(TP, TfmPrintHeader);
  AddTabItem(TP, TfmPrintAttribute);
  AddTabItem(TP, TfmPrintBuffer);
  AddTabItem(TP, TfmPrintOperations);
  AddTabItem(TP, TfmPrintTest);
  // Печать графики
  TP := AddTabbedPage('Печать графики');
  AddTabItem(TP, TfmPrintImage);
  AddTabItem(TP, TfmPrintImage2);
  AddTabItem(TP, TfmPrintBarcode);
  AddTabItem(TP, TfmPrintBarcodePrinter);
  AddTabItem(TP, TfmPrintLine);
  // Подкладной документ
  TP := AddTabbedPage('ПД');
  AddTabItem(TP, TfmSlipConfigure);
  AddTabItem(TP, TfmSlipOpen);
  AddTabItem(TP, TfmSlipRegistration);
  AddTabItem(TP, TfmSlipDiscountCharge);
  AddTabItem(TP, TfmSlipClose);
  AddTabItem(TP, TfmSlipBuffer);
  AddTabItem(TP, TfmSlipPrintEject);
  // Параметры устройства
  TP := AddTabbedPage('Параметры устройства');
  AddTabItem(TP, TfmTotalizers);
  AddTabItem(TP, TfmCashTotalizer);
  AddTabItem(TP, TfmWorkTotalizer);
  AddTabItem(TP, TfmTable);
  AddTabItem(TP, TfmFont);
  // Сервис
  TP := AddTabbedPage('Сервис');
  AddTabItem(TP, TfmTaxOfficer);
  AddTabItem(TP, TfmTaxOfficer2);
  AddTabItem(TP, TfmBelarus);
  AddTabItem(TP, TfmDateTime);
  AddTabItem(TP, TfmWriteSerial);
  AddTabItem(TP, TfmFiscalMemory);
  AddTabItem(TP, TfmResetSettings);
  AddTabItem(TP, TfmReadDump);
  // ЭКЛЗ
  TP := AddTabbedPage('ЭКЛЗ');
  AddTabItem(TP, TfmEJStatus );             // Состояние
  AddTabItem(TP, TfmEJOperations);          // Операции
  AddTabItem(TP, TfmEJReports);             // Отчеты
  AddTabItem(TP, TfmEJReportPrint);         // Печать очтета
  AddTabItem(TP, TfmEJSession);             // Итоги
  AddTabItem(TP, TfmEJDocument);            // Документ по КПК
  AddTabItem(TP, TfmEJActivizationResult);  // Итог активизации
  // Купюроприемник
  AddPage(TfmBillAcceptor);
  // MasterPay-K
  AddPage(TfmMasterPayK);
  // Прочее
  TP := AddTabbedPage('Прочее');
  AddTabItem(TP, TfmConnectionTest);
  AddTabItem(TP, TfmConnection);
  AddTabItem(TP, TfmLogicDevice);
  AddTabItem(TP, TfmFindDevice);
  AddTabItem(TP, TfmPrintServer);
  AddTabItem(TP, TfmCashControl);
  AddTabItem(TP, TfmPresenter);
  AddTabItem(TP, TfmIBMPrinter);
end;

procedure TfmMain.SaveParams;
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  try
    if Reg.OpenKey(REGSTR_KEY_DRVFRTST, True) then
    begin
      SaveControlParams(Name, Self, Reg);
      Reg.WriteInteger('PageIndex', ListBox.ItemIndex);
      Reg.WriteInteger('TabIndex', GetTabIndex);
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

var
  APage: TPage;
  Reg: TRegistry;
  PageIndex: Integer;
  TabIndex: Integer;
begin
  Reg := TRegistry.Create;
  try
    SetDefaults(Self);
    PageIndex := 0;
    TabIndex := 0;
    if Reg.OpenKey(REGSTR_KEY_DRVFRTST, False) then
    begin
      LoadControlParams(Self.Name, Self, Reg);
      if Reg.ValueExists('PageIndex') then
      begin
        PageIndex := Reg.ReadInteger('PageIndex');
        if (PageIndex < 0) or (PageIndex >= ListBox.Count) then
          PageIndex := 0;
      end;
      if Reg.ValueExists('TabIndex') then
        TabIndex := Reg.ReadInteger('TabIndex');
    end;
    ListBox.ItemIndex := PageIndex;

    APage := TPage(ListBox.Items.Objects[ListBox.ItemIndex]);
    ShowPage(APage, ListBox.Items[ListBox.ItemIndex]);
    SetTab(TabIndex);
  finally
    Reg.Free;
  end;
end;

procedure TfmMain.PagesChanged(Sender: TObject; ChangeType: TChangeType);
var
  ResultCode: Integer;
  ResultCodeDescription: string;
begin
  try
    case ChangeType of
      ctStart:
      begin
        FTickCount := GetTickCount;
      end;
      // обновление результата
      ctStop:
      begin
        ResultCode := Driver.ResultCode;
        ResultCodeDescription := Driver.ResultCodeDescription;
        edtInput.Text := Driver.ECRInput;
        edtOutput.Text := Driver.ECROutput;
        edtResult.Text := Format('(%d) %s',
          [ResultCode, ResultCodeDescription]);
        edtTime.Text := IntToStr(GetTickCount - FTickCount) + ' мс';
        edtOperator.Text := IntToStr(Driver.OperatorNumber);
      end;
    end;
  except
    { !!! }
  end;
end;

procedure TfmMain.btnAboutClick(Sender: TObject);
begin
  ShowAboutBox(Handle, Application.Title,
    ['Версия теста: ' + GetModuleVersion]);
end;

procedure TfmMain.FormCreate(Sender: TObject);
begin
  FPages := TPages.Create;
  PageNotifier.OnChange := PagesChanged;
  CreatePages;
  InitializePages;
  LoadParams;
  FOldEditWndProc := edtPassword.WindowProc;
  edtPassword.WindowProc := NewEditWndProc;
  Caption := Caption + ' ' + DeviceName + ' ' + GetFileVersionInfoStr;
end;

procedure TfmMain.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmMain.ShowPage(APage: TPage; ACaption: string);
begin
  if APage <> FPage then
  begin
    // Получили данные
    if FPage <> nil then
    begin
      FPage.UpdateObject;
    end;

    // Показали страницу
    if APage <> nil then
    begin
//      ListBox.Constraints.MaxWidth := Width - APage.Constraints.MinWidth - 20;
      APage.Align := alClient;
      APage.Visible := True;

      APage.UpdatePage;
      APage.Width := pnlSite.ClientWidth;
      APage.Height := pnlSite.ClientHeight;
    end;
    // Спрятали страницу
    if FPage <> nil then
    begin
      FPage.Visible := False;
    end;
    FPage := APage;
    UpdateListBox;
  end;
end;

procedure TfmMain.miAboutClick(Sender: TObject);
begin
  ShowAboutBox(Handle, Application.Title,
    ['Версия теста: ' + GetModuleVersion]);
end;

procedure TfmMain.tbAboutClick(Sender: TObject);
begin
  ShowAboutBox(Handle, Application.Title,
    ['Версия теста: ' + GetModuleVersion]);
end;

procedure TfmMain.miExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmMain.Mailto;
var
  S: string;
begin
  S := Format('mailto:support@shtrih-m.ru?subject=Тест%%20драйвера%%20%%20%s',
    [GetModuleVersion]);
  ShellExecute(Handle, 'open', PChar(S), nil, nil, SW_SHOWDEFAULT);
end;

procedure TfmMain.miMailtoClick(Sender: TObject);
begin
  Mailto;
end;

procedure TfmMain.tbMailtoClick(Sender: TObject);
begin
  Mailto;
end;

procedure TfmMain.FormResize(Sender: TObject);
begin
  UpdateListBox;
{  if ClientWidth > 600 then
    pnlMain.Width := ClientWidth;
  if ClientHeight > 400 then
    pnlMain.Height := ClientHeight;}

  if Width > 639 then
    pnlMain.Width := ClientWidth;
  if Height > 479 then
    pnlMain.Height := ClientHeight;
end;

procedure TfmMain.UpdateListBox;
var
  MaxWidth: Integer;
begin
  if FPage <> nil then
  begin
    MaxWidth := Width - FPage.Constraints.MinWidth - 20;
    if MaxWidth > ListBox.Constraints.MinWidth then
      ListBox.Constraints.MaxWidth := MaxWidth
    else
      ListBox.Constraints.MaxWidth := ListBox.Constraints.MinWidth;
  end;
end;

procedure TfmMain.ListViewChange(Sender: TObject; Item: TListItem;
  Change: TItemChange);
begin
  ShowPage(TPage(Item.Data), Item.Caption);
end;

procedure TfmMain.ListBoxClick(Sender: TObject);
var
  Item: TPage;
begin
  Item := TPage(ListBox.Items.Objects[ListBox.ItemIndex]);
  ShowPage(Item, ListBox.Items[ListBox.ItemIndex]);
end;

procedure TfmMain.ListBoxDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
var
  S: string;
begin
  ListBox.Canvas.FillRect(Rect);
  S := Format('%.2d. %s', [Index + 1, ListBox.Items[Index]]);
  ListBox.Canvas.TextOut(Rect.Left + 8, Rect.Top + 4, S);
end;

procedure TfmMain.btnPropertiesClick(Sender: TObject);
begin
  Driver.ShowProperties;
  edtPassword.Text := IntToStr(Driver.Password);
end;

procedure TfmMain.edtPasswordChange(Sender: TObject);
begin
  Driver.Password := StrToInt(edtPassword.Text);
end;

procedure TfmMain.edtPasswordKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0'..'9', Chr(VK_TAB), Chr(VK_DELETE), Chr(VK_BACK)]) then
    Key := #0;
end;

procedure TfmMain.miShowPropertiesClick(Sender: TObject);
begin
  Driver.ShowProperties;
end;

function TfmMain.GetTabIndex: Integer;
var
  Item: TPage;
begin
  Result := 0;
  if (ListBox.Count = 0) or (ListBox.ItemIndex < 0) then
    Exit;
  if not (ListBox.Items.Objects[ListBox.ItemIndex] is TPage) then
    Exit;
  Item := TPage(ListBox.Items.Objects[ListBox.ItemIndex]);
  if Item.ComponentCount = 0 then
    Exit;
  if Item.Components[0] is TPageControl then
    Result := TPageControl(Item.Components[0]).ActivePageIndex
  else
    Result := 0;
end;

procedure TfmMain.SetTab(ATabIndex: Integer);
var
  Item: TPage;
begin
  Item := TPage(ListBox.Items.Objects[ListBox.ItemIndex]);
  if Item.ComponentCount < 0 then Exit;
  if Item.Components[0] is TPageControl then
    if TPageControl(Item.Components[0]).PageCount > ATabIndex then
      TPageControl(Item.Components[0]).ActivePageIndex := ATabIndex;
end;

procedure TfmMain.SplitterCanResize(Sender: TObject; var NewSize: Integer;
  var Accept: Boolean);
begin
  if NewSize > 200 then
    Accept := False
  else
    Accept := True;
end;

// Перейти на страницу с адресом
procedure TfmMain.SetPage(APage: TPage);
var
  i, j: Integer;
begin
  GetPageIndex(APage, i, j);
  SetPageIndex(i, j);
end;

// Получить индекс страницы
procedure TfmMain.GetPageIndex(APage: TPage; var Index, TabIndex: Integer);
var
  i: Integer;
  j: Integer;
  Item: TPage;
begin
  Index := -1;
  TabIndex := -1;
  for i := 0 to ListBox.Items.Count - 1 do
  begin
    Item := TPage(ListBox.Items.Objects[i]);
    if Item = APage then
    begin
      Index := i;
      Break;
    end;
    if Item.ComponentCount = 0 then Continue;
    if Item.Components[0] is TPageControl then
    begin
      for j := 0 to TPageControl(Item.Components[0]).PageCount - 1 do
      begin
        if TPageControl(Item.Components[0]).Pages[j].ContainsControl(APage) then
        begin
          Index := i;
          TabIndex := j;
          Break;
        end;
      end;
    end;
  end;
end;

// Перейти на страницу с индексом
procedure TfmMain.SetPageIndex(Index, TabIndex: Integer);
begin
  if Index < 0 then Exit;
  ListBox.ItemIndex := Index;
  ListBoxClick(Self);
  if TabIndex < 0 then Exit;
  SetTab(TabIndex);
end;

procedure TfmMain.InitializePages;
var
  i: Integer;
begin
  for i := 0 to Pages.Count-1 do
  begin
    Pages[i].Initialize;
  end;
end;

procedure TfmMain.NewEditWndProc(var Message: TMessage);
begin
  if Message.Msg = WM_PASTE then
  begin
    CheckPasswordText(Clipboard.AsText);
  end;
  FOldEditWndProc(Message)
end;

procedure TfmMain.CheckPasswordText(const AStr: string);
begin
  if Length(AStr) > 1024 then
    raise Exception.Create('Некорректное значение в поле "Password"');
  StrToInt(AStr);  
end;

procedure TfmMain.edtPasswordExit(Sender: TObject);
begin
  edtPassword.Text := IntToStr(Driver.Password);
end;

end.
