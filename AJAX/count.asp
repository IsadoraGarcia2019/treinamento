<!-- #include file = "conexao.asp" -->
<%

dim usuid
dim rs
dim cn
usuid=Request("usuid")

set cn = Server.CreateObject("ADODB.Connection") 

cn.Provider = "sqloledb"
cn.Open("Server=ES208;Database=treinamento;UserId=sa;Password=sa123456;")

sql = cn.Execute("SELECT COUNT(*) FROM tarefa WHERE geradorID = "&usuid)
 
if sql > 0 then



end if
%>