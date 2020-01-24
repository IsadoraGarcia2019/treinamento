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
    //     mudarImagem(e);
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
    TabelaCriarCorpo(tblTarefas, dadosCorpo);
}


function TabelaCriarCorpo(tblTarefas, dadosCorpo) {
    debugger
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
                // a.href = url;
                // var imagem = document.createElement("IMG");
                // imagem.src = "../Cliente/imagens/editar.png";
                // a.appendChild(imagem);
                // cell.appendChild(a);
                break;
            }
            var text = document.createTextNode(element[key]);
            cell.appendChild(text);
        }
    }
}

function mudarImagem(objImagem, tarID) {

    var status = 0;
    if (objImagem.src.indexOf("cadeadoAberto") > -1) {

        objImagem.src = "./imagens/CadeadoCancelado.gif";
        status = 7;

    } else if (objImagem.src.indexOf("CadeadoCancelado") > -1) {
        objImagem.src = "./imagens/cadeadoFechado.gif";
        status = 9;
    } else if (objImagem.src.indexOf("cadeadoFechado") > -1) {
        objImagem.src = "./imagens/cadeadoAberto.gif";
        status = 1;

    }
    return $.ajax({
        url: "../Servidor/Controllers/listaAjax.asp",
        type: 'POST',
        data: {
            "fnTarget": "atualizaStatus",
            "status": status,
            "id": tarID
        },
        error: function(xhr, status, error) {
            alert("Erro: " + error.Message);
        }
    });
}

function edicaoTarefa(e, tableData, tarID) {
    debugger
    var titulo = e.currentTarget;

    input = document.createElement("input");

    input.value = titulo;

    input.addEventListener('keypress', function(e) {
        if (e.keyCode == 13) {
            var valorInput = input.value;
            document.getElementById("tar" + tarID).innerText = "";
            salvaTarefa(valorInput, tarID);
        }
    });

    input.addEventListener('blur', function(e) {
        e.target.parentElement.innerHTML = titulo;
    });

    titulo.appendChild(input);

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
            "id": tarID
        },
        success: function(resposta) {
            document.getElementById("tar" + tarID).innerText = txt;

        },
        error: function(xhr, titulo, error) {
            alert("Erro: " + error.Message);
        }
    });
}
