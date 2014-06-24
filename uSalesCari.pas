unit uSalesCari;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, IWHTMLControls,
  IWCompButton, IWCompEdit, IWCompRectangle, IWCompListbox, IWVCLBaseControl,
  IWBaseControl, IWBaseHTMLControl, IWControl, IWCompLabel, Vcl.Controls,
  Vcl.Forms, IWVCLBaseContainer, IWContainer, IWHTMLContainer, eapStrUtils,
  IWHTML40Container, IWRegion;

type
  TSalesCari = class(TIWAppForm)
    rCustomer: TIWRegion;
    IWLabel5: TIWLabel;
    cxPilihNama: TIWComboBox;
    TitleBar: TIWRectangle;
    eNama: TIWEdit;
    btCari: TIWButton;
    btPilih: TIWButton;
    IWLabel1: TIWLabel;
    eTelp: TIWEdit;
    btNext: TIWButton;
    btClose: TIWButton;
    IWLabel2: TIWLabel;
    IWHRule1: TIWHRule;
    eNamaBaru: TIWEdit;
    btSimpan: TIWButton;
    IWLabel4: TIWLabel;
    lbID: TIWLabel;
    IWLabel6: TIWLabel;
    cxTipe: TIWComboBox;

    procedure ShowSales;
    function SimpanSalesBaru: Boolean;
    function IsSalesExists: Boolean;

    procedure btCloseClick(Sender: TObject);
    procedure btNextClick(Sender: TObject);
    procedure btCariClick(Sender: TObject);
    procedure btPilihClick(Sender: TObject);
    procedure btSimpanClick(Sender: TObject);
    procedure eNamaAsyncKeyDown(Sender: TObject; EventParams: TStringList);
    procedure cxPilihNamaAsyncKeyDown(Sender: TObject;
      EventParams: TStringList);
  public
  end;

implementation

{$R *.dfm}

uses ServerController, uJual, uJualMaster;

procedure TSalesCari.ShowSales;
begin
  lbID.Caption:=IntToStr(UserSession.Sales.AI);
  eNamaBaru.Text:=UserSession.Sales.Nama;
  eTelp.Text:=UserSession.Sales.Telp;
  cxTipe.Text:=UserSession.Sales.Tipe;
end;

procedure TSalesCari.btCariClick(Sender: TObject);
var
  _ListSales: TStringList;
  _AI: Integer;
begin
  try
    try
      _AI:=StrToInt(eNama.Text);
    except
      _AI:=-1;
    end;
    _ListSales:=TStringList.Create;
    cxPilihNama.Items.Clear;
    if UserSession.GetSalesByAI(_AI) then
    begin
      ShowSales;
      SetActiveControl(btNext);
    end
    else
    begin
      UserSession.CreateListSales(eNama.Text, _ListSales);
      cxPilihNama.Items:=_ListSales;
      SetActiveControl(cxPilihNama);
    end;
  finally
    _ListSales.Free;
  end;
end;

procedure TSalesCari.btCloseClick(Sender: TObject);
begin
  Release;
end;

procedure TSalesCari.btNextClick(Sender: TObject);
begin
  if UserSession.Transaksi.State='JUAL' then
    TJual.Create(WebApplication).Show
  else if UserSession.Transaksi.State='JUALMASTER'  then
    TJualMaster.Create(WebApplication).Show;
end;

procedure TSalesCari.btPilihClick(Sender: TObject);
var
  _AI: Integer;
begin
  try
    _AI:=StrToInt(GetStrBetween(cxPilihNama.Text,1,'[',']'));
  except
    _AI:=-1;
  end;
  if UserSession.GetSalesByAI(_AI) then
  begin
    ShowSales;
    SetActiveControl(btNext);
  end;
end;

procedure TSalesCari.btSimpanClick(Sender: TObject);
begin
  SimpanSalesBaru;
end;

procedure TSalesCari.cxPilihNamaAsyncKeyDown(Sender: TObject;
  EventParams: TStringList);
begin
  if (EventParams.Values['which']='13') then SetActiveControl(btPilih);
end;

procedure TSalesCari.eNamaAsyncKeyDown(Sender: TObject;
  EventParams: TStringList);
begin
  if (EventParams.Values['which']='13') then SetActiveControl(btCari);
end;

function TSalesCari.IsSalesExists: Boolean;
var
  _nama, _sql: String;
begin
  Result:=false;
  try
    _Nama:=eNamaBaru.Text;

    _sql:='select AI from sales where nama=:nama';
    UserSession.q0.Close;
    UserSession.q0.SQL.Clear;
    UserSession.q0.SQL.Text:=_sql;
    UserSession.q0.ParamByName('nama').Value:=_nama;
    UserSession.q0.Open();

    if not UserSession.q0.IsEmpty then
      Result:=true;
  finally
    UserSession.q0.Close;
  end;
end;

function TSalesCari.SimpanSalesBaru: Boolean;
var
  _sql: String;
  _LastID: Integer;
begin
  Result:=false;
  _LastID:=-1;

  if not IsSalesExists then
  try
    _sql:='insert into sales(nama,telp,tipe)'+
          ' values(:nama,:telp,:tipe)';
    UserSession.q0.Close;
    UserSession.q0.SQL.Clear;
    UserSession.q0.SQL.Text:=_sql;
    UserSession.q0.ParamByName('nama').Value:=eNamaBaru.Text;
    UserSession.q0.ParamByName('telp').Value:=eTelp.Text;
    UserSession.q0.ParamByName('tipe').Value:=cxTipe.Text;
    UserSession.q0.ExecSQL;

    _sql:='select LAST_INSERT_ID() as idsales';
    UserSession.q0.Close;
    UserSession.q0.SQL.Clear;
    UserSession.q0.SQL.Text:=_sql;
    try
      UserSession.q0.Open();
      if UserSession.q0['idsales']>0 then
      begin
        // update record Sales di UserSession
        _LastID:=UserSession.q0['idsales'];
        UserSession.Sales.AI:=_LastID;
        UserSession.Sales.Nama:=eNamaBaru.Text;
        UserSession.Sales.Telp:=eTelp.Text;
        UserSession.Sales.Tipe:=cxTipe.Text;

        Result:=true;
      end;
    finally
      UserSession.q0.Close;
    end;
  except
    Result:=false;
    Raise;
  end;
end;


end.
