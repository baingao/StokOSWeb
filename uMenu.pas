unit uMenu;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, Vcl.Menus,
  Vcl.Controls, IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl, IWControl,
  IWCompMenu;

type
  TMenu = class(TIWAppForm)
    IWMenu1: TIWMenu;
    MainMenu1: TMainMenu;
    ManajemenUser1: TMenuItem;
    Stok1: TMenuItem;
    Beli1: TMenuItem;
    Jual1: TMenuItem;
    MasterStok1: TMenuItem;
    Mutasi1: TMenuItem;
    N1: TMenuItem;
    Gudang1: TMenuItem;
    MasterBeli1: TMenuItem;
    ransaksiBeli1: TMenuItem;
    MasterJual1: TMenuItem;
    ransaksiJual1: TMenuItem;
    N2: TMenuItem;
    SuratJalan1: TMenuItem;
    N3: TMenuItem;
    erimaBarang1: TMenuItem;
    Logout1: TMenuItem;
    procedure ManajemenUser1Click(Sender: TObject);
    procedure MasterStok1Click(Sender: TObject);
    procedure Gudang1Click(Sender: TObject);
    procedure ransaksiJual1Click(Sender: TObject);
    procedure Logout1Click(Sender: TObject);
    procedure MasterJual1Click(Sender: TObject);
  public
  end;

implementation

{$R *.dfm}

uses ServerController, uUser, uStok, uGudang, uCustomerCari, uTanggal;

procedure TMenu.Gudang1Click(Sender: TObject);
begin
  TGudang.Create(WebApplication).Show;
end;

procedure TMenu.Logout1Click(Sender: TObject);
begin
  WebApplication.Terminate;
end;

procedure TMenu.ManajemenUser1Click(Sender: TObject);
begin
  TUser.Create(WebApplication).Show;
end;

procedure TMenu.MasterJual1Click(Sender: TObject);
begin
  UserSession.Transaksi.State:='JUALMASTER';
  TTanggal.Create(WebApplication).Show;
  //TCustomerCari.Create(WebApplication).Show;
  //TJualMaster.Create(WebApplication).Show;
end;

procedure TMenu.MasterStok1Click(Sender: TObject);
begin
  TStok.Create(WebApplication).Show;
end;

procedure TMenu.ransaksiJual1Click(Sender: TObject);
begin
  UserSession.Transaksi.State:='JUAL';
  if UserSession.InitTempNotaJual then
  begin
    with TCustomerCari.Create(WebApplication) do
    begin
      Show;
    end;
  end;

end;

end.
