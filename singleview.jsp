<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="model.Modeldao"%>
     <%@ taglib uri="/struts-tags" prefix="s"%>
     
  
  
     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src="jquery-1.10.2.js"></script>
<script type="text/javascript" src="jquery-ui.js"></script>
<link href="https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript">
function updateview(name)
{
$("#hidupdate").val(name);
$("#updateview").submit();
}
function delview(name)
{
$("#delfn").val(name);
$("#delete").submit();
}
</script>
<title>Insert title here</title>
</head>

<body>

<% String sess=(String)session.getAttribute("name");   
     String name=Modeldao.uname;
     out.println(sess+name);
     if(sess.equals(name))
    {
    %>
    <a href="javascript:updateview('<%= sess%>')">UPDATE</a> <br>
    <a href="changepswdform.action">CHANGE PASSWORD</a> <br>
    <a href="javascript:delview('<%= sess%>')">DELETE</a>  <br>
     <%}%>
     

<table border ="2">
<s:iterator value="list">
<tr>

<td>USERID</td>
<td><s:property value="userid"/>
</td>
</tr>
<tr>
<td>USERNAME</td>
   <td><s:property value="name"/>
   </tr>
   <tr>
<td>EMAIL</td>
   <td><s:property value="email"/>
   </td></tr>
   <tr>
<td>GENDER</td>
     <td><s:property value="gender"/>
     </td>
     </tr>
     <tr>
<td>ADDRESS</td>
   <td><s:property value="address"/>
   </td>
   </tr>
 <tr>  
<td>PINCODE</td>
    <td><s:property value="pincode"/>
    </td>
    </tr>
    <tr>
<td>IMAGE</td>
    <td><img src="image/<s:property value="image"/>" width=50 height=50>
    </td>
</tr>


</s:iterator>
</table>


<s:form id="updateview" action="updateview">
<s:hidden name="hidupdate" id="hidupdate"/>
</s:form>
<s:form id="delete" action="delete">

<s:hidden name="delfn" id="delfn"/>
</s:form>


</body>
</html>




