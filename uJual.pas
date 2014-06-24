unit uJual;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, IWCompGrids,
  IWDBGrids, IWCompEdit, IWCompListbox, IWCompLabel, IWCompButton,
  IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl, IWControl,
  IWCompRectangle, Vcl.Controls, Vcl.Forms, IWVCLBaseContainer, IWContainer,
  IWHTMLContainer, IWHTML40Container, IWRegion, IWCompCheckbox;

type
  TJual = class(TIWAppForm)
    IWRegion2: TIWRegion;
    IWRectangle1: TIWRectangle;
    btClose: TIWButton;
    IWRegion1: TIWRegion;
    IWRectangle4: TIWRectangle;
    IWDBGrid1: TIWDBGrid;
    IWRegion3: TIWRegion;
    lbNamaBarang: TIWLabel;
    lbHargaBarang: TIWLabel;
    rCari: TIWRegion;
    IWLabel16: TIWLabel;
    IWLabel18: TIWLabel;
    IWRectangle3: TIWRectangle;
    btCari: TIWButton;
    btTampilkan: TIWButton;
    cxBarang: TIWComboBox;
    eKode: TIWEdit;
    IWLabel9: TIWLabel;
    eHJual: TIWEdit;
    eQty: TIWEdit;
    IWLabel2: TIWLabel;
    IWRegion5: TIWRegion;
    IWRectangle2: TIWRectangle;
    btHapus: TIWButton;
    btBatal: TIWButton;
    btSimpan: TIWButton;
    lbUserLokasi: TIWLabel;
    IWLabel6: TIWLabel;
    eSerial: TIWEdit;
    lbSubTotal: TIWRectangle;
    lbTotal: TIWRectangle;
    eDisc: TIWEdit;
    lbPPN: TIWRectangle;
    eDiscRp: TIWEdit;
    cbDisc: TIWCheckBox;
    cbDiscRp: TIWCheckBox;
    cbPPN: TIWCheckBox;
    IWLabel1: TIWLabel;
    IWLabel3: TIWLabel;
    IWLabel4: TIWLabel;

    procedure ShowJual;
    procedure HitungTotal;
    function SimpanNota: Boolean;

    procedure eKodeAsyncKeyDown(Sender: TObject; EventParams: TStringList);
    procedure cxBarangAsyncKeyDown(Sender: TObject; EventParams: TStringList);
    procedure IWAppFormCreate(Sender: TObject);
    procedure btTampilkanClick(Sender: TObject);
    procedure eHJualAsyncKeyPress(Sender: TObject; EventParams: TStringList);
    procedure eQtyAsyncKeyPress(Sender: TObject; EventParams: TStringList);
    procedure btCloseClick(Sender: TObject);
    procedure cxBarangAsyncExit(Sender: TObject; EventParams: TStringList);
    procedure eSerialAsyncKeyPress(Sender: TObject; EventParams: TStringList);
    procedure IWDBGrid1Columns2Click(ASender: TObject; const AValue: string);
    procedure btSimpanClick(Sender: TObject);
    procedure btCariClick(Sender: TObject);
    procedure eDiscAsyncExit(Sender: TObject; EventParams: TStringList);
    procedure eDiscRpAsyncExit(Sender: TObject; EventParams: TStringList);
    procedure cbPPNAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure cbDiscAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure cbDiscRpAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure btHapusClick(Sender: TObject);
  public
  end;

implementation

{$R *.dfm}

uses ServerController, eapStrUtils, uJualNota;

function TJual.SimpanNota: Boolean;
var
  _sql: String;
  _LastID: Integer;
begin
  Result:=false;

  try
    _LastID:=-1;

    // Post JualNota
    _sql:='insert into jualnota (aicustomer,subtotal,disc,discrp,ppn,total,user,gudang,kassa)'+
          ' values (:aicustomer,:subtotal,:disc,:discrp,:ppn,:total,:user,:gudang,:kassa)';

    UserSession.q0.Close;
    UserSession.q0.SQL.Clear;
    UserSession.q0.SQL.Text:=_sql;
    UserSession.q0.ParamByName('aicustomer').Value:=UserSession.Customer.AI;
    UserSession.q0.ParamByName('subtotal').Value:=UserSession.TempNotaJual.Subtotal;
    UserSession.q0.ParamByName('disc').Value:=UserSession.TempNotaJual.Disc;
    UserSession.q0.ParamByName('discrp').Value:=UserSession.TempNotaJual.DiscRp;
    UserSession.q0.ParamByName('ppn').Value:=UserSession.TempNotaJual.PPN;
    UserSession.q0.ParamByName('total').Value:=UserSession.TempNotaJual.Total;
    UserSession.q0.ParamByName('user').Value:=UserSession.CurrentUser.Nama;
    UserSession.q0.ParamByName('gudang').Value:=UserSession.CurrentUser.Lokasi;
    UserSession.q0.ParamByName('kassa').Value:=UserSession.CurrentUser.Nama+UserSession.CurrentUser.Lokasi;
    UserSession.q0.ExecSQL;

    // GET AI dari JualNota
    _sql:='select LAST_INSERT_ID() as nomornota';

    UserSession.q0.Close;
    UserSession.q0.SQL.Clear;
    UserSession.q0.SQL.Text:=_sql;
    UserSession.q0.Open();
    if not UserSession.q0.IsEmpty then
      _LastID:=UserSession.q0['nomornota'];

    // POST Jual

    if _LastID>=0 then
    begin
      _sql:='insert into jual (nota,kode,serial,gudang,jml,hjual,'+
            ' disc,discrp,laba,user,kassa,keterangan)'+
            ' select :nota,kode,serial,gudang,jml,hjual,'+
            ' disc,discrp,laba,user,kassa,keterangan from tempjual';

      UserSession.q0.Close;
      UserSession.q0.SQL.Clear;
      UserSession.q0.SQL.Text:=_sql;
      UserSession.q0.ParamByName('nota').Value:=_LastID;
      UserSession.q0.ExecSQL;
      Result:=true;
    end;
  except
    Result:=false;
    Raise;
  end;
end;

procedure TJual.HitungTotal;
var
  _sql: String;
  _subtotal, _disc, _discrp, _ppn, _total, _hpp: Extended;
begin
  _subtotal:=0;
  _disc:=0;
  if cbDisc.Checked then
    _disc:=StrToFloat(eDisc.Text);
  _discrp:=0;
  if cbDiscRp.Checked then
    _discrp:=StrToFloat(eDiscRp.Text);
  _ppn:=0;
  if cbPPN.Checked then
    _ppn:=10;
  _total:=0;

  _sql:='select sum(hjual*jml) as subtotal from tempjual';

  UserSession.q0.Close;
  UserSession.q0.SQL.Clear;
  UserSession.q0.SQL.Text:=_sql;
  UserSession.q0.Open();

  if not UserSession.q0.IsEmpty then
  begin
    _subtotal:=UserSession.q0['subtotal'];
    _hpp:=_subtotal-(_subtotal*_disc/100);
    _hpp:=_hpp-_discrp;
    _total:=_hpp+(_hpp*_ppn/100);

    UserSession.TempNotaJual.Subtotal:=_subtotal;
    UserSession.TempNotaJual.Disc:=_disc;
    UserSession.TempNotaJual.DiscRp:=_discrp;
    UserSession.TempNotaJual.PPN:=_PPN;
    UserSession.TempNotaJual.HPP:=_hpp;
    UserSession.TempNotaJual.Total:=_total;

    lbSubTotal.Text:='Rp. '+Format('%9.0n', [_subtotal]);
    lbPPN.Text:='Rp. '+Format('%9.0n', [(_hpp*_ppn/100)]);
    lbTotal.Text:='Rp. '+Format('%9.0n', [_total]);
  end;

end;

procedure TJual.btCloseClick(Sender: TObject);
begin
  Release;
end;

procedure TJual.btHapusClick(Sender: TObject);
begin
  UserSession.qJual.Delete;
end;

procedure TJual.btSimpanClick(Sender: TObject);
begin
  if SimpanNota then
    TJualNota.Create(WebApplication).Show;
end;

procedure TJual.btTampilkanClick(Sender: TObject);
var
  _kode: String;
  _hjual: extended;
  _qty: double;
begin
  _kode:=UserSession.Barang.Kode;
  _hjual:=StrToFloat(eHJual.Text);
  _qty:=StrToFloat(eQty.Text);
  if _qty<0 then
    _qty:=1;

  lbNamaBarang.Caption:=UserSession.Barang.Nama;
  lbHargaBarang.Caption:='Rp. '+Format('%9.0n', [(_hjual*_qty)]);

  eKode.Text:='';
  SetActiveControl(eKode);

  UserSession.qJual.Append;
  UserSession.qJual['kode']:=UserSession.Barang.Kode;
  UserSession.qJual['hjual']:=_hjual;
  UserSession.qJual['jml']:=_qty;
  UserSession.qJual['user']:=UserSession.CurrentUser.Nama;
  UserSession.qJual['gudang']:=UserSession.CurrentUser.Lokasi;
  UserSession.qJual['kassa']:=UserSession.CurrentUser.Nama+UserSession.CurrentUser.Lokasi;
  UserSession.qJual.Post;

  HitungTotal;
  ShowJual;
end;

procedure TJual.cbDiscAsyncClick(Sender: TObject; EventParams: TStringList);
begin
  HitungTotal;
end;

procedure TJual.cbDiscRpAsyncClick(Sender: TObject; EventParams: TStringList);
begin
  HitungTotal;
end;

procedure TJual.cbPPNAsyncClick(Sender: TObject; EventParams: TStringList);
begin
  HitungTotal;
end;

procedure TJual.cxBarangAsyncExit(Sender: TObject; EventParams: TStringList);
var
  _kode: String;
begin
  _kode:=GetStrBetween(cxBarang.Text,1,'[',']');
  UserSession.GetBarangByKode(_kode);
  eHJual.Text:=FloatToStr(UserSession.Barang.HJual);
end;

procedure TJual.cxBarangAsyncKeyDown(Sender: TObject; EventParams: TStringList);
begin
  if (EventParams.Values['which']='13') then SetActiveControl(eHJual);
end;

procedure TJual.eDiscAsyncExit(Sender: TObject; EventParams: TStringList);
begin
  HitungTotal;
end;

procedure TJual.eDiscRpAsyncExit(Sender: TObject; EventParams: TStringList);
begin
  HitungTotal;
end;

procedure TJual.eHJualAsyncKeyPress(Sender: TObject; EventParams: TStringList);
begin
  if (EventParams.Values['which']='13') then
  begin
    eQty.Text:='';
    SetActiveControl(eQty);
  end;
end;

procedure TJual.eKodeAsyncKeyDown(Sender: TObject; EventParams: TStringList);
begin
  if (EventParams.Values['which']='13') then SetActiveControl(btCari);
end;

procedure TJual.eQtyAsyncKeyPress(Sender: TObject; EventParams: TStringList);
begin
  //if (EventParams.Values['which']='13') then SetActiveControl(eSerial);
  if (EventParams.Values['which']='13') then SetActiveControl(btTampilkan);
end;

procedure TJual.eSerialAsyncKeyPress(Sender: TObject; EventParams: TStringList);
begin
  //if (EventParams.Values['which']='13') then SetActiveControl(btTampilkan);
end;

procedure TJual.IWAppFormCreate(Sender: TObject);
begin
  lbUserLokasi.Caption:=UserSession.CurrentUser.Role+' / '+UserSession.CurrentUser.Nama+' / '+UserSession.CurrentUser.Lokasi;
  UserSession.qJual.Close;
  UserSession.CreateJualTemp;
  UserSession.qJual.Open;
end;

procedure TJual.IWDBGrid1Columns2Click(ASender: TObject; const AValue: string);
begin
  //WebApplication.ShowMessage(AValue);
  UserSession.qJual.Locate('AI', StrToInt(AValue), []);
end;

procedure TJual.ShowJual;
begin
  UserSession.qJual.Close;
  UserSession.qJual.Open();
end;

procedure TJual.btCariClick(Sender: TObject);
var
  _ListBarang: TStringList;
begin
  try
    _ListBarang:=TStringList.Create;
    cxBarang.Items.Clear;
    if UserSession.GetBarangByKode(eKode.Text) then
    begin
      eHJual.Text:=FloatToStr(UserSession.Barang.HJual);
      SetActiveControl(eHJual);
    end
    else
    begin
      UserSession.CreateListBarang(eKode.Text, _ListBarang);
      cxBarang.Items:=_ListBarang;
      SetActiveControl(cxBarang);
    end;
  finally
    _ListBarang.Free;
  end;
end;

end.
