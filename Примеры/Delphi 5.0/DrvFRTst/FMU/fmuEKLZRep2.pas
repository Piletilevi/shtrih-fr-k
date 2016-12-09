unit fmuEKLZRep2;

interface

uses
  // VCL
  Controls, StdCtrls, ExtCtrls, ComCtrls, Classes, SysUtils, Buttons, Graphics,
  // This
  untPages, untDriver, TestManager, fmuData, untUtil;

type
  TfmEKLZRep2 = class(TPage)
    lblUDescription: TLabel;
    edtUDescription: TEdit;
    btnGetEKLZActivizationResult: TButton;
    Label1: TLabel;
    Bevel1: TBevel;
    Label2: TLabel;
    lblStopEKLZDocumentPrinting: TLabel;
    Bevel2: TBevel;
    lblKPKNumber: TLabel;
    edtKPKNumber: TEdit;
    btnGetEKLZDocument: TButton;
    Label4: TLabel;
    Bevel3: TBevel;
    Label5: TLabel;
    Bevel4: TBevel;
    lblSessionNumber: TLabel;
    edtSessionNumber: TEdit;
    btnGetEKLZJournal: TButton;
    btnGetEKLZSessionTotal: TButton;
    btnGetEKLZData: TBitBtn;
    btnShowData: TBitBtn;
    Bevel5: TBevel;
    procedure btnGetEKLZDataClick(Sender: TObject);
    procedure btnShowDataClick(Sender: TObject);
    procedure btnGetEKLZActivizationResultClick(Sender: TObject);
    procedure btnGetEKLZDocumentClick(Sender: TObject);
    procedure btnGetEKLZSessionTotalClick(Sender: TObject);
    procedure btnGetEKLZJournalClick(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btnGetEKLZSessionMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
    procedure btnGetEKLZDocumentMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
    procedure btnGetEKLZActivizationResultMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
  private
    fmData: TfmData;
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.DFM}

constructor TfmEKLZRep2.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  fmData := TfmData.Create(Self);
end;

procedure TfmEKLZRep2.btnGetEKLZDataClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    if Driver.GetEKLZData = 0 then
      fmData.Memo.Lines.Add(Driver.EKLZData);
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmEKLZRep2.btnShowDataClick(Sender: TObject);
begin
  fmData.Show;
end;

procedure TfmEKLZRep2.btnGetEKLZActivizationResultClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    if Driver.GetEKLZActivizationResult = 0 then
      edtUDescription.Text := Driver.UDescription
    else
      edtUDescription.Clear;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmEKLZRep2.btnGetEKLZDocumentClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.KPKNumber := StrToInt(edtKPKNumber.Text);
    if Driver.GetEKLZDocument = 0 then
      edtUDescription.Text := Driver.UDescription
    else
      edtUDescription.Clear;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmEKLZRep2.btnGetEKLZSessionTotalClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.SessionNumber := StrToInt(edtSessionNumber.Text);
    if Driver.GetEKLZSessionTotal = 0 then
      edtUDescription.Text := Driver.UDescription
    else
      edtUDescription.Clear;

    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmEKLZRep2.btnGetEKLZJournalClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.SessionNumber := StrToInt(edtSessionNumber.Text);
    if Driver.GetEKLZJournal=0 Then
      edtUDescription.Text := Driver.UDescription
    else
      edtUDescription.Clear;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmEKLZRep2.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if HighLighting then
  begin
    edtUDescription.Color := clBtnFace;
    edtKPKNumber.Color := clWindow;
    edtSessionNumber.Color := clWindow;
  end;
end;

procedure TfmEKLZRep2.btnGetEKLZSessionMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if HighLighting then
  begin
    edtUDescription.Color := OutColor;
    edtSessionNumber.Color := InColor;
  end;
end;

procedure TfmEKLZRep2.btnGetEKLZDocumentMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if HighLighting then
  begin
    edtUDescription.Color := OutColor;
    edtKPKNumber.Color := InColor;
  end;
end;

procedure TfmEKLZRep2.btnGetEKLZActivizationResultMouseMove(
  Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  if HighLighting then
    edtUDescription.Color := OutColor;
end;

end.
