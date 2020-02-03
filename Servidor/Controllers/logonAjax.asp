<!-- #include file = "../Models/conexao.class.asp" -->
<%
dim cn, rs

if (Request("fnTarget") <> "") then
	Execute(Request("fnTarget") & "()")
end if

function ValidaLogin()
	
	set ObjConexao = new Conexao
	set cn = ObjConexao.AbreConexao()
	login=Replace(Request("usuario"), "'", "''")
	senha=Replace(Request("senha"), "'", "''")

	set rs = cn.execute("SELECT * FROM usuario WHERE usuario = '" & login &"' AND senha = '" & senha & "' ")

	if (not rs.eof) Then
		Session("usuario") = "logado"
		response.write "true"
	else
	response.write "false"
end if
end function

%>