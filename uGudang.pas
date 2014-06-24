unit uGudang;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, IWCompListbox,
  IWCompGrids, IWDBGrids, IWCompRectangle, IWCompEdit, IWDBStdCtrls,
  IWCompLabel, IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl, IWControl,
  IWCompButton, Vcl.Controls, Vcl.Forms, IWVCLBaseContainer, IWContainer,
  IWHTMLContainer, IWHTML40Container, IWRegion, DB;

type
  TGudang = class(TIWAppForm)
    IWRegion2: TIWRegion;
    btAdd: TIWButton;
    IWLabel1: TIWLabel;
    IWDBEdit1: TIWDBEdit;
    btDelete: TIWButton;
    btSave: TIWButton;
    IWRectangle1: TIWRectangle;
    x: TIWButton;
    IWDBGrid1: TIWDBGrid;
    cxList: TIWComboBox;
    btRefresh: TIWButton;
    procedure btAddClick(Sender: TObject);
    procedure btSaveClick(Sender: TObject);
    procedure btDeleteClick(Sender: TObject);
  public
  end;

implementation

{$R *.dfm}

uses ServerController;


procedure TGudang.btAddClick(Sender: TObject);
begin
  UserSession.qGudang.Append;
end;

procedure TGudang.btDeleteClick(Sender: TObject);
begin
  UserSession.qGudang.Delete;
end;

procedure TGudang.btSaveClick(Sender: TObject);
begin
  if UserSession.qGudang.State in [dsEdit] then
    UserSession.qGudang.Post;
end;

end.
