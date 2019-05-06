<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="model.Modeldao"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<html>
<head>
<title>View</title>
</head>
<body>
<body style="background-color:lime;">

   YOUR name, <s:property value="name"/><br>
   
   YOUR email, <s:property value="email"/><br>
  
   YOUR gender, <s:property value="gender"/><br>
  YOUR qualification, <s:property value="qualification"/><br>
   
  YOUR DOB, <s:property value="dob"/><br>
  YOUR address, <s:property value=" address"/><br>
  YOUR contactNo, <s:property value="contactno"/><br>
  YOUR PINCODE, <s:property value="pincode"/><br>
   YOUR Password, <s:property value="password"/><br>
                
   YOUR Designation, <s:property value="designation"/><br>
     YOUR userid, <s:property value="userid"/><br>
  
   YOUR image, <s:property value="image"/><br>
  
</body>
</html>