window.addEventListener('load', function(e) {
    carregarTarefa();
    adicionarEventos();
});

function adicionarEventos(){
    var geradorID = document.getElementById("geradorID");
    var btnCadastrar = document.getElementById("btnCadastrar");
    var btnAlterar = document.getElementById("btnAlterar");
    var btnExcluir = document.getElementById("btnExcluir");
    var btnNovo = document.getElementById("btnNovo");
    debugger
    geradorID.addEventListener("click", function () {
        BuscarGeradores();
    });
    btnCadastrar.addEventListener("click", function (e) {
        CadastrarUsuario(e);
    });

    btnAlterar.addEventListener("click", function (e) {
        AlterarUsuario(e);
    });
    btnExcluir.addEventListener("click", function (e) {
        ExcluirUsuario(e);
    });btnNovo.addEventListener("click", function (e) {
        limparCampos(e);
    });
}

function BuscarGeradores() {
    debugger
    if (!geradorID) {
        return false;
    }

    $.ajax({
        url: "../Servidor/Controllers/tarefaAjax.asp",
        type: 'POST',
        async:false,
        data: {
            "fnTarget": "BuscarGeradores"
        },
        success: function(data){
            var geradorID =  document.getElementById("geradorID");
            preencheOptions(geradorID, data);
        },
        error: function(erro){
            alert("Gerador" + erro);   
        }
    });
}

function preencheOptions(geradorID, data) {
    var gerador = data.Geradores;
    for (var i = 0; i < gerador.length; i++) {
        var opt = document.createElement('option');
        opt.innerHTML = gerador[i]['nome'];
        opt.value = gerador[i]['usuid'];
        gerador.appendChild(opt);
    }
}

function carregarTarefa(){
    debugger
    var queryString = window.location.search;
    var urlParams = new URLSearchParams(queryString);
    var tarID = urlParams.get('tarID');

    if (tarID != 0 && tarID != null) {

        $.ajax({
            url: "../Servidor/Controllers/tarefaAjax.asp",
            type: 'POST',
            async:false,
            data: {
                "fnTarget": "carregarTarefa", 
                "tarID": tarID
            },
            success: function(resposta){
                document.getElementById("tarTitulo").value = resposta.tarTitulo ;
                document.getElementById("geradorID").value = resposta.geradorID;
                document.getElementById("tarData").value = resposta.tarData;
                document.getElementById("tarStatus").value = resposta.tarStatus;
                document.getElementById("tarDescricao").value = resposta.tarDescricao;

                document.getElementById("btnCadastrar").style.display = "none";
                document.getElementById("btnExcluir").style.display = "inline";                
            }
        });
    }
}

function limparCampos() {
    document.getElementById("tarTitulo").value = ""
    document.getElementById("geradorID").value = ""
    document.getElementById("tarData").value = ""
    document.getElementById("tarStatus").value = ""
    document.getElementById("tarDescricao").value = ""
}

function CadastrarTarefa(e) {
    debugger
    e.preventDefault();
    var tarTitulo = document.getElementById("tarTitulo").value;
    var geradorID = document.getElementById("geradorID").value;
    var tarData = document.getElementById("tarData").value;
    var tarStatus = document.getElementById("tarStatus").value;
    var tarDescricao = document.getElementById("tarDescricao").value;

    $.ajax({
        url:"../Servidor/Controllers/tarefaAjax.asp",
        type:'POST',
        async:false,
        data:{
            "fnTarget": "CadastrarTarefa",
            "tarTitulo": tarTitulo,
            "geradorID" : geradorID,
            "tarData": tarData,
            "tarStatus": tarStatus,
            "tarDescricao": tarDescricao
        },
        success: function(){
            document.getElementById("btnCadastrar").style.display = "none";            
            document.getElementById("btnExcluir").style.display = "inline";            
        }
    });
}

function AlterarTarefa(e){
    e.preventDefault();
    var queryString = window.location.search;
    var urlParams = new URLSearchParams(queryString);
    var tarID = urlParams.get('tarID');

    if (tarID != 0 && tarID != null) {
        var tarTitulo = document.getElementById("tarTitulo").value;
        var geradorID = document.getElementById("geradorID").value;
        var tarData = document.getElementById("tarData").value;
        var tarStatus = document.getElementById("tarStatus").value;
        var tarDescricao = document.getElementById("tarDescricao").value;


        $.ajax({
            url: "../Servidor/Controllers/tarefaAjax.asp",
            type: 'POST',
            async:false,
            data: {
                "fnTarget": "AlterarTarefa", 
                "tarID": tarID,
                "tarTitulo": tarTitulo,
                "geradorID" : geradorID,
                "tarData": tarData,
                "tarStatus": tarStatus,
                "tarDescricao": tarDescricao
            },
            success: function(){
                document.getElementById("btnCadastrar").style.display = "none";
                alert("Tarefa alterada com sucesso !!");
                location.href = "/treinamento/lista.asp";                             
            }
        });
    }
}

function ExcluirTarefa(e) {
    e.preventDefault();
    var queryString = window.location.search;
    var urlParams = new URLSearchParams(queryString);
    var tarID = urlParams.get('tarID');
    if (tarID != 0 && tarID != null) {

        if (confirm("Tem certeza que deseja excluir essa tarefa?")) {

            $.ajax({
                url: "../Servidor/Controllers/tarefaAjax.asp",
                type: 'POST',
                async:false,
                data: {
                    "fnTarget": "ExcluirTarefa", 
                    "tarID": tarID
                },
                success: function(){
                    alert(data.mensagem);
                    location.href = "/treinamento/Cliente/lista.asp";                             
                }
            });
        }
    }
}