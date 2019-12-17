<%@ page import="dao.StudentDAO" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/13
  Time: 19:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="shortcut icon" href="#" />

    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js" ></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/table.css">

</head>
<body>
<div  style="font-size: 24px;">
    <form action="" >
        <span STYLE="margin-left: 423px;">请输入：</span><input id="delosgt" type="text" class="osgt" name="delt" placeholder="账号" required><br>
        <input type="submit" class="gbtn" value="删除教师账号" >
    </form>
</div>


</body>
</html>
