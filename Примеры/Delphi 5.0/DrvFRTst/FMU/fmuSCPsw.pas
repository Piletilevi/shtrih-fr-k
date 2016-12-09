unit fmuSCPsw;

interface

uses
  // VCL
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls,
  // This
  untPages, untDriver, Buttons, untUtil;

type
  TfmSCPsw = class(TPage)
    lblSCPassword: TLabel;
    edtSCPassword: TEdit;
    lblNewSCPassword: TLabel;
    edtNewSCPassword: TEdit;
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    btnSetSCPassword: TBitBtn;
    procedure btnSetSCPasswordClick(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btnSetSCPasswordMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
  end;

implementation

{$R *.DFM}

procedure TfmSCPsw.btnSetSCPasswordClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.SCPassword := StrToInt(edtSCPassword.Text);
    Driver.NewSCPassword := StrToInt(edtNewSCPassword.Text);
    Driver.SetSCPassword;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmSCPsw.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if HighLighting then
  begin
    edtSCPassword.Color := clWindow;
    edtNewSCPassword.Color := clWindow;
  end;
end;

procedure TfmSCPsw.btnSetSCPasswordMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if HighLighting then
  begin
    edtSCPassword.Color := InColor;
    edtNewSCPassword.Color := InColor;
  end;
end;

end.
