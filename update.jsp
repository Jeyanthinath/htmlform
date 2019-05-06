<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><script type="text/javascript">
$(document).ready(function() {
	$(function() {
		$("#dob").datepicker({dateFormat:'yy-mm-dd'});
	});
	
});

</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<s:form action="Updateaction" enctype="multipart/form-data" method="post">
<s:iterator value="list">
<table border ="2">
<tr>

<s:textfield name="userid" id="userid" label="USERID" value="%{userid}"/>
<s:textfield name="name" id="name" label="USERNAME" value="%{name}"/>
<s:radio list="#{'1':'male', '2':'female'}" name="gender" label="GENDER" value="%{gender}"/>
<s:textfield name="email" label="EMAIL" value="%{email}"/>
<s:select list="#{'':'select','1':'BCA','2':'MCA','3':'BSE','4':'MSE','5':'B.E','6':'ME','7':'DIPLOMO'}" name="qualification" label="QUALIFICATION" value="%{qualification}"/>
<s:textfield name="dob" id="dob" label="DOB" value="%{dob}"/>
<s:textarea name="address" label="ADDRESS" value="%{address}"/>
<s:textfield name="contactno" label="CONTACTNO" value="%{contactno}"/>
<s:textfield name="pincode" label="PINCODE" value="%{pincode}"/>
<s:checkboxlist list="{'TECHNICAL','JAPANESH','STUDENT'}" name="desigantion" label="DESIGNATION" value="%{designation}"/>
<s:file name="image" label="IMAGE" value="%{image}"/>
<s:hidden name="hideupdate" id="hideupadte" value="%{userid}"/>
<s:submit value="UPDATE"/>
<s:reset value="reset"/>
</tr>
</table>
</s:iterator>
</s:form>
</body>
</html>