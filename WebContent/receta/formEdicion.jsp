<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Editar receta</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col">
				<h2>Edicion de una receta</h2>
				<p>Editar y guardar</p>

				<form action="${pageContext.request.contextPath}/receta/cambiar"
					method="POST">
					<input type="hidden" name="id" value="${receta.id}"/>
					<label for="nombre">Nombre</label>
					<input type="text" maxlength="64" size="50" name="nombre" id="nombre" value="${receta.nombre}" /><br>
					<label for="descripcion">Descripción</label>
					<input type="text" maxlength="256" size="100" name="descripcion" id="descripcion" value="${receta.descripcion}"/><br>
					<label for="elavoracion">Elavoración</label><br>
					<textarea rows="10" cols="100" name="elavoracion" id="elavoracion">${receta.elavoracion}</textarea><br>
					
					<input type="submit" value="Guardar receta" name="guardar" />
				</form>

				<!-- tabla de ingredientes -->
				<table border="1">
					<thead>
						<tr>
							<th>id</th>
							<th>nombre</th>
							<th>cantidad</th>
							<th>accion</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${receta.ingredientes}" var="ingrediente">
							<tr>
								<td>${ingrediente.alimento.id}</td>
								<td>${ingrediente.alimento.nombre}</td>
								<td><input id="cantidadAlimento${ingrediente.alimento.id}" name="cantidadAlimento" value="${ingrediente.cantidad}"/></td>
								<td>
									<a href="${pageContext.request.contextPath}/ingrediente/eliminar?id=${ingrediente.id}&idReceta=${receta.id}">Eliminar ingrediente</a>
									<a href="${pageContext.request.contextPath}/alimento/ver?id=${ingrediente.alimento.id}">Ver alimento</a>
									<a href="${pageContext.request.contextPath}/alimento/editar?id=${ingrediente.alimento.id}">Editar alimento</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<!-- anadir ingrediente a receta -->
				<form action="${pageContext.request.contextPath}/receta/anadir/ingrediente" method="post">
					<input type="hidden" name="idReceta" value="${receta.id}"/>
					<select name="alimento">
						<option value=""></option>
						<c:forEach items="${alimentos}" var="alimento">
							<option value="${alimento.id}">${alimento.nombre}</option>
						</c:forEach>
					</select>
					<input type="number" name="cantidad" value="0"/>
					<input type="submit" value="Anadir ingrediente a receta" name="guardar" />
				</form>


			</div>
		</div>
	</div>
</body>
</html>