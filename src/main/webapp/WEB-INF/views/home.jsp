<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width">
<title>Anna oma hinnang asutusele</title>
<link href="<c:url value="/resources/style.css" />" rel="stylesheet" />

</head>
<body>
	<h1>Valige asutus mida hinnata</h1>
	<div class="wrap">
		<nav>
			<ul class="primary">
				<li><a href="<c:url value="/type?id=1" />">Söögikohad</a></li>
				<li><a href="<c:url value="/type?id=2" />">Remonditöökojad</a></li>
				<li><a href="<c:url value="/type?id=3" />">Riigiasutused</a></li>
				<li><a href="<c:url value="/type?id=4" />">Kinod</a></li>
			</ul>
		</nav>
	</div>
	<div align="center">

		<table class="list" cellspacing='0'>
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
				<c:forEach var="company" items="${listCompany}" varStatus="status">
					<tr id="${status.index + 1}"
						class="${status.index % 2 == 0 ? 'even' : 'odd'}">
						<td><a href="<c:url value="/newRating?id=" />${company.id}">${company.name}</a></td>
						<td>${company.address}</td>
						<td>${company.averageRating}</td>
						<td>${company.totalCount}</td>
						<td><a href="editCompany?id=${company.id}">Muuda</a>
							&nbsp;&nbsp;&nbsp;&nbsp; <a href="deleteCompany?id=${company.id}">Kustuta</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<h3><a href="newCompany">Lisa asutus</a></h3>
		
</body>
</html>
