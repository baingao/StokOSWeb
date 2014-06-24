unit uPiutang;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, IWCompLabel,
  IWCompGrids, IWDBGrids, IWCompButton, IWVCLBaseControl, IWBaseControl,
  IWBaseHTMLControl, IWControl, IWCompRectangle, Vcl.Controls, Vcl.Forms,
  IWVCLBaseContainer, IWContainer, IWHTMLContainer, IWHTML40Container, IWRegion;

type
  TPiutang = class(TIWAppForm)
    IWRegion2: TIWRegion;
    IWRectangle1: TIWRectangle;
    btClose: TIWButton;
    IWRegion1: TIWRegion;
    IWRectangle4: TIWRectangle;
    IWDBGrid1: TIWDBGrid;
    IWRegion3: TIWRegion;
    IWRectangle3: TIWRectangle;
    IWDBGrid2: TIWDBGrid;
    btSimpan: TIWButton;
    btBatal: TIWButton;
    btHapus: TIWButton;
    IWRegion5: TIWRegion;
    IWRectangle2: TIWRectangle;
    lbSubTotal: TIWRectangle;
    lbTotal: TIWRectangle;
    IWLabel1: TIWLabel;
    IWLabel3: TIWLabel;
    IWRegion4: TIWRegion;
    IWRectangle5: TIWRectangle;
    lbNama: TIWLabel;
    lbAlamat1: TIWLabel;
    lbAlamat2: TIWLabel;
    lbAlamat3: TIWLabel;
    lbTelp: TIWLabel;
    IWButton1: TIWButton;
    lbTipe: TIWLabel;
    procedure btCloseClick(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
  public
  end;

implementation

{$R *.dfm}

uses ServerController;


procedure TPiutang.btCloseClick(Sender: TObject);
begin
  Release;
end;

procedure TPiutang.IWAppFormCreate(Sender: TObject);
begin
  UserSession.qPiutang.Close;
  UserSession.qPiutang.ParamByName('aicustomer').Value:=UserSession.Customer.AI;
  UserSession.qPiutang.Open();

  lbNama.Caption:='['+IntToStr(UserSession.Customer.AI)+'] '+UserSession.Customer.Nama;
  lbAlamat1.Caption:=UserSession.Customer.Alamat1;
  lbAlamat2.Caption:=UserSession.Customer.Alamat2;
  lbAlamat3.Caption:=UserSession.Customer.Alamat3;
  lbTelp.Caption:=UserSession.Customer.Telp;
  lbTipe.Caption:=UserSession.Customer.Tipe;
end;

end.
