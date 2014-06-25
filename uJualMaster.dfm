object JualMaster: TJualMaster
  Left = 0
  Top = 0
  Width = 1292
  Height = 768
  RenderInvisibleControls = False
  AllowPageAccess = True
  ConnectionMode = cmAny
  OnCreate = IWAppFormCreate
  Background.Fixed = False
  HandleTabs = False
  LeftToRight = True
  LockUntilLoaded = True
  LockOnSubmit = True
  ShowHint = True
  XPTheme = True
  DesignLeft = 8
  DesignTop = 8
  object IWRegion2: TIWRegion
    Left = 39
    Top = 30
    Width = 1200
    Height = 600
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
    object IWRectangle1: TIWRectangle
      Left = 1
      Top = 1
      Width = 1198
      Height = 32
      Cursor = crAuto
      Align = alTop
      ParentShowHint = False
      ShowHint = True
      ZIndex = 0
      RenderSize = True
      Text = 'Master Penjualan'
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
      ExplicitLeft = 0
      ExplicitTop = 0
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
      TabOrder = 0
      OnClick = btCloseClick
    end
    object btTerimaBayar: TIWButton
      Left = 942
      Top = 562
      Width = 251
      Height = 25
      Cursor = crAuto
      ParentShowHint = False
      ShowHint = True
      ZIndex = 0
      RenderSize = True
      Caption = 'Terima Pembayaran'
      Confirmation = 'SIMPAN Nota Penjualan ini?'
      Color = clBtnFace
      Font.Color = clNone
      Font.Size = 10
      Font.Style = []
      FriendlyName = 'btAdd'
      ScriptEvents = <>
      TabOrder = 1
    end
    object btSuratJalan: TIWButton
      Left = 942
      Top = 531
      Width = 251
      Height = 25
      Cursor = crAuto
      ParentShowHint = False
      ShowHint = True
      ZIndex = 0
      RenderSize = True
      Caption = 'Buat Surat Jalan'
      Color = clBtnFace
      Font.Color = clNone
      Font.Size = 10
      Font.Style = []
      FriendlyName = 'Hapus'
      ScriptEvents = <>
      TabOrder = 2
      OnClick = btSuratJalanClick
    end
    object rNotaDtl: TIWRegion
      Left = 13
      Top = 307
      Width = 923
      Height = 282
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
      object IWRectangle4: TIWRectangle
        Left = 1
        Top = 1
        Width = 921
        Height = 32
        Cursor = crAuto
        Align = alTop
        ParentShowHint = False
        ShowHint = True
        ZIndex = 0
        RenderSize = True
        Text = 'Detail Nota'
        Font.Color = clWebWHITE
        Font.FontFamily = 'Sans-Serif, Helvetica, Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        BorderOptions.Color = clNone
        BorderOptions.Width = 0
        FriendlyName = 'IWRectangle1'
        Color = clWebLIGHTSLATEGRAY
        Alignment = taCenter
        VAlign = vaMiddle
        ExplicitLeft = 0
        ExplicitWidth = 496
      end
      object gJualMasterDtl: TIWDBGrid
        Left = 10
        Top = 39
        Width = 906
        Height = 234
        Cursor = crAuto
        ParentShowHint = False
        ShowHint = True
        ZIndex = 0
        RenderSize = True
        BorderColors.Color = clNone
        BorderColors.Light = clNone
        BorderColors.Dark = clNone
        BGColor = clNone
        BorderSize = 1
        BorderStyle = tfVoid
        CellPadding = 5
        CellSpacing = 0
        Font.Color = clNone
        Font.FontFamily = 'Sans-Serif, Helvetica, Arial'
        Font.Size = 10
        Font.Style = []
        FrameBuffer = 40
        Lines = tlNone
        UseFrame = False
        UseSize = True
        ScrollToCurrentRow = True
        Columns = <
          item
            Alignment = taCenter
            BGColor = clNone
            DoSubmitValidation = True
            Font.Color = clNone
            Font.Size = 10
            Font.Style = []
            Header = False
            Height = '0'
            ShowHint = True
            VAlign = vaMiddle
            Visible = True
            Width = '64'
            Wrap = False
            RawText = False
            Css = ''
            BlobCharLimit = 0
            CompareHighlight = hcNone
            DataField = 'AI'
            LinkField = 'AI'
            OnClick = gJualMasterDtlColumns0Click
            Title.Alignment = taCenter
            Title.BGColor = clNone
            Title.DoSubmitValidation = True
            Title.Font.Color = clNone
            Title.Font.Size = 10
            Title.Font.Style = []
            Title.Header = False
            Title.Height = '0'
            Title.ShowHint = True
            Title.Text = 'No.'
            Title.VAlign = vaMiddle
            Title.Visible = True
            Title.Width = '0'
            Title.Wrap = False
            Title.RawText = True
          end
          item
            Alignment = taLeftJustify
            BGColor = clNone
            DoSubmitValidation = True
            Font.Color = clNone
            Font.Size = 10
            Font.Style = []
            Header = False
            Height = '0'
            ShowHint = True
            VAlign = vaMiddle
            Visible = True
            Width = '256'
            Wrap = False
            RawText = False
            Css = ''
            BlobCharLimit = 0
            CompareHighlight = hcNone
            DataField = 'kode'
            Title.Alignment = taCenter
            Title.BGColor = clNone
            Title.DoSubmitValidation = True
            Title.Font.Color = clNone
            Title.Font.Size = 10
            Title.Font.Style = []
            Title.Header = False
            Title.Height = '0'
            Title.ShowHint = True
            Title.Text = 'Kode'
            Title.VAlign = vaMiddle
            Title.Visible = True
            Title.Width = '0'
            Title.Wrap = False
            Title.RawText = True
          end
          item
            Alignment = taLeftJustify
            BGColor = clNone
            DoSubmitValidation = True
            Font.Color = clNone
            Font.Size = 10
            Font.Style = []
            Header = False
            Height = '0'
            ShowHint = True
            VAlign = vaMiddle
            Visible = True
            Width = '0'
            Wrap = False
            RawText = False
            Css = ''
            BlobCharLimit = 0
            CompareHighlight = hcNone
            DataField = 'nama'
            LinkField = 'AI'
            Title.Alignment = taCenter
            Title.BGColor = clNone
            Title.DoSubmitValidation = True
            Title.Font.Color = clNone
            Title.Font.Size = 10
            Title.Font.Style = []
            Title.Header = False
            Title.Height = '0'
            Title.ShowHint = True
            Title.Text = 'Nama Barang'
            Title.VAlign = vaMiddle
            Title.Visible = True
            Title.Width = '0'
            Title.Wrap = False
            Title.RawText = True
          end
          item
            Alignment = taRightJustify
            BGColor = clNone
            DoSubmitValidation = True
            Font.Color = clNone
            Font.Size = 10
            Font.Style = []
            Header = False
            Height = '0'
            ShowHint = True
            VAlign = vaMiddle
            Visible = True
            Width = '128'
            Wrap = False
            RawText = False
            Css = ''
            BlobCharLimit = 0
            CompareHighlight = hcNone
            DataField = 'displayhjual'
            Title.Alignment = taCenter
            Title.BGColor = clNone
            Title.DoSubmitValidation = True
            Title.Font.Color = clNone
            Title.Font.Size = 10
            Title.Font.Style = []
            Title.Header = False
            Title.Height = '0'
            Title.ShowHint = True
            Title.Text = 'Harga Jual (Rp)'
            Title.VAlign = vaMiddle
            Title.Visible = True
            Title.Width = '0'
            Title.Wrap = False
            Title.RawText = True
          end
          item
            Alignment = taCenter
            BGColor = clNone
            DoSubmitValidation = True
            Font.Color = clNone
            Font.Size = 10
            Font.Style = []
            Header = False
            Height = '0'
            ShowHint = True
            VAlign = vaMiddle
            Visible = True
            Width = '64'
            Wrap = False
            RawText = False
            Css = ''
            BlobCharLimit = 0
            CompareHighlight = hcNone
            DataField = 'jml'
            Title.Alignment = taCenter
            Title.BGColor = clNone
            Title.DoSubmitValidation = True
            Title.Font.Color = clNone
            Title.Font.Size = 10
            Title.Font.Style = []
            Title.Header = False
            Title.Height = '0'
            Title.ShowHint = True
            Title.Text = 'Qty'
            Title.VAlign = vaMiddle
            Title.Visible = True
            Title.Width = '0'
            Title.Wrap = False
            Title.RawText = True
          end
          item
            Alignment = taRightJustify
            BGColor = clNone
            DoSubmitValidation = True
            Font.Color = clNone
            Font.Size = 10
            Font.Style = []
            Header = False
            Height = '0'
            ShowHint = True
            VAlign = vaMiddle
            Visible = True
            Width = '128'
            Wrap = False
            RawText = False
            Css = ''
            BlobCharLimit = 0
            CompareHighlight = hcNone
            DataField = 'displayhtotal'
            Title.Alignment = taCenter
            Title.BGColor = clNone
            Title.DoSubmitValidation = True
            Title.Font.Color = clNone
            Title.Font.Size = 10
            Title.Font.Style = []
            Title.Header = False
            Title.Height = '0'
            Title.ShowHint = True
            Title.Text = 'Harga Total (Rp)'
            Title.VAlign = vaMiddle
            Title.Visible = True
            Title.Width = '0'
            Title.Wrap = False
            Title.RawText = True
          end
          item
            Alignment = taLeftJustify
            BGColor = clNone
            DoSubmitValidation = True
            Font.Color = clNone
            Font.Size = 10
            Font.Style = []
            Header = False
            Height = '0'
            ShowHint = True
            VAlign = vaMiddle
            Visible = True
            Width = '128'
            Wrap = False
            RawText = False
            Css = ''
            BlobCharLimit = 0
            CompareHighlight = hcNone
            DataField = 'serial'
            Title.Alignment = taCenter
            Title.BGColor = clNone
            Title.DoSubmitValidation = True
            Title.Font.Color = clNone
            Title.Font.Size = 10
            Title.Font.Style = []
            Title.Header = False
            Title.Height = '0'
            Title.ShowHint = True
            Title.Text = 'Serial No.'
            Title.VAlign = vaMiddle
            Title.Visible = True
            Title.Width = '0'
            Title.Wrap = False
            Title.RawText = True
          end>
        DataSource = IWUserSession.dsqJualMasterDtl
        FooterRowCount = 0
        FriendlyName = 'gJualMasterDtl'
        FromStart = True
        HighlightColor = clWebCORAL
        HighlightRows = True
        Options = [dgIndicator, dgShowTitles]
        RefreshMode = rmAutomatic
        RowLimit = 0
        RollOver = True
        RowClick = True
        RollOverColor = clWebPEACHPUFF
        RowHeaderColor = clWebMOCCASIN
        RowAlternateColor = clWebLIGHTBLUE
        RowCurrentColor = clWebDARKORANGE
        TabOrder = -1
      end
    end
    object rNota: TIWRegion
      Left = 13
      Top = 39
      Width = 1180
      Height = 262
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
      object IWRectangle3: TIWRectangle
        Left = 1
        Top = 1
        Width = 1178
        Height = 32
        Cursor = crAuto
        Align = alTop
        ParentShowHint = False
        ShowHint = True
        ZIndex = 0
        RenderSize = True
        Text = 'Nota'
        Font.Color = clWebWHITE
        Font.FontFamily = 'Sans-Serif, Helvetica, Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        BorderOptions.Color = clNone
        BorderOptions.Width = 0
        FriendlyName = 'IWRectangle1'
        Color = clWebLIGHTSLATEGRAY
        Alignment = taCenter
        VAlign = vaMiddle
        ExplicitLeft = 0
        ExplicitWidth = 496
      end
      object IWDBGrid2: TIWDBGrid
        Left = 14
        Top = 39
        Width = 1163
        Height = 214
        Cursor = crAuto
        ParentShowHint = False
        ShowHint = True
        ZIndex = 0
        RenderSize = True
        BorderColors.Color = clNone
        BorderColors.Light = clNone
        BorderColors.Dark = clNone
        BGColor = clNone
        BorderSize = 1
        BorderStyle = tfVoid
        CellPadding = 5
        CellSpacing = 0
        Font.Color = clNone
        Font.FontFamily = 'Sans-Serif, Helvetica, Arial'
        Font.Size = 10
        Font.Style = []
        FrameBuffer = 40
        Lines = tlNone
        UseFrame = False
        UseSize = True
        ScrollToCurrentRow = True
        Columns = <
          item
            Alignment = taLeftJustify
            BGColor = clNone
            DoSubmitValidation = True
            Font.Color = clNone
            Font.Size = 10
            Font.Style = []
            Header = False
            Height = '0'
            ShowHint = True
            VAlign = vaMiddle
            Visible = True
            Width = '0'
            Wrap = False
            RawText = False
            Css = ''
            BlobCharLimit = 0
            CompareHighlight = hcNone
            DataField = 'tgl'
            Title.Alignment = taCenter
            Title.BGColor = clNone
            Title.DoSubmitValidation = True
            Title.Font.Color = clNone
            Title.Font.Size = 10
            Title.Font.Style = []
            Title.Header = False
            Title.Height = '0'
            Title.ShowHint = True
            Title.Text = 'Tanggal'
            Title.VAlign = vaMiddle
            Title.Visible = True
            Title.Width = '0'
            Title.Wrap = False
            Title.RawText = True
          end
          item
            Alignment = taLeftJustify
            BGColor = clNone
            DoSubmitValidation = True
            Font.Color = clNone
            Font.Size = 10
            Font.Style = []
            Header = False
            Height = '0'
            ShowHint = True
            VAlign = vaMiddle
            Visible = True
            Width = '0'
            Wrap = False
            RawText = False
            Css = ''
            BlobCharLimit = 0
            CompareHighlight = hcNone
            DataField = 'AI'
            LinkField = 'AI'
            OnClick = IWDBGrid2Columns0Click
            Title.Alignment = taCenter
            Title.BGColor = clNone
            Title.DoSubmitValidation = True
            Title.Font.Color = clNone
            Title.Font.Size = 10
            Title.Font.Style = []
            Title.Header = False
            Title.Height = '0'
            Title.ShowHint = True
            Title.Text = 'No. Nota'
            Title.VAlign = vaMiddle
            Title.Visible = True
            Title.Width = '0'
            Title.Wrap = False
            Title.RawText = True
          end
          item
            Alignment = taLeftJustify
            BGColor = clNone
            DoSubmitValidation = True
            Font.Color = clNone
            Font.Size = 10
            Font.Style = []
            Header = False
            Height = '0'
            ShowHint = True
            VAlign = vaMiddle
            Visible = True
            Width = '0'
            Wrap = False
            RawText = False
            Css = ''
            BlobCharLimit = 0
            CompareHighlight = hcNone
            DataField = 'namacustomer'
            Title.Alignment = taCenter
            Title.BGColor = clNone
            Title.DoSubmitValidation = True
            Title.Font.Color = clNone
            Title.Font.Size = 10
            Title.Font.Style = []
            Title.Header = False
            Title.Height = '0'
            Title.ShowHint = True
            Title.Text = 'Customer'
            Title.VAlign = vaMiddle
            Title.Visible = True
            Title.Width = '0'
            Title.Wrap = False
            Title.RawText = True
          end
          item
            Alignment = taRightJustify
            BGColor = clNone
            DoSubmitValidation = True
            Font.Color = clNone
            Font.Size = 10
            Font.Style = []
            Header = False
            Height = '0'
            ShowHint = True
            VAlign = vaMiddle
            Visible = True
            Width = '0'
            Wrap = False
            RawText = False
            Css = ''
            BlobCharLimit = 0
            CompareHighlight = hcNone
            DataField = 'displaysubtotal'
            Title.Alignment = taCenter
            Title.BGColor = clNone
            Title.DoSubmitValidation = True
            Title.Font.Color = clNone
            Title.Font.Size = 10
            Title.Font.Style = []
            Title.Header = False
            Title.Height = '0'
            Title.ShowHint = True
            Title.Text = 'Sub-Total'
            Title.VAlign = vaMiddle
            Title.Visible = True
            Title.Width = '0'
            Title.Wrap = False
            Title.RawText = True
          end
          item
            Alignment = taCenter
            BGColor = clNone
            DoSubmitValidation = True
            Font.Color = clNone
            Font.Size = 10
            Font.Style = []
            Header = False
            Height = '0'
            ShowHint = True
            VAlign = vaMiddle
            Visible = True
            Width = '0'
            Wrap = False
            RawText = False
            Css = ''
            BlobCharLimit = 0
            CompareHighlight = hcNone
            DataField = 'disc'
            Title.Alignment = taCenter
            Title.BGColor = clNone
            Title.DoSubmitValidation = True
            Title.Font.Color = clNone
            Title.Font.Size = 10
            Title.Font.Style = []
            Title.Header = False
            Title.Height = '0'
            Title.ShowHint = True
            Title.Text = 'Disc (%)'
            Title.VAlign = vaMiddle
            Title.Visible = True
            Title.Width = '0'
            Title.Wrap = False
            Title.RawText = True
          end
          item
            Alignment = taRightJustify
            BGColor = clNone
            DoSubmitValidation = True
            Font.Color = clNone
            Font.Size = 10
            Font.Style = []
            Header = False
            Height = '0'
            ShowHint = True
            VAlign = vaMiddle
            Visible = True
            Width = '0'
            Wrap = False
            RawText = False
            Css = ''
            BlobCharLimit = 0
            CompareHighlight = hcNone
            DataField = 'displaydiscrp'
            Title.Alignment = taCenter
            Title.BGColor = clNone
            Title.DoSubmitValidation = True
            Title.Font.Color = clNone
            Title.Font.Size = 10
            Title.Font.Style = []
            Title.Header = False
            Title.Height = '0'
            Title.ShowHint = True
            Title.Text = 'Disc (Rp)'
            Title.VAlign = vaMiddle
            Title.Visible = True
            Title.Width = '0'
            Title.Wrap = False
            Title.RawText = True
          end
          item
            Alignment = taCenter
            BGColor = clNone
            DoSubmitValidation = True
            Font.Color = clNone
            Font.Size = 10
            Font.Style = []
            Header = False
            Height = '0'
            ShowHint = True
            VAlign = vaMiddle
            Visible = True
            Width = '0'
            Wrap = False
            RawText = False
            Css = ''
            BlobCharLimit = 0
            CompareHighlight = hcNone
            DataField = 'ppn'
            Title.Alignment = taCenter
            Title.BGColor = clNone
            Title.DoSubmitValidation = True
            Title.Font.Color = clNone
            Title.Font.Size = 10
            Title.Font.Style = []
            Title.Header = False
            Title.Height = '0'
            Title.ShowHint = True
            Title.Text = 'PPN'
            Title.VAlign = vaMiddle
            Title.Visible = True
            Title.Width = '0'
            Title.Wrap = False
            Title.RawText = True
          end
          item
            Alignment = taRightJustify
            BGColor = clNone
            DoSubmitValidation = True
            Font.Color = clNone
            Font.Size = 10
            Font.Style = []
            Header = False
            Height = '0'
            ShowHint = True
            VAlign = vaMiddle
            Visible = True
            Width = '0'
            Wrap = False
            RawText = False
            Css = ''
            BlobCharLimit = 0
            CompareHighlight = hcNone
            DataField = 'displaytotal'
            Title.Alignment = taCenter
            Title.BGColor = clNone
            Title.DoSubmitValidation = True
            Title.Font.Color = clNone
            Title.Font.Size = 10
            Title.Font.Style = []
            Title.Header = False
            Title.Height = '0'
            Title.ShowHint = True
            Title.Text = 'Total'
            Title.VAlign = vaMiddle
            Title.Visible = True
            Title.Width = '0'
            Title.Wrap = False
            Title.RawText = True
          end
          item
            Alignment = taCenter
            BGColor = clNone
            DoSubmitValidation = True
            Font.Color = clNone
            Font.Size = 10
            Font.Style = []
            Header = False
            Height = '0'
            ShowHint = True
            VAlign = vaMiddle
            Visible = True
            Width = '0'
            Wrap = False
            RawText = False
            Css = ''
            BlobCharLimit = 0
            CompareHighlight = hcNone
            DataField = 'metode'
            Title.Alignment = taCenter
            Title.BGColor = clNone
            Title.DoSubmitValidation = True
            Title.Font.Color = clNone
            Title.Font.Size = 10
            Title.Font.Style = []
            Title.Header = False
            Title.Height = '0'
            Title.ShowHint = True
            Title.Text = 'metode'
            Title.VAlign = vaMiddle
            Title.Visible = True
            Title.Width = '0'
            Title.Wrap = False
            Title.RawText = True
          end
          item
            Alignment = taCenter
            BGColor = clNone
            DoSubmitValidation = True
            Font.Color = clNone
            Font.Size = 10
            Font.Style = []
            Header = False
            Height = '0'
            ShowHint = True
            VAlign = vaMiddle
            Visible = True
            Width = '0'
            Wrap = False
            RawText = False
            Css = ''
            BlobCharLimit = 0
            CompareHighlight = hcNone
            DataField = 'gudang'
            Title.Alignment = taCenter
            Title.BGColor = clNone
            Title.DoSubmitValidation = True
            Title.Font.Color = clNone
            Title.Font.Size = 10
            Title.Font.Style = []
            Title.Header = False
            Title.Height = '0'
            Title.ShowHint = True
            Title.Text = 'gudang'
            Title.VAlign = vaMiddle
            Title.Visible = True
            Title.Width = '0'
            Title.Wrap = False
            Title.RawText = True
          end
          item
            Alignment = taLeftJustify
            BGColor = clNone
            DoSubmitValidation = True
            Font.Color = clNone
            Font.Size = 10
            Font.Style = []
            Header = False
            Height = '0'
            ShowHint = True
            VAlign = vaMiddle
            Visible = True
            Width = '0'
            Wrap = False
            RawText = False
            Css = ''
            BlobCharLimit = 0
            CompareHighlight = hcNone
            DataField = 'namasales'
            Title.Alignment = taCenter
            Title.BGColor = clNone
            Title.DoSubmitValidation = True
            Title.Font.Color = clNone
            Title.Font.Size = 10
            Title.Font.Style = []
            Title.Header = False
            Title.Height = '0'
            Title.ShowHint = True
            Title.Text = 'Sales'
            Title.VAlign = vaMiddle
            Title.Visible = True
            Title.Width = '0'
            Title.Wrap = False
            Title.RawText = True
          end
          item
            Alignment = taCenter
            BGColor = clNone
            DoSubmitValidation = True
            Font.Color = clNone
            Font.Size = 10
            Font.Style = []
            Header = False
            Height = '0'
            ShowHint = True
            VAlign = vaMiddle
            Visible = True
            Width = '0'
            Wrap = False
            RawText = False
            Css = ''
            BlobCharLimit = 0
            CompareHighlight = hcNone
            DataField = 'user'
            Title.Alignment = taCenter
            Title.BGColor = clNone
            Title.DoSubmitValidation = True
            Title.Font.Color = clNone
            Title.Font.Size = 10
            Title.Font.Style = []
            Title.Header = False
            Title.Height = '0'
            Title.ShowHint = True
            Title.Text = 'user'
            Title.VAlign = vaMiddle
            Title.Visible = True
            Title.Width = '0'
            Title.Wrap = False
            Title.RawText = True
          end>
        DataSource = IWUserSession.dsqJualMaster
        FooterRowCount = 0
        FriendlyName = 'IWDBGrid1'
        FromStart = True
        HighlightColor = clWebCORAL
        HighlightRows = True
        Options = [dgIndicator, dgShowTitles]
        RefreshMode = rmAutomatic
        RowLimit = 0
        RollOver = True
        RowClick = True
        RollOverColor = clWebPEACHPUFF
        RowHeaderColor = clWebMOCCASIN
        RowAlternateColor = clWebLIGHTBLUE
        RowCurrentColor = clWebDARKORANGE
        TabOrder = -1
      end
    end
    object IWRegion5: TIWRegion
      Left = 942
      Top = 455
      Width = 251
      Height = 70
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
      object IWRectangle2: TIWRectangle
        Left = 1
        Top = 1
        Width = 249
        Height = 32
        Cursor = crAuto
        Align = alTop
        ParentShowHint = False
        ShowHint = True
        ZIndex = 0
        RenderSize = True
        Text = 'Summary'
        Font.Color = clWebWHITE
        Font.FontFamily = 'Sans-Serif, Helvetica, Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        BorderOptions.Color = clNone
        BorderOptions.Width = 0
        FriendlyName = 'IWRectangle1'
        Color = clWebLIGHTSLATEGRAY
        Alignment = taCenter
        VAlign = vaMiddle
        ExplicitLeft = 0
        ExplicitWidth = 496
      end
      object lbTotal: TIWRectangle
        Left = 120
        Top = 39
        Width = 120
        Height = 24
        Cursor = crAuto
        ParentShowHint = False
        ShowHint = True
        ZIndex = 0
        RenderSize = True
        Text = '0'
        Font.Color = clNone
        Font.FontFamily = 'Sans-Serif, Helvetica, Arial'
        Font.Size = 10
        Font.Style = []
        BorderOptions.Color = clNone
        BorderOptions.Width = 0
        FriendlyName = 'IWRectangle5'
        Color = clNone
        Alignment = taRightJustify
        VAlign = vaMiddle
      end
      object IWLabel3: TIWLabel
        Left = 10
        Top = 41
        Width = 31
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
        Caption = 'Total'
        RawText = False
      end
    end
    object IWRegion7: TIWRegion
      Left = 941
      Top = 307
      Width = 251
      Height = 142
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
      Splitter = True
      object IWRectangle7: TIWRectangle
        Left = 1
        Top = 1
        Width = 249
        Height = 32
        Cursor = crAuto
        Align = alTop
        ParentShowHint = False
        ShowHint = True
        ZIndex = 0
        RenderSize = True
        Text = 'Filter'
        Font.Color = clWebWHITE
        Font.FontFamily = 'Sans-Serif, Helvetica, Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        BorderOptions.Color = clNone
        BorderOptions.Width = 0
        FriendlyName = 'IWRectangle1'
        Color = clWebLIGHTSLATEGRAY
        Alignment = taCenter
        VAlign = vaMiddle
        ExplicitLeft = 0
        ExplicitWidth = 496
      end
      object cxLokasi: TIWComboBox
        Left = 70
        Top = 39
        Width = 167
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
        Style = stNormal
        ButtonColor = clBtnFace
        Editable = True
        NonEditableAsLabel = False
        SubmitOnAsyncEvent = True
        TabOrder = 3
        ItemIndex = -1
        Sorted = False
        FriendlyName = 'cxBarang'
      end
      object IWLabel5: TIWLabel
        Left = 12
        Top = 41
        Width = 38
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
        Caption = 'Lokasi'
        RawText = False
      end
      object IWLabel1: TIWLabel
        Left = 12
        Top = 65
        Width = 46
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
        Caption = 'Metode'
        RawText = False
      end
      object cxMetode: TIWComboBox
        Left = 70
        Top = 63
        Width = 167
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
        Style = stNormal
        ButtonColor = clBtnFace
        Editable = True
        NonEditableAsLabel = False
        SubmitOnAsyncEvent = True
        TabOrder = 4
        ItemIndex = -1
        Sorted = False
        FriendlyName = 'cxBarang'
      end
      object IWLabel2: TIWLabel
        Left = 12
        Top = 90
        Width = 28
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
        Caption = 'User'
        RawText = False
      end
      object cxUser: TIWComboBox
        Left = 70
        Top = 88
        Width = 167
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
        Style = stNormal
        ButtonColor = clBtnFace
        Editable = True
        NonEditableAsLabel = False
        SubmitOnAsyncEvent = True
        TabOrder = 5
        ItemIndex = -1
        Sorted = False
        FriendlyName = 'cxBarang'
      end
      object cbFilter: TIWCheckBox
        Left = 68
        Top = 117
        Width = 89
        Height = 21
        Cursor = crAuto
        ParentShowHint = False
        ShowHint = True
        ZIndex = 0
        RenderSize = True
        Caption = 'Filter Data'
        Editable = True
        Font.Color = clNone
        Font.FontFamily = 'Sans-Serif, Helvetica, Arial'
        Font.Size = 10
        Font.Style = []
        SubmitOnAsyncEvent = True
        ScriptEvents = <>
        Style = stNormal
        TabOrder = 6
        OnChange = cbFilterChange
        Checked = False
        FriendlyName = 'cbFilter'
      end
    end
  end
end
