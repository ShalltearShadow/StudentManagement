<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/13
  Time: 22:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="dao.TeacherDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="teacher" class="data.TeacherBean" scope="session"/>
<html>
<head>
    <link rel="shortcut icon" href="#" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/table.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js" ></script>
    <%
        String tname = teacher.getTname();
    %>
</head>
<body>
<div class="pane" id="alterCname">
    <form action="${pageContext.request.contextPath}/teacher-infomation/altertname.jsp" method="post">
        <p >原名称：<%=tname%></p>
        <p >新名称：</p>
        <input name="tname" type="text" required/>
        <input class="sub" type="submit" />
    </form>

</div>

<%
    response.setContentType("text/html;charset=UTF-8");
    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("UTF-8");
    String a = request.getParameter("tname");
    if (!(a==null||a.equals(""))) {
        teacher.setTname(a);
        session.setAttribute("teacher",teacher);
        TeacherDAO.alterTeacherByBean(teacher);
        response.sendRedirect("../teacherindex.jsp?flag=1");
    }
%>
</body>
</html>

