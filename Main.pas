unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxSkinsCore, dxSkinBasic, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkroom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinOffice2019Black, dxSkinOffice2019Colorful, dxSkinOffice2019DarkGray,
  dxSkinOffice2019White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringtime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinTheBezier,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, dxDateRanges,
  dxScrollbarAnnotations, DB, cxDBData, dxServerModeData,
  dxServerModeADODataSource, ADODB, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, Provider,
  DBAccess, Uni, MemDS, UniProvider, SQLServerUniProvider, cxContainer,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBExtLookupComboBox, StdCtrls, cxDBEdit, ComCtrls, IWVCLBaseControl,
  IWBaseControl, IWBaseHTMLControl, IWControl, IWGrids, IWCompCalendar,
  cxSchedulerStorage, cxSchedulerCustomControls, cxSchedulerDateNavigator,
  cxDateNavigator, dxCore, cxDateUtils, cxCalendar, Menus, cxButtons, IniFiles,
  cxLabel;

type
  TReportForm = class(TForm)
    UniDataSource: TUniDataSource;
    UniConnection: TUniConnection;
    SQLServerUniProvider: TSQLServerUniProvider;
    UserBox: TcxComboBox;
    IWCalendar1: TIWCalendar;
    EditDateFrom: TcxDateEdit;
    EditDateTo: TcxDateEdit;
    ButtonConfirm: TcxButton;
    UniQuery: TUniQuery;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1Nazwa: TcxGridDBColumn;
    cxGrid1DBTableView1Data: TcxGridDBColumn;
    cxGrid1DBTableView1Godzina: TcxGridDBColumn;
    cxGrid1DBTableView1Uytkownik: TcxGridDBColumn;
    cxGrid1DBTableView1Lokal: TcxGridDBColumn;
    lblLoc: TcxLabel;
    lblDateFrom: TcxLabel;
    lblDateTo: TcxLabel;
    procedure FormCreate(Sender: TObject);
    procedure ButtonConfirmClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ReportForm: TReportForm;

implementation

{$R *.dfm}

procedure TReportForm.FormCreate(Sender: TObject);
var
  Ini: TIniFile;
  ConfigFile: string;
begin
  ConfigFile := ExtractFilePath(Application.ExeName) + 'config.ini';
  Ini := TIniFile.Create(ConfigFile);
  try
    UniConnection.ProviderName := Ini.ReadString('Database', 'ProviderName', 'SQL Server');
    UniConnection.Server := Ini.ReadString('Database', 'Server', '');
    UniConnection.Database := Ini.ReadString('Database', 'Database', '');
    UniConnection.LoginPrompt := Ini.ReadBool('Database', 'LoginPrompt', False);
    UniConnection.SpecificOptions.Values['SQL Server.Authentication'] :=
      Ini.ReadString('Database', 'Authentication', 'auWindows');
    UniConnection.Connected := True;
  finally
    Ini.Free;
  end;

  UniQuery.SQL.Text := 'SELECT DISTINCT local_name FROM exports ORDER BY local_name';
  UniQuery.Open;

  UserBox.Properties.Items.Clear;
  while not UniQuery.Eof do
  begin
    UserBox.Properties.Items.Add(UniQuery.FieldByName('local_name').AsString);
    UniQuery.Next;
  end;
  UserBox.Text := '';

  UniQuery.Close;
  UniQuery.SQL.Text :=
    'SELECT export_name AS Nazwa, ' +
    'CAST(export_dt AS DATE) AS Data, ' +
    'CONVERT(VARCHAR(5), export_dt, 108) AS Godzina, ' +
    'export_creator AS [U¿ytkownik], ' +
    'local_name AS Lokal ' +
    'FROM exports ' +
    'ORDER BY export_dt DESC';
  UniQuery.Open;
  cxGrid1DBTableView1.OptionsView.GroupByBox := False;
end;

procedure TReportForm.ButtonConfirmClick(Sender: TObject);
var
  chosenLocal: string;
  dateFrom, dateTo: TDateTime;
  sql: string;
begin
  chosenLocal := UserBox.Text;
  if not TryStrToDate(EditDateFrom.Text, dateFrom) then
  begin
    ShowMessage('Niepoprawna data "Data od"');
    Exit;
  end;
  if not TryStrToDate(EditDateTo.Text, dateTo) then
  begin
    ShowMessage('Niepoprawna data "Data do"');
    Exit;
  end;

  if dateFrom > dateTo then
  begin
    ShowMessage('Data od nie mo e by  p niejsza ni  data do');
    EditDateFrom.SetFocus;
    Exit;
  end;

  sql :=
    'SELECT export_name AS Nazwa, ' +
    'CAST(export_dt AS DATE) AS Data, ' +
    'CONVERT(VARCHAR(5), export_dt, 108) AS Godzina, ' +
    'export_creator AS [U¿ytkownik], ' +
    'local_name AS Lokal ' +
    'FROM exports ' +
    'WHERE export_dt >= :DateFrom AND export_dt < :DateToPlusOne';

  if chosenLocal <> '' then
    sql := sql + ' AND local_name = :LocalName';

  sql := sql + ' ORDER BY export_dt DESC';

  UniQuery.Close;
  UniQuery.SQL.Text := sql;

  UniQuery.ParamByName('DateFrom').AsDateTime := dateFrom;
  UniQuery.ParamByName('DateToPlusOne').AsDateTime := dateTo + 1;

  if chosenLocal <> '' then
    UniQuery.ParamByName('LocalName').AsString := chosenLocal;

  UniQuery.Open;
end;


end.

