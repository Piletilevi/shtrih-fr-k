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
      Memo.Lines.Add('Название таблицы: ' + Driver.TableName);
      Memo.Lines.Add('Кол-во рядов: ' + IntToStr(Driver.RowNumber));
      Memo.Lines.Add('Кол-во полей: ' + IntToStr(Driver.FieldNumber));
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
      Memo.Lines.Add('Название поля: ' + Driver.FieldName);
      if Driver.FieldType then Memo.Lines.Add('    Тип поля: строка')
      else Memo.Lines.Add('Тип поля: число');
      Memo.Lines.Add('Размер поля: '+IntToStr(Driver.FieldSize));
      if not Driver.FieldType then
      begin
        Memo.Lines.Add('Мин. значение: '+IntToStr(Driver.MINValueOfField));
        Memo.Lines.Add('Макс. значение: '+IntToStr(Driver.MaxValueOfField));
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
      Memo.Lines.Add('Название поля: '+Driver.FieldName);
      if Driver.FieldType then Memo.Lines.Add('    Тип поля: строка')
      else Memo.Lines.Add('Тип поля: число');
      Memo.Lines.Add('Размер поля: '+IntToStr(Driver.FieldSize));
      if not Driver.FieldType then
      begin
        Memo.Lines.Add('Мини. значение: '+IntToStr(Driver.MINValueOfField));
        Memo.Lines.Add('Макс. значение: '+IntToStr(Driver.MaxValueOfField));
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
      Memo.Lines.Add('Структура поля:');
      Memo.Lines.Add('    Название поля: ' + Driver.FieldName);
      if Driver.FieldType then Memo.Lines.Add('    Тип поля: строка')
      else Memo.Lines.Add('    Тип поля: число');
      Memo.Lines.Add('    Размер поля: '+IntToStr(Driver.FieldSize));
      if not Driver.FieldType then
      begin
        Memo.Lines.Add('    Мини. значение: '+IntToStr(Driver.MINValueOfField));
        Memo.Lines.Add('    Макс. значение: '+IntToStr(Driver.MaxValueOfField));
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
