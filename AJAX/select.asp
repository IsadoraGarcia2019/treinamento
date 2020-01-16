<!-- #include file = "../conexao.asp" -->
<%
if (Request("fnTarget") <> "") then
	Execute(Request("fnTarget") & "()")
end if

function ValidaLogin()

	login=Request("usuario")
	senha=Request("senha")

	set rs = cn.execute("SELECT * FROM usuario WHERE usuario = '" & login &"' AND senha = '" & senha & "' ")

	if (not rs.eof) Then
		Session("usuario") = "logado"
		response.write "true"
	else
		response.write "false"
	end if
end function

%>