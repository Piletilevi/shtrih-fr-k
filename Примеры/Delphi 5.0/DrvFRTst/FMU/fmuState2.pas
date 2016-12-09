unit fmuState2;

interface

uses
  // VCL
  Windows, Forms, ComCtrls, StdCtrls, Controls, Classes, SysUtils, Graphics,
  Buttons,
  // This
  untPages, untUtil, untDriver, TestManager;

type
  TfmState2 = class(TPage)
    btnBeep: TButton;
    btnResetSettings: TButton;
    btnResetSummary: TButton;
    btnDeviceMetrics: TButton;
    lblDrawer: TLabel;
    edtDrawer: TEdit;
    udDrawer: TUpDown;
    btnOpenDrawer: TButton;
    Memo: TMemo;
    procedure btnOpenDrawerClick(Sender: TObject);
    procedure btnBeepClick(Sender: TObject);
    procedure btnResetSettingsClick(Sender: TObject);
    procedure btnResetSummaryClick(Sender: TObject);
    procedure btnDeviceMetricsClick(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btnOpenDrawerMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
  end;

implementation

{$R *.DFM}

procedure TfmState2.btnOpenDrawerClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.DrawerNumber := StrToInt(edtDrawer.Text);
    Driver.OpenDrawer;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmState2.btnBeepClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Memo.Clear;
    Driver.Password := DriverManager.Password;
    Driver.Beep;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmState2.btnResetSettingsClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Memo.Clear;
    Driver.Password := DriverManager.Password;
    Driver.ResetSettings;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmState2.btnResetSummaryClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Memo.Clear;
    Driver.Password := DriverManager.Password;
    Driver.ResetSummary;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmState2.btnDeviceMetricsClick(Sender: TObject);
var
  ResultCode: Integer;
begin
  EnableButtons(False);
  try
    Memo.Clear;
    Driver.Password := DriverManager.Password;
    ResultCode := Driver.GetDeviceMetrics;
    UpdatePage;
    if ResultCode = 0 then
    begin
      with Memo do
      begin
        Lines.Add('');
        Lines.Add('  Кодовая Страница    : '+ IntToStr(Driver.UCodePage));
        Lines.Add('  Описание Устройства : '+ Driver.UDescription);
        Lines.Add('  Версия протокола    : '+ IntToStr(Driver.UMajorProtocolVersion));
        Lines.Add('  Подверсия протокола : '+ IntToStr(Driver.UMinorProtocolVersion));
        Lines.Add('  Тип устройства      : '+ IntToStr(Driver.UMajorType));
        Lines.Add('  Подтип устройства   : '+ IntToStr(Driver.UMinorType));
        Lines.Add('  Модель устройства   : '+ IntToStr(Driver.UModel));
      end;
    end;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmState2.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if HighLighting then
    edtDrawer.Color := clWindow;
end;

procedure TfmState2.btnOpenDrawerMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if HighLighting then
    edtDrawer.Color := InColor;
end;

end.
