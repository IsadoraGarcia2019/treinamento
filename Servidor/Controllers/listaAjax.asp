<!-- #include file = "../Servidor/Models/conexao.class.asp" -->
<%
set ObjConexao = new Conexao
set cn = ObjConexao.AbreConexao()

dim tarStatus, tarID, tarTitulo

if (Request("fnTarget") <> "") then
	Execute(Request("fnTarget") & "()")
end if

function atualizaStatus()

	tarID=Request("id")
	tarStatus=Request("status")

	sql = ("UPDATE tarefa SET tarStatus = '" &tarStatus& "' WHERE tarID = " &tarID)
	cn.execute(sql)

	response.write("true")
end function

function atualizaTitulo()

	tarID=Request("id")
	tarTitulo=Request("titulo")

	sql = ("UPDATE tarefa SET tarTitulo = '" & tarTitulo & "' WHERE tarID = " &tarID)
	cn.execute(sql)

	response.write("true")
end function
%>