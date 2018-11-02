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
	<h3>Add a student</h3>
	<form action="saveStudent" method="POST">
		<table border="1" style="width: 50%">
			<tr>
				<th align="left" width="30%">First Name:</th>
				<td align="left" width="70%"><input type="text"
					name="addFirstName"></td>
			</tr>
			<tr>
				<th align="left" width="30%">Last Name:</th>
				<td align="left" width="70%"><input type="text"
					name="addLastName"></td>
			</tr>
			<tr>
				<th align="left" width="30%">Email:</th>
				<td align="left" width="70%"><input type="text" name="addEmail"></td>
			</tr>
			<tr>
				<th align="left" width="30%">Gender:</th>
				<td align="left" width="70%">


					<table style="width: 100%">
						<tr>
							<td width="10%"><p>Male</p></td>
							<td width="40%"><input type="radio" name="addGender"
								value="male" checked="checked"></td>
							<td width="10%"><p>Female</p></td>
							<td width="40%"><input type="radio" name="addGender"
								value="female"></td>
						</tr>
					</table>
				</td>
			</tr>

			<tr>
				<th>Specialization:</th>
				<td><select style="width: 100%" name="addSpecialization">
						<c:forEach items="${listSpec}" var="spec">
							<option value="${spec.id}">${spec.name}</option>
						</c:forEach>
				</select></td>
			</tr>
		</table>
		<br /> <input style="height: 50px" type="submit" value="Add student" />
	</form>
</body>
</html>