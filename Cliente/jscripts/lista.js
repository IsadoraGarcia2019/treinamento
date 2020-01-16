var input;

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
        url: "AJAX/update.asp",
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

function edicaoTarefa(tableData, tarID) {
    var titulo = tableData.textContent;
    tableData.textContent = "";

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

    tableData.appendChild(input);

    input.focus();
}

function salvaTarefa(txt, tarID) {
    return $.ajax({
        url: "AJAX/update.asp",
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
