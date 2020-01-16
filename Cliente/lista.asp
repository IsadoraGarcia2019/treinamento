<!-- #include file = "Includes/header.asp" -->
<!-- #include file = "../Servidor/conexao.asp" -->
<!-- #include file = "paginacaoTarefa.asp" -->
<%  
Response.AddHeader "Content-Type", "text/html;charset=UTF-8"
Response.CodePage = 65001
Response.CharSet = "UTF-8"

'AQUI CASO NAO ESTEJA LOGADO VAI PARA A PAGINA DE LOGIN
if Session("usuario") <> "logado"  then
    response.Redirect("logon.asp")
end if
%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <link rel="stylesheet" type="text/css" href="./css/reset-min.css">
    <link rel="stylesheet" type="text/css" href="./css/lista.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <meta charset="utf-8">
    <title>Lista de Tarefas</title>
</head>
<body>
    <div class="box">
      <p>Tarefas</p>
      <a href="TarefaCadastro.asp">Nova Tarefa</a>
      <table>
        <tr>
            <th style="padding-left: 20px;"><b>Nº</b></th>
            <th><b>Título</b></th>
            <th><b>Descrição</b></th>
            <th><b>Data Abertura</b></th>
            <th><b>Status</b></th>
        </tr>
        <%
        Do while not recordSet.eof

            id = recordSet("tarID").value
            titulo = recordSet("tarTitulo").value
            tarStatus = recordSet("tarStatus").value
            imgStatus = ""

            if tarStatus <= 1  then

                imgStatus = "./imagens/cadeadoAberto.gif"

            end if
            if tarStatus = 7 then

                imgStatus = "./imagens/CadeadoCancelado.gif"

            end if
            if tarStatus = 9 then

                imgStatus = "./imagens/cadeadoFechado.gif"
            end if

            Response.write("<tr>")
            Response.write("<td>")
            Response.write("<a href=""/treinamento/TarefaCadastro.asp?tarID=" & recordSet("tarID") &""">"&id&"</a>")
            Response.write("</td>") 
            Response.write("<td ondblclick='edicaoTarefa(this, "&id&")' id='tar"&id&"' >")         
            Response.write(titulo)
            Response.write("</td>") 
            Response.write("<td>")
            Response.write(recordSet("tarDescricao").value)
            Response.write("</td>")                           
            Response.write("<td>")
            Response.write(recordSet("tarData").value)
            Response.write("</td>")                                
            Response.write("<td id='img"&id&"'><img ondblclick=""mudarImagem(this,"&id&")""src='"&imgStatus&"' alt='invalido'/></td>")
            Response.write("</tr>")
            recordSet.moveNext()
        loop
        recordSet.close()
        if numeroAtual = intTotal then
            voltarDisableddenovo = "disabled"
        end if
        %>
        <form id="formInput" action="lista.asp" method="post">
            <input type="hidden" id="Npagina" name="Npagina" value="<%=Npagina %>">
            <td colspan="6" class="pimba">
                <input type="submit" name="botao" class="btnPagina" id="inputFormPaginacao" <%=voltarDisabled%> value="<<">
                <input type="text " name="input" size="1" id="inputFormPaginacao" onkeyup="numero(event, 'formInput')">
                <input type="submit" name="botao" class="btnPagina" id="inputFormPaginacao"id="inputFormPaginacao" <%=voltarDisableddenovo%> value=">>">
                <div id="numeroRegistros"><strong>Mostrando <%=numeroAtual%> de <%=intTotal %> registros</strong></div>
            </td>
        </form>
    </table>
</div> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<script type="text/javascript" src="jscripts/lista.js"></script>
<script type="text/javascript" src="jscripts/auxiliar.js"></script>
</body>
</html>
