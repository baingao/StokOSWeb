unit uJualNota;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, IWCompEdit,
  IWCompListbox, IWCompLabel, IWCompGrids, IWDBGrids, IWCompButton,
  IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl, IWControl,
  IWCompRectangle, Vcl.Controls, Vcl.Forms, IWVCLBaseContainer, IWContainer,
  IWHTMLContainer, IWHTML40Container, IWRegion, IWCompMemo;

type
  TJualNota = class(TIWAppForm)
    IWRegion2: TIWRegion;
    IWRectangle1: TIWRectangle;
    IWRegion1: TIWRegion;
    IWRectangle4: TIWRectangle;
    IWDBGrid1: TIWDBGrid;
    IWRegion5: TIWRegion;
    IWRectangle2: TIWRectangle;
    lbSubTotal: TIWRectangle;
    lbTotal: TIWRectangle;
    IWRectangle9: TIWRectangle;
    IWRectangle10: TIWRectangle;
    IWRectangle11: TIWRectangle;
    IWRectangle12: TIWRectangle;
    lbPPN: TIWRectangle;
    lbDisc: TIWRectangle;
    IWRegion3: TIWRegion;
    IWLabel1: TIWLabel;
    lbNama: TIWLabel;
    IWRegion4: TIWRegion;
    lbNamaToko: TIWLabel;
    lbAlamatToko: TIWLabel;
    IWLabel2: TIWLabel;
    IWLabel3: TIWLabel;
    IWRectangle5: TIWRectangle;
    IWRegion6: TIWRegion;
    lbJudul: TIWLabel;
    lbNomor: TIWLabel;
    lbTanggal: TIWLabel;
    lbAlamat1: TIWLabel;
    lbAlamat2: TIWLabel;
    lbAlamat3: TIWLabel;
    lbTelp: TIWLabel;
    IWLabel4: TIWLabel;
    IWLabel5: TIWLabel;
    IWRectangle3: TIWRectangle;
    lbDiscRp: TIWRectangle;
    procedure btCloseClick(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure lbJudulAsyncClick(Sender: TObject; EventParams: TStringList);
  public
  end;

implementation

{$R *.dfm}

uses ServerController, uMenu;

procedure TJualNota.btCloseClick(Sender: TObject);
begin
  Release;
end;

procedure TJualNota.IWAppFormCreate(Sender: TObject);
begin
  lbNama.Caption:=UserSession.Customer.Nama+' ['+IntToStr(UserSession.Customer.AI)+']';
  lbAlamat1.Caption:=UserSession.Customer.Alamat1;
  lbAlamat2.Caption:=UserSession.Customer.Alamat2;
  lbAlamat3.Caption:=UserSession.Customer.Alamat3;
  lbTelp.Caption:=UserSession.Customer.Telp;

  lbSubTotal.Text:='Rp. '+Format('%9.0n', [UserSession.TempNotaJual.Subtotal]);
  lbDisc.Text:=FloatToStr(UserSession.TempNotaJual.Disc);
  lbDiscRp.Text:='Rp. '+Format('%9.0n', [UserSession.TempNotaJual.DiscRp]);
  lbPPN.Text:=FloatToStr(UserSession.TempNotaJual.PPN);
  lbTotal.Text:='Rp. '+Format('%9.0n', [UserSession.TempNotaJual.Total]);
end;

procedure TJualNota.lbJudulAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  Release;
  TMenu.Create(WebApplication).Show;
end;

end.
