unit uCustomerCari;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, IWCompButton,
  IWCompRectangle, IWCompEdit, IWCompListbox, IWVCLBaseControl, IWBaseControl,
  IWBaseHTMLControl, IWControl, IWCompLabel, Vcl.Controls, Vcl.Forms,
  IWVCLBaseContainer, IWContainer, IWHTMLContainer, IWHTML40Container, IWRegion,
  IWHTMLControls, eapStrUtils;

type
  TCustomerCari = class(TIWAppForm)
    rCustomer: TIWRegion;
    IWLabel5: TIWLabel;
    cxPilihNama: TIWComboBox;
    eAlamat1: TIWEdit;
    eAlamat2: TIWEdit;
    IWLabel3: TIWLabel;
    TitleBar: TIWRectangle;
    eNama: TIWEdit;
    btCari: TIWButton;
    btPilih: TIWButton;
    eAlamat3: TIWEdit;
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
    btPiutang: TIWButton;

    procedure ShowCustomer;
    function IsCustomerExists: Boolean;
    function SimpanCustomerBaru: Boolean;

    procedure btNextClick(Sender: TObject);
    procedure btCloseClick(Sender: TObject);
    procedure btCariClick(Sender: TObject);
    procedure btPilihClick(Sender: TObject);
    procedure btSimpanClick(Sender: TObject);
    procedure eNamaAsyncKeyDown(Sender: TObject; EventParams: TStringList);
    procedure cxPilihNamaAsyncKeyDown(Sender: TObject;
      EventParams: TStringList);
    procedure eNamaBaruAsyncKeyDown(Sender: TObject; EventParams: TStringList);
    procedure eAlamat1AsyncKeyDown(Sender: TObject; EventParams: TStringList);
    procedure eAlamat2AsyncKeyDown(Sender: TObject; EventParams: TStringList);
    procedure eAlamat3AsyncKeyDown(Sender: TObject; EventParams: TStringList);
    procedure eTelpAsyncKeyDown(Sender: TObject; EventParams: TStringList);
    procedure cxTipeAsyncKeyDown(Sender: TObject; EventParams: TStringList);
    procedure btPiutangClick(Sender: TObject);
  public
  end;

implementation

{$R *.dfm}

uses ServerController, uSalesCari, uPiutang;

procedure TCustomerCari.ShowCustomer;
begin
  lbID.Caption:=IntToStr(UserSession.Customer.AI);
  eNamaBaru.Text:=UserSession.Customer.Nama;
  eAlamat1.Text:=UserSession.Customer.Alamat1;
  eAlamat2.Text:=UserSession.Customer.Alamat2;
  eAlamat3.Text:=UserSession.Customer.Alamat3;
  eTelp.Text:=UserSession.Customer.Telp;
  cxTipe.Text:=UserSession.Customer.Tipe;
end;

procedure TCustomerCari.btCariClick(Sender: TObject);
var
  _ListCustomer: TStringList;
  _AI: Integer;
begin
  try
    try
      _AI:=StrToInt(eNama.Text);
    except
      _AI:=-1;
    end;
    _ListCustomer:=TStringList.Create;
    cxPilihNama.Items.Clear;
    if UserSession.GetCustomerByAI(_AI) then
    begin
      ShowCustomer;
      SetActiveControl(btNext);
    end
    else
    begin
      UserSession.CreateListCustomer(eNama.Text, _ListCustomer);
      cxPilihNama.Items:=_ListCustomer;
      SetActiveControl(cxPilihNama);
    end;
  finally
    _ListCustomer.Free;
  end;
end;

procedure TCustomerCari.btPilihClick(Sender: TObject);
var
  _AI: Integer;
begin
  try
    _AI:=StrToInt(GetStrBetween(cxPilihNama.Text,1,'[',']'));
  except
    _AI:=-1;
  end;
  if UserSession.GetCustomerByAI(_AI) then
  begin
    ShowCustomer;
    SetActiveControl(btNext);
  end;
end;

procedure TCustomerCari.btPiutangClick(Sender: TObject);
begin
  TPiutang.Create(WebApplication).Show;
end;

procedure TCustomerCari.btCloseClick(Sender: TObject);
begin
  Release;
end;

procedure TCustomerCari.btNextClick(Sender: TObject);
begin
  SimpanCustomerBaru;
  if UserSession.Transaksi.State='JUAL' then
    UserSession.TempNotaJual.AICustomer:=UserSession.Customer.AI;
  TSalesCari.Create(WebApplication).Show;
end;

procedure TCustomerCari.btSimpanClick(Sender: TObject);
begin
  SimpanCustomerBaru;
end;

procedure TCustomerCari.cxPilihNamaAsyncKeyDown(Sender: TObject;
  EventParams: TStringList);
begin
  if (EventParams.Values['which']='13') then SetActiveControl(btPilih);
end;

procedure TCustomerCari.cxTipeAsyncKeyDown(Sender: TObject;
  EventParams: TStringList);
begin
  if (EventParams.Values['which']='13') then SetActiveControl(btNext);
end;

procedure TCustomerCari.eAlamat1AsyncKeyDown(Sender: TObject;
  EventParams: TStringList);
begin
  if (EventParams.Values['which']='13') then SetActiveControl(eAlamat2);
end;

procedure TCustomerCari.eAlamat2AsyncKeyDown(Sender: TObject;
  EventParams: TStringList);
begin
  if (EventParams.Values['which']='13') then SetActiveControl(eAlamat3);
end;

procedure TCustomerCari.eAlamat3AsyncKeyDown(Sender: TObject;
  EventParams: TStringList);
begin
  if (EventParams.Values['which']='13') then SetActiveControl(eTelp);
end;

procedure TCustomerCari.eNamaAsyncKeyDown(Sender: TObject;
  EventParams: TStringList);
begin
  if (EventParams.Values['which']='13') then SetActiveControl(btCari);
end;

procedure TCustomerCari.eNamaBaruAsyncKeyDown(Sender: TObject;
  EventParams: TStringList);
begin
  if (EventParams.Values['which']='13') then SetActiveControl(eAlamat1);
end;

procedure TCustomerCari.eTelpAsyncKeyDown(Sender: TObject;
  EventParams: TStringList);
begin
  if (EventParams.Values['which']='13') then SetActiveControl(cxTIpe);
end;

function TCustomerCari.IsCustomerExists: Boolean;
var
  //_AI: Integer;
  _nama, _sql: String;
begin
  Result:=false;
  try
    //_AI:=UserSession.Customer.AI;
    _Nama:=eNamaBaru.Text;

    //_sql:='select AI from customer where AI=:AI and nama=:nama';
    _sql:='select AI from customer where nama=:nama';
    UserSession.q0.Close;
    UserSession.q0.SQL.Clear;
    UserSession.q0.SQL.Text:=_sql;
    //UserSession.q0.ParamByName('AI').Value:=_AI;
    UserSession.q0.ParamByName('nama').Value:=_nama;
    UserSession.q0.Open();

    if not UserSession.q0.IsEmpty then
      Result:=true;
  finally
    UserSession.q0.Close;
  end;
end;

function TCustomerCari.SimpanCustomerBaru: Boolean;
var
  _sql: String;
  _LastID: Integer;
begin
  Result:=false;
  _LastID:=-1;

  if not IsCustomerExists then
  try
    _sql:='insert into customer(nama,alamat1,alamat2,alamat3,telp,tipe)'+
          ' values(:nama,:alamat1,:alamat2,:alamat3,:telp,:tipe)';
    UserSession.q0.Close;
    UserSession.q0.SQL.Clear;
    UserSession.q0.SQL.Text:=_sql;
    UserSession.q0.ParamByName('nama').Value:=eNamaBaru.Text;
    UserSession.q0.ParamByName('alamat1').Value:=eAlamat1.Text;
    UserSession.q0.ParamByName('alamat2').Value:=eAlamat2.Text;
    UserSession.q0.ParamByName('alamat3').Value:=eAlamat3.Text;
    UserSession.q0.ParamByName('telp').Value:=eTelp.Text;
    UserSession.q0.ParamByName('tipe').Value:=cxTipe.Text;
    UserSession.q0.ExecSQL;

    _sql:='select LAST_INSERT_ID() as idcustomer';
    UserSession.q0.Close;
    UserSession.q0.SQL.Clear;
    UserSession.q0.SQL.Text:=_sql;
    try
      UserSession.q0.Open();
      if UserSession.q0['idcustomer']>0 then
      begin
        // update record Customer di UserSession
        _LastID:=UserSession.q0['idcustomer'];
        UserSession.Customer.AI:=_LastID;
        UserSession.Customer.Nama:=eNamaBaru.Text;
        UserSession.Customer.Alamat1:=eAlamat1.Text;
        UserSession.Customer.Alamat2:=eAlamat2.Text;
        UserSession.Customer.Alamat3:=eAlamat3.Text;
        UserSession.Customer.Telp:=eTelp.Text;
        UserSession.Customer.Tipe:=cxTipe.Text;

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
