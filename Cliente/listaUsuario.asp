<!-- #include file = "Includes/header.asp" -->
<!-- #include file = "../Servidor/conexao.asp" -->
<!-- #include file = "paginacaoUsuario.asp" -->
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
    <meta charset="UTF-8" />
    <link rel="stylesheet" type="text/css" href="./css/reset-min.css">
    <link rel="stylesheet" type="text/css" href="./css/listaUsuario.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <title>Lista de Usuários</title>
</head>

<body>
    <div class="box">
        <p>Usuário</p>
        <a href="usuarioCadastro.asp">Novo Usuário</a>
        <table>
            <tr>
                <th><b>Nome</b></th>
                <th><b>Usuário</b></th>
                <th><b>Endereço</b></th>
                <th><b>Cidade</b></th>
                <th><b>Cep</b></th>
                <th><b>Editar</b></th>
            </tr>
            <%
            Do while not recordSet.eof
                Response.write("<tr>")
                Response.write("<td>")
                Response.write(recordSet("Nome").value)
                Response.write("</td>") 
                Response.write("<td>")
                Response.write(recordSet("Usuario").value)
                Response.write("</td>")  
                Response.write("<td>")
                Response.write(recordSet("Endereco").value)
                Response.write("</td>") 
                Response.write("<td>")
                Response.write(recordSet("Cidade").value)
                Response.write("</td>")
                Response.write("<td>")
                Response.write(recordSet("Cep").value)
                Response.write("</td>")    
                Response.write("<td><a href=""usuarioCadastro.asp?usuid=" & recordSet("usuid") &"""><img src='./imagens/editar.png '/></a></td>")
                Response.write("</tr>")
                recordSet.moveNext()
            loop
            recordSet.close()
            if numeroAtual = intTotal then
                voltarDisableddenovo = "disabled"
            end if
            %>
            <form id="formInput" action="listaUsuario.asp" method="post">
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
    <script type="text/javascript" src="./jscripts/listaUsuario.js"></script>
    <script type="text/javascript" src="./jscripts/auxiliar.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>