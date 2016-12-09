unit fmuEKLZRep4;

interface

uses
  // VCL
  Controls, StdCtrls, ExtCtrls, ComCtrls, Classes, SysUtils, Buttons,  Graphics,
  // This
  untPages, untDriver, TestManager, untUtil;

type
  TfmEKLZRep4 = class(TPage)
    lblStopEKLZDocumentPrinting: TLabel;
    Label1: TLabel;
    Bevel1: TBevel;
    Label2: TLabel;
    Bevel2: TBevel;
    lblKPKNumber: TLabel;
    edtKPKNumber: TEdit;
    btnReadEKLZDocumentOnKPK: TButton;
    btnReadEKLZSessionTotal: TButton;
    btnEKLZJournalOnSessionNumber: TButton;
    edtSessionNumber: TEdit;
    lblSessionNumber: TLabel;
    Label3: TLabel;
    Bevel3: TBevel;
    btnStopEKLZDocumentPrinting: TBitBtn;
    procedure btnStopEKLZDocumentPrintingClick(Sender: TObject);
    procedure btnReadEKLZDocumentOnKPKClick(Sender: TObject);
    procedure btnEKLZJournalOnSessionNumberClick(Sender: TObject);
    procedure btnReadEKLZSessionTotalClick(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btnEKLZSessionMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
    procedure btnReadEKLZDocumentOnKPKMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
  end;

implementation

{$R *.DFM}

procedure TfmEKLZRep4.btnStopEKLZDocumentPrintingClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.StopEKLZDocumentPrinting;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmEKLZRep4.btnReadEKLZDocumentOnKPKClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.KPKNumber := StrToInt(edtKPKNumber.Text);
    Driver.ReadEKLZDocumentOnKPK;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmEKLZRep4.btnEKLZJournalOnSessionNumberClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.SessionNumber := StrToInt(edtSessionNumber.Text);
    Driver.EKLZJournalOnSessionNumber;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmEKLZRep4.btnReadEKLZSessionTotalClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.SessionNumber := StrToInt(edtSessionNumber.Text);
    Driver.ReadEKLZSessionTotal;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmEKLZRep4.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if HighLighting then
  begin
    edtKPKNumber.Color := clWindow;
    edtSessionNumber.Color := clWindow;
  end;
end;

procedure TfmEKLZRep4.btnEKLZSessionMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if HighLighting then
    edtSessionNumber.Color := InColor;
end;

procedure TfmEKLZRep4.btnReadEKLZDocumentOnKPKMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if HighLighting then
    edtKPKNumber.Color := InColor;
end;

end.
