unit uMain;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, IWCompButton,
  Vcl.Controls, IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl, IWControl,
  IWCompLabel, IWCompEdit, Vcl.Forms, IWVCLBaseContainer, IWContainer,
  IWHTMLContainer, IWHTML40Container, IWRegion, DB, IWCompRectangle,
  IWCompGrids, IWCompCalendar, IWDBGrids;

type
  TMain = class(TIWAppForm)
    IWRegion1: TIWRegion;
    User: TIWLabel;
    btLogin: TIWButton;
    eNama: TIWEdit;
    Password: TIWLabel;
    ePassword: TIWEdit;
    IWRectangle1: TIWRectangle;
    gJualMasterDtl: TIWDBGrid;
    procedure btLoginClick(Sender: TObject);
    procedure eNamaAsyncKeyPress(Sender: TObject; EventParams: TStringList);
    procedure ePasswordAsyncKeyPress(Sender: TObject; EventParams: TStringList);
    procedure gJualMasterDtlColumns0Click(ASender: TObject;
      const AValue: string);
    procedure IWAppFormCreate(Sender: TObject);
  public
  end;

implementation

{$R *.dfm}

uses ServerController, uMenu;

procedure TMain.btLoginClick(Sender: TObject);
var
  _sql, _passhash: String;
  _nama, _role, _lokasi: String;
begin
  _sql:='select * from operator where nama=:nama';
  _passhash:='';
  _nama:='';
  _role:='';
  _lokasi:='';

  UserSession.q0.Close;
  UserSession.q0.SQL.Clear;
  UserSession.q0.SQL.Text:=_sql;
  UserSession.q0.ParamByName('nama').Value:=eNama.Text;
  UserSession.q0.Open();

  if not UserSession.q0.IsEmpty then
  begin
    _nama:=UserSession.q0['nama'];
    _role:=UserSession.q0['role'];
    _lokasi:=UserSession.q0['lokasi'];
    _passhash:=UserSession.q0['password'];
    _sql:='select md5(:password) as passhash';

    UserSession.q0.Close;
    UserSession.q0.SQL.Clear;
    UserSession.q0.SQL.Text:=_sql;
    UserSession.q0.ParamByName('password').Value:=ePassword.Text;
    UserSession.q0.Open();

    if not UserSession.q0.IsEmpty then
    begin
      if _passhash=UserSession.q0['passhash'] then
      begin
        UserSession.CurrentUser.Nama:=_nama;
        UserSession.CurrentUser.Role:=_role;
        UserSession.CurrentUser.Lokasi:=_lokasi;
        TMenu.Create(WebApplication).Show;
      end
      else
        WebApplication.ShowMessage('Password yang anda masukan tidak benar.');
    end;
  end
  else
    WebApplication.ShowMessage('Username tidak ditemukan.');
end;

procedure TMain.eNamaAsyncKeyPress(Sender: TObject; EventParams: TStringList);
begin
  if (EventParams.Values['which']='13') then SetActiveControl(ePassword);
end;

procedure TMain.ePasswordAsyncKeyPress(Sender: TObject;
  EventParams: TStringList);
begin
  if (EventParams.Values['which']='13') then SetActiveControl(btlogin);
end;

procedure TMain.gJualMasterDtlColumns0Click(ASender: TObject;
  const AValue: string);
begin
  WebApplication.ShowMessage(AValue);
end;

procedure TMain.IWAppFormCreate(Sender: TObject);
begin
  UserSession.FDQuery1.Open();
end;

initialization
  TMain.SetAsMainForm;

end.
