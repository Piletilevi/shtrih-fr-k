unit fmuEJStatus;

interface

uses
  // VCL
  Windows, StdCtrls, Controls, Classes, Forms, Sysutils, ExtCtrls, Graphics,
  // This
  untPages, untUtil, untDriver;

type
  { TfmEJStatus }

  TfmEJStatus = class(TPage)
    Memo: TMemo;
    btnGetEJCode1Status: TButton;
    btnGetEJCode2Status: TButton;
    btnEJVersion: TButton;
    btnGetEJSerialNumber: TButton;
    btnGetAll: TButton;
    procedure btnGetEJSerialNumberClick(Sender: TObject);
    procedure btnGetEJCode1StatusClick(Sender: TObject);
    procedure btnGetEJCode2StatusClick(Sender: TObject);
    procedure btnEJVersionClick(Sender: TObject);
    procedure btnGetAllClick(Sender: TObject);
  private
    procedure AddSeparator;
    procedure GetEKLZVersion;
    procedure GetEKLZCode1Status;
    procedure GetEKLZCode2Status;
    procedure GetEKLZSerialNumber;
  end;

implementation

{$R *.DFM}

{ TfmEJStatus }

procedure TfmEJStatus.btnGetEJSerialNumberClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Memo.Clear;
    Memo.Lines.Add('');
    GetEKLZSerialNumber;
    AddSeparator;    
  finally
    EnableButtons(True);
  end;
end;

procedure TfmEJStatus.btnGetEJCode1StatusClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Memo.Clear;
    Memo.Lines.Add('');
    GetEKLZCode1Status;
    AddSeparator;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmEJStatus.btnGetEJCode2StatusClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Memo.Clear;
    Memo.Lines.Add('');
    GetEKLZCode2Status;
    AddSeparator;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmEJStatus.btnEJVersionClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Memo.Clear;
    Memo.Lines.Add('');
    GetEKLZVersion;
    AddSeparator;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmEJStatus.GetEKLZCode1Status;

  procedure EKLZFlagsToMemo;
  const
    DocType: array [0..3] of string = ('�������', '�������', '������� �������',
      '������� �������');
    BoolToStr:	array [Boolean] of string = ('[���]', '[��]');
  var
    Flags: Integer;
  begin
    Flags := Driver.EKLZFlags;
    Memo.Lines.Add('  <T> ��� ���������         : ' + DocType[Flags and $3]);
    Memo.Lines.Add('  <I> ������ �����          : ' + BoolToStr[Flags and $4=$4]);
    Memo.Lines.Add('  <F> ��������� ����������� : ' + BoolToStr[Flags and $8=$8]);
    Memo.Lines.Add('  <W> ����� ������          : ' + BoolToStr[Flags and $10=$10]);
    Memo.Lines.Add('  <D> ������ ��������       : ' + BoolToStr[Flags and $20=$20]);
    Memo.Lines.Add('  <S> ������� �����         : ' + BoolToStr[Flags and $40=$40]);
    Memo.Lines.Add('  <A> ������ ����������     : ' + BoolToStr[Flags and $80=$80]);
  end;

begin
  Check(Driver.GetEKLZCode1Report);
  AddSeparator;
  Memo.Lines.Add(' ����                 : ' + DateToStr(Driver.LastKPKDate));
  Memo.Lines.Add(' �����                : ' + TimeToStr(Driver.LastKPKTime));
  Memo.Lines.Add(' ����                 : ' + CurrToStr(Driver.LastKPKDocumentResult));
  Memo.Lines.Add(' ����� ���            : ' + IntToStr(Driver.LastKPKNumber));
  Memo.Lines.Add(' ��������� ����� ���� : ' + Driver.EKLZNumber);
  AddSeparator;
  Memo.Lines.Add(' ����� (' + IntToStr(Driver.EKLZFlags)+')');
  EKLZFlagsToMemo;
  // ������������ Memo �� ������
  Memo.SelStart := 0;
  Memo.SelLength := 0;
end;

procedure TfmEJStatus.GetEKLZCode2Status;
begin
  Check(Driver.GetEKLZCode2Report);
  AddSeparator;
  Memo.Lines.Add(' ����� �����     : ' + IntToStr(Driver.SessionNumber));
  Memo.Lines.Add(' �������         : ' + CurrToStr(Driver.Summ1));
  Memo.Lines.Add(' �������         : ' + CurrToStr(Driver.Summ2));
  Memo.Lines.Add(' ������� ������  : ' + CurrToStr(Driver.Summ3));
  Memo.Lines.Add(' ������� ������� : ' + CurrToStr(Driver.Summ4));
end;

procedure TfmEJStatus.GetEKLZSerialNumber;
begin
  Check(Driver.GetEKLZSerialNumber);
  AddSeparator;
  Memo.Lines.Add(' ��������� ����� : ' + Driver.EKLZNumber);
end;

procedure TfmEJStatus.GetEKLZVersion;
begin
  Check(Driver.GetEKLZVersion);
  AddSeparator;
  Memo.Lines.Add(' ������          : ' + Driver.EKLZVersion);
end;

procedure TfmEJStatus.btnGetAllClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Memo.Clear;
    Memo.Lines.Add('');
    GetEKLZCode1Status;
    GetEKLZCode2Status;
    GetEKLZVersion;
    GetEKLZSerialNumber;
    AddSeparator;
    // ������������ Memo �� ������
    Memo.SelStart := 0;
    Memo.SelLength := 0;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmEJStatus.AddSeparator;
begin
  Memo.Lines.Add(' ' + StringOfChar('-', 36));
end;

end.
