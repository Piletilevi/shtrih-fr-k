unit fmuGraph;

interface

uses
  // VCL
  Windows, ExtDlgs, Dialogs, ComCtrls, ExtCtrls, Controls, StdCtrls,
  Classes, SysUtils, Graphics, Forms, Buttons,
  // This
  untPages, untDriver, TestManager, untUtil;

type
  TfmGraph = class(TPage)
    btnDraw: TButton;
    edtBarcode: TEdit;
    btnLoadImage: TButton;
    btnPrintBarcode: TButton;
    btnDrawEx: TButton;
    btnLoadLineDataEx: TButton;
    btnWideLoadLineData: TButton;
    btnMonochrome1: TButton;
    btnMonochrome2: TButton;
    lblFirstLineNumber: TLabel;
    edtFirstLineNumber: TEdit;
    udFirstLineNumber: TUpDown;
    lblLastLineNumber: TLabel;
    edtLastLineNumber: TEdit;
    udLastLineNumber: TUpDown;
    pnlImage: TPanel;
    Image: TImage;
    ProgressBar: TProgressBar;
    lblBarcode: TLabel;
    OpenPictureDialog: TOpenPictureDialog;
    btnOpenPicture: TBitBtn;
    Label1: TLabel;
    Bevel1: TBevel;
    procedure btnDrawClick(Sender: TObject);
    procedure btnLoadImageClick(Sender: TObject);
    procedure btnPrintBarcodeClick(Sender: TObject);
    procedure btnOpenPictureClick(Sender: TObject);
    procedure btnDrawExClick(Sender: TObject);
    procedure btnLoadLineDataExClick(Sender: TObject);
    procedure btnWideLoadLineDataClick(Sender: TObject);
    procedure btnMonochrome1Click(Sender: TObject);
    procedure btnMonochrome2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btnDrawMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btnPrintBarcodeMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
  private
    function ContinueExecution: Boolean;
    procedure MonochromeImage(Image: TImage);
    procedure MonochromeImage2(Image: TImage);
  end;


implementation

{$R *.DFM}

function ColorToInt(Value: TColor): Cardinal;
var
  RGB: Cardinal;
begin
  RGB := ColorToRGB(Value);
  Result := (RGB and $FF) +
    ((RGB and $FF00) shr 8) +
    ((RGB and $FF0000) shr 16);
end;

function GetLineData(Image: TImage; Index: Integer): string;
const
  Bits: array[0..7] of Byte = (1,2,4,8,$10,$20,$40,$80);
var
  Data: Byte;
  i,j: Integer;
  ImageWidth: Integer;
begin
  Result := '';
  ImageWidth := Image.Picture.Width;
  for i := 0 to 39 do
  begin
    Data := 0;
    for j := 0 to 7 do
    begin
      if (8*i+j) <= ImageWidth then
      begin
        if (Image.Canvas.Pixels[8*i + j, Index] = clBlack)or
          (Image.Canvas.Pixels[8*i+j, Index] = 0) then
        Data := Data + Bits[j];
      end;
    end;
    Result := Result + Chr(Data);
  end;
end;

function GetPixelColor(Image: TImage; X,Y: Integer): Longint;
var
  Color: Longint;
  Green, Red, Blue: Byte;
begin
  Color := ColorToRGB(Image.Canvas.Pixels[X,Y]);
  Red := Color and $FF;
  Green := Color and $FFFF;
  Blue := Color and $FFFFFF;
  Result := Red*Red + Green*Green + Blue*Blue;
end;

function GetAvColor(Image: TImage): Extended;
var
  i,j: Integer;
  ImWidth, ImHeight: Integer;
begin
  ImWidth := Image.Picture.Width;
  ImHeight := Image.Picture.Height;

  Result := 0;
  for i := 0 to ImWidth-1 do
  for j := 0 to ImHeight-1 do
    Result := Result + GetPixelColor(Image, i, j);

  Result := Result/(ImWidth*ImHeight);
end;

procedure TfmGraph.MonochromeImage(Image: TImage);
var
  i,j: Integer;
  Color: Longint;
  AvColor: Extended;
  ImWidth, ImHeight: Integer;
begin
  AvColor := GetAvColor(Image);
  ImWidth := Image.Picture.Width;
  ImHeight := Image.Picture.Height;

  ProgressBar.Max := ImHeight;
  ProgressBar.Visible := True;

  for i := 0 to ImWidth-1 do
  begin
    for j := 0 to ImHeight-1 do
    begin
      Color := GetPixelColor(Image, i, j);
      if Color < AvColor then
        Image.Canvas.Pixels[i,j] := clBlack
      else
        Image.Canvas.Pixels[i,j] := clWhite;
    end;
    ProgressBar.Position := i;
  end;
  Image.Picture.Bitmap.Monochrome := True;
  Image.Picture.Bitmap.PixelFormat := pf1bit;
  ProgressBar.Visible := False;
end;

procedure TfmGraph.MonochromeImage2(Image: TImage);
var
  i,j: Integer;
  ImWidth: Integer;
  ImHeight: Integer;
  Bits: array of array of Boolean;
begin
  ImWidth := Image.Picture.Width;
  if ImWidth > 320 then ImWidth := 320;
  ImHeight := Image.Picture.Height;
  ProgressBar.Max := ImWidth*2;
  ProgressBar.Visible := True;

  SetLength(Bits, ImWidth);
  for i := 1 to ImWidth-1 do
  begin
    SetLength(Bits[i], ImHeight);
    for j := 1 to ImHeight-1 do
    begin
      if (i = 0)or(i = ImWidth-1) or (j=0)or(j= ImHeight-1) then
      begin
        Bits[i,j] := True;
        Continue;
      end
      else
      begin
        //8-связность
        if ColorToInt(Image.Canvas.Pixels[i-1,j+1])+
           ColorToInt(Image.Canvas.Pixels[i,j+1])+
           ColorToInt(Image.Canvas.Pixels[i+1,j+1])+
           ColorToInt(Image.Canvas.Pixels[i-1,j])+
           ColorToInt(Image.Canvas.Pixels[i+1,j])+
           ColorToInt(Image.Canvas.Pixels[i-1,j-1])+
           ColorToInt(Image.Canvas.Pixels[i,j-1])+
           ColorToInt(Image.Canvas.Pixels[i+1,j-1]) <= 8*ColorToInt(Image.Canvas.Pixels[i,j]) Then
          Bits[i,j] := TRUE
        else
        begin
          Bits[i,j] := FALSE;
        end;
      end;
    end;
    ProgressBar.Position := i;
  end;
  for i := 1 to ImWidth-1 do
  begin
    for j := 1 to ImHeight-1 do
    begin
      if not Bits[i,j] then
        Image.Canvas.Pixels[i,j] := clBlack
      else
        Image.Canvas.Pixels[i,j] := clWhite;
    end;
    ProgressBar.Position := ImWidth + i;
  end;
  Image.Picture.Bitmap.Monochrome := True;
  Image.Picture.Bitmap.PixelFormat := pf1bit;
  ProgressBar.Visible := False;
end;

procedure TfmGraph.btnDrawClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.FirstLineNumber := StrToInt(edtFirstLineNumber.Text);
    Driver.LastLineNumber := StrToInt(edtLastLineNumber.Text);
    Driver.Draw;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

function TfmGraph.ContinueExecution: Boolean;
var
  S: string;
  ResultCode: Integer;
  ResultCodeDescription: string;
begin
  ResultCode := Driver.ResultCode;
  ResultCodeDescription := Driver.ResultCodeDescription;
  S := Format('Ошибка %d: %s'#10#13'Продолжить?',
    [ResultCode, ResultCodeDescription]);
  Result := MessageBox(Handle, PChar(S), PChar(Application.Title),
    MB_YESNO) = IDYES;
end;

procedure TfmGraph.btnLoadImageClick(Sender: TObject);
var
  i: Integer;
  Count: Integer;
begin
  if Image.Picture.Graphic = nil then Exit;

  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Count := Image.Picture.Height;
    if Count > 200 then Count := 200;
    ProgressBar.Max := Count;
    ProgressBar.Visible := True;
    for i := 0 to Count-1 do
    begin
      Driver.LineNumber := i;
      Driver.LineData := GetLineData(Image, i);
      if Driver.LoadLineData <> 0 then
      begin
        if not ContinueExecution then Break;
      end;
      ProgressBar.Position := i;
    end;
    UpdatePage;
  finally
    EnableButtons(True);
    ProgressBar.Visible := False;
  end;
end;

procedure TfmGraph.btnPrintBarcodeClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.Barcode := edtBarcode.Text;
    Driver.PrintBarcode;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmGraph.btnOpenPictureClick(Sender: TObject);
begin
  if OpenPictureDialog.Execute then
  begin
    Driver.Password := DriverManager.Password;
    Image.Picture.LoadFromFile(OpenPictureDialog.FileName);
    UpdatePage;
  end;
end;

procedure TfmGraph.btnDrawExClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.FirstLineNumber := StrToInt(edtFirstLineNumber.Text);
    Driver.LastLineNumber := StrToInt(edtLastLineNumber.Text);
    Driver.DrawEx;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmGraph.btnLoadLineDataExClick(Sender: TObject);
var
  i: Integer;
  Count: Integer;
begin
  if Image.Picture.Graphic = nil then Exit;

  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Count := Image.Picture.Height;
    if Count > 1200 then Count := 1200;
    ProgressBar.Max := Count;
    ProgressBar.Visible := True;
    for i := 0 to Count-1 do
    begin
      Driver.LineNumber := i;
      Driver.LineData := GetLineData(Image, i);
      if Driver.LoadLineDataEx <> 0 then
      begin
        if not ContinueExecution then Break;
      end;
      ProgressBar.Position := i;
    end;
    UpdatePage;
  finally
    EnableButtons(True);
    ProgressBar.Visible := False;
  end;
end;

procedure TfmGraph.btnWideLoadLineDataClick(Sender: TObject);
var
  i: Integer;
  LineData: string;
  ImageHeight: Integer;
begin
  if Image.Picture.Graphic = nil then Exit;

  ImageHeight := Image.Picture.Height;
  if ImageHeight > 1200 then ImageHeight := 1200;

  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    LineData := '';
    for i := 0 to ImageHeight-1 do
    begin
      LineData := LineData + GetLineData(Image, i);
    end;
    Driver.LineNumber := StrToInt(edtFirstLineNumber.Text);
    Driver.LineData := LineData;
    Driver.WideLoadLineData;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmGraph.btnMonochrome1Click(Sender: TObject);
begin
  if Image.Picture.Graphic = nil then Exit;

  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    MonochromeImage(Image);
    UpdatePage;
  finally
    EnableButtons(true);
  end;
end;

procedure TfmGraph.btnMonochrome2Click(Sender: TObject);
begin
  if Image.Picture.Graphic = nil then Exit;

  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    MonochromeImage2(Image);
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmGraph.FormCreate(Sender: TObject);
begin
  OpenPictureDialog.InitialDir := ExtractFilePath(ParamStr(0));
end;

procedure TfmGraph.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if HighLighting then
  begin
    edtBarcode.Color := clWindow;
    edtFirstLineNumber.Color := clWindow;
    edtLastLineNumber.Color := clWindow;
  end;
end;

procedure TfmGraph.btnDrawMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if HighLighting then
  begin
    edtFirstLineNumber.Color := InColor;
    edtLastLineNumber.Color := InColor;
  end;
end;

procedure TfmGraph.btnPrintBarcodeMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if HighLighting then
    edtBarcode.Color := InColor;
end;

end.
