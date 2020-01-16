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
        <input type="hidden" id="usuid" name="usuid">
        <div class="box">

            <p>Usuário</p>

            <a href="listaUsuario.asp">Voltar para a listagem</a>

            <div class="campos">

                <label for="usuario">Usuário: </label>
                <input type="text" class="form-control" id="usuario" name="usuario">


                <label for="senha">Senha: </label>
                <input type="password" class="form-control" id="senha" name="senha">
            </div>

            <label for="nome">Nome: </label>
            <input type="text" id="nome" name="nome">

            <div class="campos">

               <label for="endereco">Endereço: </label>
               <input type="text" class="form-control" id="endereco" name="endereco">

               <label for="cidade">Cidade: </label>
               <input type="text" class="form-control" id="cidade" name="cidade">
           </div>

           <div class="campos">

            <label for="cep">Cep: </label>
            <input type="text" id="cep" name="cep" maxlength="8">

            <label for="estadoid">Estado: </label>
            <select name="estadoid" id="estadoid">
            </select>
        </div>

        <div class="botoes">
         <button class="button" onclick="CadastrarUsuario(event)" id="btnCadastrar">Cadastrar</button>
         <button class="button" onclick="AlterarUsuario(event)" id="btnAlterar" value="Alterar">Alterar</button>
         <button class="btnExcluir" onclick="ExcluirUsuario(event)" style="display: none;" id="btnExcluir">Excluir</button> 
         <button class="btnExcluir" onclick="ExclusaoGerador(event)" style="display: none;" id="btnExcluir">Excluir</button>   
         <button onclick="limparCampos()" class="button" name="acao" id="btnNovo">Novo</button>              
     </div>
 </div>
</form>
</body>
</html>  
