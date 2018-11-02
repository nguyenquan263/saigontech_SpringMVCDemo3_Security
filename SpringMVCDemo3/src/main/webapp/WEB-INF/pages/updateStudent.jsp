<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<title>Add a specialization</title>
<style>
td>input {
	margin: 0;
	height: 100% !important;
	display: inline-block;
	width: 98%;
	border-radius: 0 !important;
}
</style>
</head>
<body>
	<h3>Update a student</h3>
	<form action="confirmUpdateStudent" method="POST">
		<input type="hidden" name="updateID" value="${targetStu.id}" />
		<table border="1" style="width: 50%">
			<tr>
				<th align="left" width="30%">First Name:</th>
				<td align="left" width="70%"><input type="text"
					name="updateFirstName" value="${targetStu.firstName}"></td>
			</tr>
			<tr>
				<th align="left" width="30%">Last Name:</th>
				<td align="left" width="70%"><input type="text"
					name="updateLastName" value="${targetStu.lastName}"></td>
			</tr>
			<tr>
				<th align="left" width="30%">Email:</th>
				<td align="left" width="70%"><input type="text" name="updateEmail" value="${targetStu.email}"></td>
			</tr>
			<tr>
				<th align="left" width="30%">Gender:</th>
				<td align="left" width="70%">


					<table style="width: 100%">
						<tr>
							<td width="10%"><p>Male</p></td>
							<td width="40%"><input type="radio" name="updateGender" ${targetStu.isMale == true ? "checked='checked'":""} 
								value="male"></td>
							<td width="10%"><p>Female</p></td>
							<td width="40%"><input type="radio" name="updateGender" ${targetStu.isMale == false ? "checked='checked'":""}
								value="female"></td>
						</tr>
					</table>
				</td>
			</tr>

			<tr>
				<th>Specialization:</th>
				<td><select style="width: 100%" name="updateSpecialization">
						<c:forEach items="${listSpec}" var="spec">
							
							
							<c:choose>
								<c:when test="${targetStu.specialization.id eq spec.id}">
	        						<option value="${spec.id}" selected>${spec.name}</option>
								</c:when>
								<c:otherwise>
	       							<option value="${spec.id}">${spec.name}</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
				</select></td>
			</tr>
		</table>
		<br /> <input style="height: 50px" type="submit" value="Add student" />
	</form>
</body>
</html>