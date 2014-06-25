object IWUserSession: TIWUserSession
  OldCreateOrder = False
  OnCreate = IWUserSessionBaseCreate
  Height = 500
  Width = 806
  object DB: TFDConnection
    Params.Strings = (
      'User_Name=baingao191'
      'Password=str0ngH0lD'
      'Port=3309'
      'Database=dbstokos'
      'Server=localhost'
      'DriverID=MySQL')
    Connected = True
    Left = 24
    Top = 64
  end
  object q0: TFDQuery
    Connection = DB
    Left = 24
    Top = 112
  end
  object MySQL: TFDPhysMySQLDriverLink
    DriverID = '1'
    Left = 24
    Top = 16
  end
  object qUser: TFDQuery
    Connection = DB
    SQL.Strings = (
      'select * from operator order by AI desc'
      'limit :list')
    Left = 112
    Top = 16
    ParamData = <
      item
        Name = 'LIST'
        ParamType = ptInput
      end>
  end
  object dsqUser: TDataSource
    DataSet = qUser
    Left = 191
    Top = 16
  end
  object qStok: TFDQuery
    Connection = DB
    SQL.Strings = (
      'select * from stok where kode=:kode')
    Left = 113
    Top = 63
    ParamData = <
      item
        Name = 'KODE'
        ParamType = ptInput
      end>
  end
  object dsqStok: TDataSource
    DataSet = qStok
    Left = 191
    Top = 64
  end
  object qLogStok: TFDQuery
    Connection = DB
    SQL.Strings = (
      'select * from logstok where kode=:kode'
      'ordefr by AI'
      'limit :list')
    Left = 113
    Top = 113
    ParamData = <
      item
        Name = 'KODE'
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'LIST'
        ParamType = ptInput
      end>
  end
  object dsqLogStok: TDataSource
    DataSet = qLogStok
    Left = 191
    Top = 113
  end
  object qStokDtl: TFDQuery
    Connection = DB
    SQL.Strings = (
      'select * from stokdtl where kode=:kode'
      'limit :list')
    Left = 113
    Top = 161
    ParamData = <
      item
        Name = 'KODE'
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'LIST'
        ParamType = ptInput
      end>
  end
  object dsqStokDtl: TDataSource
    DataSet = qStokDtl
    Left = 191
    Top = 161
  end
  object qGudang: TFDQuery
    Connection = DB
    SQL.Strings = (
      'select * from gudang'
      'order by ai desc')
    Left = 113
    Top = 209
  end
  object dsqGudang: TDataSource
    DataSet = qGudang
    Left = 191
    Top = 209
  end
  object qJual: TFDQuery
    Connection = DB
    SQL.Strings = (
      'select tempjual.*,'
      '(select nama from stok where kode=tempjual.kode) as nama,'
      '(tempjual.hjual*tempjual.jml) as htotal,'
      'format(hjual,0) as displayhjual,'
      'format((tempjual.hjual*tempjual.jml),0) as displayhtotal'
      'from tempjual'
      'order by tempjual.ai'
      'limit 100')
    Left = 269
    Top = 61
  end
  object dsqJual: TDataSource
    DataSet = qJual
    Left = 347
    Top = 61
  end
  object qCustomer: TFDQuery
    Connection = DB
    SQL.Strings = (
      'select * from customer order by nama')
    Left = 269
    Top = 13
  end
  object dsqCustomer: TDataSource
    DataSet = qCustomer
    Left = 347
    Top = 13
  end
  object qPiutang: TFDQuery
    Connection = DB
    SQL.Strings = (
      'select jualnota.*,'
      'format(subtotal,0) as displaysubtotal,'
      'format(jualnota.discrp,0) as displaydiscrp,'
      'format(jualnota.total,0) as displaytotal,'
      
        '(select nama from customer where ai=jualnota.aicustomer) as nama' +
        'customer,'
      '(select nama from sales where ai=jualnota.aisales) as namasales'
      'from jualnota'
      'where aicustomer like :aicustomer'
      'and aisales like :aisales'
      'and tgllunas is null'
      'order by jualnota.ai desc')
    Left = 269
    Top = 113
    ParamData = <
      item
        Name = 'AICUSTOMER'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'AISALES'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object dsqPiutang: TDataSource
    DataSet = qPiutang
    OnDataChange = dsqPiutangDataChange
    Left = 347
    Top = 113
  end
  object qPiutangDtl: TFDQuery
    Connection = DB
    SQL.Strings = (
      'select jual.*,'
      '(select nama from stok where kode=jual.kode) as nama,'
      '(jual.hjual*jual.jml) as htotal,'
      'format(hjual,0) as displayhjual,'
      'format((jual.hjual*jual.jml),0) as displayhtotal'
      'from jual'
      'where nota=:nota'
      'order by jual.ai desc')
    Left = 269
    Top = 161
    ParamData = <
      item
        Name = 'NOTA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object dsqPiutangDtl: TDataSource
    DataSet = qPiutangDtl
    Left = 347
    Top = 161
  end
  object qJualMaster: TFDQuery
    Connection = DB
    SQL.Strings = (
      'select jualnota.*,'
      'format(subtotal,0) as displaysubtotal,'
      'format(jualnota.discrp,0) as displaydiscrp,'
      'format(jualnota.total,0) as displaytotal,'
      
        '(select nama from customer where ai=jualnota.aicustomer) as nama' +
        'customer,'
      '(select nama from sales where ai=jualnota.aisales) as namasales'
      'from jualnota'
      'where date(tgl) between :tglstart and :tglend '
      'and aicustomer like :aicustomer'
      'and aisales like :aisales'
      'and gudang like :gudang'
      'and metode like :metode'
      'and user like :user'
      'order by jualnota.ai desc')
    Left = 269
    Top = 209
    ParamData = <
      item
        Name = 'TGLSTART'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'TGLEND'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'AICUSTOMER'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'AISALES'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'GUDANG'
        ParamType = ptInput
      end
      item
        Name = 'METODE'
        ParamType = ptInput
      end
      item
        Name = 'USER'
        ParamType = ptInput
      end>
  end
  object dsqJualMaster: TDataSource
    DataSet = qJualMaster
    OnDataChange = dsqJualMasterDataChange
    Left = 347
    Top = 209
  end
  object qJualMasterDtl: TFDQuery
    Connection = DB
    SQL.Strings = (
      'select jual.*,'
      '(select nama from stok where kode=jual.kode) as nama,'
      '(jual.hjual*jual.jml) as htotal,'
      'format(hjual,0) as displayhjual,'
      'format((jual.hjual*jual.jml),0) as displayhtotal'
      'from jual'
      'where nota='#39'662'#39
      'order by jual.ai')
    Left = 269
    Top = 257
  end
  object dsqJualMasterDtl: TDataSource
    DataSet = qJualMasterDtl
    Left = 347
    Top = 257
  end
  object qSuratJalanDtl: TFDQuery
    Connection = DB
    SQL.Strings = (
      'select suratjalan.*,'
      '(select nama from stok where kode=suratjalan.kode) as nama'
      'from suratjalan'
      'where aisuratjalan=:aisuratjalan'
      'order by suratjalan.ai')
    Left = 265
    Top = 369
    ParamData = <
      item
        Name = 'AISURATJALAN'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object dsqSuratJalanDtl: TDataSource
    DataSet = qSuratJalanDtl
    Left = 343
    Top = 369
  end
  object qSuratJalanMaster: TFDQuery
    Connection = DB
    SQL.Strings = (
      'select suratjalannota.*,'
      
        '(select nama from customer where ai=suratjalannota.aicustomer) a' +
        's namacustomer'
      'from suratjalannota'
      'where nota=:nota'
      'order by ai desc')
    Left = 265
    Top = 313
    ParamData = <
      item
        Name = 'NOTA'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object dsqSuratJalanMaster: TDataSource
    DataSet = qSuratJalanMaster
    OnDataChange = dsqSuratJalanMasterDataChange
    Left = 343
    Top = 313
  end
  object qSuratJalan: TFDQuery
    Connection = DB
    SQL.Strings = (
      'select tempsuratjalan.*'
      'from tempsuratjalan'
      'order by tempsuratjalan.ai'
      'limit 100')
    Left = 441
    Top = 9
  end
  object dsqSuratJalan: TDataSource
    DataSet = qSuratJalan
    Left = 519
    Top = 9
  end
  object FDQuery1: TFDQuery
    Connection = DB
    SQL.Strings = (
      'select jual.*,'
      '(select nama from stok where kode=jual.kode) as nama,'
      '(jual.hjual*jual.jml) as htotal,'
      'format(hjual,0) as displayhjual,'
      'format((jual.hjual*jual.jml),0) as displayhtotal'
      'from jual'
      'where nota='#39'662'#39
      'order by jual.ai')
    Left = 560
    Top = 148
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 628
    Top = 156
  end
end
