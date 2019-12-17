<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/12
  Time: 17:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="teacher" class="data.TeacherBean" scope="session"/>

<html>
<head>
    <%
        String num = teacher.getTno();
        String name = teacher.getTname();
        String course = teacher.getCoures();
        String phone = teacher.getPhone();
    %>
    <link rel="shortcut icon" href="#" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/table.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js" ></script>
</head>
<body>
<div  id="infomation">
    <table>
        <tr> <td>账号</td> <td class="con"><%=num%></td> </tr>
        <tr> <td>姓名</td> <td class="con"><%=name%></td> </tr>
        <tr> <td>任课</td> <td class="con"><%=course%></td> </tr>
        <tr> <td>电话</td> <td class="con"><%=phone%></td> </tr>
    </table>
</div>
</body>
</html>