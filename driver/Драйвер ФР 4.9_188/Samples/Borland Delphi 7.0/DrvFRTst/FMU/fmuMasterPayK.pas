unit fmuMasterPayK;

interface

uses
  // VCL
  Windows, Forms, ComCtrls, StdCtrls, Controls, Classes, SysUtils, Messages,
  Buttons, Dialogs,
  // This
  untPages, untUtil, untDriver;

type
  { TfmMasterPayK }

  TfmMasterPayK = class(TPage)
    Memo: TMemo;
    btnReadLastReceipt: TButton;
    btnReadLastReceiptLine: TButton;
    btnReadLastReceiptMac: TButton;
    btnReadReceipt: TButton;
    btnSave: TBitBtn;
    SaveDialog: TSaveDialog;
    chbSaveReceipt: TCheckBox;
    Label1: TLabel;
    procedure btnReadLastReceiptClick(Sender: TObject);
    procedure btnReadLastReceiptLineClick(Sender: TObject);
    procedure btnReadLastReceiptMacClick(Sender: TObject);
    procedure btnReadReceiptClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
    function GetReceiptFileName: string;
    procedure SaveReceipt(const Text: string);
  end;

implementation

{$R *.DFM}

{ TfmMasterPayK }

procedure TfmMasterPayK.btnReadLastReceiptClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Memo.Clear;
    if Driver.ReadLastReceipt = 0 then
    begin
      Memo.Lines.Add(Format(' Íîìåğ îïåğàòîğà: %d', [Driver.OperatorNumber]));
    end;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmMasterPayK.btnReadLastReceiptLineClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Memo.Clear;
    if Driver.ReadLastReceiptLine = 0 then
    begin
      Memo.Lines.Add(Format(' Íîìåğ îïåğàòîğà: %d', [Driver.OperatorNumber]));
      Memo.Lines.Add(Format(' Äàííûå: %s', [Driver.LineData]));
    end;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmMasterPayK.btnReadLastReceiptMacClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Memo.Clear;
    if Driver.ReadLastReceiptMac = 0 then
    begin
      Memo.Lines.Add(Format(' Íîìåğ îïåğàòîğà: %d', [Driver.OperatorNumber]));
      Memo.Lines.Add(Format(' ÊÏÊ: %d', [Driver.KPKNumber]));
    end;
  finally
    EnableButtons(True);
  end;
end;

function TfmMasterPayK.GetReceiptFileName: string;
begin
  Result := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0))) +
    'Receipt.txt';
end;

procedure TfmMasterPayK.SaveReceipt(const Text: string);
var
  Mode: Integer;
  Stream: TFileStream;
begin
  if Length(Text) = 0 then Exit;

  Mode := fmCreate;
  if FileExists(GetReceiptFileName) then Mode := fmOpenReadWrite;
  Mode := Mode + fmShareDenyWrite;
  Stream := TFileStream.Create(GetReceiptFileName, Mode);
  try
    Stream.Seek(0, soFromEnd);
    Stream.Write(Text[1], Length(Text));
  finally
    Stream.Free;
  end;
end;

procedure TfmMasterPayK.btnReadReceiptClick(Sender: TObject);
const
  CRLF = #13#10;
  TestReceipt =
  '                                   ÊÊÌ 1' + CRLF +
  'ÊÊÌ 001234567890 ÈÍÍ 000000123456       ' + CRLF +
  'İÊËÇ 0000000007                         ' + CRLF +
  'ÊÎÍÒĞÎËÜÍÀß ËÅÍÒÀ. ÑÌÅÍÀ 0001           ' + CRLF +
  'ÏĞÎÄÀÆÀ 16/04/10 19:24 ÎÏÅĞÀÒÎĞ00       ' + CRLF +
  'ÎÒÄÅË001     1.000                 *1.23' + CRLF +
  'ÑÊÈÄÊÀ                             *1.23' + CRLF +
  'ÍÀÖÅÍÊÀ                            *1.23' + CRLF +
  'ÈÒÎÃ                               *1.23' + CRLF +
  '00000005 #002163                        ';
begin
  EnableButtons(False);
  try
    Memo.Clear;
    if Driver.ReadLastReceipt = 0 then
    begin
      while True do
      begin
        if Driver.ReadLastReceiptLine <> 0 then Break;
        Memo.Lines.Add(Driver.LineData);
      end;
    end;
    //Memo.Lines.Text := TestReceipt;
    if chbSaveReceipt.Checked then
      SaveReceipt(Memo.Lines.Text);
  finally
    EnableButtons(True);
  end;
end;

procedure TfmMasterPayK.btnSaveClick(Sender: TObject);
begin
  if SaveDialog.Execute then
    Memo.Lines.SaveToFile(SaveDialog.FileName);
end;

end.
