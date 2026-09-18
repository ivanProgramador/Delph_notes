program Delph_notes;

uses
  Vcl.Forms,
  uTiposDados in 'Tipos_de_dados\uTiposDados.pas' {formTelaDados};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TformTelaDados, formTelaDados);
  Application.Run;
end.
