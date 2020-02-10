<!--#include file="../Models/Conexao.class.asp"-->
<%
set ObjConexao = new Conexao
set cn = ObjConexao.AbreConexao()

tarID=Request("tarID")
tarTitulo=Replace(Request("titulo"), "'", "''")
tarStatus=Request("status")


dim tarStatus, tarID, tarTitulo

if (Request("fnTarget") <> "") then
	Execute(Request("fnTarget").item & "()")
end if

function atualizaStatus()

	sql = ("UPDATE tarefa SET tarStatus = '" &tarStatus& "' WHERE tarID = " &tarID)
	cn.execute sql, ra
	Response.ContentType = "application/json"
	response.write "{"
	response.write 		"""resposta"": """ & ra & """"
	response.write "}"

end function

function atualizaTitulo()
	
	sql = ("UPDATE tarefa SET tarTitulo = '" & tarTitulo & "' WHERE tarID = " &tarID)
	cn.execute sql, ra

	Response.ContentType = "application/json"
	response.write "{"
	response.write 		"""resposta"": """ & ra & """"
	response.write "}"
end function
%>