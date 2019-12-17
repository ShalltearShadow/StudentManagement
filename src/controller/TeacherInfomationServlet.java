package controller;

import dao.StudentDAO;
import dao.TeacherDAO;
import data.StudentBean;
import data.TeacherBean;
import net.sf.json.JSONArray;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Vector;

public class TeacherInfomationServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        resp.setContentType("application/x-json");
        resp.setCharacterEncoding("UTF-8");

        PrintWriter out = resp.getWriter();
        Vector<TeacherBean> teacherBeans = TeacherDAO.selectAllTeacher();

        JSONArray tea = JSONArray.fromObject(teacherBeans);
        out.print(tea.toString());
        out.flush();
        out.close();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
