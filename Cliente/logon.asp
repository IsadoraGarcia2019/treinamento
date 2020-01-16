<!-- #include file = "AJAX/select.asp" -->
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" type="text/css" href="./css/reset-min.css">
    <link rel="stylesheet" type="text/css" href="./css/logon.css">
    <title>Logon</title>
</head>
<body>
    <form action="logon.asp" method="post" id="logon">
        <div class="box">

            <img src="./imagens/key.png" class="key">

            <div class="campos">
                <label for="usuario">Usuário: </label>
                <input type="text" class="form-control" id="usuario" name="usuario">

                <br />

                <label for="senha">Senha: </label>
                <input type="password" class="form-control" id="senha" name="senha">
            </div>

            <div class="alerta" id="divAlerta"></div>
            <button onclick="verificarURL(event)" type="submit" name="btnEntrar" id="btnEntrar"><b>Entrar</b></button>
        </div>
    </form>
    <script type="text/javascript" src="./jscripts/logon.js" /></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</body>
</html>