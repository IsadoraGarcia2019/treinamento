<!--#include file="../Models/Conexao.class.asp"-->
<!--#include file="../Models/Estado.class.asp"-->
<%
Response.CodePage = 65001
Response.CharSet = "UTF-8"

'Seleção das funções a serem realizadas
'
If Request("fnTarget")<>"" Then
	Execute(Request("fnTarget"))
End if

'
' Função para buscar os estados cadastrados no banco e retornar em formato Json Response Write
'
Function BuscarEstados()
	set ObjConexao = new Conexao
	set cn = ObjConexao.AbreConexao()
	set estados = new Estado
	set rs = estados.BuscarEstados(cn)
	if not rs.eof then
		Response.ContentType = "application/json"
		response.write "{"
		response.write """Estados"":["
		Do while not rs.eof 
			response.write "{"
			response.write 		"""estadoid"": """ & rs("estadoid").value & """"
			response.write 		",""nome"": """ & rs("nome").value & """"
			response.write "}"
			if rs.AbsolutePosition < rs.RecordCount then
				response.write ","
			end if
			rs.moveNext()
		loop
	end if
	response.write "]"
	response.write "}"
	ObjConexao.FecharConexao(cn)
end function
'
' Função para buscar os estados cadastrados no banco e retornar em formato Json Chilkat
'
Function BuscarEstadosJson()
	set ObjConexao = new Conexao
	set cn = ObjConexao.AbreConexao()
	set ObjEstado = new Estado
	set rs = ObjEstado.BuscarEstados(cn)
	If Not rs.Eof Then
		Set json = Server.CreateObject("Chilkat_9_5_0.JsonObject")
		success = json.AddArrayAt(-1,"Registros")
		Set aRegistros = json.ArrayAt(json.Size - 1)  
		index = -1
		Do While Not (rs.Eof OR rs.AbsolutePage <> PaginaPesquisa)
			success = aRegistros.AddObjectAt(-1)
			Set estado = aRegistros.ObjectAt(aRegistros.Size - 1)
			success = estado.AddIntAt(-1,"estadoid",rs("estadoid"))
			success = estado.AddStringAt(-1,"nome",rs("nome"))
			rs.MoveNext
		Loop
	End If
	rs.Close()
	ObjConexao.FecharConexao(cn)
	json.EmitCompact = 0
	Response.Write json.Emit()
End Function
%>