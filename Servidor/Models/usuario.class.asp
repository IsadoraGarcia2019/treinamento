<%
Class cUsuario
    '
    ' Propriedades da classe
    '
    Private usuid
    Private usuario
    Private senha
    Private nome
    Private endereco
    Private cidade
    Private cep
    Private estadoid
    '
    ' Métodos Get e Set de cada propriedade
    '
    Public function getId()
        getId = usuid
    End function
    Public sub setId(byval p_id)
        usuid = p_id
    End sub	
    Public function getUsuario()
        getUsuario = usuario
    End function
    Public sub setUsuario(byval p_usuario)
        usuario = p_usuario
    End sub

    Public function getSenha()
        getSenha = senha
    End function
    Public sub setSenha(byval p_senha)
        senha = p_senha
    End sub
    Public function getNome()
        getNome = nome
    End function
    Public sub setNome(byval p_nome)
        nome = p_nome
    End sub

    Public function getEndereco()
        getEndereco = endereco
    End function
    Public sub setEndereco(byval p_endereco)
        endereco = p_endereco
    End sub
    Public function getCidade()
        getCidade = cidade
    End function
    Public sub setCidade(byval p_cidade)
        cidade = p_cidade
    End sub
    Public function getCep()
        getCep = cep
    End function
    Public sub setCep(byval p_cep)
        cep = p_cep
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
        sql = "INSERT INTO [dbo].[usuario] (usuario,senha,nome,endereco,cidade,cep,estadoid) VALUES (" 
        sql = sql & "'" & ObjUsuario.getUsuario() & "',"
        sql = sql & "'" & ObjUsuario.getSenha() & "'," 
        sql = sql & "'" & ObjUsuario.getNome() & "',"
        sql = sql & "'" & ObjUsuario.getEndereco() & "',"
        sql = sql & "'" & ObjUsuario.getCidade() & "',"
        sql = sql & "'" & ObjUsuario.getCep() & "'," 
        sql = sql & "'" & ObjUsuario.getIdEstado() & "');"

        cn.Execute(sql)
        Set rs=Server.CreateObject("ADODB.recordset")
        rs.Open "SELECT SCOPE_IDENTITY() As usuid;", cn
        CadastrarUsuario = rs("usuid").value
        rs.close()
    end function

    'Update de usuários
    public function AlterarUsuario(cn, ObjUsuario)
        '
        ' TODO Lógica de update de usuários
        '
        stop
        sql = "UPDATE [dbo].[usuario] SET "
        sql = sql & "'" & ObjUsuario.getUsuario() & "', "
        sql = sql & "'" & ObjUsuario.getSenha() & "', "
        sql = sql & "'" & ObjUsuario.getNome() & "', "
        sql = sql & "'" & ObjUsuario.getEndereco() & "', "
        sql = sql & "'" & ObjUsuario.getCidade() & "', "
        sql = sql & "'" & ObjUsuario.getCep() & "', "
        sql = sql & "'" & ObjUsuario.getIdEstado() & "' "
        sql = sql & "WHERE usuid = " & ObjUsuario.getId()

        cn.Execute(sql)
        Set rs=Server.CreateObject("ADODB.recordset")
        rs.Open "SELECT SCOPE_IDENTITY() As usuid;", cn
        CadastrarUsuario = rs("usuid").value
        rs.close()
    end function

    public function ExcluirUsuario(cn, usuid)

        sql = "DELETE FROM [dbo.[usuario] "
        sql = "WHERE usuid = " & ObjUsuario.usuid

        cn.Execute(sql)
        Set rs=Server.CreateObject("ADODB.recordset")
        rs.Open "SELECT SCOPE_IDENTITY() As usuid;", cn
        CadastrarUsuario = rs("usuid").value
        rs.close()
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
        sql = "SELECT * FROM [treinamento].[dbo].[usuario] where usuario='" & ObjUsuario.getUsuario() & "' and senha='" & ObjUsuario.getSenha() & "'" 
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