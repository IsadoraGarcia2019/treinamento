var input;
window.addEventListener('DOMContentLoaded', function(e) {
    debugger
    adicionarEventos();
    BuscarTarefas();

});

function adicionarEventos(){
 var body = document.getElementsByTagName("BODY")[0];
    // carregamento dos dados com valores padrões
    body.addEventListener("load", function () {
        BuscarTarefas();
    });

    // var btnImg = document.getElementById("btnImg");
    // var tblTarefa = document.getElementById("tblTarefa");

    // btnImg.addEventListener("dblclick", function (e) {
    //     debugger
    //     atualizaStatus(e);
    // });

    // tblTarefa.addEventListener("dblclick", function (e) {
    //     edicaoTarefa(e);
    // });
}

function BuscarTarefas() {
    debugger
    return $.ajax({
        url:"../Servidor/Controllers/tarefaAjax.asp",
        type:'POST',
        data: {
            "fnTarget" : "BuscarTarefas"
        },
        success:function(data) {
            debugger
            PreencheTabela(data);
        },
        error: function(xhr, status, error){
            alert("listagem Tarefas" + xhr + status + error);
        }
    });
}

function PreencheTabela(data) {
    debugger
    var dadosCorpo = data.Tarefas;
    var tblTarefas = document.getElementById("tblTarefas");
    
    var tbody = tblTarefas.createTBody();
    for (var element of dadosCorpo) {
        var row = tbody.insertRow();
        for (key in element) {
            var cell = row.insertCell();
            if (key == 'tarID') {
                var params = new URLSearchParams();
                params.append(key, element[key]);
                // TODO - Melhorar a forma de construção da url criar objeto URL
                var url = 'TarefaCadastro.asp?' + params.toString();
                var a = document.createElement("a");
                a.href = url;
                a.innerText = element[key];
                cell.appendChild(a);
                continue;
            }
            if (key == 'tarTitulo') {            
                debugger 
                cell.id = element.tarID;
                cell.addEventListener('dblclick', function(e){
                    edicaoTarefa(e);
                });         
            }
            if (key == 'tarStatus') {
                var img = document.createElement("img");
                if (element[key] == 1) {0
                    img.src = "./imagens/cadeadoAberto.gif"
                }
                if (element[key] == 7) {
                    img.src = "./imagens/CadeadoCancelado.gif"
                }
                if (element[key] == 9) {
                    img.src = "./imagens/cadeadoFechado.gif"
                }   
                debugger
                img.setAttribute("status", element[key]);
                img.setAttribute("tarID", element['tarID']);
                img.addEventListener('dblclick', function(e){
                    atualizaStatus(e);
                });         
                cell.appendChild(img);
                continue;
            }
            var text = document.createTextNode(element[key]);
            cell.appendChild(text);
        }
    }
}

function atualizaStatus(e) {
    debugger
    var status = e.currentTarget.getAttribute("status");
    var img = event.currentTarget;

    if (status == '0' || status == '1') {
        img.src = "./imagens/CadeadoCancelado.gif";
        img.setAttribute("status", 7);
        statusNovo = 7;
    } else if (status == 7) {
        img.src = "./imagens/cadeadoFechado.gif";
        img.setAttribute("status", 9);
        statusNovo = 9;
    } else if (status == '9') {
        img.src = "./imagens/cadeadoAberto.gif";
        img.setAttribute("status", 1);
        statusNovo = 1;
    }
    data = {
        fnTarget: "atualizaStatus",
        tarID: event.currentTarget.getAttribute("tarID"),
        status: statusNovo
    }
    return $.ajax({
        url: "../Servidor/Controllers/listaAjax.asp",
        type: 'POST',
        data: data,
        success: function (data) {
            if (data.Erro) {
                alert("Erro: " + data.Erro);
            }
        },
        error: function(xhr, status, error) {
            alert("Erro: " + error.Message);
        }
    });
}

function edicaoTarefa(e) {
    debugger

    var titulo = e.currentTarget.innerText;
    e.currentTarget.innerText = "";
    var tarID = e.currentTarget.id;

    var input = document.createElement("input");

    input.value = titulo;
    input.id = tarID;

    input.addEventListener('keypress', function(e) {
        if (e.keyCode == 13) {
            debugger
            var valorInput = input.value;
            // document.getElementById(e.currentTarget);
            salvaTarefa(valorInput, tarID);
        }
    });

    input.addEventListener('blur', function(e) {
        e.target.parentElement.innerHTML = titulo;
    });

    e.currentTarget.appendChild(input);

    input.focus();
}

function salvaTarefa(txt, tarID) {
    return $.ajax({
        url: "../Servidor/Controllers/listaAjax.asp",
        type: 'POST',
        async: false,
        data: {
            "fnTarget": "atualizaTitulo",
            "titulo": txt,
            "tarID": tarID
        },
        success: function(resposta) {
            debugger
            alert("alterado com sucesso!");
            window.location.reload();

        },
        error: function(xhr, titulo, error) {
            alert("Erro: " + error.Message);
        }
    });
}