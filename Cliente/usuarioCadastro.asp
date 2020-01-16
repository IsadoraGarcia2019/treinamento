<!-- #include file = "AJAX/conexao.asp" -->
<!-- #include file = "AJAX/usuarioAjax.asp" -->
<%
dim records

'Recordsets
dim rsEstado

set rsEstado = cn.Execute("SELECT * FROM estado")    

set records = cn.execute("select * from tarefa where geradorID ="& usuid)
if records.eof then
    geradorID = 0
else
geradorID = records("geradorID")
end if

%>
<!DOCTYPE html>
<html>
<head>
    <!-- #include file = "Includes/HTMLhead.inc" -->    
    <link rel="stylesheet" type="text/css" href="./css/usuarioCadastro.css">
    <script type="text/javascript" src="./jscripts/usuarioCadastro.js"></script>

    <title>Cadastro de Usuário</title>
</head>
<body>
    <form action="usuarioCadastro.asp" method="post" id="formularioUsuario">
        <input type="hidden" id="usuid" name="usuid" value="<%=usuid%> ">
        <div class="box">

            <p>Usuário</p>

            <a href="listaUsuario.asp">Voltar para a listagem</a>

            <div class="campos">

                <label for="usuario">Usuário: </label>
                <input type="text" class="form-control" id="usuario" name="usuario" value="<%= usuario %>">


                <label for="senha">Senha: </label>
                <input type="password" class="form-control" id="senha" name="senha" value="<%= senha %>">
            </div>

            <label for="nome">Nome: </label>
            <input type="text" id="nome" name="nome" value="<% = nome %>">

            <div class="campos">

               <label for="endereco">Endereço: </label>
               <input type="text" class="form-control" id="endereco" name="endereco" value="<%= endereco %>">

               <label for="cidade">Cidade: </label>
               <input type="text" class="form-control" id="cidade" name="cidade" value="<%= cidade %>">
           </div>

           <div class="campos">

            <label for="cep">Cep: </label>
            <input type="text" id="cep" name="cep" maxlength="8" value="<%= cep %>" />

            <label for="estadoid">Estado: </label>
            <select name="estadoid" id="estadoid">
                <% 
                dim selected

                while not rsEstado.eof 

                    if rsEstado("estadoid") = estadoid then

                        selected = "selected"
                    end if

                    response.write("<option "& selected &" value="& rsEstado("estadoid") &">" & rsEstado("nome") &"</option>")

                    selected = ""

                    rsEstado.moveNext()
                wend
                %>
            </select>
        </div>

        <div class="botoes">

         <button class="button" onclick="CadastrarUsuario(event)" id="btnCadastrar">Cadastrar</button>
         <button class="button" onclick="AlterarUsuario(event)" id="btnAlterar" value="Alterar">Alterar</button>
         <%if usuid <> geradorID then%>
         <button class="btnExcluir" onclick="ExcluirUsuario(event)" style="display: none;" id="btnExcluir">Excluir</button> 
         <%end if%>  
         <%if usuid = geradorID then%>
         <button class="btnExcluir" onclick="ExclusaoGerador(event)" style="display: none;" id="btnExcluir">Excluir</button>   
         <%end if%>  
         <button onclick="limparCampos()" class="button" name="acao" id="btnNovo">Novo</button>              
     </div>
 </div>
</form>
</body>
</html>  
