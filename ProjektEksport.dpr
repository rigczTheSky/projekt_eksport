program ProjektEksport;

uses
  Forms,
  Main in 'Main.pas' {ReportForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TReportForm, ReportForm);
  Application.Run;
end.
