<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta charset="utf-8">
	<title>Lisa hinnang</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
	<link href="<c:url value="/resources/style.css" />" rel="stylesheet" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<!--[if lt IE 9]>
	          <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
	        <![endif]-->
</head>

<body>
	<div class="container">
	    <div class="row">
	        <div class="col-sm-6 col-md-4 col-md-offset-4">
	
				<h1>Lisa hinnang > ${companyName}</h1>
				<form:form action="saveRating" method="post" modelAttribute="rating" class="form-horizontal">
					<div class="input-group">
						<div class="form-group">
							<label for="name" class="control-label col-md-3">Nimi:</label> 
							<form:input path="name" class="form-control" id="name"/>
							<br /><font color='red'><form:errors path='name' /></font>
							<form:hidden path="id"/>
							<form:hidden path="company_id"/>
						</div>
						<div class="form-group">
							<label for="comment" class="control-label col-md-3">Kommentaar:</label> 
							<form:textarea path="comment" rows="10" cols="40" id="comment" class="form-control " />
							<br /><font color='red'><form:errors path='comment' /></font>
						</div>
						<div class="form-group">
							<label for="vote" class="control-label col-md-3">Hinnang:</label> 
							<form:select path="vote" id="vote">
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
						</div>
						<div class="form-group">
							<a href="<c:url value='/' />" class="btn btn-secondary pull-left btn-sm">&lt; Tagasi</a>
							<button type="submit" class="btn btn-primary pull-right">Saada!</button>
						</div>
					</div>
				</form:form>
						
				<section>
					<c:if test="${not empty listRating}"><h2>Teiste hinnangud</h2></c:if>
					<c:forEach var="ratingitem" items="${listRating}" varStatus="status">
							<hr></hr>
								<div class="media">
									<div class="media-body">
										<h4 class="media-heading">
											${ratingitem.name} <small>${ratingitem.vote}/10</small>
										</h4>
										${ratingitem.comment}
										<div class="media"></div>
									</div>
								</div>
							</c:forEach>
				</section>
			
			</div>
		</div>
	</div>
</body>
</html>