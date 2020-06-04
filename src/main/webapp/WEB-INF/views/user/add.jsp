<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html">
<title>Cadastro de Usuários</title>
<spring:url value="/static/css/bootstrap.css" var="css"/>
<link rel="stylesheet" href="${ css }"/>

</head>
<body>

	<div class="container">
		<h1>Cadastro de Usuários</h1>
		<hr>
		<div>
		<spring:url value="/usuario/todos" var="home"/>
			<a class="btn btn-outline-info" href="${ home }">HOME</a>
		</div>
		<hr>
		<div>
		<spring:url value="${usuario.id == null ? '/usuario/save' : '/usuario/update'}" var="save"/>
			<form:form modelAttribute="usuario" action="${ save }" method="post">
			<form:hidden path="id"/>
				<div class="form-group">
					<label for="nome">Nome: </label> <form:input path="nome"
						class="form-control" />
						<form:errors path="nome" cssClass="alert alert-danger"/>
				</div>
				<div class="form-group">
					<label for="sobrenome">Sobrenome: </label> <form:input path="sobrenome"
						class="form-control" />
						<form:errors path="sobrenome" cssClass="alert alert-danger"/>
				</div>
				
				<div class="form-group">
					<label for="dtNascimento">Data Nascimento: </label> <form:input path="dtNascimento"
						class="form-control"  type="date" />
						<form:errors path="dtNascimento" cssClass="alert alert-danger"/>
				</div>
				<div class="form-group">
					<label for="sexo">Sexo: </label>
					<form:select path="sexo" class="form-control">
						<form:options items="${ sexos }" itemLabel="desc"/>
					</form:select>
				</div>
				<div class="form-group">
					<button type="submit" class="btn btn-primary">Confirmar</button>
				</div>
			</form:form>
		</div>
		<hr>
		<footer class="footer">&copy; 2020 Roberto Ângelo</footer>
	</div>
</body>


</html>