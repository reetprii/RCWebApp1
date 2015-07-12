<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta charset="utf-8">
	<title>Lisa või muuda asutus</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
	<link href="<c:url value="/resources/style.css" />" rel="stylesheet" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<!--[if lt IE 9]>
	          <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
	        <![endif]-->
</head>

<%-- <body>
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
</body> --%>
<body>
	<div class="container">
	    <div class="row">
	        <div class="col-sm-6 col-md-4 col-md-offset-4">
	
				<h1>Lisa või muuda asutus</h1>
				<form:form action="saveCompany" method="post" modelAttribute="company" class="form-horizontal">
					<div class="input-group">
						<div class="form-group">
							<label for="name" class="control-label col-md-3">Nimi:</label> 
							<form:input path="name" class="form-control" id="name"/>
							<br /><font color='red'><form:errors path='name' /></font>
							<form:hidden path="id"/>
						</div>
						<div class="form-group">
							<label for="address" class="control-label col-md-3">Aadress:</label> 
							<form:input path="address" class="form-control" id="address"/>
							<br /><font color='red'><form:errors path='address' /></font>
						</div>
						<div class="form-group">
							<label for="type_id" class="control-label col-md-3">Grupp:</label> 
							<form:select path="type_id" id="type_id">
						   		<option value="1" <c:if test="${1 eq company.getType_id()}">selected='selected'</c:if> >Söögikohad</option>
						   		<option value="2" <c:if test="${2 eq company.getType_id()}">selected='selected'</c:if> >Remonditöökojad</option>
						   		<option value="3" <c:if test="${3 eq company.getType_id()}">selected='selected'</c:if> >Riigiasutused</option>
						   		<option value="4" <c:if test="${4 eq company.getType_id()}">selected='selected'</c:if> >Kinod</option>
							</form:select>
							<br /><font color='red'><form:errors path='type_id' /></font>
						</div>
						<div class="form-group">
							<a href="<c:url value='/' />" class="btn btn-secondary pull-left btn-sm">&lt; Tagasi</a>
							<button type="submit" class="btn btn-primary pull-right">Salvesta</button>
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>