<!DOCTYPE html>
<html lang="pt-br">
<head>
    <!-- #include file = "Includes/HTMLhead.inc" -->
    <link rel="stylesheet" type="text/css" href="./css/TarefaCadastro.css">
    <script type="text/javascript" src="./jscripts/TarefaCadastro.js"/></script>    
    <title>Cadastro de Tarefas</title>
</head>

<body>
    <form method="post" id="formularioTarefa">
        <div class="box">

            <p>Tarefa</p>


            <a href="listaTarefa.asp">Voltar para a listagem</a>

            <br />

            <label for="titulo">Título: </label>
            <input type="text" id="tarTitulo" name="tarTitulo">

            <br />

            <label for="geradorID">Gerador: </label>
            <select name="geradorID" id="geradorID">
            </select>

            <br />

            <label for="tarData">Data: </label>
            <input type="datetime-local" id="tarData" name="tarData" min="1900-01-01T01:01" max="2100-12-31T23:59">

            <br />

            <label for="tarStatus">Status: </label>
            <select name="tarStatus" id="tarStatus">
                <option value="0">Não iniciado</option>
                <option value="1">Em andamento</option>
                <option value="7">Cancelada</option>
                <option value="9">Concluída</option>
            </select>

            <br />

            <label for="tarDescricao" id="descricao">Descrição: </label>
            <textarea name="tarDescricao" rows="7" cols="55" id="tarDescricao"><%=tarDescricao%></textarea>

            <br />

            <div class="botoes">
               <button class="button" id="btnCadastrar">Cadastrar</button> 
               <button class="button" id="btnAlterar" >Alterar</button>     
               <button class="button" id="btnExcluir" style="display: none !important;" >Excluir</button>    
               <button class="button" id="btnNovo">Novo</button>  
           </div>
       </div>
   </form>
</body>
</html>
