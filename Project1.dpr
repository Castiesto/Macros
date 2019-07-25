program Project1;

uses
  Forms,
  Macros in 'Macros.pas' {Form1},
  Vcl.Themes,
  Vcl.Styles,
  Confi in 'Confi.pas' {Form2},
  Winapi.Hooks in 'Winapi.Hooks.pas';

{$R *.res}

begin
  Application.Initialize;
  TStyleManager.TrySetStyle('Windows10 Dark');
  Application.Title := 'Macr';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
