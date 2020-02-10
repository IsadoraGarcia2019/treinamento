<!DOCTYPE html>
<html>
<!-- include file = "Includes/HTMLhead.inc" -->
<head>
	<title>Página Inicial</title>
	<link rel="stylesheet" type="text/css" href="./css/listaUsuario.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<meta charset="utf-8">
</head>
<header>
	<nav class="navbar navbar-expand-lg navbar-light" style="background-color: #aaa; color: white;">
		<a class="navbar-brand" href="paginaInicial.asp" style="color: #404a47; padding-left: 0 !important;">Página Incial</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Alterna navegação">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNavDropdown">
			<ul class="navbar-nav">
				<li class="nav-item active">
					<a class="nav-link" href="logon.asp" style="color: white;">Login <span class="sr-only">(Página atual)</span></a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="listaUsuario.asp" style="color: white;">Lista de Usuários</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="./listaTarefa.asp" style="color: white;">Lista de Tarefas</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="usuarioCadastro.asp" style="color: white;">Cadastro de Usuários</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="TarefaCadastro.asp" style="color: white;">Cadastro de Tarefas</a>
				</li>
			</ul>
		</div>
	</nav>
</header>
<body style="background-color: #c9f5ef;">

	<div class="boxInicial shadow">
		<div class="row">
			<a href="listaUsuario.asp">
				<div class="card col mb-3 mt-5" style="max-width: 18rem;background-color: gray; margin-left: 125px;">
					<div class="card-header text-dark"><h5 style="color: black;">Listagem de Usuários</h5></div>
					<div class="card-body">
						<img id="listagem" src="imagens/listagemUsuario.png">
					</div>
				</div>
			</a>
			<a href="listaTarefa.asp">
				<div class="card col mb-3 mt-5" style="max-width: 18rem;background-color: gray; margin-left: 125px;">
					<div class="card-header text-dark"><h5 style="color: black;">Listagem de Tarefas</h5></div>
					<div class="card-body">
						<img id="listagem" src="imagens/listagemTarefa.png">
					</div>
				</div>
			</a>
		</div>
		<div class="row">
			<a href="usuarioCadastro.asp">
				<div class="card col mb-3 mt-5" style="max-width: 18rem;background-color: gray; margin-left: 125px;">
					<div class="card-header text-dark"><h5 style="color: black;">Cadastro de Usuários</h5></div>
					<div class="card-body">
						<img id="listagem" src="imagens/cadastroUsuario.png">
					</div>
				</div>
			</a>
			<a href="TarefaCadastro.asp">
				<div class="card col mb-3 mt-5" style="max-width: 18rem;background-color: gray; margin-left: 125px;">
					<div class="card-header text-dark"><h5 style="color: black;">Cadastro de Tarefas</h5></div>
					<div class="card-body">
						<img id="listagem" src="imagens/cadastroTarefa.png">
					</div>
				</div>
			</a>
		</div>
	</div>
</body>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</html>