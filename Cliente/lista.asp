<!-- #include file = "verificacaoLogado.asp" -->
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <!-- #include file = "Includes/HTMLhead.inc" -->
    <link rel="stylesheet" type="text/css" href="./css/lista.css">
    <title>Lista de Tarefas</title>
    <script type="text/javascript" src="./jscripts/lista.js"></script>
    <script type="text/javascript" src="jscripts/auxiliar.js"></script>
</head>
<body>
    <!-- #include file = "Includes/header.asp" -->
    <div class="box">
      <p>Tarefas</p>
      <a href="TarefaCadastro.asp">Nova Tarefa</a>
      <table id="tblTarefas">
            <thead>
                <tr>
                    <th style="padding-left: 20px;"><b>Nº</b></th>
                    <th><b>Título</b></th>
                    <th><b>Descrição</b></th>
                    <th><b>Data Abertura</b></th>
                    <th><b>Status</b></th>
                </tr> 
            </thead>       
            <tfoot>
                <tr>
                    <th colspan="5">
                        <div class="paginacao">
                            <ul>
                                <button id="btnPrimeiraPagina">
                                    <li><<</li> 
                                </button>
                                <button id="btnRecuaPagina">
                                    <li><</li> 
                                </button> <input type="text" name="" id="txtPagina">
                                <button id="btnAvancaPagina">
                                    <li>></li>
                                </button> 
                                <button id="btnUltimaPagina">
                                    <li>>></li>
                                </button>
                                <li id="txtDetalhesRegistros">Mostrando Registros</li>
                            </ul>
                        </div>
                    </th>
                </tr>
            </tfoot>           
        </table>
    </div> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>
