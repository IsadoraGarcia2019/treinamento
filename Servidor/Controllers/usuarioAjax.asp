<!-- #include file = "../Models/conexao.class.asp" -->
<!-- #include file = "../Models/usuario.class.asp" -->
<%
Response.CodePage = 65001
Response.CharSet = "UTF-8"

dim rs
dim usuario, senha, nome, endereco, cidade, cep, estadoid, usuid

usuid=cint(0&Request("usuid"))
usuario=replace(Request.Form("usuario"), "'", "''") 
senha=replace(Request.Form("senha"), "'", "''") 
nome=replace(Request.Form("nome"), "'", "''") 
endereco=replace(Request.Form("endereco"), "'", "''") 
cidade=replace(Request.Form("cidade"), "'", "''") 
cep=Request.Form("cep") 
estadoid=Request.Form("estadoid")

if (Request("fnTarget") <> "") then
	Execute(Request("fnTarget").item & "()")
end if

function CadastrarUsuario(usuario,senha,nome,endereco,cidade,cep,estadoid) 

	if validaNome(usuario,senha,nome,endereco,cidade,cep,estadoid) then
		stop
		set ObjUsuario = new usuario
		set ObjUsuario.setUsuario  = usuario		
		set ObjUsuario.setSenha  = senha		
		set ObjUsuario.setNome  = nome		
		set ObjUsuario.setEndereco  = endereco
		set ObjUsuario.setCidade  = cidade
		set ObjUsuario.setCep  = cep
		set ObjUsuario.setEstadoid  = estadoid

	end if

end function  

function AlterarUsuario()
	if usuid <> 0 then

		set rs = cn.execute("UPDATE usuario SET usuario = '" & usuario & "', senha = '" & senha & "', nome = '" & nome & "', endereco = '" & endereco & "', cidade = '" & cidade & "', cep = '" & cep & "', estadoid = '" & estadoid & "' WHERE usuid =" & usuid)
	end if
end function      


function ExcluirUsuario()

	set rs = cn.execute("DELETE FROM usuario WHERE usuid = " & usuid)

end function

function carregarUsuario(usuid)
	stop

	if usuid > 0 then 

		set ObjConexao = new Conexao
		set cn = ObjConexao.AbreConexao()
		set ObjUsuario = new usuario
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
end function

%>