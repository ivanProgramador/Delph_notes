unit cCadCategoria;

interface

uses
  System.Classes,
  Vcl.Controls,
  Vcl.ExtCtrls,
  Vcl.Dialogs,
  ZAbstractConnection,
  ZConnection,
  ZAbstractRODataset,
  ZAbstractDataset,
  ZDataset,
  System.SysUtils;


type
  TCategoria = class

  private

    conexao : TZConnection;
    {
      aqui estou criando 2 prrpridades proivadas basedas na tabela de categorias
      a letra F significa Field entãoa diretiva qua estou usando é "F_nomedocampo"
      vou assumir esse padrão, os tipos também são iguais.
    }

    F_categoriaId: integer;
    F_descricao:string;
    function getCodigo: Integer;
    function getDescricao: String;
    procedure setCodigo(const Value: Integer);
    procedure setgetDescricao(const Value: String);

  public
    //injetando a conexão no construtor da classe
    constructor  Create(aConexao:TZConnection);
    destructor Destroy; override;
    function Inserir: Boolean;
    function Atualizar: Boolean;
    function Apagar:Boolean;
    function Selecionar(id:Integer): Boolean;


  published
    {
      As "property" são uma forma publica de acessar os atributos da classe
      o atributo  "F_categoriaId" esta sendo representado de forma publica como
      " codigo " então a "property" me fornece 2 metodos de encpsuamento pra manipular
      ele

      1 - read = getCodigo
      2 - write =  setCodigo

      então se eu precisar manipular esses dados ue preciso usar esses metodos
      isso mantem a estrutura da classe segura


    }
      property codigo:Integer read getCodigo write setCodigo;
      property descricao:String read getDescricao write setgetDescricao;

  end;


implementation

{ $region 'CRUD' }

function TCategoria.Apagar: Boolean;
  var
    Qry: TZQuery;

  begin
      if MessageDlg('Apagar o registro ' + #13+#13 +
                    'Código: ' + intToStr(F_categoriaId) + #13
                    +'Descrição : ' + F_descricao,mtConfirmation,[mbYes,mbNo],0)=mrNo then
         begin
           Result := False;
           abort;
         end;
      try
         Result := True;
         Qry := TZQuery.Create(nil);
         Qry.Connection := conexao;
         Qry.SQL.Clear;
         Qry.SQL.Add('DELETE FROM dbo.categorias ' +
                    'WHERE categoriaId = :categoriaId ');
         Qry.ParamByName('categoriaId').AsInteger := Self.F_categoriaId;

         try
            Qry.ExecSQL;
           Except
            Result := False;
         end;

      finally
         if Assigned(Qry) then
          begin
            FreeAndNil(Qry);
          end;
      end;

  end;




function TCategoria.Atualizar: Boolean;
 var
    Qry: TZQuery;

  begin
    try
         Result := True;
         Qry := TZQuery.Create(nil);
         Qry.Connection := conexao;
         Qry.SQL.Clear;
         Qry.SQL.Add(' UPDATE dbo.categorias '+
                     ' SET descricao = :descricao '+
                     ' WHERE categoriaId = :categoriaId ');
         Qry.ParamByName('categoriaId').AsInteger := Self.F_categoriaId;
         Qry.ParamByName('descricao').AsString := Self.F_descricao;

       try
         Qry.ExecSQL;
          Except
         Result := False;
       end;

    finally
       if Assigned(Qry) then
          begin
            FreeAndNil(Qry);
          end;

    end;

end;



function TCategoria.Inserir: Boolean;
  var
    Qry: TZQuery;

  begin
     try
        Result := True;
        Qry := TZQuery.Create(nil);
        Qry.Connection := conexao;
        Qry.SQL.Clear;
        Qry.SQL.Add('INSERT INTO dbo.Categorias (descricao) VALUES (:descricao)');
        Qry.ParamByName('descricao').Value := Self.F_descricao;

        try
          Qry.ExecSQL;
         Except
           Result := False;
        end;


       finally
        if Assigned(Qry) then
          begin
            FreeAndNil(Qry);
          end;

     end;

  end;

function TCategoria.Selecionar(id:Integer): Boolean;

 var
   Qry:TZQuery;

  begin
     try
        Result := True;
        Qry := TZQuery.Create(nil);
        Qry.Connection := conexao;
        Qry.SQL.Clear;
        Qry.SQL.Add('SELECT categoriaId,' +
                    ' descricao  '        +
                    ' FROM dbo.categorias '+
                    ' WHERE categoriaId = :categoriaId');
        Qry.ParamByName('categoriaId').Value := id;

        try
          Qry.Open;
          Self.F_categoriaId := Qry.FieldByName('categoriaId').AsInteger;
          Self.F_descricao := Qry.FieldByName('descricao').AsString;

         Except
           Result := False;
        end;

     finally
        if Assigned(Qry) then
          begin
            FreeAndNil(Qry);
          end;
     end;



  end;

{ $endregion }







//injetando a conexão no metodo inplmenetado de criação

constructor TCategoria.Create(aConexao:TZConnection);
begin
   conexao := aConexao;
end;

destructor TCategoria.Destroy;
begin

  inherited;
end;



{ metodos de encapsulamento }

//leitura
function TCategoria.getCodigo: Integer;
   begin
      //retornando o id pelo result
      result := Self.F_categoriaId;
   end;

function TCategoria.getDescricao: String;
   begin
      result := Self.F_descricao;
   end;




//escrita


//essa procedure vai receber um valor inteiro que seria um valor comapivel com o
//atributo  id

procedure TCategoria.setCodigo(const Value: Integer);
   begin
      //como é uma funcção de escrita eu associo um valor ao atributo
      Self.F_categoriaId := Value;
   end;


 //essa procedure vai receber um valor string que seria um valor compativel com o
//atributo  descrição

procedure TCategoria.setgetDescricao(const Value: String);
   begin
      Self.F_descricao := Value;
   end;

end.
