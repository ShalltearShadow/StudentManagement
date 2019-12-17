<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/12
  Time: 17:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="student" class="data.StudentBean" scope="session"/>

<html>
<head>
    <%
        String num = student.getNumber();
        String name = student.getName();
        String pwd = student.getPasswd();
        String cname = student.getCname();
        String introduce = student.getIntroduce();
    %>
    <link rel="shortcut icon" href="#" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/table.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js" ></script>
</head>
<body>
<div  id="infomation">
    <table>
        <tr> <td>学号</td> <td class="con"><%=num%></td> </tr>
        <tr> <td>姓名</td> <td class="con"><%=name%></td> </tr>
        <tr> <td>昵称</td> <td class="con"><%=cname%></td> </tr>
        <tr> <td>简介</td> <td class="con"><%=introduce%></td> </tr>
    </table>
</div>
</body>
</html>