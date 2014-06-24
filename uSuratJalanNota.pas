unit uSuratJalanNota;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, IWCompLabel,
  IWCompGrids, IWDBGrids, IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl,
  IWControl, IWCompRectangle, Vcl.Controls, Vcl.Forms, IWVCLBaseContainer,
  IWContainer, IWHTMLContainer, IWHTML40Container, IWRegion;

type
  TSuratJalanNota = class(TIWAppForm)
    IWRegion2: TIWRegion;
    IWRectangle1: TIWRectangle;
    IWRegion1: TIWRegion;
    IWRectangle4: TIWRectangle;
    IWDBGrid1: TIWDBGrid;
    IWRegion5: TIWRegion;
    IWRectangle2: TIWRectangle;
    lbTotal: TIWRectangle;
    IWRectangle12: TIWRectangle;
    IWRegion3: TIWRegion;
    IWLabel1: TIWLabel;
    lbNama: TIWLabel;
    lbAlamat1: TIWLabel;
    lbAlamat2: TIWLabel;
    lbAlamat3: TIWLabel;
    lbTelp: TIWLabel;
    IWLabel4: TIWLabel;
    IWLabel5: TIWLabel;
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
    IWLabel6: TIWLabel;
    IWLabel7: TIWLabel;
    IWLabel8: TIWLabel;
    IWLabel9: TIWLabel;
    IWLabel10: TIWLabel;
    IWLabel11: TIWLabel;
    lbKendaraan: TIWLabel;
  public
  end;

implementation

{$R *.dfm}

uses ServerController;

end.
