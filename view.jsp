<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="/struts-tags" prefix="s"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <%String Sess=(String)session.getAttribute("name");
    out.println(Sess);
%>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src="jquery-1.10.2.js"></script>
<script type="text/javascript" src="jquery-ui.js"></script>
<link href="https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel="stylesheet">
<title>Insert title here</title>
<script type ="text/javascript">
function viewfn(value)
{
	alert(value);
	$("#hidview").val(value);
	$("#viewform").submit();
}	
	
function active(val)
{
	alert(val);
$("#hideactive1").val(val);
$("#view").submit();
}
function gender(val)
{
	alert(val);
$("#gender").val(val);
$("#view").submit();
}
function sorting(value)
{
	alert(value);
$("#hidsort").val(value);
$("#view").submit();
}

function downloadpdf(name)
{
	alert();
	$("#hidpdfid").val(name);
	$("#pdfform").submit();
}
</script>
</head>


<s:form name="view" id="view" action="viewrecords">
<body>	
<s:a href="javascript:active(1);">ACTIVE</s:a><br>
<s:a href="javascript:active(0);">INACTIVE</s:a><br>
<input type="hidden" name="hideactive1" id="hideactive1">
<s:a href="javascript:gender(1);">MALE</s:a><br>
<s:a href="javascript:gender(2);">FEMALE</s:a><br>
<input type="hidden" name="gender" id="gender">
<select name="sort" onchange="sorting(value)">
<option>....SELECT....</option>
<option value="username">NAME</option>
<option value="email">EMAIL</option>
<option value="password">PASSWORD</option>
<option value="address">ADDRESS</option>
</select>
<input type="hidden" name="hidsort" id="hidsort">

<table border ="2">
<s:textfield name="search1" label="search1"/>
<s:submit value="..SEARCH.."/>
</table>
</s:form>

<s:form name="viewform" id="viewform" action="viewfn">
<input type="hidden" name="hidview" id="hidview">
</s:form>


<table border ="2">

<tr>

<td>USERID</td>
<td>USERNAME</td>
<td>EMAIL</td>
<td>GENDER</td>
<td>ADDRESS</td>
<td>PINCODE</td>
<td>image</td>
</tr>
<c:forEach var="emp" items="${emplist}">
<tr>
<%-- <td><a href="<c:url value='javascript:viewfn('${emp.userid}')'/>">${emp.userid}</a></td> --%>
<td><a href="<c:url value='javascript:viewfn(${emp.id})'/>">${emp.userid}</a></td>
<td>${emp.name}</td>
<td>${emp.email}</td>
<td>${emp.gender}</td>
<td>${emp.address}</td>
<td>${emp.pincode}</td>
<td><img src="image/${emp.image}" width=50 height=50>
</tr>
</c:forEach>
</table>
<table>
<tr>
<c:if test="${currentpage!=1 }">
<td><a href="viewrecords.action?page=${currentpage-1 }">previous</a></td>
</c:if>
<c:forEach begin="1" end="${pages}" var="i">
<c:choose>
<c:when test="${currentpage eq i}">
<td>${i}</td>
</c:when>
<c:otherwise>
<td><a href="viewrecords.action?page=${i}">${i}</a></td>
</c:otherwise>
</c:choose>
</c:forEach>
<c:if test="${currentpage lt pages }">
<td><a href="viewrecords.action?page=${currentpage+1}">next</a></td>
</c:if>
</tr>

</table>
<a href="javascript:downloadpdf('<%= Sess%>')">Download Pdf</a>
<a href="excel.action">click to excel download</a>
<%-- <s:iterator value="list">
<tr>
<td><a href="javascript:viewfn('${userid}')"><s:property value="userid"/></a></td>

<td><s:property value="name"/>
<td><s:property value="email"/>
<td><s:property value="gender"/>           
<td><s:property value="address"/>
<td><s:property value="pincode"/>
<td><s:property value="designation"/></td>
<td><img src="image/<s:property value="image"/>" width=50 height=50>
</s:iterator> --%>

<s:form id="pdfform" action="pdfform">
<s:hidden name="hidpdfid" id="hidpdfid"></s:hidden>
</s:form>
</body>

</html>


