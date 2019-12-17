<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/13
  Time: 16:59
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
    <span style="margin-left: 421px;">请输入：</span><input id="osgt" type="text" class="osgt"placeholder="学号"><br>
    <button class="gbtn" onclick="ajaxfindone()">查看一个学生成绩</button>
    <table>
        <tbody id="text">
        </tbody>
    </table>
</div>


</body>
</html>
