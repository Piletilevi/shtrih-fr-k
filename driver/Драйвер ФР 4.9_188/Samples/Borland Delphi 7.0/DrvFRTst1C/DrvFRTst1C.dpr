program DrvFRTst1C;

uses
  Forms,
  fmuMain in 'FMU\fmuMain.pas' {Form1},
  DrvFRTst1C_TLB in 'DrvFRTst1C_TLB.pas',
  OleArray1C in 'Units\OleArray1C.pas' {Array1C: CoClass},
  Driver1C in 'Units\Driver1C.pas',
  DrvFRLib_TLB in '..\DrvFR\DrvFRLib_TLB.pas',
  LanguageExtender in 'Units\LanguageExtender.pas',
  VLEUtil in 'Units\VLEUtil.pas';

{$R *.TLB}

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
