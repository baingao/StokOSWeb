unit UserSessionUnit;

{
  This is a DataModule where you can add components or declare fields that are specific to 
  ONE user. Instead of creating global variables, it is better to use this datamodule. You can then
  access the it using UserSession.
}
interface

uses
  IWUserSessionBase, SysUtils, Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TBarang = record
    AI: Integer;
    Kode: String;
    Kategori: String;
    Merk: String;
    Tipe: String;
    Varian: String;
    Nama: String;
    HBeli: Extended;
    PPN: Double;
    Biaya: Extended;
    Disc: Double;
    DiscRp: Extended;
    Laba: Double;
    LabaRp: Extended;
    HJual: Extended;
  end;

type
  TCurrentUser = record
    Nama: String;
    Role: String;
    Lokasi: String;
  end;

type
  TTempNotaJual = record
    AI: Integer;
    Nomor: String;
    AICustomer: Integer;
    Tgl: TDateTime;
    Subtotal: Extended;
    Disc: Double;
    DiscRp: Extended;
    PPN: Double;
    HPP: Extended;
    Total: Extended;
    Tipe: String;
  end;

type
  TCustomer = record
    AI: Integer;
    Nama: String;
    Alamat1: String;
    Alamat2: String;
    Alamat3: String;
    Telp: String;
    Tipe: String;
  end;

type
  TSales = record
    AI: Integer;
    Nama: String;
    Telp: String;
    Tipe: String;
  end;

type
  TTransaksi = record
    Nomor: Integer;
    State: String;
    TglStart: TDateTime;
    TglEnd: TDateTime;
  end;

type
  TIWUserSession = class(TIWUserSessionBase)
    DB: TFDConnection;
    q0: TFDQuery;
    MySQL: TFDPhysMySQLDriverLink;
    qUser: TFDQuery;
    dsqUser: TDataSource;
    qStok: TFDQuery;
    dsqStok: TDataSource;
    qLogStok: TFDQuery;
    dsqLogStok: TDataSource;
    qStokDtl: TFDQuery;
    dsqStokDtl: TDataSource;
    qGudang: TFDQuery;
    dsqGudang: TDataSource;
    qJual: TFDQuery;
    dsqJual: TDataSource;
    qCustomer: TFDQuery;
    dsqCustomer: TDataSource;
    qPiutang: TFDQuery;
    dsqPiutang: TDataSource;
    qPiutangDtl: TFDQuery;
    dsqPiutangDtl: TDataSource;
    qJualMaster: TFDQuery;
    dsqJualMaster: TDataSource;
    qJualMasterDtl: TFDQuery;
    dsqJualMasterDtl: TDataSource;
    qSuratJalanDtl: TFDQuery;
    dsqSuratJalanDtl: TDataSource;
    qSuratJalanMaster: TFDQuery;
    dsqSuratJalanMaster: TDataSource;
    qSuratJalan: TFDQuery;
    dsqSuratJalan: TDataSource;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    procedure IWUserSessionBaseCreate(Sender: TObject);
    procedure dsqPiutangDataChange(Sender: TObject; Field: TField);
    procedure dsqJualMasterDataChange(Sender: TObject; Field: TField);
    procedure dsqSuratJalanMasterDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    Barang: TBarang;
    CurrentUser: TCurrentUser;
    TempNotaJual: TTempNotaJual;
    Customer: TCustomer;
    Sales: TSales;
    //AppState: String;      // JUAL JUALMASTER
    Transaksi: TTransaksi;

    function IsUserExists(UserName: String): Boolean;

    function LogStok(Jumlah: Double; Kode,Serial,Transaksi,User,Gudang,Kassa: String): Boolean;

    function GetBarangByKode(Kode: String): Boolean;
    function CreateJualTemp: Boolean;
    procedure CreateListBarang(Nama: String; var ListBarang: TStringList);

    function InitTempNotaJual: Boolean;
    function GetCustomerByAI(AI: Integer): Boolean;
    procedure CreateListCustomer(Nama: String; var ListCustomer: TStringList);

    function GetSalesByAI(AI: Integer): Boolean;
    procedure CreateListSales(Nama: String; var ListSales: TStringList);

    function CreateSuratJalanTemp: Boolean;
    procedure CreateListGudang(var ListGudang: TStringList);
  end;

implementation

{$R *.dfm}

function TIWUserSession.CreateSuratJalanTemp: Boolean;
var
  _q: TFDQuery;
  _sql: String;
begin
  Result:=false;
  try
    _sql:='DROP TEMPORARY TABLE IF EXISTS `tempsuratjalan`';
    _q:=TFDQuery.Create(Self);
    _q.Connection:=DB;
    _q.Close;
    _q.SQL.Clear;
    _q.SQL.Text:=_sql;
    _q.ExecSQL;
    _sql:='CREATE TEMPORARY TABLE IF NOT EXISTS `tempsuratjalan` ('+
          ' `AI` INT(11) NOT NULL AUTO_INCREMENT,'+
          ' `aisuratjalan` INT(11) NULL DEFAULT NULL,'+
          ' `nota` VARCHAR(51) NULL DEFAULT NULL,'+
          ' `tgl` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,'+
          ' `kode` VARCHAR(51) NULL DEFAULT NULL,'+
          ' `nama` VARCHAR(101) NULL DEFAULT NULL,'+
          ' `jml` DECIMAL(5,2) NULL DEFAULT NULL,'+
          ' `serial` VARCHAR(51) NULL DEFAULT NULL,'+
          ' `gudang` VARCHAR(51) NULL DEFAULT NULL,'+
          ' `tag` INT(11) NULL DEFAULT NULL,'+
          ' PRIMARY KEY (`AI`)'+
          ' )'+
          ' COLLATE=''utf8_general_ci'''+
          ' ENGINE=MyISAM';
    _q.Close;
    _q.SQL.Clear;
    _q.SQL.Text:=_sql;
    _q.ExecSQL;
    Result:=true;
  finally
    _q.Free;
  end;
end;

function TIWUserSession.LogStok(Jumlah: Double; Kode: string; Serial: string; Transaksi: string; User: string; Gudang: string; Kassa: string): Boolean;
var
  _q: TFDQuery;
  _IDTransaksi: Integer;
  _sql: String;
begin
  Result:=false;
  _IDTransaksi:=0;
  try
    _q:=TFDQuery.Create(self);
    _q.Connection:=DB;

    _sql:='select LAST_INSERT_ID() as idtransaksi';
    _q.Close;
    _q.SQL.Clear;
    _q.SQL.Text:=_sql;
    _q.Open();
    if _q['idtransaksi']>0 then
    begin
      _IDTransaksi:=_q['idtransaksi'];
      _sql:='insert into logstok(kode,serial,jml,transaksi,user,gudang,kassa)'+
            ' values (:kode,:serial,:jml,:transaksi,:user,:gudang,:kassa)';
      _q.Close;
      _q.SQL.Clear;
      _q.SQL.Text:=_sql;
      _q.ParamByName('kode').Value:=Kode;
      _q.ParamByName('serial').Value:=Serial;
      _q.ParamByName('jml').Value:=Jumlah;
      _q.ParamByName('transaksi').Value:=Transaksi;
      _q.ParamByName('user').Value:=CurrentUser.Nama;
      _q.ParamByName('gudang').Value:=CurrentUser.Lokasi;
      _q.ParamByName('kassa').Value:=CurrentUser.Nama+CurrentUser.Lokasi;
      try
        _q.ExecSQL;
        Result:=true;
      except
        Result:=false;
        Raise;
      end;
    end;
  finally
    _q.Free;
  end;
end;

function TIWUserSession.IsUserExists(UserName: String): Boolean;
var
  _q: TFDQuery;
  _sql: String;
begin
  Result:=false;
  try
    _q:=TFDQuery.Create(self);
    _q.Connection:=DB;

    _sql:='select nama from operator where nama=:nama';
    _q.SQL.Clear;
    _q.SQL.Text:=_sql;
    _q.Open();
    if not _q.IsEmpty then
      Result:=true;
  finally
    _q.Free;
  end;
end;

function TIWUserSession.InitTempNotaJual: Boolean;
begin
  Result:=false;
  try
    TempNotaJual.AI:=0;
    TempNotaJual.Nomor:='0';
    TempNotaJual.AICustomer:=0;
    TempNotaJual.Tgl:=Now;
    TempNotaJual.Subtotal:=0;
    TempNotaJual.Disc:=0;
    TempNotaJual.DiscRp:=0;
    TempNotaJual.PPN:=0;
    TempNotaJual.Total:=0;
    TempNotaJual.Tipe:='TUNAI';
    Result:=true;
  except
    Result:=false;
    Raise;
  end;
end;

function TIWUserSession.CreateJualTemp: Boolean;
var
  _q: TFDQuery;
  _sql: String;
begin
  Result:=false;
  try
    _sql:='DROP TEMPORARY TABLE IF EXISTS `tempjual`';
    _q:=TFDQuery.Create(Self);
    _q.Connection:=DB;
    _q.Close;
    _q.SQL.Clear;
    _q.SQL.Text:=_sql;
    _q.ExecSQL;
    _sql:='CREATE TEMPORARY TABLE IF NOT EXISTS `tempjual` ('+
          ' `AI` INT(11) NOT NULL AUTO_INCREMENT,'+
          ' `tgl` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,'+
          ' `nota` VARCHAR(51) NOT NULL DEFAULT '''','+
          ' `kode` VARCHAR(21) NOT NULL DEFAULT '''','+
          ' `serial` VARCHAR(51) NOT NULL DEFAULT '''','+
          ' `gudang` VARCHAR(21) NOT NULL DEFAULT ''KM1'','+
          ' `jml` DECIMAL(5,2) NOT NULL DEFAULT ''0.00'','+
          ' `hjual` DECIMAL(15,2) NOT NULL DEFAULT ''0.00'','+
          ' `disc` DECIMAL(5,2) NOT NULL DEFAULT ''0.00'','+
          ' `discrp` DECIMAL(15,2) NOT NULL DEFAULT ''0.00'','+
          ' `laba` DECIMAL(15,2) NOT NULL DEFAULT ''0.00'','+
          ' `user` VARCHAR(21) NOT NULL DEFAULT '''','+
          ' `kassa` VARCHAR(21) NOT NULL DEFAULT '''','+
          ' `keterangan` VARCHAR(21) NOT NULL DEFAULT '''','+
          ' `status` INT(1) NOT NULL DEFAULT ''0'','+
          ' PRIMARY KEY (`AI`),'+
	        ' INDEX `tgl` (`nota`)'+
          ' )'+
          ' COLLATE=''utf8_general_ci'''+
          ' ENGINE=MyISAM';
    _q.Close;
    _q.SQL.Clear;
    _q.SQL.Text:=_sql;
    _q.ExecSQL;
    Result:=true;
  finally
    _q.Free;
  end;
end;

procedure TIWUserSession.CreateListGudang(var ListGudang: TStringList);
var
  _sql: String;
  _q: TFDQuery;
begin
  try
    ListGudang.Clear;
    _q:=TFDQuery.Create(self);

    _sql:='select * from gudang order by gudang';

    _q.Connection:=DB;
    _q.SQL.Text:=_sql;
    _q.Open();
    if not _q.IsEmpty then
    begin
      _q.First;
      while not _q.Eof do
      begin
        ListGudang.Add(_q['gudang']);
        _q.Next;
      end;
    end;
  finally
    _q.Free;
  end;
end;

procedure TIWUserSession.CreateListCustomer(Nama: String; var ListCustomer: TStringList);
var
  _sql: String;
  _q: TFDQuery;
begin
  try
    ListCustomer.Clear;
    _q:=TFDQuery.Create(self);

    _sql:='select * from customer where nama like :nama';

    _q.Connection:=DB;
    _q.SQL.Text:=_sql;
    _q.ParamByName('nama').Value:='%'+Nama+'%';
    _q.Open();
    if not _q.IsEmpty then
    begin
      _q.First;
      while not _q.Eof do
      begin
        ListCustomer.Add('['+IntToStr(_q['AI'])+'] '+_q['nama']);
        _q.Next;
      end;
    end;
  finally
    _q.Free;
  end;
end;

procedure TIWUserSession.CreateListSales(Nama: String; var ListSales: TStringList);
var
  _sql: String;
  _q: TFDQuery;
begin
  try
    ListSales.Clear;
    _q:=TFDQuery.Create(self);

    _sql:='select * from sales where nama like :nama';

    _q.Connection:=DB;
    _q.SQL.Text:=_sql;
    _q.ParamByName('nama').Value:='%'+Nama+'%';
    _q.Open();
    if not _q.IsEmpty then
    begin
      _q.First;
      while not _q.Eof do
      begin
        ListSales.Add('['+IntToStr(_q['AI'])+'] '+_q['nama']);
        _q.Next;
      end;
    end;
  finally
    _q.Free;
  end;
end;

procedure TIWUserSession.dsqJualMasterDataChange(Sender: TObject;
  Field: TField);
begin
  qJualMasterDtl.Close;
  qJualMasterDtl.ParamByName('nota').Value:=qJualMaster['AI'];
  qJualMasterDtl.Open();
end;

procedure TIWUserSession.dsqPiutangDataChange(Sender: TObject; Field: TField);
begin
  qPiutangDtl.Close;
  qPiutangDtl.ParamByName('nota').Value:=qPiutang['AI'];
  qPiutangDtl.Open();
end;

procedure TIWUserSession.dsqSuratJalanMasterDataChange(Sender: TObject;
  Field: TField);
begin
  qSuratJalanDtl.Close;
  qSuratJalanDtl.ParamByName('aisuratjalan').Value:=qSuratJalanMaster['ai'];
  qSuratJalanDtl.Open;
end;

procedure TIWUserSession.CreateListBarang(Nama: String; var ListBarang: TStringList);
var
  _sql: String;
  _q: TFDQuery;
begin
  try
    LIstBarang.Clear;
    _q:=TFDQuery.Create(self);

    _sql:='select AI, kode, nama from stok where nama like :nama';

    _q.Connection:=DB;
    _q.SQL.Text:=_sql;
    _q.ParamByName('nama').Value:='%'+Nama+'%';
    _q.Open();
    if not _q.IsEmpty then
    begin
      _q.First;
      while not _q.Eof do
      begin
        LIstBarang.Add('['+_q['kode']+'] '+_q['nama']);
        _q.Next;
      end;
    end;
  finally
    _q.Free;
  end;
end;

function TIWUserSession.GetSalesByAI(AI: Integer): Boolean;
var
  _sql: String;
  _q: TFDQuery;
begin
  Result:=false;
  try
    _q:=TFDQuery.Create(self);
    _sql:='select * from sales where ai=:ai';

    _q.Connection:=DB;
    _q.SQL.Text:=_sql;
    _q.ParamByName('ai').Value:=AI;

    try
      _q.Open();
      if not _q.IsEmpty then
      begin
        Sales.AI:=_q['AI'];
        Sales.Nama:=_q['nama'];
        Sales.Telp:=_q['telp'];
        Sales.Tipe:=_q['tipe'];
        Result:=true;
      end;
    except
      Result:=false;
      Raise;
    end;
  finally
    _q.Free;
  end;
end;

function TIWUserSession.GetCustomerByAI(AI: Integer): Boolean;
var
  _sql: String;
  _q: TFDQuery;
begin
  Result:=false;
  try
    _q:=TFDQuery.Create(self);
    _sql:='select * from customer where ai=:ai';

    _q.Connection:=DB;
    _q.SQL.Text:=_sql;
    _q.ParamByName('ai').Value:=AI;

    try
      _q.Open();
      if not _q.IsEmpty then
      begin
        Customer.AI:=_q['AI'];
        Customer.Nama:=_q['nama'];
        Customer.Alamat1:=_q['alamat1'];
        Customer.Alamat2:=_q['alamat2'];
        Customer.Alamat3:=_q['alamat3'];
        Customer.Telp:=_q['telp'];
        Customer.Tipe:=_q['tipe'];
        Result:=true;
      end;
    except
      Result:=false;
      Raise;
    end;
  finally
    _q.Free;
  end;
end;

function TIWUserSession.GetBarangByKode(Kode: string): Boolean;
var
  _sql: String;
  _q: TFDQuery;
begin
  Result:=false;
  try
    _q:=TFDQuery.Create(self);
    _sql:='select * from stok where kode=:kode';

    _q.Connection:=DB;
    _q.SQL.Text:=_sql;
    _q.ParamByName('kode').Value:=Kode;

    try
      _q.Open();
      if not _q.IsEmpty then
      begin
        Barang.AI:=_q['AI'];
        Barang.Kode:=_q['kode'];
        Barang.Nama:=_q['nama'];
        Barang.Kategori:=_q['dept'];
        Barang.Merk:=_q['brand'];
        Barang.Tipe:=_q['type'];
        Barang.Varian:=_q['model'];
        Barang.HBeli:=_q['hbeli'];
        Barang.PPN:=_q['ppn'];
        Barang.Disc:=_q['disc'];
        Barang.DiscRp:=_q['discrp'];
        Barang.Laba:=_q['laba'];
        Barang.LabaRp:=_q['labarp'];
        Barang.HJual:=_q['hjual'];
        Result:=true;
      end;
    except
      Result:=false;
      Raise;
    end;
  finally
    _q.Free;
  end;
end;

procedure TIWUserSession.IWUserSessionBaseCreate(Sender: TObject);
begin
  DB.Connected:=true;
end;

end.
