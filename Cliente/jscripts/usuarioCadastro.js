window.addEventListener('load', function(e) {
    carregarUsuario();
    adicionarEventos();
    BuscarEstados();
});

function adicionarEventos(){
    var estadoid = document.getElementById("estadoid");
    var btnCadastrar = document.getElementById("btnCadastrar");
    var btnAlterar = document.getElementById("btnAlterar");
    var btnExcluir = document.getElementById("btnExcluir");
    var btnNovo = document.getElementById("btnNovo");

    estadoid.addEventListener("click", function () {
        BuscarEstados();
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

function carregarUsuario(){    
   var queryString = window.location.search;
   var urlParams = new URLSearchParams(queryString);
   var id = urlParams.get('usuid');
   if (id != 0 && id != null) {

    $.ajax({
        url: "../Servidor/Controllers/usuarioAjax.asp",
        type: 'POST',
        async:false,
        data: {
            "fnTarget": "carregarUsuario", 
            "usuid": id
        },
        success: function(resposta){

            document.getElementById("usuario").value = resposta.usuario ;
            document.getElementById("senha").value = resposta.senha;
            document.getElementById("nome").value = resposta.nome;
            document.getElementById("endereco").value = resposta.endereco;
            document.getElementById("cidade").value = resposta.cidade;
            document.getElementById("cep").value = resposta.cep;
            document.getElementById("estadoid").value = resposta.estadoid;

            document.getElementById("btnCadastrar").style.display = "none";
            document.getElementById("btnExcluir").style.display = "inline";                
        },
        error: function(erro){
            alert("Carregar" + erro);   
        }
    });
}
}

function BuscarEstados() {
   if (!estadoid) {
    return false;
}

$.ajax({
    url: "../Servidor/Controllers/estadoAjax.asp",
    type: 'POST',
    async:false,
    data: {
        "fnTarget": "BuscarEstados"
    },
    success: function(data){
        var estadoid =  document.getElementById("estadoid");
        preencheOptions(estadoid, data);
    },
    error: function(erro){
        alert("Estado" + erro);   
    }
});
}

function preencheOptions(estadoid, data) {
   var estados = data.Estados;
   for (var i = 0; i < estados.length; i++) {
    var opt = document.createElement('option');
    opt.innerHTML = estados[i]['nome'];
    opt.value = estados[i]['estadoid'];
    estadoid.appendChild(opt);
}
}

function limparCampos() {
    document.getElementById("usuid").value = "";
    document.getElementById("usuario").value = "";
    document.getElementById("senha").value = "";
    document.getElementById("nome").value = "";
    document.getElementById("endereco").value = "";
    document.getElementById("cidade").value = "";
    document.getElementById("cep").value = "";
    document.getElementById("estadoid").value = "";
}

function CadastrarUsuario(e){
    e.preventDefault();
    if (camposObrigatorios()) {
        var usuario = document.getElementById("usuario").value;
        var senha = document.getElementById("senha").value;
        var nome = document.getElementById("nome").value;
        var endereco = document.getElementById("endereco").value;
        var cidade = document.getElementById("cidade").value;
        var cep = document.getElementById("cep").value;
        var estadoid = document.getElementById("estadoid").value;

        $.ajax({
            url: "../Servidor/Controllers/usuarioAjax.asp",
            type: 'POST',
            async:false,
            data: {
                "fnTarget": "CadastrarUsuario",
                "usuario": usuario,
                "senha": senha,
                "nome": nome,
                "endereco": endereco,
                "cep": cep,
                "cidade": cidade,
                "estadoid": estadoid
            },
            success: function(data){
                alert (data.mensagem)
                document.getElementById("btnCadastrar").style.display = "none";
                document.getElementById("btnExcluir").style.display = "inline";
            },
            error: function(xhr, status, error){
                alert("Erro:" + xhr + status + error);
            }
        });
    }
}

function camposObrigatorios() {
    debugger
    if (usuario.value = "") {
        alert("Preencha o campo USUÁRIO");
        return false;
    }
    else if (senha.value = "") {
        alert("Preencha o campo SENHA");
        return false;
    }
    else if (nome.value = "") {
        alert("Preencha o campo NOME");
        return false;
    }
    else if (endereco.value = "") {
        alert("Preencha o campo ENDERECO");
        return false;
    }
    else if (cidade.value = "") {
        alert("Preencha o campo CIDADE");
        return false;
    }
    else if (cep.value = "") {
        alert("Preencha o campo CEP");
        return false;
    }
    else if (estadoid.value = "") {
        alert("Preencha o campo ESTADO");
        return false;
    }
}

function AlterarUsuario(e) {
    e.preventDefault();
    var queryString = window.location.search;
    var urlParams = new URLSearchParams(queryString);
    var id = urlParams.get('usuid');
    if (id != 0 && id != null) {

        var usuario = document.getElementById("usuario").value;
        var senha = document.getElementById("senha").value;
        var nome = document.getElementById("nome").value;
        var endereco = document.getElementById("endereco").value;
        var cidade = document.getElementById("cidade").value;
        var cep = document.getElementById("cep").value;
        var estadoid = document.getElementById("estadoid").value;

        $.ajax({
            url:"../Servidor/Controllers/usuarioAjax.asp",
            type:'POST',
            async:false,
            data: {
                "fnTarget": "AlterarUsuario",
                "usuid": id,
                "usuario": usuario,
                "senha": senha,
                "nome": nome,
                "endereco": endereco,
                "cep": cep,
                "cidade": cidade,
                "estadoid": estadoid
            },
            success: function(){
                alert("Usuário alterado com sucesso !!");
                location.href = "/treinamento/Cliente/listaUsuario.asp";
            }
        });
    }
}

function ExcluirUsuario(e) {
    e.preventDefault();
    var queryString = window.location.search;
    var urlParams = new URLSearchParams(queryString);
    var id = urlParams.get('usuid');
    if (id != 0 && id != null) {

        if (confirm("Tem certeza que deseja excluir seus dados?")) {
         $.ajax({
            url:"../Servidor/Controllers/usuarioAjax.asp",
            type:'POST',
            async:false,
            data: {
                "fnTarget": "ExcluirUsuario",
                "usuid": id
            },
            success: function(data){
                alert(data.mensagem);
                location.href = "/treinamento/Cliente/listaUsuario.asp";
            }
        });          
     }
 }
}