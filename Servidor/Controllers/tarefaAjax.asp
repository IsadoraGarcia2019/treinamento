<!-- #include file = "../Models/conexao.class.asp" -->
<!-- #include file = "../Models/tarefa.class.asp" -->
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
	set ObjConexao = new Conexao
	set cn = ObjConexao.AbreConexao()

	set ObjTarefa = new Tarefa

	tarData = Replace(tarData ,"T", " ")
	tarData = FormatDateTime(tarData)

	if ObjTarefa.validaTarefa(tarTitulo,geradorID,tarData,tarStatus,tarDescricao) then
		ObjTarefa.setTitulo(tarTitulo)
		ObjTarefa.setgeradorID(geradorID)
		ObjTarefa.setData(tarData)
		ObjTarefa.setStatus(tarStatus)
		ObjTarefa.setDescricao(tarDescricao)
		
		r = ObjTarefa.CadastrarTarefa(cn, ObjTarefa)
		mensagem = "Tarefa cadastrada com sucesso!"
	end if
	' rs.Close()
	cn.close
end function

function AlterarTarefa()
	set ObjConexao = new Conexao
	set cn = ObjConexao.AbreConexao()
	set ObjTarefa = new Tarefa
	
	if tarID > 0 then

		ObjTarefa.setId(tarID)
		ObjTarefa.setTitulo(tarTitulo)
		ObjTarefa.setgeradorID(geradorID)
		ObjTarefa.setData(tarData)
		ObjTarefa.setStatus(tarStatus)
		ObjTarefa.setDescricao(tarDescricao)

		r = ObjTarefa.AlterarTarefa(cn, ObjTarefa)
		mensagem = "Tarefa alterada com sucesso!"
		' rs.Close()
		cn.close
	end if
end function

function ExcluirTarefa()
	set ObjConexao = new Conexao
	set cn = ObjConexao.AbreConexao()
	set ObjTarefa = new Tarefa

	r = ObjTarefa.ExcluirTarefa(cn, tarID)
	mensagem = "Tarefa excluida com sucesso"
end function

function carregarTarefa()
	set ObjConexao = new Conexao
	set cn = ObjConexao.AbreConexao()

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

function BuscarGeradores()
	set ObjConexao = new Conexao
	set cn = ObjConexao.AbreConexao()
	set gerador = new Tarefa
	set rs = gerador.BuscarGeradores(cn)
	if not rs.eof then
		Response.ContentType = "application/json"
		response.write "{"
		response.write """Geradores"":["
		Do while not rs.eof 
			response.write "{"
			response.write 		"""usuid"": """ & rs("usuid").value & """"
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
	' rs.Close()
	cn.close
end function

%>