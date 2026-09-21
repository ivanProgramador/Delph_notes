program vendas;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uDtmDados in 'components\uDtmDados.pas' {DataModule1: TDataModule},
  uTelaHeranca in 'Heranca\uTelaHeranca.pas' {frmTelaHeranca};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TfrmTelaHeranca, frmTelaHeranca);
  Application.Run;
end.
