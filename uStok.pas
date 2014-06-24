unit uStok;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, IWDBStdCtrls,
  IWCompListbox, IWCompGrids, IWDBGrids, IWCompRectangle, IWCompEdit,
  IWCompLabel, IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl, IWControl,
  IWCompButton, Vcl.Controls, Vcl.Forms, IWVCLBaseContainer, IWContainer,
  IWHTMLContainer, IWHTML40Container, IWRegion;

type
  TStok = class(TIWAppForm)
    IWRegion2: TIWRegion;
    IWRectangle1: TIWRectangle;
    btClose: TIWButton;
    rEditor: TIWRegion;
    IWLabel6: TIWLabel;
    IWDBEdit5: TIWDBEdit;
    IWDBEdit4: TIWDBEdit;
    IWLabel5: TIWLabel;
    IWLabel2: TIWLabel;
    IWDBEdit3: TIWDBEdit;
    IWDBComboBox1: TIWDBComboBox;
    lbPassword: TIWLabel;
    IWLabel3: TIWLabel;
    IWDBEdit2: TIWDBEdit;
    IWDBEdit1: TIWDBEdit;
    IWLabel1: TIWLabel;
    IWRectangle2: TIWRectangle;
    IWDBEdit6: TIWDBEdit;
    IWLabel7: TIWLabel;
    IWDBEdit7: TIWDBEdit;
    IWDBEdit8: TIWDBEdit;
    IWLabel8: TIWLabel;
    IWLabel9: TIWLabel;
    IWLabel10: TIWLabel;
    IWDBEdit9: TIWDBEdit;
    lbPPN: TIWLabel;
    IWDBEdit10: TIWDBEdit;
    IWLabel12: TIWLabel;
    IWDBEdit11: TIWDBEdit;
    rCari: TIWRegion;
    IWLabel16: TIWLabel;
    IWLabel18: TIWLabel;
    IWRectangle3: TIWRectangle;
    IWLabel15: TIWLabel;
    IWLabel19: TIWLabel;
    IWDBEdit12: TIWDBEdit;
    IWDBEdit13: TIWDBEdit;
    IWLabel11: TIWLabel;
    btCari: TIWButton;
    btTampilkan: TIWButton;
    IWRegion1: TIWRegion;
    IWRectangle4: TIWRectangle;
    IWDBGrid1: TIWDBGrid;
    IWDBLookupComboBox1: TIWDBLookupComboBox;
    cxBarang: TIWComboBox;
    eKode: TIWEdit;
    cxList: TIWComboBox;
    btRefresh: TIWButton;
    IWRegion3: TIWRegion;
    IWRectangle5: TIWRectangle;
    IWDBGrid2: TIWDBGrid;
    IWComboBox1: TIWComboBox;
    IWButton1: TIWButton;
    IWDBNavigator1: TIWDBNavigator;
    procedure btCloseClick(Sender: TObject);
    procedure btCariClick(Sender: TObject);
    procedure btTampilkanClick(Sender: TObject);
    procedure ShowStok(Kode: String);
    procedure btAddClick(Sender: TObject);
    procedure btEditClick(Sender: TObject);
    procedure eKodeAsyncKeyPress(Sender: TObject; EventParams: TStringList);
    procedure cxBarangAsyncKeyPress(Sender: TObject; EventParams: TStringList);
  public
  end;

implementation

{$R *.dfm}

uses ServerController, eapStrUtils;

procedure TStok.ShowStok(Kode: String);
begin
  UserSession.qStok.Close;
  UserSession.qStok.ParamByName('kode').Value:=Kode;
  UserSession.qStok.Open();
end;

procedure TStok.btAddClick(Sender: TObject);
begin
  UserSession.qStok.Append;
end;

procedure TStok.btCariClick(Sender: TObject);
var
  _ListBarang: TStringList;
begin
  try
    _ListBarang:=TStringList.Create;
    cxBarang.Items.Clear;
    if UserSession.GetBarangByKode(eKode.Text) then
      ShowStok(eKode.Text)
    else
      UserSession.CreateListBarang(eKode.Text, _ListBarang);
      cxBarang.Items:=_ListBarang;
  finally
    _ListBarang.Free;
  end;
end;

procedure TStok.btCloseClick(Sender: TObject);
begin
  Release;
end;

procedure TStok.btEditClick(Sender: TObject);
begin
  UserSession.qStok.Edit;
end;

procedure TStok.btTampilkanClick(Sender: TObject);
var
  _kode: String;
begin
  _kode:=GetStrBetween(cxBarang.Text,1,'[',']');
  if UserSession.GetBarangByKode(_kode) then
    ShowStok(_kode);
end;

procedure TStok.cxBarangAsyncKeyPress(Sender: TObject;
  EventParams: TStringList);
begin
  if (EventParams.Values['which']='13') then SetActiveControl(btTampilkan);
end;

procedure TStok.eKodeAsyncKeyPress(Sender: TObject; EventParams: TStringList);
begin
  if (EventParams.Values['which']='13') then SetActiveControl(btCari);
end;

end.
