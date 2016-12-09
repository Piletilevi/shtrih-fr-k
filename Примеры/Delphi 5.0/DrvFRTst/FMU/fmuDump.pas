unit fmuDump;

interface

uses
  // VCL
  Windows, Forms, Grids, Dialogs, StdCtrls, Buttons, ExtCtrls, Classes, Controls,
  SysUtils;

type
  { TDeviceRec }

  TDeviceRec = record
    Code: Integer;
    Description: string;
  end;

  { TfmDump }

  TfmDump = class(TForm)
    Grid: TStringGrid;
    SaveDialog: TSaveDialog;
    OpenDialog: TOpenDialog;
    pnlTop: TPanel;
    btnSave: TBitBtn;
    btnCompare: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCompareClick(Sender: TObject);
  private
    FDump: string;
    FDevice: TDeviceRec;
    procedure UpdatePage;
  end;

procedure ShowDumpDlg(AOwner: TComponent; const Data: string;
  const ADevice: TDeviceRec);

implementation

{$R *.DFM}

procedure ShowDumpDlg(AOwner: TComponent; const Data: string;
  const ADevice: TDeviceRec);
var
  fm: TfmDump;
begin
  fm := TfmDump.Create(AOwner);
  try
    fm.FDump := Data;
    fm.FDevice := ADevice;
    fm.UpdatePage;
    fm.ShowModal;
  finally
    fm.Free;
  end;
end;

{ TfmDump }

procedure TfmDump.FormCreate(Sender: TObject);
Var
  i: Integer;
begin
  for i := 1 to 16 do
    Grid.Cells[i,0] := IntToHex(i-1,2);
  Grid.ColWidths[0] := 60;
end;

procedure TfmDump.UpdatePage;
var
  i, j: Integer;
  DataSize: Integer;
  RowCount: Integer;
  BytesCount: Integer;
  RowData: string;
begin
  DataSize := Length(FDump);
  RowCount := DataSize div 16;
  if (DataSize mod 16) <> 0 then Inc(RowCount);
  if RowCount = 0 then RowCount := 1;
  Grid.RowCount := RowCount + 1;

  for i := 1 to RowCount do
  begin
    RowData := Copy(FDump, (i-1)*16 + 1, 16);
    BytesCount := Length(RowData);
    Grid.Cells[0, i] := IntToHex((i-1)*16, 6);
    for j := 1 to BytesCount do
      Grid.Cells[j, i] := IntToHex(Ord(RowData[j]), 2);
    for j := BytesCount + 1 to 16 do
      Grid.Cells[j, i] := '';
  end;
end;

procedure TfmDump.btnSaveClick(Sender: TObject);
var
  Stream: TFileStream;
begin
  if SaveDialog.Execute then
  begin
    Stream := TFileStream.Create(SaveDialog.FileName, fmCreate);
    try
      Stream.Write(FDump[1], Length(FDump));
    finally
      Stream.Free;
    end;
  end;
end;

procedure TfmDump.btnCompareClick(Sender: TObject);
var
  S: string;
  Data: string;
  Stream: TFileStream;
begin
  if not (FDevice.Code in [5,6]) then
  begin
    S := FDevice.Description + ' не сравнивается с эталоном.';
    MessageBox(Handle, PChar(S), PChar(Application.Title),
      MB_OK or MB_ICONEXCLAMATION);
    Exit;
  end;
  if OpenDialog.Execute then
  begin
    Stream := TFileStream.Create(OpenDialog.FileName, fmOpenRead);
    try
      SetLength(Data, Stream.Size);
      Stream.Read(Data[1], Stream.Size);
    finally
      Stream.Free;
    end;

    if FDevice.Code = 5 then S := 'Прошивка ФП'
    else S := 'Прошивка ФР';

    if FDump = Data then S := S + ' совпадает с эталонной.'
    else S := S + ' не совпадает с эталонной.';
    MessageBox(Handle, PChar(S), PChar(Application.Title), MB_OK);
  end;
end;

end.
