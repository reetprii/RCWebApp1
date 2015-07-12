<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta charset="utf-8">
	<title>Anna oma hinnang asutusele</title>
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
	<div class="page-container">
		<div class="navbar navbar-default navbar-fixed-top" role="navigation">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="offcanvas"
						data-target=".sidebar-nav">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<h1>Valige hindamiseks asutus</h1>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row row-offcanvas row-offcanvas-left">

				<!-- sidebar -->
				<div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar"
					role="navigation">
					<ul class="nav">
						<li <c:if test="${param.id == '1' || empty param.id}">class="active"</c:if> ><a href="<c:url value="/type?id=1" />">Söögikohad</a></li>
						<li <c:if test="${param.id == '2'}">class="active"</c:if> ><a href="<c:url value="/type?id=2" />">Remonditöökojad</a></li>
						<li <c:if test="${param.id == '3'}">class="active"</c:if> ><a href="<c:url value="/type?id=3" />">Riigiasutused</a></li>
						<li <c:if test="${param.id == '4'}">class="active"</c:if> ><a href="<c:url value="/type?id=4" />">Kinod</a></li>
					</ul>
				</div>

				<!-- main area -->
				<div class="col-xs-12 col-sm-9">
					<div>.</div>
					<c:if test="${empty listCompany}">
						<div class="row">
							<div class="alert alert-warning" role="alert">Antud gruppi ei ole asutusi veel lisatud.</div>
						</div>
					</c:if>
					<c:if test="${not empty listCompany}">
					
					
					<table class="table table-striped" >
						<thead>
							<tr>
								<th>Nimi</th>
								<th>Asutus</th>
								<th>Keskmine hinne</th>
								<th>Hinnatud (korda)</th>
								<th>Admin</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="company" items="${listCompany}"
								varStatus="status">
								<tr id="${status.index + 1}"
									class="${status.index % 2 == 0 ? 'even' : 'odd'}">
									<td><a
										href="<c:url value="/newRating?id=" />${company.id}">${company.name}</a></td>
									<td>${company.address}</td>
									<td>${company.averageRating}</td>
									<td>${company.totalCount}</td>
									<td><a href="editCompany?id=${company.id}">Muuda</a>
										&nbsp;&nbsp;&nbsp;&nbsp; 
										<%-- TODO: confirmation dialog 
										 <a href="deleteCompany?id=${company.id}">Kustuta</a> --%>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					</c:if>
				</div>
				<!-- /.col-xs-12 main -->

			</div>
		</div>
		<div class="row">
			<p class="text-center"><a href="newCompany" class="pull-center">Lisa asutus</a></p>
		</div>
	</div>

<script type='text/javascript' src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type='text/javascript' src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
</body>
</html>
