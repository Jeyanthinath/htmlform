<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="/struts-tags" prefix="s"%>
    <%String sess=(String)session.getAttribute("name");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>WELCOME<%= sess%>

<s:form action="changepswd">
<s:password name="oldpswd" label="OLD PASSWORD"/>
<s:password name="newpswd" label="NEW PASSWORD"/>
<s:password name="confpswd" label="CONFIRMPASSWORD"/>
<input type="hidden" name="hidpswd" value="<%=sess%>">
<s:submit value="submit">
</s:submit>
</s:form>

</body>
</html>