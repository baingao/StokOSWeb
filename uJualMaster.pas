unit uJualMaster;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, IWCompCalendar,
  IWCompLabel, IWCompGrids, IWDBGrids, IWCompButton, IWVCLBaseControl,
  IWBaseControl, IWBaseHTMLControl, IWControl, IWCompRectangle, Vcl.Controls,
  Vcl.Forms, IWVCLBaseContainer, IWContainer, IWHTMLContainer,
  IWHTML40Container, IWRegion, IWCompEdit, IWCompListbox, IWCompCheckbox;

type
  TJualMaster = class(TIWAppForm)
    IWRegion2: TIWRegion;
    IWRectangle1: TIWRectangle;
    btClose: TIWButton;
    btTerimaBayar: TIWButton;
    btSuratJalan: TIWButton;
    rNotaDtl: TIWRegion;
    IWRectangle4: TIWRectangle;
    gJualMasterDtl: TIWDBGrid;
    rNota: TIWRegion;
    IWRectangle3: TIWRectangle;
    IWDBGrid2: TIWDBGrid;
    IWRegion5: TIWRegion;
    IWRectangle2: TIWRectangle;
    lbTotal: TIWRectangle;
    IWLabel3: TIWLabel;
    IWRegion7: TIWRegion;
    IWRectangle7: TIWRectangle;
    cxLokasi: TIWComboBox;
    IWLabel5: TIWLabel;
    IWLabel1: TIWLabel;
    cxMetode: TIWComboBox;
    IWLabel2: TIWLabel;
    cxUser: TIWComboBox;
    cbFilter: TIWCheckBox;
    procedure IWButton1AsyncClick(Sender: TObject; EventParams: TStringList);
    procedure btCloseClick(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure IWDBGrid2Columns0Click(ASender: TObject; const AValue: string);
    procedure cbFilterChange(Sender: TObject);
    procedure btSuratJalanClick(Sender: TObject);
    procedure gJualMasterDtlColumns0Click(ASender: TObject;
      const AValue: string);
  public
  end;

implementation

{$R *.dfm}

uses ServerController, uSuratJalan;

procedure TJualMaster.btCloseClick(Sender: TObject);
begin
  Release;
end;

procedure TJualMaster.btSuratJalanClick(Sender: TObject);
begin
  TSuratJalan.Create(WebApplication).Show;
end;

procedure TJualMaster.cbFilterChange(Sender: TObject);
begin
  UserSession.qJualMaster.Close;
  if cbFilter.Checked then
  begin
    UserSession.qJualMaster.ParamByName('gudang').Value:=cxLokasi.Text;
    UserSession.qJualMaster.ParamByName('metode').Value:=cxMetode.Text;
    UserSession.qJualMaster.ParamByName('user').Value:=cxUser.Text;
  end
  else
  begin
    UserSession.qJualMaster.ParamByName('gudang').Value:='%';
    UserSession.qJualMaster.ParamByName('metode').Value:='%';
    UserSession.qJualMaster.ParamByName('user').Value:='%';
  end;
  UserSession.qJualMaster.Open();
end;

procedure TJualMaster.gJualMasterDtlColumns0Click(ASender: TObject;
  const AValue: string);
begin
  WebApplication.ShowMessage(AValue);
  //UserSession.qJualMasterDtl.Locate('AI', StrToInt(AValue), []);
end;

procedure TJualMaster.IWAppFormCreate(Sender: TObject);
begin
  UserSession.qJualMaster.Close;
  UserSession.qJualMaster.ParamByName('tglstart').Value:=UserSession.Transaksi.TglStart;
  UserSession.qJualMaster.ParamByName('tglend').Value:=UserSession.Transaksi.TglEnd;
  UserSession.qJualMaster.ParamByName('aicustomer').Value:=UserSession.Customer.AI;
  UserSession.qJualMaster.ParamByName('aisales').Value:=UserSession.Sales.AI;
  UserSession.qJualMaster.ParamByName('gudang').Value:='%';
  UserSession.qJualMaster.ParamByName('metode').Value:='%';
  UserSession.qJualMaster.ParamByName('user').Value:='%';
  UserSession.qJualMaster.Open();
end;

procedure TJualMaster.IWButton1AsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
{
  if rNotaDtl.Visible then
  begin
    rNotaDtl.Visible:=false;
    rNota.Height:=550;
  end
  else
  begin
    rNotaDtl.Visible:=true;
    rNota.Height:=262;
  end;
}
end;

procedure TJualMaster.IWDBGrid2Columns0Click(ASender: TObject;
  const AValue: string);
begin
  UserSession.qJualMaster.Locate('AI', StrToInt(AValue), []);
end;

end.
