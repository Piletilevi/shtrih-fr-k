unit fmuTable;

interface

uses
  // VCL
  ComCtrls, StdCtrls, Controls, Classes, SysUtils, ExtCtrls, Buttons, Graphics,
  // This
  untPages, untUtil, untDriver, Spin;

type
  { TfmTable }

  TfmTable = class(TPage)
    Memo: TMemo;
    edtValue: TEdit;
    lblValue: TLabel;
    lblRowNumber: TLabel;
    lblTableNumber: TLabel;
    lblFieldNumber: TLabel;
    btnGetTableStruct: TBitBtn;
    btnGetFieldStruct: TBitBtn;
    btnReadTable: TBitBtn;
    btnWriteTable: TBitBtn;
    btnInitTable: TBitBtn;
    seTableNumber: TSpinEdit;
    seRowNumber: TSpinEdit;
    seFieldNumber: TSpinEdit;
    btnShowTablesDlg: TButton;
    procedure btnGetTableStructClick(Sender: TObject);
    procedure btnGetFieldStructClick(Sender: TObject);
    procedure btnReadTableClick(Sender: TObject);
    procedure btnWriteTableClick(Sender: TObject);
    procedure btnInitTableClick(Sender: TObject);
    procedure btnShowTablesDlgClick(Sender: TObject);
  end;

implementation

{$R *.DFM}

{ TfmTable }

procedure TfmTable.btnGetTableStructClick(Sender: TObject);
begin
  Memo.Clear;
  EnableButtons(False);
  try
    Driver.TableNumber := seTableNumber.Value;
    if Driver.GetTableStruct=0 then
    begin
      Memo.Lines.Add('�������� �������: ' + Driver.TableName);
      Memo.Lines.Add('���-�� �����: ' + IntToStr(Driver.RowNumber));
      Memo.Lines.Add('���-�� �����: ' + IntToStr(Driver.FieldNumber));
    end;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmTable.btnGetFieldStructClick(Sender: TObject);
begin
  Memo.Clear;
  EnableButtons(False);
  try
    Driver.TableNumber := seTableNumber.Value;
    Driver.FieldNumber := seFieldNumber.Value;
    if Driver.GetFieldStruct = 0 then
    begin
      Memo.Lines.Add('�������� ����: ' + Driver.FieldName);
      if Driver.FieldType then Memo.Lines.Add('    ��� ����: ������')
      else Memo.Lines.Add('��� ����: �����');
      Memo.Lines.Add('������ ����: '+IntToStr(Driver.FieldSize));
      if not Driver.FieldType then
      begin
        Memo.Lines.Add('���. ��������: '+IntToStr(Driver.MINValueOfField));
        Memo.Lines.Add('����. ��������: '+IntToStr(Driver.MaxValueOfField));
      end;
    end;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmTable.btnReadTableClick(Sender: TObject);
begin
  Memo.Clear;
  EnableButtons(False);
  try
    Driver.TableNumber := seTableNumber.Value;
    Driver.FieldNumber := seFieldNumber.Value;
    Driver.RowNumber := seRowNumber.Value;
    if Driver.ReadTable = 0 then
    begin
      Memo.Lines.Add('�������� ����: '+Driver.FieldName);
      if Driver.FieldType then Memo.Lines.Add('    ��� ����: ������')
      else Memo.Lines.Add('��� ����: �����');
      Memo.Lines.Add('������ ����: '+IntToStr(Driver.FieldSize));
      if not Driver.FieldType then
      begin
        Memo.Lines.Add('����. ��������: '+IntToStr(Driver.MINValueOfField));
        Memo.Lines.Add('����. ��������: '+IntToStr(Driver.MaxValueOfField));
        edtValue.Text := IntToStr(Driver.ValueOfFieldInteger);
      end
      else
      begin
        edtValue.Text := Driver.ValueOfFieldString;
      end;
    end;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmTable.btnWriteTableClick(Sender: TObject);
begin
  Memo.Clear;
  EnableButtons(False);
  try
    Driver.TableNumber := seTableNumber.Value;
    Driver.FieldNumber := seFieldNumber.Value;
    Driver.RowNumber := seRowNumber.Value;
    Driver.ValueOfFieldString := edtValue.Text;
    if Driver.WriteTable = 0 then
    begin
      Memo.Lines.Add('��������� ����:');
      Memo.Lines.Add('    �������� ����: ' + Driver.FieldName);
      if Driver.FieldType then Memo.Lines.Add('    ��� ����: ������')
      else Memo.Lines.Add('    ��� ����: �����');
      Memo.Lines.Add('    ������ ����: '+IntToStr(Driver.FieldSize));
      if not Driver.FieldType then
      begin
        Memo.Lines.Add('    ����. ��������: '+IntToStr(Driver.MINValueOfField));
        Memo.Lines.Add('    ����. ��������: '+IntToStr(Driver.MaxValueOfField));
        edtValue.Text := IntToStr(Driver.ValueOfFieldInteger);
      end else
        edtValue.Text := Driver.ValueOfFieldString;
    end;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmTable.btnInitTableClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.InitTable;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmTable.btnShowTablesDlgClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.ParentWnd := Handle;
    Driver.ShowTablesDlg;
  finally
    EnableButtons(True);
  end;
end;

end.
