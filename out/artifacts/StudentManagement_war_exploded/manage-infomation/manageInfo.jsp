<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/12
  Time: 17:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="manage" class="data.ManageBean" scope="session"/>

<html>
<head>
    <%
        String gnum = manage.getGno();
        String gname = manage.getGname();
        String gpwd = manage.getGpwd();
    %>
    <link rel="shortcut icon" href="#" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/table.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js" ></script>
</head>
<body>
<div  id="infomation">
    <table>
        <tr> <td>账号</td> <td class="con"><%=gnum%></td> </tr>
        <tr> <td>姓名</td> <td class="con"><%=gname%></td> </tr>
        <tr> <td>密码</td> <td class="con"><%=gpwd%></td> </tr>
    </table>
</div>
</body>
</html>