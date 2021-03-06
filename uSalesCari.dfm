object SalesCari: TSalesCari
  Left = 0
  Top = 0
  Width = 593
  Height = 371
  RenderInvisibleControls = False
  AllowPageAccess = True
  ConnectionMode = cmAny
  ActiveControl = eNama
  Background.Fixed = False
  HandleTabs = False
  LeftToRight = True
  LockUntilLoaded = True
  LockOnSubmit = True
  ShowHint = True
  XPTheme = True
  DesignLeft = 8
  DesignTop = 8
  object rCustomer: TIWRegion
    Left = 32
    Top = 32
    Width = 516
    Height = 289
    Cursor = crAuto
    RenderInvisibleControls = False
    BorderOptions.NumericWidth = 1
    BorderOptions.BorderWidth = cbwNumeric
    BorderOptions.Style = cbsSolid
    BorderOptions.Color = clNone
    Color = clNone
    ParentShowHint = False
    ShowHint = True
    ZIndex = 1000
    Splitter = False
    object IWLabel5: TIWLabel
      Left = 8
      Top = 40
      Width = 36
      Height = 16
      Cursor = crAuto
      ParentShowHint = False
      ShowHint = True
      ZIndex = 0
      RenderSize = True
      Alignment = taLeftJustify
      BGColor = clNone
      Font.Color = clNone
      Font.FontFamily = 'Sans-Serif, Helvetica, Arial'
      Font.Size = 10
      Font.Style = []
      NoWrap = False
      ConvertSpaces = False
      HasTabOrder = False
      FriendlyName = 'IWLabel1'
      Caption = 'Nama'
      RawText = False
    end
    object cxPilihNama: TIWComboBox
      Left = 61
      Top = 65
      Width = 332
      Height = 21
      Cursor = crAuto
      ParentShowHint = False
      ShowHint = True
      ZIndex = 0
      RenderSize = True
      BGColor = clNone
      Font.Color = clNone
      Font.Size = 10
      Font.Style = []
      FocusColor = clNone
      AutoHideOnMenuActivation = False
      ItemsHaveValues = False
      NoSelectionText = '-- Silahkan Pilih --'
      Required = False
      RequireSelection = True
      ScriptEvents = <>
      UseSize = True
      OnAsyncKeyDown = cxPilihNamaAsyncKeyDown
      Style = stNormal
      ButtonColor = clBtnFace
      Editable = True
      NonEditableAsLabel = False
      SubmitOnAsyncEvent = True
      TabOrder = 0
      ItemIndex = -1
      Sorted = False
      FriendlyName = 'cxBarang'
    end
    object TitleBar: TIWRectangle
      Left = 1
      Top = 1
      Width = 514
      Height = 32
      Cursor = crAuto
      Align = alTop
      ParentShowHint = False
      ShowHint = True
      ZIndex = 0
      RenderSize = True
      Text = 'Data Sales'
      Font.Color = clWebWHITE
      Font.FontFamily = 'Sans-Serif, Helvetica, Arial'
      Font.Size = 10
      Font.Style = [fsBold]
      BorderOptions.Color = clNone
      BorderOptions.Width = 0
      FriendlyName = 'IWRectangle1'
      Color = clWebCORNFLOWERBLUE
      Alignment = taCenter
      VAlign = vaMiddle
      ExplicitLeft = 2
      ExplicitTop = 5
      ExplicitWidth = 338
    end
    object eNama: TIWEdit
      Left = 61
      Top = 38
      Width = 332
      Height = 21
      Cursor = crAuto
      ParentShowHint = False
      ShowHint = True
      ZIndex = 0
      RenderSize = True
      Alignment = taLeftJustify
      BGColor = clNone
      FocusColor = clNone
      Editable = True
      NonEditableAsLabel = False
      Font.Color = clNone
      Font.FontFamily = 'Sans-Serif, Helvetica, Arial'
      Font.Size = 10
      Font.Style = []
      FriendlyName = 'eKode'
      MaxLength = 0
      ReadOnly = False
      Required = False
      ScriptEvents = <>
      SubmitOnAsyncEvent = True
      TabOrder = 1
      OnAsyncKeyDown = eNamaAsyncKeyDown
      PasswordPrompt = False
    end
    object btCari: TIWButton
      Left = 399
      Top = 39
      Width = 97
      Height = 21
      Cursor = crAuto
      ParentShowHint = False
      ShowHint = True
      ZIndex = 0
      RenderSize = True
      Caption = 'Cari'
      Color = clBtnFace
      Font.Color = clNone
      Font.Size = 10
      Font.Style = []
      FriendlyName = 'btAdd'
      ScriptEvents = <>
      TabOrder = 2
      OnClick = btCariClick
    end
    object btPilih: TIWButton
      Left = 399
      Top = 65
      Width = 97
      Height = 21
      Cursor = crAuto
      ParentShowHint = False
      ShowHint = True
      ZIndex = 0
      RenderSize = True
      Caption = 'Pilih'
      Color = clBtnFace
      Font.Color = clNone
      Font.Size = 10
      Font.Style = []
      FriendlyName = 'btAdd'
      ScriptEvents = <>
      TabOrder = 3
      OnClick = btPilihClick
    end
    object IWLabel1: TIWLabel
      Left = 8
      Top = 179
      Width = 49
      Height = 16
      Cursor = crAuto
      ParentShowHint = False
      ShowHint = True
      ZIndex = 0
      RenderSize = True
      Alignment = taLeftJustify
      BGColor = clNone
      Font.Color = clNone
      Font.FontFamily = 'Sans-Serif, Helvetica, Arial'
      Font.Size = 10
      Font.Style = []
      NoWrap = False
      ConvertSpaces = False
      HasTabOrder = False
      FriendlyName = 'IWLabel1'
      Caption = 'Telp/HP'
      RawText = False
    end
    object eTelp: TIWEdit
      Left = 61
      Top = 179
      Width = 332
      Height = 21
      Cursor = crAuto
      ParentShowHint = False
      ShowHint = True
      ZIndex = 0
      RenderSize = True
      Alignment = taLeftJustify
      BGColor = clNone
      FocusColor = clNone
      Editable = True
      NonEditableAsLabel = False
      Font.Color = clNone
      Font.FontFamily = 'Sans-Serif, Helvetica, Arial'
      Font.Size = 10
      Font.Style = []
      FriendlyName = 'eKode'
      MaxLength = 0
      ReadOnly = False
      Required = False
      ScriptEvents = <>
      SubmitOnAsyncEvent = True
      TabOrder = 4
      PasswordPrompt = False
    end
    object btNext: TIWButton
      Left = 261
      Top = 240
      Width = 125
      Height = 25
      Cursor = crAuto
      ParentShowHint = False
      ShowHint = True
      ZIndex = 0
      RenderSize = True
      Caption = 'Lanjutkan'
      Color = clBtnFace
      Font.Color = clNone
      Font.Size = 10
      Font.Style = []
      FriendlyName = 'btAdd'
      ScriptEvents = <>
      TabOrder = 5
      OnClick = btNextClick
    end
    object btClose: TIWButton
      Left = 0
      Top = 0
      Width = 50
      Height = 25
      Cursor = crAuto
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      ParentShowHint = False
      ShowHint = True
      ZIndex = 0
      RenderSize = True
      Caption = 'x'
      Color = clBtnFace
      Font.Color = clNone
      Font.FontFamily = 'Sans-Serif, Helvetica, Arial'
      Font.Size = 10
      Font.Style = []
      FriendlyName = 'btClose'
      ScriptEvents = <>
      TabOrder = 6
      OnClick = btCloseClick
    end
    object IWLabel2: TIWLabel
      Left = 8
      Top = 155
      Width = 36
      Height = 16
      Cursor = crAuto
      ParentShowHint = False
      ShowHint = True
      ZIndex = 0
      RenderSize = True
      Alignment = taLeftJustify
      BGColor = clNone
      Font.Color = clNone
      Font.FontFamily = 'Sans-Serif, Helvetica, Arial'
      Font.Size = 10
      Font.Style = []
      NoWrap = False
      ConvertSpaces = False
      HasTabOrder = False
      FriendlyName = 'IWLabel1'
      Caption = 'Nama'
      RawText = False
    end
    object IWHRule1: TIWHRule
      Left = 8
      Top = 99
      Width = 493
      Height = 3
      Cursor = crAuto
      ParentShowHint = False
      ShowHint = True
      ZIndex = 0
      RenderSize = True
      FriendlyName = 'IWHRule1'
    end
    object eNamaBaru: TIWEdit
      Left = 61
      Top = 152
      Width = 332
      Height = 21
      Cursor = crAuto
      ParentShowHint = False
      ShowHint = True
      ZIndex = 0
      RenderSize = True
      Alignment = taLeftJustify
      BGColor = clNone
      FocusColor = clNone
      Editable = True
      NonEditableAsLabel = False
      Font.Color = clNone
      Font.FontFamily = 'Sans-Serif, Helvetica, Arial'
      Font.Size = 10
      Font.Style = []
      FriendlyName = 'eKode'
      MaxLength = 0
      ReadOnly = False
      Required = False
      ScriptEvents = <>
      SubmitOnAsyncEvent = True
      TabOrder = 7
      PasswordPrompt = False
    end
    object btSimpan: TIWButton
      Left = 130
      Top = 240
      Width = 125
      Height = 25
      Cursor = crAuto
      ParentShowHint = False
      ShowHint = True
      ZIndex = 0
      RenderSize = True
      Caption = 'Simpan'
      Color = clBtnFace
      Font.Color = clNone
      Font.Size = 10
      Font.Style = []
      FriendlyName = 'btAdd'
      ScriptEvents = <>
      TabOrder = 8
      OnClick = btSimpanClick
    end
    object IWLabel4: TIWLabel
      Left = 8
      Top = 129
      Width = 13
      Height = 16
      Cursor = crAuto
      ParentShowHint = False
      ShowHint = True
      ZIndex = 0
      RenderSize = True
      Alignment = taLeftJustify
      BGColor = clNone
      Font.Color = clNone
      Font.FontFamily = 'Sans-Serif, Helvetica, Arial'
      Font.Size = 10
      Font.Style = []
      NoWrap = False
      ConvertSpaces = False
      HasTabOrder = False
      FriendlyName = 'IWLabel1'
      Caption = 'ID'
      RawText = False
    end
    object lbID: TIWLabel
      Left = 61
      Top = 129
      Width = 13
      Height = 16
      Cursor = crAuto
      ParentShowHint = False
      ShowHint = True
      ZIndex = 0
      RenderSize = True
      Alignment = taLeftJustify
      BGColor = clNone
      Font.Color = clNone
      Font.FontFamily = 'Sans-Serif, Helvetica, Arial'
      Font.Size = 10
      Font.Style = []
      NoWrap = False
      ConvertSpaces = False
      HasTabOrder = False
      FriendlyName = 'IWLabel1'
      Caption = 'ID'
      RawText = False
    end
    object IWLabel6: TIWLabel
      Left = 8
      Top = 206
      Width = 27
      Height = 16
      Cursor = crAuto
      ParentShowHint = False
      ShowHint = True
      ZIndex = 0
      RenderSize = True
      Alignment = taLeftJustify
      BGColor = clNone
      Font.Color = clNone
      Font.FontFamily = 'Sans-Serif, Helvetica, Arial'
      Font.Size = 10
      Font.Style = []
      NoWrap = False
      ConvertSpaces = False
      HasTabOrder = False
      FriendlyName = 'IWLabel1'
      Caption = 'Tipe'
      RawText = False
    end
    object cxTipe: TIWComboBox
      Left = 61
      Top = 206
      Width = 176
      Height = 21
      Cursor = crAuto
      ParentShowHint = False
      ShowHint = True
      ZIndex = 0
      RenderSize = True
      BGColor = clNone
      Font.Color = clNone
      Font.Size = 10
      Font.Style = []
      FocusColor = clNone
      AutoHideOnMenuActivation = False
      ItemsHaveValues = False
      NoSelectionText = '-- No Selection --'
      Required = False
      RequireSelection = True
      ScriptEvents = <>
      UseSize = True
      Style = stNormal
      ButtonColor = clBtnFace
      Editable = True
      NonEditableAsLabel = False
      SubmitOnAsyncEvent = True
      TabOrder = 9
      ItemIndex = 0
      Items.Strings = (
        'TUNAI'
        'KANVAS'
        'KREDIT LS'
        'KREDIT FINANCING')
      Sorted = False
      FriendlyName = 'cxBarang'
    end
  end
end
