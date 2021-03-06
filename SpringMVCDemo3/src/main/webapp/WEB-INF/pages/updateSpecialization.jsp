<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<title>Update a specialization</title>
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
	<form action="confirmUpdateSpecialization" method="POST">
		<input type="hidden" name="updateID" value="${targetSpec.id}" />
		<table border="1" style="width: 50%">
			<tr>
				<th align="left" width="30%">Name:</th>
				<td align="left" width="70%"><input  type="text" name="updateName" value="${targetSpec.name}"/></td>
			</tr>
			<tr>
				<th align="left" width="30%">Number of credit:</th>
				<td align="left" width="70%"><input type="text" name="updateCredit" value="${targetSpec.creditNumber}"></td>
			</tr>
		</table>
		<br /> <input style="height: 50px" type="submit" value="Update specialization" />
	</form>
</body>
</html>