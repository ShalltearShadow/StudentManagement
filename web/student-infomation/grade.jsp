<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/12
  Time: 19:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="student" class="data.StudentBean" scope="session"/>

<html>
<head>
    <%
        String java = student.getJava();
        String os = student.getOs();
        String math = student.getMath();
    %>
    <link rel="shortcut icon" href="#" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/table.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js" ></script>
</head>
<body>
<div  id="infomation">
    <table>
        <tr><td>课程名</td><td>成绩</td></tr>
        <tbody>
        <tr> <td>java</td> <td><%=java%></td> </tr>
        <tr> <td>os</td> <td><%=os%></td> </tr>
        <tr> <td>math</td> <td><%=math%></td> </tr>
        </tbody>
    </table>
</div>
</body>
</html>
