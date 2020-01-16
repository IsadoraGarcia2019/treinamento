function verificarURL(event) {
    event.preventDefault();

    var usuario = document.getElementById("usuario")
    var senha = document.getElementById("senha")

    if (usuario == "") {
        mostraAlerta("Preencha o campo usuario!!!");
        return false;
    } else if (senha == "") {
        mostraAlerta("Preencha o campo senha!!!");
        return false;
    }

    $.ajax({
        url: "AJAX/logonAjax.asp",
        type: 'POST',
        async: false,
        data: {
            "fnTarget": "ValidaLogin",
            usuario: document.getElementById("usuario").value,
            senha: document.getElementById("senha").value
        },
        success: function(retorno) {
            if (retorno == 'true') {
                window.location.href = "Cliente/listaUsuario.asp";
            } else {

                mostraAlerta("Usuario e/ou senha incorretos!")
                document.getElementById("senha").value = "";
            }
        }
    });
}

function mostraAlerta(mensagem) {
    var $alerta = document.getElementById("divAlerta");
    $alerta.innerHTML = mensagem;
    $alerta.classList.add('alerta-show');
    setTimeout(function() {
        $alerta.className = $alerta.className.replace("alerta-show", "");
    }, 3000);
}