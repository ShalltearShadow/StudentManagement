<%@ page import="dao.StudentDAO" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/13
  Time: 9:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="student" class="data.StudentBean" scope="session"/>

<html>
<head>
    <link rel="shortcut icon" href="#" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/table.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js" ></script>
</head>
<body>
    <div class="pane" id="alterIntroduce">
    <form action="${pageContext.request.contextPath}/student-infomation/alterintroduce.jsp" method="post">
        <p>新简介：</p><br>
        <input id="alterIntroduceText" name="introduce" type="text" required/>
        <input  class="sub" type="submit" id="alterIntroduceSurebtn" >
    </form>
</div>


    <%
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("UTF-8");
        String a = request.getParameter("introduce");
        if (!(a==null||a.equals(""))) {
            student.setIntroduce(a);
            session.setAttribute("student",student);
            StudentDAO.alterStudentByBean(student);
            response.sendRedirect("../studentindex.jsp?flag=2");
        }
    %>
</body>
</html>
