object ReportForm: TReportForm
  Left = 0
  Top = 0
  Caption = 'Raport'
  ClientHeight = 365
  ClientWidth = 708
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object IWCalendar1: TIWCalendar
    Left = 304
    Top = 168
    Width = 300
    Height = 150
    Cursor = crAuto
    IW50Hint = False
    ParentShowHint = False
    ShowHint = True
    ZIndex = 0
    RenderSize = True
    StyleRenderOptions.RenderSize = True
    StyleRenderOptions.RenderPosition = True
    StyleRenderOptions.RenderFont = True
    StyleRenderOptions.RenderZIndex = True
    StyleRenderOptions.RenderVisibility = True
    StyleRenderOptions.RenderStatus = True
    StyleRenderOptions.RenderAbsolute = True
    BorderColors.Color = clNone
    BorderColors.Light = clNone
    BorderColors.Dark = clNone
    BGColor = clNone
    BorderSize = 1
    BorderStyle = tfDefault
    Caption = 'IWCalendar1'
    CellPadding = 0
    CellSpacing = 0
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FrameBuffer = 40
    Lines = tlAll
    UseFrame = False
    UseSize = True
    CalendarFont.Color = clNone
    CalendarFont.Size = 10
    CalendarFont.Style = []
    CalendarHeaderFont.Color = clNone
    CalendarHeaderFont.Size = 10
    CalendarHeaderFont.Style = []
    SelectedDate = 45748.000000000000000000
    FriendlyName = 'IWCalendar1'
    StartDate = 45777.180348796300000000
    DisplayYear = True
  end
  object UserBox: TcxComboBox
    Left = 16
    Top = 43
    ParentShowHint = False
    Properties.Items.Strings = (
      '')
    ShowHint = False
    TabOrder = 0
    Width = 121
  end
  object EditDateFrom: TcxDateEdit
    Left = 16
    Top = 109
    ParentShowHint = False
    Properties.Nullstring = 'Data od:'
    ShowHint = False
    TabOrder = 1
    Width = 121
  end
  object EditDateTo: TcxDateEdit
    Left = 16
    Top = 175
    TabOrder = 2
    Width = 121
  end
  object ButtonConfirm: TcxButton
    Left = 16
    Top = 332
    Width = 75
    Height = 25
    Caption = 'Zatwierd'#378
    TabOrder = 3
    OnClick = ButtonConfirmClick
  end
  object cxGrid1: TcxGrid
    Left = 160
    Top = 24
    Width = 529
    Height = 333
    TabOrder = 4
    LookAndFeel.SkinName = 'Coffee'
    object cxGrid1DBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      ScrollbarAnnotations.CustomAnnotations = <>
      DataController.DataSource = UniDataSource
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object cxGrid1DBTableView1Nazwa: TcxGridDBColumn
        DataBinding.FieldName = 'Nazwa'
      end
      object cxGrid1DBTableView1Data: TcxGridDBColumn
        DataBinding.FieldName = 'Data'
        Width = 83
      end
      object cxGrid1DBTableView1Godzina: TcxGridDBColumn
        DataBinding.FieldName = 'Godzina'
        Width = 82
      end
      object cxGrid1DBTableView1Uytkownik: TcxGridDBColumn
        DataBinding.FieldName = 'U'#380'ytkownik'
        Width = 111
      end
      object cxGrid1DBTableView1Lokal: TcxGridDBColumn
        DataBinding.FieldName = 'Lokal'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object lblLoc: TcxLabel
    Left = 16
    Top = 24
    Caption = 'Lokal:'
  end
  object lblDateFrom: TcxLabel
    Left = 16
    Top = 86
    Caption = 'Data od:'
  end
  object lblDateTo: TcxLabel
    Left = 16
    Top = 152
    Caption = 'Data do:'
  end
  object UniDataSource: TUniDataSource
    DataSet = UniQuery
    Left = 552
    Top = 176
  end
  object UniConnection: TUniConnection
    ProviderName = 'SQL Server'
    Database = 'local'
    SpecificOptions.Strings = (
      'SQL Server.Authentication=auWindows')
    Left = 488
    Top = 120
  end
  object SQLServerUniProvider: TSQLServerUniProvider
    Left = 552
    Top = 120
  end
  object UniQuery: TUniQuery
    Connection = UniConnection
    SQL.Strings = (
      
        'SELECT export_name as Nazwa, CAST(export_dt AS DATE) AS Data, CO' +
        'NVERT(VARCHAR(5), export_dt, 108) AS Godzina, export_creator AS ' +
        'U'#380'ytkownik, local_name AS Lokal'
      'FROM exports;')
    Left = 488
    Top = 176
  end
end
