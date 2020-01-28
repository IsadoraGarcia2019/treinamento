<!-- #include file = "verificacaoLogado.asp" -->
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <!-- #include file = "Includes/HTMLhead.inc" -->
    <link rel="stylesheet" type="text/css" href="./css/listaUsuario.css">
    <title>Lista de Usuários</title>
</head>
<body>
    <!-- #include file = "Includes/header.asp" -->
    <div class="box">
        <p>Usuário</p>
        <a href="usuarioCadastro.asp">Novo Usuário</a>
        <table  id="tblUsuarios">
            <thead>
                <tr>
                    <th><b>Nome</b></th>
                    <th><b>Usuário</b></th>
                    <th><b>Endereço</b></th>
                    <th><b>Cidade</b></th>
                    <th><b>Cep</b></th>
                    <th><b>Editar</b></th>
                </tr>
            </thead> 
            <tfoot>
                <tr>
                    <th colspan="6">
                        <div class="paginacao">
                            <ul>
                                <button>
                                    <li><<</li> 
                                </button>
                                <button>
                                    <li><</li> 
                                </button> <input type="text" name="" id="">
                                <button>
                                    <li>></li>
                                </button> 
                                <button>
                                    <li>>></li>
                                </button>
                                <li>Mostrando 0 de 0 registros</li>
                            </ul>
                        </div>
                    </th>
                </tr>
            </tfoot>           
        </table>
    </div>
    <script type="text/javascript" src="./jscripts/listaUsuario.js"></script>
    <script type="text/javascript" src="./jscripts/auxiliar.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>