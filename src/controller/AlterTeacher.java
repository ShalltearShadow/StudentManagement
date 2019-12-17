package controller;

import dao.StudentDAO;
import dao.TeacherDAO;
import data.StudentBean;
import data.TeacherBean;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AlterTeacher extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("UTF-8");

        String tno = request.getParameter("tno");
        String tname = request.getParameter("tname");
        String course = request.getParameter("course");
        String phone = request.getParameter("phone");

        TeacherBean tea = TeacherDAO.findTeacherByID(tno);

        tea.setTname(tname);
        tea.setCoures(course);
        tea.setPhone(phone);

        TeacherDAO.alterTeacherByBean(tea);

        response.sendRedirect("manageindex.jsp?flag=9");

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
