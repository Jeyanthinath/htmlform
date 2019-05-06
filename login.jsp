<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="jquery-1.10.2.js"></script>
<script type="text/javascript" src="jquery-ui.js"></script>
<link href="https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel="stylesheet">
<script type="text/javascript">
$(document).ready(function() {
	$(function() {
		$("#dob").datepicker({dateFormat:'dd-mm-yy'});
	});
	
});

</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script>
/* $(document).ready(function() {
	$(function() {
		$("#dob").datepicker({dateFormat:'yy-mm-dd'});
});
}); */
</script>
</head>
<body>
<body style="background-color:pink;">
<s:form action="Controlleraction" enctype="multipart/form-data" method="post">
<s:textfield name="name" label="NAME"/>
<s:radio list="#{'1':'male', '2':'female'}" name="gender" label="GENDER"/>
<s:textfield name="email" label="EMAIL"/>
<s:select list="#{'':'select','1':'BCA','2':'MCA','3':'BSE','4':'MSE','5':'B.E','6':'ME','7':'DIPLOMO'}" name="qualification" label="QUALIFICATION"/>
<s:textfield name="dob" id="dob" label="DOB"/>
<s:textarea name="address" label="ADDRESS"/>
<s:textfield name="contactno" label="CONTACTNO"/>
<s:textfield name="pincode" label="PINCODE"/>
<s:checkboxlist list="{'TECHNICAL','JAPANESH','STUDENT'}" name="desigantion" label="DESIGNATION"/>
<s:file name="image" label="IMAGE"/>
<%-- <s:password name="password" label="PASSWORD"/> --%>
<s:submit value="REGISTER"/><br>
<s:reset value="reset"/><br>
<h1><a href="log.jsp">LOGIN</a></h1>
</s:form>
</body>
</html>