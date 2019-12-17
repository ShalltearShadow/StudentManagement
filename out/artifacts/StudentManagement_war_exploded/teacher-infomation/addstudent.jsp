<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/13
  Time: 18:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/addstu.css"></head>
<body>
    <div class="pane">
        <form action="helpRegister" method="post">
            <div class="ins"><span class="insp">昵称</span><input type="text" name="cname" required></div>
            <div class="ins"><span class="insp">姓名</span><input type="text" name="name" required></div>
            <div class="ins"><span class="insp">math成绩</span><input type="text" name="math" required></div>
            <div class="ins"><span class="insp">os成绩</span><input type="text" name="os" required></div>
            <div class="ins"><span class="insp">java成绩</span><input type="text" name="java" required></div>
            <input id="sub" type="submit" value="注册">
        </form>
    </div>
</body>
</html>
