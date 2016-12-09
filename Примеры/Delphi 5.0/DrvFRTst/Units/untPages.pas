unit untPages;

interface

Uses
  // VCL
  Windows, Classes, Controls, ExtCtrls,
  // This
  SizeableForm, TestManager;

type
  TPage = class;
  TPageClass = class of TPage;

  { TPages }

  TPages = class
  private
    FList: TList;
    FPage: TPage;
    procedure Clear;
    function GetCount: Integer;
    procedure InsertItem(AItem: TPage);
    procedure RemoveItem(AItem: TPage);
    function GetItem(Index: Integer): TPage;
  public
    constructor Create;
    destructor Destroy; override;

    procedure ShowPage(APage: TPage);

    property Count: Integer read GetCount;
    property Page: TPage read FPage write FPage;
    property Items[Index: Integer]: TPage read GetItem; default;
  end;

  { TPage }

  TPage = class(TSizeableForm)
  private
    FOwner: TPages;
    FPages: TPages;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure UpdatePage; virtual;
    procedure UpdateObject; virtual;
    procedure SetOwner(AOwner: TPages);
    function LoadDefaults: Boolean; virtual;
    procedure EnableButtons(Value: Boolean); override;
    procedure ExecuteCommand(var ResultCode, Count: Integer); virtual;

    property Pages: TPages read FPages;
  end;

implementation

{ TPages }

constructor TPages.Create;
begin
  inherited Create;
  FList := TList.Create;
end;

destructor TPages.Destroy;
begin
  Clear;
  FList.Free;
  inherited Destroy;
end;

procedure TPages.Clear;
begin
  while Count > 0 do
    Items[0].Free;
end;

function TPages.GetCount: Integer;
begin
  Result := FList.Count;
end;

function TPages.GetItem(Index: Integer): TPage;
begin
  Result := FList[Index];
end;

procedure TPages.InsertItem(AItem: TPage);
begin
  FList.Add(AItem);
  AItem.FOwner := Self;
end;

procedure TPages.RemoveItem(AItem: TPage);
begin
  AItem.FOwner := nil;
  FList.Remove(AItem);
end;

procedure TPages.ShowPage(APage: TPage);

  // Спрятать страницу и всех ее родителей

  procedure HidePageTree(Page: TWinControl);
  begin
    if Page <> nil then
    begin
      if (Page is TPage) or (Page is TPanel) then
      begin
        Page.Visible := False;
        if Page is TPage then
          TPage(Page).UpdateObject;
        if (Page.Parent is TPage) or (Page.Parent is TPanel) then
          HidePageTree(Page.Parent);
      end;
    end;
  end;

  // Показать страницу и всех ее родителей

  procedure ShowPageTree(Page: TWinControl);
  begin
    if Page <> nil then
    begin
      if (Page is TPage) or (Page is TPanel) then
      begin
        Page.Visible := True;
        Page.Align := alClient;
        if Page is TPage then
          (Page as TPage).UpdateObject;
        if (Page.Parent is TPage) or (Page.Parent is TPanel) then
        begin
          ShowPageTree(Page.Parent);
          // Предполагается, что дочерняя страничка всегда помещается
          // на панель TPanel родительской страницы
          if (Page is TPage) and (Page.Parent.Parent is TPage) then
          begin
            // Сообщаем родительской страничке указатель на текущую
            // дочернюю страничку
            (Page.Parent.Parent as TPage).Pages.Page := Page as TPage;
          end;
        end;
      end;
    end;
  end;

begin
  if APage <> FPage then
  begin
    HidePageTree(FPage);
    ShowPageTree(APage);
    FPage := APage;
  end;
end;

{ TPage }

constructor TPage.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FPages := TPages.Create;
end;

destructor TPage.Destroy;
begin
  SetOwner(nil);
  FPages.Free;
  inherited Destroy;
end;

procedure TPage.SetOwner(AOwner: TPages);
begin
  if FOwner <> nil then FOwner.RemoveItem(Self);
  if AOwner <> nil then AOwner.InsertItem(Self);
end;

procedure TPage.UpdatePage;
begin

end;

procedure TPage.UpdateObject;
begin

end;

procedure TPage.EnableButtons(Value: Boolean);
begin
  inherited EnableButtons(Value);
  if Value then
    DriverManager.StopTest
  else
    DriverManager.StartTest;
end;

function TPage.LoadDefaults: Boolean;
begin
  Result := True;
end;

procedure TPage.ExecuteCommand(var ResultCode, Count: Integer);
begin
  Count := 0;
  ResultCode := 0;
end;

end.
