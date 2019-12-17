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
    <form action="AlterTeacher" method="post">
        <p>请输入待修改教师的账号：</p>
        <div class="in"><span class="insp">账号</span><input type="text" name="tno" required></div>
        <br>
        <p>请输入信息：</p>
        <div class="in"><span class="insp">姓名</span><input type="text" name="tname" required></div>
        <div class="in"><span class="insp">任课</span><input type="text" name="course" required></div>
        <div class="in"><span class="insp">电话</span><input type="text" name="phone" required></div>
        <input id="sub" type="submit" value="修改">
    </form>


</div>
</body>
</html>
