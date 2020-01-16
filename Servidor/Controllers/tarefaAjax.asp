<!-- #include file = "../Servidor/Models/conexao.class.asp" -->
<!-- #include file = "../Cliente/validacaoTarefa.asp" -->
<%
Response.CodePage = 65001
Response.CharSet = "UTF-8"

dim tarTitulo
dim geradorID
dim tarData, tarData2
dim tarStatus
dim tarDescricao
dim rs

tarID=cint(0&Request("tarID"))
tarTitulo= Replace(Request.Form("tarTitulo"), "'","''")
geradorID=cint(0 & replace(Request.Form("geradorID"), "'", "''"))
tarDescricao=cstr("" & replace(Request.Form("tarDescricao"), "'", "''"))
tarStatus=cstr("" & replace(Request.Form("tarStatus"), "'", "''"))
tarData = Request.Form("tarData")

if (Request("fnTarget") <> "") then
	Execute(Request("fnTarget").item & "()")
end if

function CadastrarTarefa()
	tarData = Replace(tarData ,"T", " ")
	tarData = FormatDateTime(tarData)

	if validaTarefa(tarTitulo,geradorID,tarData,tarStatus,tarDescricao) then
		cn.execute("INSERT INTO tarefa (tarTitulo, geradorID, tarData, tarStatus, tarDescricao ) VALUES ('" & tarTitulo & "','" & geradorID & "','" & tarData & "','" & tarStatus & "','" & tarDescricao & "')")

		set rs = cn.execute("select TOP 1 tarID FROM tarefa ORDER BY tarID DESC")
		if not rs.eof then
			tarID = rs("tarID")
		end if
	end if
end function

function AlterarTarefa()
	if tarID <> 0 then

		set rs = cn.execute("UPDATE tarefa SET tarTitulo = '" & tarTitulo & "', geradorID = '" & geradorID & "', tarData = '" & tarData & "',  tarStatus = '" & tarStatus & "', tarDescricao = '" & tarDescricao & "' WHERE tarID =" & tarID)
	end if
end function

function ExcluirTarefa()
	set rs = cn.execute("DELETE FROM tarefa WHERE tarID = " & tarID)
end function

function carregarTarefa()

	if tarID > 0 then 
		
		set rs = cn.Execute("SELECT * FROM tarefa WHERE tarID = "&tarID)

		if not rs.eof then
			tarData = FormatDateTime(rs("tarData"))
			novaData = split(tarData," ")
			Data = split(novaData(0),"/")
			Data2 = Data(2) & "-" & Data(1) & "-" & Data(0)
			novavar = Data2 & "T" & NovaData(1)
			
			Response.ContentType = "application/json"
			response.write "{"
			response.write 		"""tarTitulo"": """ & rs("tarTitulo").value & """"
			response.write 		",""geradorID"": """ & rs("geradorID").value & """"
			response.write 		",""tarData"": """ & novavar & """"
			response.write 		",""tarStatus"": """ & rs("tarStatus").value & """"
			response.write 		",""tarDescricao"": """ & rs("tarDescricao").value & """"
			response.write "}"
		end if
	end if
end function

%>