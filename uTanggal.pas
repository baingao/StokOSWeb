unit uTanggal;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, IWCompGrids,
  IWCompCalendar, IWCompEdit, IWCompLabel, IWCompButton, IWVCLBaseControl,
  IWBaseControl, IWBaseHTMLControl, IWControl, IWCompRectangle, Vcl.Controls,
  Vcl.Forms, IWVCLBaseContainer, IWContainer, IWHTMLContainer,
  IWHTML40Container, IWRegion;

type
  TTanggal = class(TIWAppForm)
    rCustomer: TIWRegion;
    TitleBar: TIWRectangle;
    btClose: TIWButton;
    IWLabel1: TIWLabel;
    eTglStart: TIWEdit;
    IWCalendar1: TIWCalendar;
    IWLabel2: TIWLabel;
    eTglEnd: TIWEdit;
    btTglStart: TIWButton;
    btTglEnd: TIWButton;
    btNext: TIWButton;
    procedure btCloseClick(Sender: TObject);
    procedure btTglStartAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure btTglEndAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure IWCalendar1DateChange(ADate: TDateTime);
    procedure btNextClick(Sender: TObject);
  public
  end;

implementation

{$R *.dfm}

uses ServerController, uCustomerCari;


procedure TTanggal.btCloseClick(Sender: TObject);
begin
  Release;
end;

procedure TTanggal.btNextClick(Sender: TObject);
begin
  TCustomerCari.Create(WebApplication).Show;
end;

procedure TTanggal.btTglEndAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  IWCalendar1.Caption:='Sampai Dengan Tanggal';
  if not IWCalendar1.Visible then
    IWCalendar1.Visible:=true
  else
    IWCalendar1.Visible:=false;
end;

procedure TTanggal.btTglStartAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  IWCalendar1.Caption:='Mulai Tanggal';
  if not IWCalendar1.Visible then
    IWCalendar1.Visible:=true
  else
    IWCalendar1.Visible:=false;
end;

procedure TTanggal.IWCalendar1DateChange(ADate: TDateTime);
begin
  if IWCalendar1.Caption='Mulai Tanggal' then
  begin
    eTglStart.Text:=DateToStr(IWCalendar1.SelectedDate);
    UserSession.Transaksi.TglStart:=IWCalendar1.SelectedDate;
  end
  else
  begin
    eTglEnd.Text:=DateToStr(IWCalendar1.SelectedDate);
    UserSession.Transaksi.TglEnd:=IWCalendar1.SelectedDate;
  end;
  IWCalendar1.Visible:=false;
end;

end.
