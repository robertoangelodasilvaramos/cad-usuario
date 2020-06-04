<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html">
<title>Lista de Usuarios</title>
<spring:url value="/static/css/bootstrap.css" var="css" />
<link rel="stylesheet" href="${ css }" />
</head>
<body>
	<div class="container">
		<h1>Lista de Usuários</h1>
		<hr>
		<div>
			<spring:url value="/usuario/cadastro" var="cadastro" />
			<a class="btn btn-outline-info" href="${ cadastro }">Novo Usuário</a>

		</div>
		<hr>

		<div class="panel-default">

			<div >
				<div class="${ message == null ? 'panel-default' : 'alert alert-success' }">
					<span>${ message == null ? '&nbsp;' : message }</span>
				</div>
			</div>
			<table class="table table-striped table-condensed">
				<thead class="thead-dark">
					<tr>
						<th>ID</th>
						<th>Nome</th>
						<th>Data de Nascimento</th>
						<th>Sexo</th>
						<th>Ação</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="usuario" items="${ usuarios }">
						<tr>
							<td>${ usuario.id }</td>
							<td>${ usuario.nome }&nbsp;${ usuario.sobrenome }</td>
							<td><f:parseDate var="date"
									value="${ usuario.dtNascimento }" pattern="yyyy-MM-dd"
									type="date" /> <f:formatDate value="${date }"
									pattern="dd/MM/yyyy" type="date" /></td>
							<td>${ usuario.sexo.desc }</td>
							<td><spring:url value="/usuario/update/${ usuario.id }"
									var="update" /> <a class="btn btn-info" href="${ update }">Editar</a>
								<spring:url value="/usuario/delete/${usuario.id}" var="delete" />
								<a  class="btn btn-danger" href="javascript:del(${categoria.codigo})">Excluir</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<hr>
		<footer class="footer">&copy;Roberto</footer>
	</div>
<script type="text/javascript">

function del(codigo) {  
    if (confirm('Excluir o Usuário?')) {  
        location.href = '${ delete }';
    }
}
</script>



</body>


</html>