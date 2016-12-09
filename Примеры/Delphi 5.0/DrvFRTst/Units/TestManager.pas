unit TestManager;

interface

uses
  // VCL
  Windows, Classes;

type
  TChangeType = (ctUpdate, ctGetPassword);
  TChangeEvent = procedure(Sender: TObject; ChangeType: TChangeType) of object;

  { TTestManager }

  TTestManager = class
  private
    FTickCount: DWORD;
    FPassword: Integer;
    FOnChange: TChangeEvent;
    function GetPassword: Integer;
    procedure DoChange(AChangeType: TChangeType);
  public
    procedure StopTest;
    procedure StartTest;

    property TickCount: DWORD read FTickCount;
    property Password: Integer read GetPassword write FPassword;
    property OnChange: TChangeEvent read FOnChange write FOnChange;
  end;

var
  DriverManager: TTestManager;

implementation

{ TTestManager }

procedure TTestManager.DoChange(AChangeType: TChangeType);
begin
  if Assigned(FOnChange) then FOnChange(Self, AChangeType);
end;

function TTestManager.GetPassword: Integer;
begin
  DoChange(ctGetPassword);
  Result := FPassword;
end;

procedure TTestManager.StartTest;
begin
  FTickCount := GetTickCount;
end;

procedure TTestManager.StopTest;
begin
  DoChange(ctUpdate);
end;

initialization
  DriverManager := TTestManager.Create;

finalization
  DriverManager.Free;

end.
