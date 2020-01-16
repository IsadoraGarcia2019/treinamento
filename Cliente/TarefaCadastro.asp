<!-- #include file = "validacaoTarefa.asp" -->
<!-- #include file = "conexao.asp" -->
<!-- #include file = "AJAX/tarefaAjax.asp" -->
<%
Response.AddHeader "Content-Type", "text/html;charset=UTF-8"
Response.CodePage = 65001
Response.CharSet = "UTF-8"

dim selected

'Recordsets
dim rsGerador
dim usuid

set rsGerador = cn.Execute("SELECT usuid, Usuario FROM Usuario")

%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="./css/reset-min.css">
    <link rel="stylesheet" type="text/css" href="./css/TarefaCadastro.css">    

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script type="text/javascript" src="./jscripts/TarefaCadastro.js"/></script>

    <title>Cadastro de Tarefas</title>
</head>

<body>
    <form action="TarefaCadastro.asp" method="post" id="formularioTarefa">
        <input type="hidden" id="tarID" name="tarID" value="<%=tarID%> ">
        <div class="box">

            <p>Tarefa</p>


            <a href="lista.asp">Voltar para a listagem</a>

            <br />

            <label for="titulo">Título: </label>
            <input type="text" id="tarTitulo" name="tarTitulo" value="<%=tarTitulo %>">

            <br />

            <label for="geradorID">Gerador: </label>
            <select name="geradorID" id="geradorID"  value="<%=geradorID %>">
              <% 


              while not rsGerador.eof 
                if rsGerador("usuid") = geradorID then

                    selected = "selected"

                end if

                response.write("<option "& selected &" value="""& rsGerador("usuid") &""">" & rsGerador("usuario") &"</option>")

                selected = ""

                rsGerador.moveNext()
            wend
            %>
        </select>

        <br />

        <label for="tarData">Data: </label>
        <input type="datetime-local" id="tarData" name="tarData" min="1900-01-01T00:00:00" max="2100-12-31T23:59:59" value="<%=tarData%>">

        <br />

        <label for="tarStatus">Status: </label>
        <select name="tarStatus" id="tarStatus">
            <option value="0" <% if tarStatus = "0" then %> selected <% else %> placeholder="" <%end if %> >Não iniciado</option>
            <option value="1" <% if tarStatus = "1" then %> selected <% else %> placeholder="" <%end if %> >Em andamento</option>
            <option value="7" <% if tarStatus = "7" then %> selected <% else %> placeholder="" <%end if %> >Cancelada</option>
            <option value="9" <% if tarStatus = "9" then %> selected <% else %> placeholder="" <%end if %> >Concluída</option>
        </select>

        <br />

        <label for="tarDescricao" id="descricao">Descrição: </label>
        <textarea name="tarDescricao" rows="7" cols="55" id="tarDescricao"><%=tarDescricao%></textarea>

        <br />

        <div class="botoes">
           <button class="button" onclick="CadastrarTarefa(event)" id="btnCadastrar">Cadastrar</button> 
           <button class="button" onclick="AlterarTarefa(event)" id="btnAlterar" >Alterar</button>     
           <button onclick="ExcluirTarefa(event)" class="button" id="btnExcluir" style="display: none !important;" >Excluir</button>    
           <button  onclick="limparCampos()" class="button" id="btnNovo">Novo</button>  
       </div>
   </div>
</form>
</body>
</html>
