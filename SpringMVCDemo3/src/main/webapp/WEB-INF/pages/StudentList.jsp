<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Student List</title>

</head>
<%
	String noti = request.getParameter("notification");

	if (noti == null)
		noti = "";
%>
<body>
	<h2>List of Student</h2>

	<h4 style="color: red"><%=noti%></h4>
	<form action="deleteStudent" method="GET">
		<table border="1" style="width: 100%">
			<tr>
				<th width="10%">No.</th>
				<th width="15%">Last Name</th>
				<th width="15%">First Name</th>
				<th width="25%">Email</th>
				<th width="10%">Gender</th>
				<th width="20%">Specialization</th>
				<th width="5%"><input type="submit" value="Delete" /></th>

			</tr>
			<c:forEach items="${listStudent}" var="student" varStatus="loop">

				<tr>
					<td>${loop.index + 1}</td>
					<td>${student.lastName}</td>
					<td><a href="updateStudent?idUpdate=${student.id}">${student.firstName}</a></td>
					<td>${student.email}</td>
					<td><c:choose>
							<c:when test="${student.isMale==true}">
        						Male 
							</c:when>
							<c:otherwise>
       							Female
							</c:otherwise>
						</c:choose></td>
					<td>${student.specialization.name}</td>
					<td><input type="checkbox" name="idDelete"
						value="${student.id}" /></td>
				</tr>

			</c:forEach>
		</table>
	</form>
</body>
<br />
<a href="addStudent"><button style="height: 50px">ADD
		STUDENT</button></a>
</html>