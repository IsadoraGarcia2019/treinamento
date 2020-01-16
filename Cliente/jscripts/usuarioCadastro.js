window.addEventListener('load', function(e) {
    carregarUsuario();
});

function carregarUsuario(){
    debugger
    const queryString = window.location.search;
    console.log(queryString);
    const urlParams = new URLSearchParams(queryString);
    var id = urlParams.get("usuid");
    if (id != 0) {

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
            }
        });
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

function CadastrarUsuario(event){
    event.preventDefault();
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
        success: function(){
            document.getElementById("btnCadastrar").style.display = "none";
            document.getElementById("btnExcluir").style.display = "inline";
        },
        error: function(){
        }
    });
}

function AlterarUsuario(event) {
    event.preventDefault();
    var usuid = document.getElementById('usuid').value;
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
            "usuid": usuid,
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

function ExcluirUsuario(event) {
    event.preventDefault();

    var usuid = document.getElementById('usuid').value;
    var usuario = document.getElementById("usuario").value;
    var senha = document.getElementById("senha").value;
    var nome = document.getElementById("nome").value;
    var endereco = document.getElementById("endereco").value;
    var cidade = document.getElementById("cidade").value;
    var cep = document.getElementById("cep").value;
    var estadoid = document.getElementById("estadoid").value;

    if (confirm("Tem certeza que deseja excluir seus dados?")) {
        var usuid = document.getElementById('usuid').value;
        if (usuid != '') {

            $.ajax({
                url:"../Servidor/Controllers/usuarioAjax.asp",
                type:'POST',
                async:false,
                data: {
                    "fnTarget": "ExcluirUsuario",
                    "usuid": usuid,
                    "usuario": usuario,
                    "senha": senha,
                    "nome": nome,
                    "endereco": endereco,
                    "cep": cep,
                    "cidade": cidade,
                    "estadoid": estadoid
                },
                success: function(){
                    alert("Usuário excluído com sucesso !!");
                    location.href = "/treinamento/Cliente/listaUsuario.asp";
                }
            });            
        }
    }
}

function ExclusaoGerador(event) {
    event.preventDefault();
    alert('Esse usuário não pode ser excluído pois é um gerador de tarefa !!');
}

// function adicionarEventos() {

//     const inputValue = document.getElementById("cep");
//     inputValue.addEventListener("keyup", (e) => {
//         debugger;
//         mascaraCEP(e)
//     });
// }

// function mascaraCEP(e) {
//     zipCode = e.currentTarget.value;
//     if (zipCode){
//         if (zipCode.length === 8) {
//             document.getElementById("cep").value = `${zipCode.substr(0,2)}.${zipCode.substr(2,3)}-${zipCode.substr(5,3)}`;
//             console.log(zipCode);
//         }
//     }
// }