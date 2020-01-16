<%
set cn = Server.CreateObject("ADODB.Connection") 

cn.Provider = "sqloledb"
cn.Open("Server=ES208;Database=treinamento;User Id=sa;Password=sa123456;")

%>