package controller;

import dao.StudentDAO;
import data.StudentBean;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AlterStudent extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("UTF-8");

        String num = request.getParameter("sno");
        String math = request.getParameter("math");
        String os = request.getParameter("os");
        String java = request.getParameter("java");

        StudentBean stu = StudentDAO.findStudentByID(num);

        stu.setMath(math);
        stu.setOs(os);
        stu.setJava(java);

        StudentDAO.alterStudentByBean(stu);

        String action = request.getHeader("referer");
        String [] strs = action.split("/");
        if (strs[4].equals("teacherindex.jsp"))
            response.sendRedirect("teacherindex.jsp?flag=9");
        else if (strs[4].equals("manageindex.jsp")){
            response.sendRedirect("manageindex.jsp?flag=9");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
