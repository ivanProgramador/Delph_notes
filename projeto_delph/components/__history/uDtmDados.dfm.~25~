object dtmDados: TdtmDados
  Height = 396
  Width = 640
  object conexao: TZConnection
    ControlsCodePage = cCP_UTF16
    Catalog = ''
    Properties.Strings = (
      'RawStringEncoding=DB_CP')
    Connected = True
    DisableSavepoints = False
    HostName = ''
    Port = 0
    Database = 
      'Provider=SQLOLEDB.1;Password=Aa123456;Persist Security Info=True' +
      ';User ID=sa;Initial Catalog=vendas;Data Source=127.0.0.1'
    User = ''
    Password = ''
    Protocol = 'ado'
    Left = 48
    Top = 24
  end
  object QryScriptCategorias: TZQuery
    Connection = conexao
    SQL.Strings = (
      'IF OBJECT_ID('#39'categorias'#39') IS NULL'
      'BEGIN'
      '    CREATE TABLE categorias('
      '        categoriaId int IDENTITY(1,1) NOT NULL,'
      '        descricao varchar(30) NULL,'
      '        PRIMARY KEY (categoriaId)'
      '    )'
      'END')
    Params = <>
    Left = 136
    Top = 24
  end
  object QryScriptClientes: TZQuery
    Connection = conexao
    SQL.Strings = (
      'IF OBJECT_ID ('#39'clientes'#39') IS NULL'
      'BEGIN'
      '    CREATE TABLE clientes('
      '        clienteId int IDENTITY(1,1) NOT NULL,'
      '        nome varchar(60) NULL,'
      '        endereco varchar(60) null,'
      '        cidade varchar(50) null,'
      '        bairro varchar(40) null,'
      '        estado varchar(2) null,'
      '        cep varchar(10) null,'
      '        telefone varchar(14) null,'
      '        email varchar(100) null,'
      '        dataNascimento datetime null'
      '        PRIMARY KEY (clienteId)'
      '    )'
      'END')
    Params = <>
    Left = 256
    Top = 24
  end
  object QryScriptProdutos: TZQuery
    Connection = conexao
    SQL.Strings = (
      'IF OBJECT_ID ('#39'produtos'#39') IS NULL'
      'BEGIN'
      '    CREATE TABLE produtos('
      '        produtoId int IDENTITY(1,1) NOT NULL,'
      '        nome varchar(60) NULL,'
      '        descricao varchar(255) null,'
      '        valor decimal(18,5) default 0.00000 null,'
      '        quantidade decimal(18,5) default 0.00000 null,'
      '        categoriaId int null,'
      '        PRIMARY KEY (produtoId),'
      '        CONSTRAINT FK_ProdutosCategorias'
      
        '        FOREIGN KEY (categoriaId) references categorias(categori' +
        'aId)'
      '    )'
      'END')
    Params = <>
    Left = 360
    Top = 24
  end
  object QryScriptVendas: TZQuery
    Connection = conexao
    SQL.Strings = (
      'IF OBJECT_ID ('#39'vendas'#39') IS NULL'
      'BEGIN'
      '    Create table vendas ('
      '        vendaId int identity(1,1) not null,'
      '        clienteId int not null,'
      '        dataVenda datetime default getdate(),'
      '        totalVenda decimal(18,5) default 0.00000,'
      ''
      '        PRIMARY KEY (vendaId),'
      '        CONSTRAINT FK_VendasClientes FOREIGN KEY (clienteId)'
      '        REFERENCES clientes(clienteId)'
      '    )'
      'END;')
    Params = <>
    Left = 464
    Top = 24
  end
  object QryScriptItensVendas: TZQuery
    Connection = conexao
    SQL.Strings = (
      'IF OBJECT_ID ('#39'vendasItens'#39') IS NULL'
      'BEGIN'
      '    Create table vendasItens ('
      '        vendaId int not null,'
      '        produtoId int not null,'
      '        valorUnitario decimal (18,5) default 0.00000,'
      '        quantidade decimal (18,5) default 0.00000,'
      '        totalProduto decimal (18,5) default 0.00000,'
      '        PRIMARY KEY (vendaId,produtoId),'
      
        '        CONSTRAINT FK_VendasItensProdutos FOREIGN KEY (produtoId' +
        ')'
      '        REFERENCES produtos(produtoId)'
      '    )'
      'END')
    Params = <>
    Left = 56
    Top = 104
  end
end
