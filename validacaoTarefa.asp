 <%
 function validaTarefa(tarTitulo,geradorID,tarData,tarStatus,tarDescricao)

 	dim resultado: resultado = true

 	if tarTitulo = "" then
 		resultado = false
 	end if

 	if geradorID = "" then
 		resultado = false
 	end if

 	if tarData = "" then
 		resultado = false
 	end if

 	if tarStatus = "" then
 		resultado = false
 	end if

 	if tarDescricao = "" then
 		resultado = false
 	end if
 	validaTarefa=resultado
 end function
%>