object Menu: TMenu
  Left = 0
  Top = 0
  Width = 555
  Height = 400
  RenderInvisibleControls = False
  AllowPageAccess = True
  ConnectionMode = cmAny
  Background.Fixed = False
  HandleTabs = False
  LeftToRight = True
  LockUntilLoaded = True
  LockOnSubmit = True
  ShowHint = True
  XPTheme = True
  DesignLeft = 8
  DesignTop = 8
  object IWMenu1: TIWMenu
    Left = 0
    Top = 0
    Width = 555
    Height = 20
    Cursor = crAuto
    Align = alTop
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    FriendlyName = 'IWMenu1'
    AttachedMenu = MainMenu1
    ItemSpacing = itsNone
    AutoSize = mnaNone
    MainMenuStyle.MenuItemFont.Color = clNone
    MainMenuStyle.MenuItemFont.FontFamily = 'Sans-Serif, Helvetica, Arial'
    MainMenuStyle.MenuItemFont.Size = 10
    MainMenuStyle.MenuItemFont.Style = []
    MainMenuStyle.SelectedMenuItemFont.Color = clNone
    MainMenuStyle.SelectedMenuItemFont.FontFamily = 'Sans-Serif, Helvetica, Arial'
    MainMenuStyle.SelectedMenuItemFont.Size = 10
    MainMenuStyle.SelectedMenuItemFont.Style = []
    MainMenuStyle.DisabledMenuItemFont.Color = clWebSILVER
    MainMenuStyle.DisabledMenuItemFont.FontFamily = 'Sans-Serif, Helvetica, Arial'
    MainMenuStyle.DisabledMenuItemFont.Size = 10
    MainMenuStyle.DisabledMenuItemFont.Style = []
    MainMenuStyle.BGColor = 14933984
    MainMenuStyle.ItemBGColor = clNone
    MainMenuStyle.SelectedItemBGColor = clNone
    MainMenuStyle.DisabledItemBGColor = clNone
    MainMenuStyle.BorderColor = clNone
    MainMenuStyle.Orientation = iwOHorizontal
    SubMenuStyle.MenuItemFont.Color = clNone
    SubMenuStyle.MenuItemFont.FontFamily = 'Sans-Serif, Helvetica, Arial'
    SubMenuStyle.MenuItemFont.Size = 10
    SubMenuStyle.MenuItemFont.Style = []
    SubMenuStyle.SelectedMenuItemFont.Color = clNone
    SubMenuStyle.SelectedMenuItemFont.FontFamily = 'Sans-Serif, Helvetica, Arial'
    SubMenuStyle.SelectedMenuItemFont.Size = 10
    SubMenuStyle.SelectedMenuItemFont.Style = []
    SubMenuStyle.DisabledMenuItemFont.Color = clWebSILVER
    SubMenuStyle.DisabledMenuItemFont.FontFamily = 'Sans-Serif, Helvetica, Arial'
    SubMenuStyle.DisabledMenuItemFont.Size = 10
    SubMenuStyle.DisabledMenuItemFont.Style = []
    SubMenuStyle.BGColor = clNone
    SubMenuStyle.ItemBGColor = clNone
    SubMenuStyle.SelectedItemBGColor = clNone
    SubMenuStyle.DisabledItemBGColor = clNone
    SubMenuStyle.BorderColor = clNone
    SubMenuStyle.Orientation = iwOVertical
    TimeOut = 0
    ExplicitLeft = 176
    ExplicitTop = 192
    ExplicitWidth = 200
  end
  object MainMenu1: TMainMenu
    Left = 424
    Top = 31
    object ManajemenUser1: TMenuItem
      Caption = 'Manajemen User'
      OnClick = ManajemenUser1Click
    end
    object Stok1: TMenuItem
      Caption = 'Stok'
      object MasterStok1: TMenuItem
        Caption = 'Master'
        OnClick = MasterStok1Click
      end
      object Mutasi1: TMenuItem
        Caption = 'Mutasi'
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Gudang1: TMenuItem
        Caption = 'Gudang'
        OnClick = Gudang1Click
      end
    end
    object Beli1: TMenuItem
      Caption = 'Beli'
      object MasterBeli1: TMenuItem
        Caption = 'Master'
      end
      object ransaksiBeli1: TMenuItem
        Caption = 'Transaksi'
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object erimaBarang1: TMenuItem
        Caption = 'Terima Barang'
      end
    end
    object Jual1: TMenuItem
      Caption = 'Jual'
      object MasterJual1: TMenuItem
        Caption = 'Master'
        OnClick = MasterJual1Click
      end
      object ransaksiJual1: TMenuItem
        Caption = 'Transaksi'
        OnClick = ransaksiJual1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object SuratJalan1: TMenuItem
        Caption = 'Surat Jalan'
      end
    end
    object Logout1: TMenuItem
      Caption = 'Logout'
      OnClick = Logout1Click
    end
  end
end
