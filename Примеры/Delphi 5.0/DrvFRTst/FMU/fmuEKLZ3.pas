unit fmuEKLZ3;

interface

uses
  // VCL
  Windows, StdCtrls, Controls, Classes, SysUtils, Forms, ExtCtrls, Buttons,
  Graphics,
  // This
  untPages, untDriver, TestManager, untUtil;

type
  TfmEKLZ3 = class(TPage)
    Bevel2: TBevel;
    Label3: TLabel;
    btnEKLZActivization: TButton;
    btnEKLZActivizationResult: TButton;
    lblActivization: TLabel;
    Label4: TLabel;
    Bevel3: TBevel;
    Label2: TLabel;
    btnInitEKLZArchive: TButton;
    btnCloseEKLZArchive: TButton;
    btnTestEKLZArchiveIntegrity: TButton;
    edtTestNumber: TEdit;
    lblArchive: TLabel;
    lblTestNumber: TLabel;
    Label5: TLabel;
    Bevel4: TBevel;
    btnEKLZInterrupt: TBitBtn;
    procedure btnInitEKLZArchiveClick(Sender: TObject);
    procedure btnEKLZActivizationClick(Sender: TObject);
    procedure btnEKLZActivizationResultClick(Sender: TObject);
    procedure btnCloseEKLZArchiveClick(Sender: TObject);
    procedure btnTestEKLZArchiveIntegrityClick(Sender: TObject);
    procedure btnEKLZInterruptClick(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btnTestEKLZArchiveIntegrityMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
  end;


implementation

{$R *.DFM}

{ TfmEKLZ3 }

procedure TfmEKLZ3.btnInitEKLZArchiveClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.InitEKLZArchive;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmEKLZ3.btnEKLZActivizationClick(Sender: TObject);
var
  S: string;
begin
  S := 'Вы уверены что хотите активизировать ЭКЛЗ?';
  if MessageBox(Handle, PChar(S), PChar(Application.Title),
    MB_OKCANCEL or MB_DEFBUTTON2 or MB_ICONWARNING)=ID_OK then
  begin
    EnableButtons(False);
    try
      Driver.Password := DriverManager.Password;
      Driver.EKLZActivization;
      UpdatePage;
    finally
      EnableButtons(True);
    end;
  end;
end;

procedure TfmEKLZ3.btnEKLZActivizationResultClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.EKLZActivizationResult;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmEKLZ3.btnCloseEKLZArchiveClick(Sender: TObject);
var
  S: string;
begin
  S := 'Вы уверены что хотите закрыть архив ЭКЛЗ?';
  if MessageBox(Handle, PChar(S), PChar(Application.Title),
    MB_OKCANCEL or MB_DEFBUTTON2 or MB_ICONWARNING)=ID_OK then
  begin
    EnableButtons(False);
    try
      Driver.Password := DriverManager.Password;
      Driver.CloseEKLZArchive;
      UpdatePage;
    finally
      EnableButtons(True);
    end;
  end;
end;

procedure TfmEKLZ3.btnTestEKLZArchiveIntegrityClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.TestNumber := StrToInt(edtTestNumber.Text);
    Driver.TestEKLZArchiveIntegrity;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmEKLZ3.btnEKLZInterruptClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.EKLZInterrupt;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmEKLZ3.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if HighLighting then
    edtTestNumber.Color := clWindow;
end;

procedure TfmEKLZ3.btnTestEKLZArchiveIntegrityMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if HighLighting then
    edtTestNumber.Color := InColor;
end;

end.
