unit uSuratJalan;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, IWCompCheckbox,
  IWCompEdit, IWCompListbox, IWCompLabel, IWCompGrids, IWDBGrids, IWCompButton,
  IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl, IWControl,
  IWCompRectangle, Vcl.Controls, Vcl.Forms, IWVCLBaseContainer, IWContainer,
  IWHTMLContainer, IWHTML40Container, IWRegion;

type
  TSuratJalan = class(TIWAppForm)
    IWRegion2: TIWRegion;
    IWRectangle1: TIWRectangle;
    btClose: TIWButton;
    rNotaDtl: TIWRegion;
    IWRectangle4: TIWRectangle;
    IWRegion1: TIWRegion;
    IWRectangle5: TIWRectangle;
    IWRegion5: TIWRegion;
    IWRectangle2: TIWRectangle;
    IWLabel3: TIWLabel;
    btKirim: TIWButton;
    btBatal: TIWButton;
    IWButton1: TIWButton;
    IWButton2: TIWButton;
    IWButton3: TIWButton;
    IWRegion4: TIWRegion;
    lbNamaToko: TIWLabel;
    lbAlamatToko: TIWLabel;
    IWLabel2: TIWLabel;
    IWLabel4: TIWLabel;
    IWRectangle3: TIWRectangle;
    IWRegion6: TIWRegion;
    lbJudul: TIWLabel;
    IWRegion3: TIWRegion;
    IWLabel5: TIWLabel;
    lbNama: TIWLabel;
    lbAlamat1: TIWLabel;
    lbAlamat2: TIWLabel;
    lbAlamat3: TIWLabel;
    lbTelp: TIWLabel;
    IWLabel6: TIWLabel;
    IWLabel7: TIWLabel;
    eJml: TIWEdit;
    IWLabel8: TIWLabel;
    eSerial: TIWEdit;
    IWLabel9: TIWLabel;
    cxGudang: TIWComboBox;
    IWLabel1: TIWLabel;
    cxTransport: TIWComboBox;
    IWDBGrid1: TIWDBGrid;

    function KirimBarang: Boolean;
    procedure IWAppFormCreate(Sender: TObject);
    procedure btKirimClick(Sender: TObject);
    procedure btCloseClick(Sender: TObject);
    procedure IWDBGrid1Columns0Click(ASender: TObject; const AValue: string);
    procedure gJualMasterDtlColumns0Click(ASender: TObject;
      const AValue: string);
    procedure IWButton3Click(Sender: TObject);
  public
  end;

implementation

{$R *.dfm}

uses ServerController, uSuratJalanNota;

procedure TSuratJalan.btCloseClick(Sender: TObject);
begin
  Release;
end;

procedure TSuratJalan.btKirimClick(Sender: TObject);
var
  _sql, _kode: String;
begin
  _kode:=UserSession.qJualMasterDtl['kode'];
  UserSession.GetBarangByKode(_kode);

  _sql:='select * from tempsuratjalan where kode=:kode';
  UserSession.q0.Close;
  UserSession.q0.SQL.Clear;
  UserSession.q0.SQL.Text:=_sql;
  UserSession.q0.ParamByName('kode').Value:=UserSession.Barang.Kode;
  UserSession.q0.Open();

  if not UserSession.q0.IsEmpty then
  begin
    WebApplication.ShowMessage('Kode barang sudah ada di dalam surat jalan');
    exit;
  end
  else
  begin
    UserSession.qSuratJalan.Append;
    UserSession.qSuratJalan['nota']:=UserSession.qJualMasterDtl['nota'];
    UserSession.qSuratJalan['kode']:=UserSession.qJualMasterDtl['kode'];
    UserSession.qSuratJalan['nama']:=UserSession.qJualMasterDtl['nama'];
    UserSession.qSuratJalan['jml']:=StrToFloat(eJml.Text);
    UserSession.qSuratJalan['serial']:=eSerial.Text;
    UserSession.qSuratJalan['gudang']:=cxGudang.Text;
    UserSession.qSuratJalan.Post;
  end;
end;

procedure TSuratJalan.gJualMasterDtlColumns0Click(ASender: TObject;
  const AValue: string);
begin
  UserSession.qSuratJalan.Locate('AI', StrToInt(AValue), []);
end;

procedure TSuratJalan.IWAppFormCreate(Sender: TObject);
var
  _ListGudang: TStringList;
begin
  try
    _ListGudang:=TStringList.Create;
    UserSession.CreateListGudang(_ListGudang);
    cxGudang.Items.Clear;
    cxGudang.Items:=_ListGudang;
    UserSession.qSuratJalan.Close;
    UserSession.CreateSuratJalanTemp;
    UserSession.qSuratJalan.Open;
  finally
    _ListGudang.Free;
  end;
end;

procedure TSuratJalan.IWButton3Click(Sender: TObject);
begin
  TSuratJalanNota.Create(WebApplication).Show;
end;

procedure TSuratJalan.IWDBGrid1Columns0Click(ASender: TObject;
  const AValue: string);
begin
  WebApplication.ShowMessage(AValue);
  UserSession.qJualMasterDtl.Locate('AI', StrToInt(AValue), []);
end;

function TSuratJalan.KirimBarang: Boolean;
var
  _jml: Double;
begin
  Result:=false;
  _jml:=0;
  if StrToFloat(eJml.Text)>0 then
  begin

  end;
  // kirim barang
end;

end.
