<%
Class cUsuario
    '
    ' Propriedades da classe
    '
    Private Id
    Private Usuario
    Private Senha
    Private Nome
    Private Endereco
    Private Cidade
    Private Cep
    Private estadoid
    '
    ' Métodos Get e Set de cada propriedade
    '
    Public function getId()
        getId = Id
    End function
    Public sub setId(byval p_id)
        Id = p_id
    End sub	
    Public function getUsuario()
        getUsuario = Usuario
    End function
    Public sub setUsuario(byval p_usuario)
        Usuario = p_usuario
    End sub

    Public function getSenha()
        getSenha = Senha
    End function
    Public sub setSenha(byval p_senha)
        Senha = p_senha
    End sub
    Public function getNome()
        getNome = Nome
    End function
    Public sub setNome(byval p_nome)
        Nome = p_nome
    End sub

    Public function getEndereco()
        getEndereco = Endereco
    End function
    Public sub setEndereco(byval p_endereco)
        Endereco = p_endereco
    End sub
    Public function getCidade()
        getCidade = Cidade
    End function
    Public sub setCidade(byval p_cidade)
        Cidade = p_cidade
    End sub
    Public function getCep()
        getCep = Cep
    End function
    Public sub setCep(byval p_cep)
        Cep = p_cep
    End sub
    
    Public function getIdEstado()
        getIdEstado = estadoid
    End function
    Public sub setIdEstado(byval p_IdEstado)
        estadoid = p_IdEstado
    End sub
    '
    ' Métodos complementares
    '

    'Inserção de usuários
    public function CadastrarUsuario(cn, ObjUsuario)
        cn.execute("INSERT INTO usuario (usuario,senha,nome,endereco,cidade,cep,estadoid) VALUES ('" & objUsuario.getUsuario() & "','" & objUsuario.getSenha() & "','" & objUsuario.getNome() & "','" & objUsuario.getEndereco() & "','" & objUsuario.getCidade() & "','" & objUsuario.getCep() & "','" & objUsuario.getIdEstado() & "')")

        set rs = cn.execute("select TOP 1 usuid FROM usuario ORDER BY usuid DESC")   

        if not rs.eof then
            usuid = rs("usuid")
        end if
        set CadastrarUsuario  = rs
    end function

    'Update de usuários
    public function AlterarUsuario(cn, ObjUsuario)
        '
        ' TODO Lógica de update de usuários
        '
        set rs = cn.execute("UPDATE usuario SET usuario = '" & objUsuario.getUsuario() & "', senha = '" & objUsuario.getSenha() & "', nome = '" & objUsuario.getNome() & "', endereco = '" & objUsuario.getEndereco() & "', cidade = '" & objUsuario.getCidade() & "', cep = '" & objUsuario.getCep() & "', estadoid = '" & objUsuario.getIdEstado() & "' WHERE usuid =" & usuid)

        set AlterarUsuario = rs
    end function

    public function ExcluirUsuario(cn, usuid)

        set rs = cn.execute("DELETE FROM usuario WHERE usuid = " & usuid)

        set ExcluirUsuario = rs
    end function
    'Buscar usuários
    public function BuscarUsuarios(cn)
        '
        ' TODO Lógica para busca de usuários
        '
        sql = "SELECT [nome],[usuario],[endereco],[cidade],[cep],[usuid] FROM [treinamento].[dbo].[usuario]"
        Set rs=Server.CreateObject("ADODB.recordset")
        rs.Open sql, cn, &H0001
        set BuscarUsuarios = rs
    end function 

    'Buscar estados
    public function BuscarEstados(cn)
        '
        ' TODO Lógica para busca de estados
        '
        sql = "SELECT [estadoid],[nome] FROM [treinamento].[dbo].[estado]"
        Set rs=Server.CreateObject("ADODB.recordset")
        rs.Open sql, cn, &H0001
        set BuscarEstados = rs
    end function

    'Buscar um usuário
    public function BuscarUsuarioPorNomeSenha(cn,usuario,senha)
        '
        ' TODO Lógica para busca de usuários
        '
        sql = "SELECT * FROM [treinamento].[dbo].[usuario] where usuario='" & usuario & "' and senha='" & senha & "'" 
        Set rs=Server.CreateObject("ADODB.recordset")
        rs.Open sql, cn, &H0001
        set ObjRetorno = new cUsuario
        ObjRetorno.setUsuario(rs("usuario"))
        ObjRetorno.setSenha(rs("senha"))
        ObjRetorno.setId(rs("usuid"))
        set BuscarUsuarioPorNomeSenha = ObjRetorno
    end function

    'Buscar um usuário por id
    public function BuscarUsuarioPorID(cn,usuid)
        '
        ' TODO Lógica para busca de usuários
        '
        sql = "SELECT * FROM [treinamento].[dbo].[usuario] where usuid= '" & usuid & "' " 
        Set rs=Server.CreateObject("ADODB.recordset")
        rs.Open sql, cn, &H0001
        set BuscarUsuarioPorID = rs              
        
    end function
    function validaNome(usuario,senha,nome,endereco,cidade,cep,estadoid)

        dim resultado: resultado = true

        if usuario = "" then
            resultado = false
        end if

        if senha = "" then
            resultado = false
        end if

        if nome = "" then
            resultado = false
        end if

        if endereco = "" then
            resultado = false
        end if

        if cidade = "" then
            resultado = false
        end if
        if cep = "" then
            resultado = false
        end if

        if estadoid = "" then
            resultado = false
        end if
        validaNome=resultado
    end function
End Class
%>