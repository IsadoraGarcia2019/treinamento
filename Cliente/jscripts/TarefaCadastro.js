window.addEventListener('load', function(e) {
    carregarTarefa();
});

function carregarTarefa(){
    var tarID = document.getElementById("tarID").value;
    if (tarID != 0) {

        $.ajax({
            url: "AJAX/tarefaAjax.asp",
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

function confirmarExclusao(event) {
    event.preventDefault();
    if (confirm("Tem certeza que deseja excluir essa tarefa?")) {
        var tarID = document.getElementById('tarID').value;
        if (tarID != '') {
            location.href = "TarefaCadastro.asp?btnAcao=Excluir&id=" + tarID;
        }
    }
}

function CadastrarTarefa(event) {
    event.preventDefault();
    var tarTitulo = document.getElementById("tarTitulo").value;
    var geradorID = document.getElementById("geradorID").value;
    var tarData = document.getElementById("tarData").value;
    var tarStatus = document.getElementById("tarStatus").value;
    var tarDescricao = document.getElementById("tarDescricao").value;

    $.ajax({
        url:"AJAX/tarefaAjax.asp",
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

function AlterarTarefa(event){
    event.preventDefault();
    var tarID = document.getElementById("tarID").value;
    var tarTitulo = document.getElementById("tarTitulo").value;
    var geradorID = document.getElementById("geradorID").value;
    var tarData = document.getElementById("tarData").value;
    var tarStatus = document.getElementById("tarStatus").value;
    var tarDescricao = document.getElementById("tarDescricao").value;

    if (tarID != 0) {

        $.ajax({
            url: "AJAX/tarefaAjax.asp",
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

function ExcluirTarefa(event) {
    event.preventDefault();
    var tarID = document.getElementById("tarID").value;
    var tarTitulo = document.getElementById("tarTitulo").value;
    var geradorID = document.getElementById("geradorID").value;
    var tarData = document.getElementById("tarData").value;
    var tarStatus = document.getElementById("tarStatus").value;
    var tarDescricao = document.getElementById("tarDescricao").value;

    if (confirm("Tem certeza que deseja excluir essa tarefa?")) {
        var tarID = document.getElementById('tarID').value;
        if (tarID != '') {

            $.ajax({
                url: "AJAX/tarefaAjax.asp",
                type: 'POST',
                async:false,
                data: {
                    "fnTarget": "ExcluirTarefa", 
                    "tarID": tarID,
                    "tarTitulo": tarTitulo,
                    "geradorID" : geradorID,
                    "tarData": tarData,
                    "tarStatus": tarStatus,
                    "tarDescricao": tarDescricao
                },
                success: function(){
                    document.getElementById("btnCadastrar").style.display = "none";
                    alert("Tarefa excluída com sucesso !!");
                    location.href = "/treinamento/Cliente/lista.asp";                             
                }
            });
        }
    }
}