unit cCadProduto;

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
    Type
        TProduto = class

    private

        ConexaoDB : TZconnection;
        F_produtoId: Integer;
        F_nome:string;
        F_descricao:string;
        F_valor:double;
        F_quantidade:double;
        F_categoriaId:Integer;

   public

        constructor Create(aConexao:TZconnection);
        destructor Destroy; override;
        function Inserir:Boolean;
        function Atualizar:Boolean;
        function Apagar:Boolean;
        function Selecrionar(id:Integer):Boolean;

   published

        property codigo        :Integer    read F_produtoId     write F_produtoId;
        property nome          :string     read F_nome          write F_nome;
        property descricao     :string     read F_descricao     write F_descricao;
        property valor         :double     read F_valor         write F_valor;
        property quantidade    :double     read F_quantidade    write F_quantidade;
        property catergoriaId  :Integer    read F_categoriaId   write F_categoriaId;

   end;

implementation

  constructor  TProduto.Create(aConexao: TZConnection);
    begin
        ConexaoDB := aConexao;
    end;

   destructor TProduto.Destroy;
     begin
        inherited;
     end;

{$region 'CRUD'}

 function TProduto.Apagar: Boolean;
   var
    Qry : TZQuery;

    begin
      if MessageDlg('Apagar o registro : ' + #13#13 +
              'Codigo : ' + IntToStr(F_produtoId) + #13 +
              'Descrição : ' + F_nome, mtConfirmation, [mbYes, mbNo], 0) = mrNo then
      begin
        Result := false;
        Abort;
      end;

      try
          Result := true;
          Qry := TZQuery.Create(nil);
          Qry.Connection := conexaoDB;
          Qry.SQL.Clear;
          Qry.SQL.Add('DELETE FROM produtos ' +
                       'WHERE produtoId = :produtoId');
          Qry.ParamByName('produtoId').AsInteger := F_produtoId;
              try
                 Qry.ExecSQL;
                Except
                 Result := false;
              End;

      finally
          if Assigned(Qry) then
            begin
              FreeAndNil(Qry);
            end;
      end;
 end;


function TProduto.Atualizar: Boolean;
  var
    Qry : TZQuery;

   begin
       try
            Result := true;
            Qry := TZQuery.Create(nil);
            Qry.Connection := conexaoDB;
            Qry.SQL.Clear;
            Qry.SQL.Add(' UPDATE produtos              ' +
                        ' SET nome    = :nome,         ' +
                        ' descricao   = :descricao,    ' +
                        ' valor       = :valor,        ' +
                        ' quantidade  = :quantidade,   ' +
                        ' categoriaId = :categoriaId   ' +
                        ' WHERE produtoId = :produtoId ');

            Qry.ParamByName('produtoId').AsInteger     := Self.F_produtoId;
            Qry.ParamByName('nome').AsString           := Self.F_nome;
            Qry.ParamByName('descricao').AsString      := Self.F_descricao;
            Qry.ParamByName('valor').AsFloat           := Self.F_valor;
            Qry.ParamByName('quantidade').AsFloat      := Self.F_quantidade;
            Qry.ParamByName('categoriaId').AsInteger   := Self.F_categoriaId;

             try
                  Qry.ExecSQL;
               Except
                  Result := false;
             End;

       finally

            if Assigned(Qry) then
            begin
              FreeAndNil(Qry);
            end;
       end;
   end;


function TProduto.Inserir: Boolean;
 var
   Qry : TZQuery;

 begin
   try
       Result := true;
       Qry := TZQuery.Create(nil);
       Qry.Connection := conexaoDB;
       Qry.SQL.Clear;
       Qry.SQL.Add('INSERT INTO produtos(nome,  ' +
                    '           descricao,      ' +
                    '           valor,          ' +
                    '           quantidade,     ' +
                    '           categoriaId)    ' +
                    'VALUES (   nome = :nome,   ' +
                    '           descricao = :descricao, '+
                    '           valor=:valor,   ' +
                    '           quantidade = :quantidade'+
                    '           categoriaId = :categoriaId)'
                    );

        Qry.ParamByName('nome').AsString           := Self.F_nome;
        Qry.ParamByName('descricao').AsString      := Self.F_descricao;
        Qry.ParamByName('valor').AsFloat           := Self.F_valor;
        Qry.ParamByName('quantidade').AsFloat      := Self.F_quantidade;
        Qry.ParamByName('categoriaId').AsInteger   := Self.F_categoriaId;

          try
             Qry.ExecSQL;
          Except
              Result := false;
          End;

      finally
        if Assigned(Qry) then
          begin
              FreeAndNil(Qry);
          end;
   end;
 end;

 function TProduto.Selecrionar(id: Integer): Boolean;
  var
   Qry : TZQuery;

    begin
       try
         Result := true;
         Qry := TZQuery.Create(nil);
         Qry.Connection := conexaoDB;
         Qry.SQL.Clear;
         Qry.SQL.Add(' SELECT produtoId,  ' +
                     '        nome,       ' +
                     '        descricao,  ' +
                     '        valor,      ' +
                     '        quantidade,  ' +
                     '        categoriaId ' +
                     ' FROM   produtos    ' +
                     ' WHERE              ' +
                     ' produtoId = :produtoId '
                     );
         Qry.ParamByName('produtoId').AsInteger  := id;
             try
                 Qry.Open;
                 Self.F_produtoId   := Qry.FieldByName('produtoId').AsInteger;
                 Self.F_nome        := Qry.FieldByName('nome').AsString;
                 Self.F_descricao   := Qry.FieldByName('descricao').AsString;
                 Self.F_valor       := Qry.FieldByName('valor').AsFloat;
                 Self.F_quantidade  := Qry.FieldByName('quantidade').AsFloat;
                 Self.F_categoriaId := Qry.FieldByName('categoriaId').AsInteger;

                Except
                  Result := false;
             End;

         finally
            if Assigned(Qry) then
              begin
                FreeAndNil(Qry);
            end;
        end;
    end;




{$endregion}
end.
