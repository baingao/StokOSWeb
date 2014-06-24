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
    gJualMasterDtl: TIWDBGrid;
    rNota: TIWRegion;
    IWRectangle3: TIWRectangle;
    IWDBGrid2: TIWDBGrid;
    IWRegion1: TIWRegion;
    IWRectangle5: TIWRectangle;
    IWDBGrid1: TIWDBGrid;
    IWRegion5: TIWRegion;
    IWRectangle2: TIWRectangle;
    eJml: TIWRectangle;
    IWLabel3: TIWLabel;
    btKirim: TIWButton;
    btBatal: TIWButton;
    IWButton1: TIWButton;
    IWButton2: TIWButton;
    IWLabel1: TIWLabel;
    cxLokasi: TIWComboBox;
    IWButton3: TIWButton;
    procedure IWAppFormCreate(Sender: TObject);

    function KirimBarang: Boolean;
  public
  end;

implementation

{$R *.dfm}

uses ServerController;

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

procedure TSuratJalan.IWAppFormCreate(Sender: TObject);
begin
  UserSession.qSuratJalanMaster.Close;
  UserSession.qSuratJalanMaster.ParamByName('nota').Value:=UserSession.qJualMaster['AI'];
  UserSession.qSuratJalanMaster.Open();
end;

end.
