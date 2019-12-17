<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/13
  Time: 21:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/addstu.css"></head>
<body>
<div class="pane">
    <form action="AlterStudent" method="post">
        <p>请输入待修改学生的学号：</p>
        <div class="in"><span class="insp">学号</span><input type="text" name="sno" required></div>
        <br>
        <p>请输入新成绩：</p>
        <div class="in"><span class="insp">math成绩</span><input type="text" name="math" required></div>
        <div class="in"><span class="insp">os成绩</span><input type="text" name="os" required></div>
        <div class="in"><span class="insp">java成绩</span><input type="text" name="java" required></div>
        <input id="sub" type="submit" value="修改">
    </form>


</div>
</body>
</html>
