<%@ page import="dao.StudentDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="student" class="data.StudentBean" scope="session"/>
<html>
<head>
    <link rel="shortcut icon" href="#" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/table.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js" ></script>
    <%
        String cname = student.getCname();
    %>
</head>
<body>
<div class="pane" id="alterCname">
    <form action="${pageContext.request.contextPath}/student-infomation/altercname.jsp" method="post">
        <p >原昵称：<%=cname%></p>
        <p >新昵称：</p>
        <input id="alterCnameText" name="cname" type="text" required/>
        <input class="sub" type="submit" id="alterCnameSurebtn" />
    </form>

</div>

<%
    response.setContentType("text/html;charset=UTF-8");
    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("UTF-8");
    String a = request.getParameter("cname");
    if (!(a==null||a.equals(""))) {
        student.setCname(a);
        session.setAttribute("student",student);
        StudentDAO.alterStudentByBean(student);
        response.sendRedirect("../studentindex.jsp?flag=1");
    }
%>
</body>
</html>
