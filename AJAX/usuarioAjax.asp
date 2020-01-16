<!-- #include file = "../conexao.asp" -->
<!-- #include file = "../validacao.asp" -->
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

function CadastrarUsuario() 

	if validaNome(usuario,senha,nome,endereco,cidade,cep,estadoid) then
		cn.execute("INSERT INTO usuario (usuario,senha,nome,endereco,cidade,cep,estadoid) VALUES ('" & usuario & "','" & senha & "','" & nome & "','" & endereco & "','" & cidade & "','" & cep & "','" & estadoid & "')")

		set rs = cn.execute("select TOP 1 usuid FROM usuario ORDER BY usuid DESC")     
		if not rs.eof then
			usuid = rs("usuid")
			Response.write("true")
		end if
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

function carregarUsuario()

	if usuid > 0 then 

		set rs = cn.Execute("SELECT usuario, senha, nome, endereco, cidade, cep, estadoid FROM usuario WHERE usuid = " & usuid)

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