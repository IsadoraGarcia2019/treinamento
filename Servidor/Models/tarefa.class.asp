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
        getDescricao = descricao
    End function
    Public sub setDescricao(byval p_tarDescricao)
        descricao = p_tarDescricao
    End sub

    Public function CadastrarTarefa(cn, ObjTarefa)
        stop
        cn.execute("INSERT INTO tarefa (tarTitulo, geradorID, tarData, tarStatus, tarDescricao ) VALUES ('" & ObjTarefa.getTitulo() & "','" & ObjTarefa.getgeradorID()& "','" & ObjTarefa.getData() & "','" & ObjTarefa.getStatus() & "','" & ObjTarefa.getDescricao() & "')")

        set rs = cn.execute("select TOP 1 tarID FROM tarefa ORDER BY tarID DESC")

        if not rs.eof then
            tarID = rs("tarID")
        end if

        set CadastrarTarefa = rs
    end function

    'Buscar geradores
    public function BuscarGeradores(cn)
        '
        ' TODO Lógica para busca de geradores
        '
        sql = "SELECT [usuid],[nome] FROM [treinamento].[dbo].[usuario]"
        Set rs=Server.CreateObject("ADODB.recordset")
        rs.Open sql, cn, &H0001
        set BuscarGeradores = rs
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