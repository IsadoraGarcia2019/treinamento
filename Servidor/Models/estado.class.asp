<%
Class Estado

	Private estadoid
	Private Nome

	Public function getEstadoId()
		getEstadoId = estadoid
	End function
	Public sub setEstadoId(byval p_estadoId)
		estadoid = p_estadoId
	End sub	
	Public function getNome()
		getNome = Nome
	End function
	Public sub setNome(byval p_nome)
		Nome = p_nome
	End sub

     'Buscar estados
     public function BuscarEstados(cn)

     	dim sql : sql = "SELECT [estadoid],[nome] FROM [treinamento].[dbo].[estado]"
     	Set rs=Server.CreateObject("ADODB.recordset")
     	rs.Open sql, cn, &H0001
     	set BuscarEstados = rs
     end function
End Class
%>