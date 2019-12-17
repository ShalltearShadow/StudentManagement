package controller;

import dao.TeacherDAO;
import data.TeacherBean;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class HandleTeacherRegister extends HttpServlet {
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        //创建bean实体，并设置信息
        TeacherBean tea = new TeacherBean();
        String tname = req.getParameter("tname");
        String course = req.getParameter("course");
        String phone = req.getParameter("phone");

        tea.setPwd("111111");
        tea.setTname(tname);
        tea.setCoures(course);
        tea.setPhone(phone);

        //随机生成5位学号
        String number="";
        for(int i=0;i<5;i++){
            int num = (int)(Math.random()*10);
            number+=""+num;
        }
        tea.setTno(number);
        TeacherDAO.addTeacherByBean(tea);

        resp.sendRedirect("manageindex.jsp?flag=9");

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
