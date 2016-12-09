unit fmuTable;

interface

uses
  // VCL
  ComCtrls, StdCtrls, Controls, Classes, SysUtils, ExtCtrls, Buttons, Graphics,
  // This
  untPages, untDriver, TestManager, untUtil;

type
  TfmTable = class(TPage)
    Memo: TMemo;
    edtValue: TEdit;
    lblValue: TLabel;
    lblRowNumber: TLabel;
    edtRowNumber: TEdit;
    edtFieldNumber: TEdit;
    edtTableNumber: TEdit;
    lblTableNumber: TLabel;
    lblFieldNumber: TLabel;
    udTableNumber: TUpDown;
    udFieldNumber: TUpDown;
    udRowNumber: TUpDown;
    lblTables: TLabel;
    Bevel1: TBevel;
    btnGetTableStruct: TBitBtn;
    btnGetFieldStruct: TBitBtn;
    btnReadTable: TBitBtn;
    btnWriteTable: TBitBtn;
    btnInitTable: TBitBtn;
    procedure btnGetTableStructClick(Sender: TObject);
    procedure btnGetFieldStructClick(Sender: TObject);
    procedure btnReadTableClick(Sender: TObject);
    procedure btnWriteTableClick(Sender: TObject);
    procedure btnInitTableClick(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btnGetTableStructMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
    procedure btnGetFieldStructMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
    procedure btnReadTableMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btnWriteTableMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
  end;

implementation

{$R *.DFM}

{ TfmTable }

procedure TfmTable.btnGetTableStructClick(Sender: TObject);
begin
  Memo.Clear;
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.TableNumber := StrToInt(edtTableNumber.Text);
    if Driver.GetTableStruct=0 then
    begin
      Memo.Lines.Add('Название таблицы: ' + Driver.TableName);
      Memo.Lines.Add('Кол-во рядов: ' + IntToStr(Driver.RowNumber));
      Memo.Lines.Add('Кол-во полей: ' + IntToStr(Driver.FieldNumber));
    end;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmTable.btnGetFieldStructClick(Sender: TObject);
begin
  Memo.Clear;
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.TableNumber := StrToInt(edtTableNumber.Text);
    Driver.FieldNumber := StrToInt(edtFieldNumber.Text);
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
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmTable.btnReadTableClick(Sender: TObject);
begin
  Memo.Clear;
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.TableNumber := StrToInt(edtTableNumber.Text);
    Driver.FieldNumber := StrToInt(edtFieldNumber.Text);
    Driver.RowNumber := StrToInt(edtRowNumber.Text);
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
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmTable.btnWriteTableClick(Sender: TObject);
begin
  Memo.Clear;
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.TableNumber := StrToInt(edtTableNumber.Text);
    Driver.FieldNumber := StrToInt(edtFieldNumber.Text);
    Driver.RowNumber := StrToInt(edtRowNumber.Text);
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
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmTable.btnInitTableClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.InitTable;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmTable.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if HighLighting then
  begin
    edtValue.Color := clWindow;
    edtRowNumber.Color := clWindow;
    edtFieldNumber.Color := clWindow;
    edtTableNumber.Color := clWindow;
  end;
end;

procedure TfmTable.btnGetTableStructMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if HighLighting then
    edtTableNumber.Color := InColor;
end;

procedure TfmTable.btnGetFieldStructMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if HighLighting then
  begin
    edtTableNumber.Color := InColor;
    edtFieldNumber.Color := InColor;
  end;
end;

procedure TfmTable.btnReadTableMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if HighLighting then
  begin
    edtTableNumber.Color := InColor;
    edtFieldNumber.Color := InColor;
    edtRowNumber.Color := InColor;
    edtValue.Color := OutColor;
  end;
end;

procedure TfmTable.btnWriteTableMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if HighLighting then
  begin
    edtTableNumber.Color := InColor;
    edtFieldNumber.Color := InColor;
    edtRowNumber.Color := InColor;
    edtValue.Color := InColor;
  end;
end;

end.
