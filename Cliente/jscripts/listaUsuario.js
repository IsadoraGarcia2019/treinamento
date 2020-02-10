var PaginaAtual = 0;
document.addEventListener('DOMContentLoaded', function () {
    AdicionarEventos();
    BuscarUsuarios(PaginaAtual);
});

function AdicionarEventos() {
    var btnPrimeiraPagina = document.getElementById("btnPrimeiraPagina");
    var btnRecuaPagina = document.getElementById("btnRecuaPagina");
    var btnAvancaPagina = document.getElementById("btnAvancaPagina");
    var btnUltimaPagina = document.getElementById("btnUltimaPagina");
    var txtPagina = document.getElementById("txtPagina");
    var dadosPagina = document.getElementById("dadosPagina");

    btnPrimeiraPagina.addEventListener('click', function(e){
        var txt = txtPagina.value;
        PrimeiraPagina(e, txt);
    });

    btnRecuaPagina.addEventListener('click', function(e){
        var txt = txtPagina.value;
        RecuaPagina(e, txt);
    });

    btnAvancaPagina.addEventListener('click', function(e){
        var txt = txtPagina.value;
        AvancaPagina(e, txt);
    });

    btnUltimaPagina.addEventListener('click', function(e){
        UltimaPagina(e);
    });

    txtPagina.addEventListener('keypress', function(e){
        if (e.keyCode == 13) {
            irParaPagina(e);
        }
    });
}

function PrimeiraPagina(e, txt){
    BuscarUsuarios(0);
}

function  RecuaPagina(e, txt) {
    var PaginaAnterior = isNaN(txt) ? 1 : Number(txt) - 1;
    BuscarUsuarios(PaginaAnterior);
}

function AvancaPagina(e, txt){
    var ProximaPagina = isNaN(txt) ? 1 : Number(txt) + 1;
    BuscarUsuarios(ProximaPagina);
}

function UltimaPagina(e){
    BuscarUsuarios(32767);
}

function irParaPagina(e){
    e.currentTarget.value;
    var irParaPagina = isNaN(txt) ? 1 : Number(txt) + 1;
}

function BuscarUsuarios(PaginaAtual) {
    return $.ajax({
        url: "../Servidor/Controllers/usuarioAjax.asp",
        type: 'POST',
        data: {
            "fnTarget" : "BuscarUsuarios",
            "PaginaAtual" : PaginaAtual
        },
        success: function (data) {
            PreencheTabela(data);
        },
        error: function (xhr, status, error) {
            alert("Erro: " + xhr + status + error);
        }
    });
}

function PreencheTabela(data) {
    var dadosCorpo = data.Usuarios;
    var tblUsuarios = document.getElementById("tblUsuarios");
    TabelaCriarCorpo(tblUsuarios, dadosCorpo);
    var txtPagina = document.getElementById("txtPagina");
    txtPagina.value = data.PaginaAtual;

    var detalhesRegistros = document.getElementById("txtDetalhesRegistros");
    var txtPagina = document.getElementById("txtPagina");
    detalhesRegistros.innerText = "Mostrando " + data.RegistrosPorPagina + " de " + data.TotalRegistros + " registros";
    txtPagina.value = data.PaginaAtual
}

function TabelaCriarCorpo(tblUsuarios, dadosCorpo) {
    if (tblUsuarios.getElementsByTagName("tbody").length != 0) {
        var row = document.getElementsByTagName("tbody")[0];
        row.parentNode.removeChild(row);
    }
    var tbody = tblUsuarios.createTBody();
    for (var element of dadosCorpo) {
        var row = tbody.insertRow();
        for (key in element) {
            var cell = row.insertCell();
            if (key == 'usuid') {
                var a = document.createElement("a");
                var params = new URLSearchParams();
                params.append(key, element[key]);
                // TODO - Melhorar a forma de construção da url criar objeto URL
                var url = 'usuarioCadastro.asp?' + params.toString();
                a.href = url;
                var imagem = document.createElement("IMG");
                imagem.src = "../Cliente/imagens/editar.png";
                a.appendChild(imagem);
                cell.appendChild(a);
                break;
            }
            var text = document.createTextNode(element[key]);
            cell.appendChild(text);
        }
    }

}