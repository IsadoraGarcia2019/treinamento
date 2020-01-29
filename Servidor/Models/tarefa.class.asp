<%
Class Tarefa
    '
    ' Propriedades da classe
    '
    Private tarID
    Private tarTitulo
    Private geradorID
    Private tarData
    Private tarStatus
    Private tarDescrica
    '
    ' Métodos Get e Set de cada propriedade
    '
    Public function getId()
        getId = tarID
    End function
    Public sub setId(byval p_id)
        tarID = p_id
    End sub 
    Public function getTitulo()
        getTitulo = tarTitulo
    End function
    Public sub setTitulo(byval p_tarTitulo)
        tarTitulo = p_tarTitulo
    End sub

    Public function getgeradorID()
        getgeradorID = geradorID
    End function
    Public sub setgeradorID(byval p_geradorID)
        geradorID = p_geradorID
    End sub
    Public function getData()
        getData = tarData
    End function
    Public sub setData(byval p_tarData)
        tarData = p_tarData
    End sub
    Public function getStatus()
        getStatus = tarStatus
    End function
    Public sub setStatus(byval p_tarStatus)
        tarStatus = p_tarStatus
    End sub
    Public function getDescricao()
        getDescricao = tarDescricao
    End function
    Public sub setDescricao(byval p_tarDescricao)
        tarDescricao = p_tarDescricao
    End sub

    Public function CadastrarTarefa(cn, ObjTarefa)
        sql = "INSERT INTO [dbo].[tarefa] (tarTitulo, geradorID, tarData, tarStatus, tarDescricao ) VALUES ("
        sql = sql & "'" & ObjTarefa.getTitulo() & "',"
        sql = sql & "'" & ObjTarefa.getgeradorID()& "',"
        sql = sql & "'" & ObjTarefa.getData() & "',"
        sql = sql & "'" & ObjTarefa.getStatus() & "'," 
        sql = sql & "'" & ObjTarefa.getDescricao() & "');"

        cn.Execute(sql)
        Set rs=Server.CreateObject("ADODB.recordset")
        rs.Open "SELECT SCOPE_IDENTITY() As tarID;", cn
        CadastrarTarefa = rs("tarID").value
        rs.close()            
    end function

    Public function AlterarTarefa(cn, ObjTarefa)
        sql = "UPDATE [dbo].[tarefa] SET "
        sql = sql & "tarTitulo = '" & ObjTarefa.getTitulo()  & "',"
        sql = sql & "geradorID = '" & ObjTarefa.getgeradorID() & "',"
        sql = sql & "tarData = '" & ObjTarefa.getData() & "',"
        sql = sql & "tarStatus = '" & ObjTarefa.getStatus() & "',"
        sql = sql & "tarDescricao = '" & ObjTarefa.getDescricao() & "'"
        sql = sql & "WHERE tarID =" & tarID

        cn.Execute(sql)
        Set rs=Server.CreateObject("ADODB.recordset")
        rs.Open "SELECT SCOPE_IDENTITY() As tarID;", cn
        AlterarTarefa = rs("tarID").value
        rs.close()   
    end function

    Public function ExcluirTarefa(cn, tarID)
        sql = "DELETE FROM [dbo].[tarefa] WHERE tarID = " & tarID
        cn.Execute(sql)
        Set rs=Server.CreateObject("ADODB.recordset")
        rs.Open "SELECT SCOPE_IDENTITY() As tarID;", cn
        ExcluirTarefa = rs("tarID").value
        rs.close()   

    end function
    'Buscar geradores
    public function BuscarGeradores(cn)
        '
        ' TODO Lógica para busca de geradores
        '
        sql = "SELECT [usuid],[nome] FROM [treinamento].[dbo].[usuario]"
        cn.Execute(sql)
        Set rs=Server.CreateObject("ADODB.recordset")
        rs.Open sql, cn, &H0001
        set BuscarGeradores = rs
    end function

    'Buscar tarefas'
    Public function BuscarTarefas(cn)
        sqlTarefa = "SELECT [tarID], [tarTitulo], [tarDescricao], [tarData], [tarStatus] FROM [dbo].[tarefa]"
        cn.Execute(sqlTarefa)
        set rs = Server.CreateObject("ADODB.recordset")
        rs.Open sqlTarefa, cn , &H0001
        set BuscarTarefas = rs
    end function

    function validaTarefa(tarTitulo,geradorID,tarData,tarStatus,tarDescricao)

        dim resultado: resultado = true

        if tarTitulo = "" then
            resultado = false
        end if

        if geradorID = "" then
            resultado = false
        end if

        if tarData = "" then
            resultado = false
        end if

        if tarStatus = "" then
            resultado = false
        end if

        if tarDescricao = "" then
            resultado = false
        end if
        validaTarefa=resultado
    end function

end class

%>
