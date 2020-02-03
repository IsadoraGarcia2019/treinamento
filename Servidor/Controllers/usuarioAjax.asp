<!-- #include file = "../Models/conexao.class.asp" -->
<!-- #include file = "../Models/usuario.class.asp" -->
<%
Response.CodePage = 65001
Response.CharSet = "UTF-8"

dim rs
dim usuario, senha, nome, endereco, cidade, cep, estadoid, usuid
dim PaginaAtual

PaginaAtual =cint(0&Request("PaginaAtual"))
usuid=cint(0&Request("usuid"))
usuario=replace(Request.Form("usuario"), "'", "''") 
senha=replace(Request.Form("senha"), "'", "''") 
nome=replace(Request.Form("nome"), "'", "''") 
endereco=replace(Request.Form("endereco"), "'", "''") 
cidade=replace(Request.Form("cidade"), "'", "''") 
cep=Request.Form("cep") 
estadoid=cint(0&Request.Form("estadoid"))

if (Request("fnTarget") <> "") then
	Execute(Request("fnTarget").item & "()")
end if

function CadastrarUsuario()
	set ObjConexao = new Conexao
	set cn = ObjConexao.AbreConexao()

	set ObjUsuario = new cUsuario
	mensagem = "Usuário não cadastrado"
	if ObjUsuario.validaNome(usuario,senha,nome,endereco,cidade,cep,estadoid) then

		ObjUsuario.setUsuario(usuario)
		ObjUsuario.setSenha(senha)		
		ObjUsuario.setNome(nome)
		ObjUsuario.setEndereco(endereco)
		ObjUsuario.setCidade(cidade)
		ObjUsuario.setCep(cep)
		ObjUsuario.setIdEstado(estadoid)

		r = ObjUsuario.CadastrarUsuario(cn, ObjUsuario)
		mensagem = "Usuario cadastrado com sucesso"	
	end if
	Response.ContentType = "application/json"
	response.write "{"
	response.write 		"""mensagem"": """ & mensagem & """"
	response.write "}"
	ObjConexao.FecharConexao(cn)
end function

function AlterarUsuario()
	set ObjConexao = new Conexao
	set cn = ObjConexao.AbreConexao()
	set ObjUsuario = new cUsuario

	mensagem = "Não foi possivel alterar esse usuário"

	if usuid > 0 then
		ObjUsuario.setId(usuid)
		ObjUsuario.setUsuario(usuario)
		ObjUsuario.setSenha(senha)		
		ObjUsuario.setNome(nome)
		ObjUsuario.setEndereco(endereco)
		ObjUsuario.setCidade(cidade)
		ObjUsuario.setCep(cep)
		ObjUsuario.setIdEstado(estadoid)

		r = ObjUsuario.AlterarUsuario(cn, ObjUsuario)	
		mensagem = "Usuario alterado com sucesso"	

		Response.ContentType = "application/json"
		response.write "{"
		response.write 		"""mensagem"": """ & mensagem & """"
		response.write "}"
		ObjConexao.FecharConexao(cn)
	end if
end function      

function ExcluirUsuario() 
	set ObjConexao = new Conexao
	set cn = ObjConexao.AbreConexao()

	set rs=Server.CreateObject("ADODB.recordset")
	rs.Open "SELECT * FROM tarefa WHERE geradorID = "& usuid, cn, &H0001

	if rs.eof then
		set ObjUsuario = new cUsuario
		r  = ObjUsuario.ExcluirUsuario(cn, usuid)
		
		mensagem = "Usuario excluido com sucesso"
	else
	m = rs.RecordCount
	mensagem  = "Nao foi possivel excluir esse usuario pois ele e gerador de "& m &" tarefa(s)!!"
end if	
Response.ContentType = "application/json"
response.write "{"
response.write 		"""mensagem"": """ & mensagem & """"
response.write "}"
ObjConexao.FecharConexao(cn)
end function

function carregarUsuario()
	if usuid > 0 then 

		set ObjConexao = new Conexao
		set cn = ObjConexao.AbreConexao()
		set ObjUsuario = new cUsuario
		set rs = ObjUsuario.BuscarUsuarioPorID(cn,usuid)

		if not rs.eof then
			Response.ContentType = "application/json"
			response.write "{"
			response.write 		"""usuario"": """ & rs("usuario").value & """"
			response.write 		",""senha"": """ & rs("senha").value & """"
			response.write 		",""nome"": """ & rs("nome").value & """"
			response.write 		",""endereco"": """ & rs("endereco").value & """"
			response.write 		",""cidade"": """ & rs("cidade").value & """"
			response.write 		",""cep"": """ & rs("cep").value & """"
			response.write 		",""estadoid"": """ & rs("estadoid").value & """"
			response.write "}"
		end if
	End if	
	ObjConexao.FecharConexao(cn)
end function

function BuscarUsuarios()
	' STOP
	dim registrosPorPagina : registrosPorPagina = 30
	set ObjConexao = new Conexao
	set cn = ObjConexao.AbreConexao()
	set usuarios = new cUsuario
	set rs = usuarios.BuscarUsuarios(cn)
	if not rs.eof then
		rs.PageSize = registrosPorPagina
		Dim numeroTotalPaginas : numeroTotalPaginas = rs.PageCount
		Dim numeroTotalRegistros : numeroTotalRegistros = rs.RecordCount
		If PaginaAtual < 1 Then
			PaginaAtual = 1      
		End If
		if PaginaAtual > numeroTotalPaginas then 
			PaginaAtual = numeroTotalPaginas
		end if
		rs.AbsolutePage = PaginaAtual
		fimPagina = registrosPorPagina * PaginaAtual
		Response.ContentType = "application/json"
		Response.Write "{"
		Response.Write """RegistrosPorPagina"":""" & registrosPorPagina & ""","
		Response.Write """PaginaAtual"":""" & PaginaAtual & ""","
		Response.Write """TotalRegistros"":""" & numeroTotalRegistros & ""","
		Response.Write """TotalPaginas"":""" & numeroTotalPaginas & ""","
		Response.Write """Usuarios"": ["
		Do While not rs.eof and (rs.AbsolutePosition <= fimPagina)
			response.write "{"
			response.write 		"""nome"": """ & rs("nome").value & """"
			response.write 		",""usuario"": """ & rs("usuario").value & """"
			response.write 		",""endereco"": """ & rs("endereco").value & """"
			response.write 		",""cidade"": """ & rs("cidade").value & """"
			response.write 		",""cep"": """ & rs("cep").value & """"
			response.write 		",""usuid"": """ & rs("usuid").value & """"
			response.write "}"
			rs.moveNext()
			if not rs.eof and rs.AbsolutePosition <= fimPagina then
				response.write ","
			end if
		loop
	end if
	response.write "]"
	response.write "}"
	ObjConexao.FecharConexao(cn)
end function
%>