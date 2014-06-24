program StokOSWeb;

uses
  IWRtlFix,
  Forms,
  IWStart,
  UTF8ContentParser,
  uMain in 'uMain.pas' {Main: TIWAppForm},
  ServerController in 'ServerController.pas' {IWServerController: TIWServerControllerBase},
  UserSessionUnit in 'UserSessionUnit.pas' {IWUserSession: TIWUserSessionBase},
  uMenu in 'uMenu.pas' {Menu: TIWAppForm},
  uUser in 'uUser.pas' {User: TIWAppForm},
  uStok in 'uStok.pas' {Stok: TIWAppForm},
  eapStrUtils in 'eapStrUtils.pas',
  uGudang in 'uGudang.pas' {Gudang: TIWAppForm},
  uJual in 'uJual.pas' {Jual: TIWAppForm},
  uSuratJalan in 'uSuratJalan.pas' {SuratJalan: TIWAppForm},
  uSupplier in 'uSupplier.pas' {Supplier: TIWAppForm},
  uPaket in 'uPaket.pas' {Paket: TIWAppForm},
  uJualNota in 'uJualNota.pas' {JualNota: TIWAppForm},
  uCustomerCari in 'uCustomerCari.pas' {CustomerCari: TIWAppForm},
  uPiutang in 'uPiutang.pas' {Piutang: TIWAppForm},
  uSalesCari in 'uSalesCari.pas' {SalesCari: TIWAppForm},
  uJualMaster in 'uJualMaster.pas' {JualMaster: TIWAppForm},
  uTanggal in 'uTanggal.pas' {Tanggal: TIWAppForm},
  uSuratJalanNota in 'uSuratJalanNota.pas' {SuratJalanNota: TIWAppForm};

{$R *.res}

begin
  TIWStart.Execute(True);
end.
