<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/9
  Time: 13:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/register.css">
</head>
<body>
<div class="main">
    <div class="welcome">欢迎注册(っ•̀ω•́)っ✎⁾⁾ <br>
        *:ஐ٩(๑´ᵕ`)۶ஐ:* 学习使我进步
    </div>
    <div class="pane">
        <form action="helpRegister" method="post">
            <div class="in"><span>昵称</span><input type="text" name="cname" required></div>
            <div class="in"><span>姓名</span><input type="text" name="name" required></div>
            <div class="in"><span>密码</span><input type="password" name="passwd" required></div>
            <input id="sub" type="submit" value="注册">
        </form>
    </div>
</div>
</body>
</html>
