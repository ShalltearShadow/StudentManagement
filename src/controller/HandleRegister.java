package controller;

import dao.StudentDAO;
import data.StudentBean;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class HandleRegister extends HttpServlet {
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        //创建bean实体，并设置信息
        StudentBean stu = new StudentBean();
        String name = req.getParameter("name");
        String cname = req.getParameter("cname");
        String math = req.getParameter("math");
        String os = req.getParameter("os");
        String java = req.getParameter("java");
        stu.setName(name);
        stu.setPasswd("111111");
        stu.setCname(cname);
        stu.setMath(math);
        stu.setOs(os);
        stu.setJava(java);
        //随机生成7位学号
        String number="";
        for(int i=0;i<7;i++){
            int num = (int)(Math.random()*10);
            number+=""+num;
        }
        stu.setNumber(number);
        StudentDAO.addStudentByBean(stu);
        String action = req.getHeader("referer");
        String [] strs = action.split("/");
        if (strs[4].equals("teacherindex.jsp"))
            resp.sendRedirect("teacherindex.jsp?flag=9");
        else if (strs[4].equals("manageindex.jsp")){
            resp.sendRedirect("manageindex.jsp?flag=9");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
