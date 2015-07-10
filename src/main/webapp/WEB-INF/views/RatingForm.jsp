<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Lisa hinnang</title>
	<link href="<c:url value='/resources/style.css' />" rel="stylesheet" />
</head>
<body>
	<div align="center">
		<h1>Lisa hinnang</h1>
		<form:form action="saveRating" method="post" modelAttribute="rating">
		<table class="formtable">
			
			<tr>
				<th>Nimi:</th>
				<td class="left">
					<form:input path="name"/>
					<br /><font color='red'><form:errors path='name' /></font>
					<form:hidden path="id"/>
					<form:hidden path="company_id"/>
				</td>
			</tr>
			<tr>
				<th>Kommentaar:</th>
				<td>
					<form:textarea path="comment" rows="10" cols="40" />
					<br /><font color='red'><form:errors path='comment' /></font>
				</td>
			</tr>
			<tr>
				<th>Hinnang:</th>
				<td>
					<form:select path="vote">
				   		<form:option value="0" label="0"/>
				   		<form:option value="1" label="1"/>
				   		<form:option value="2" label="2"/>
				   		<form:option value="3" label="3"/>
				   		<form:option value="4" label="4"/>
				   		<form:option value="5" label="5"/>
				   		<form:option value="6" label="6"/>
				   		<form:option value="7" label="7"/>
				   		<form:option value="8" label="8"/>
				   		<form:option value="9" label="9"/>
				   		<form:option value="10" label="10"/>
					</form:select>
					<br /><font color='red'><form:errors path='vote' /></font>
				</td>
			</tr>
			<tr class="submit">
				<td colspan="2" >
					<input type="submit" value="Saada!">
				</td>
			</tr>
		</table>
		</form:form>
		<div>
			<a href="<c:url value='/' />">&lt; Tagasi</a>
		</div>
		
		<div class="comments">
			<c:if test="${not empty listRating}"><h2>Teiste hinnangud</h2></c:if>
			<c:forEach var="ratingitem" items="${listRating}" varStatus="status">
					<div class="comment">
						<header>${ratingitem.name} <span class="voted">${ratingitem.vote}/10</span></header>
						<p>${ratingitem.comment}</p>
					</div>
			</c:forEach>
		</div>
		


	</div>
</body>
</html>