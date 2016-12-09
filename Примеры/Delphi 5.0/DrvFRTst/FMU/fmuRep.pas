unit fmuRep;

interface

uses
  // VCL
  Classes, Controls, StdCtrls, ExtCtrls,
  // This
  untPages, untDriver, TestManager;

type
  { TfmRep }

  TfmRep = class(TPage)
    btnPrintDepartmentReport: TButton;
    btnPrintReportWithCleaning: TButton;
    btnPrintTaxReport: TButton;
    btnPrintOperationReg: TButton;
    btnPrintReportWithoutCleaning: TButton;
    btnOpenSession: TButton;
    btnPrintZReportInBuffer: TButton;
    btnPrintZReportFromBuffer: TButton;
    procedure btnPrintDepartmentReportClick(Sender: TObject);
    procedure btnPrintReportWithCleaningClick(Sender: TObject);
    procedure btnPrintTaxReportClick(Sender: TObject);
    procedure btnPrintOperationRegClick(Sender: TObject);
    procedure btnPrintReportWithoutCleaningClick(Sender: TObject);
    procedure btnOpenSessionClick(Sender: TObject);
    procedure btnPrintZReportInBufferClick(Sender: TObject);
    procedure btnPrintZReportFromBufferClick(Sender: TObject);
  end;

implementation

{$R *.DFM}

procedure TfmRep.btnPrintDepartmentReportClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.PrintDepartmentReport;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmRep.btnPrintReportWithCleaningClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.PrintReportWithCleaning;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmRep.btnPrintTaxReportClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.PrintTaxReport;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmRep.btnPrintOperationRegClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.PrintOperationReg;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmRep.btnPrintReportWithoutCleaningClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.PrintReportWithoutCleaning;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmRep.btnOpenSessionClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.OpenSession;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmRep.btnPrintZReportInBufferClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.PrintZReportInBuffer;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

procedure TfmRep.btnPrintZReportFromBufferClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.Password := DriverManager.Password;
    Driver.PrintZReportFromBuffer;
    UpdatePage;
  finally
    EnableButtons(True);
  end;
end;

end.
