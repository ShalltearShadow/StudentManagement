package controller;

import dao.ManageDAO;
import dao.StudentDAO;
import dao.TeacherDAO;
import data.ManageBean;
import data.StudentBean;
import data.TeacherBean;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;



public class AllLoginServlet extends HttpServlet {

    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();
        Connection con;
        Statement sql;
        String logname = request.getParameter("username"),
                password = request.getParameter("password"),
                login = request.getParameter("login");
        HttpSession session = request.getSession(true);
        session.setAttribute("username", logname);
        String c = session.getAttribute("code").toString();
        String code = request.getParameter("vlidata");
        con = StudentDAO.getConnection();
        try {
            String condition="";

            switch (login){
                case "stu" :condition = "select * from student where number ='" + logname + "'and passwd = '" + password + "'";break;
                case "tea" :condition = "select * from teacher where tno ='" + logname + "'and pwd = '" + password + "'";break;
                case "guan" :condition = "select * from manage where gno ='" + logname + "'and gpwd = '" + password + "'";break;
            }



//            if (login.equals("stu")) {
//
//                condition = "select * from student where number ='" + logname + "'and passwd = '" + password + "'";
//            }else if (login.equals("tea")){
//                condition = "select * from teacher where tno ='" + logname + "'and pwd = '" + password + "'";
//            }
            sql = con.createStatement();
            ResultSet rs = sql.executeQuery(condition);
            if (c.equals(code)) {
                boolean m = rs.next();
                if (m == true) {// "登录成功";
                    switch (login){
                        case "stu":
                            StudentBean stu = StudentDAO.findStudentByID(logname);//logname--number
                            session.setAttribute("student",stu);
                            out.write("stu");
                            break;
                        case "tea" :
                            TeacherBean tea = TeacherDAO.findTeacherByID(logname);
                            session.setAttribute("teacher",tea);
                            out.write("tea");
                            break;
                        case "guan" :
                            ManageBean man = ManageDAO.findManageByID(logname);
                            session.setAttribute("manage",man);
                            out.write("guan");
                            break;
                    }


//                    if (login.equals("stu")) {
//                        StudentBean stu = StudentDAO.findStudentByID(logname);//logname--number
//                        session.setAttribute("student",stu);
//                        out.write("stu");
//                    }else if (login.equals("tea")){
//                        TeacherBean tea = TeacherDAO.findTeacherByID(logname);
//                        session.setAttribute("teacher",tea);
//                        out.write("tea");
//                    }

                } else {
                    out.write("np");
                }
            } else {
                out.write("vli");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        this.doPost(request, response);
    }

}