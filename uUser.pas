unit uUser;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, Vcl.Controls,
  IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl, IWControl, IWCompGrids,
  IWDBGrids, IWCompButton, IWCompLabel, Vcl.Forms, IWVCLBaseContainer,
  IWContainer, IWHTMLContainer, IWHTML40Container, IWRegion, IWCompListbox,
  IWDBStdCtrls, IWCompEdit, DB, IWCompRectangle;

type
  TUser = class(TIWAppForm)
    IWRegion2: TIWRegion;
    btAdd: TIWButton;
    IWLabel1: TIWLabel;
    lbPassword: TIWLabel;
    IWLabel2: TIWLabel;
    IWLabel3: TIWLabel;
    IWDBEdit1: TIWDBEdit;
    IWDBComboBox1: TIWDBComboBox;
    btDelete: TIWButton;
    ePassword: TIWEdit;
    eVerify: TIWEdit;
    btSave: TIWButton;
    IWRectangle1: TIWRectangle;
    x: TIWButton;
    cxList: TIWComboBox;
    btRefresh: TIWButton;
    IWRegion1: TIWRegion;
    IWDBGrid1: TIWDBGrid;
    cxLokasi: TIWDBComboBox;
    IWLabel4: TIWLabel;
    procedure IWAppFormCreate(Sender: TObject);
    procedure IWDBGrid1Columns1Click(ASender: TObject; const AValue: string);
    procedure btAddClick(Sender: TObject);
    procedure btSaveClick(Sender: TObject);
    procedure btEditClick(Sender: TObject);
    procedure btDeleteClick(Sender: TObject);
    procedure xClick(Sender: TObject);
    procedure btRefreshClick(Sender: TObject);
  public
  end;

implementation

{$R *.dfm}

uses ServerController, UserSessionUnit;


procedure TUser.btAddClick(Sender: TObject);
begin
  UserSession.qUser.Append;
end;

procedure TUser.btDeleteClick(Sender: TObject);
begin
  UserSession.qUser.Delete;
end;

procedure TUser.btEditClick(Sender: TObject);
begin
  UserSession.qUser.Edit;
end;

procedure TUser.btRefreshClick(Sender: TObject);
begin
  UserSession.qUser.Close;
  UserSession.qUser.ParamByName('list').Value:=StrToInt(cxList.Text);
  UserSession.qUser.Open;
end;

procedure TUser.btSaveClick(Sender: TObject);
var
  _sql, _passhash: String;
begin
  if ((UserSession.qUser.State in [dsInsert]) or (UserSession.qUser.State in [dsEdit]))  then
  begin
    if (ePassword.Text=eVerify.Text) then
    begin
      _sql:='select md5(:pass) as passhash';
      UserSession.q0.Close;
      UserSession.q0.SQL.Clear;
      UserSession.q0.SQL.Text:=_sql;
      UserSession.q0.ParamByName('pass').Value:=ePassword.Text;
      UserSession.q0.Open();
      _passhash:=UserSession.q0['passhash'];

      //WebApplication.ShowMessage(_passhash);
      UserSession.qUser['password']:=_passhash;
      UserSession.qUser.Post;
    end;
  end
  else
    WebApplication.ShowMessage('Not in edit mode.');
end;

procedure TUser.IWAppFormCreate(Sender: TObject);
begin
  cxList.ItemIndex:=0;
  UserSession.qUser.Close;
  UserSession.qUser.ParamByName('list').Value:=StrToInt(cxList.Text);
  UserSession.qUser.Open;
end;

procedure TUser.IWDBGrid1Columns1Click(ASender: TObject; const AValue: string);
begin
  UserSession.qUser.Locate('AI', StrToInt(AValue), []);
end;

procedure TUser.xClick(Sender: TObject);
begin
  Release;
end;

end.






































