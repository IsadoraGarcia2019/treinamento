<% 
'AQUI CASO NAO ESTEJA LOGADO VAI PARA A PAGINA DE LOGIN
if Session("usuario") <> "logado"  then
    response.Redirect("logon.asp")
end if
%>