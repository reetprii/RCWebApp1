<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Lisa või muuda asutus</title>
	<link href="<c:url value='/resources/style.css' />" rel="stylesheet" />
</head>
<body>
	<div align="center">
		<h1>Lisa või muuda asutus</h1>
		<form:form action="saveCompany" method="post" modelAttribute="company">
		<table class="formtable">
			<form:hidden path="id"/>
			<tr>
				<th>Nimi:</th>
				<td><form:input path="name" /></td>
			</tr>
			<tr>
				<th>Aadress:</th>
				<td><form:input path="address" /></td>
			</tr>
			<tr>
				<th>Grupp:</th>
				<td>
					<form:select path="type_id">
				   		<option value="1" <c:if test="${1 eq company.getType_id()}">selected='selected'</c:if> label="Söögikohad" />
				   		<option value="2" <c:if test="${2 eq company.getType_id()}">selected='selected'</c:if> label="Remonditöökojad" />
				   		<option value="3" <c:if test="${3 eq company.getType_id()}">selected='selected'</c:if> label="Riigiasutused" />
				   		<option value="4" <c:if test="${4 eq company.getType_id()}">selected='selected'</c:if> label="Kinod" />
					</form:select>
					<br /><font color='red'><form:errors path='type_id' /></font>
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="right"><input type="submit" value="Salvesta"></td>
			</tr>
		</table>
		</form:form>
	</div>
	<div>
			<a href="<c:url value='/' />">&lt; Tagasi</a>
		</div>
</body>
</html>