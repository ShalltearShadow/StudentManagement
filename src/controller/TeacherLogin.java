package controller;

import dao.StudentDAO;
import data.StudentBean;

import java.io.IOException;
import java.sql.*;

import javax.servlet.*;
import javax.servlet.http.*;

public class TeacherLogin extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws NumberFormatException, ServletException, IOException {
        Connection con;
        Statement sql;
        String logname = request.getParameter("username"),
                password = request.getParameter("password");
        HttpSession session = request.getSession(true);
        session.setAttribute("username", logname);
        String c = session.getAttribute("code").toString();
        String code = request.getParameter("verify");
        String s = "true";
        session.setAttribute("news", s);
        con = StudentDAO.getConnection();
        try {
            String condition = "select * from teacher where tno ='" + logname + "'and pwd = '" + password + "'";
            sql = con.createStatement();
            ResultSet rs = sql.executeQuery(condition);
            if (c.equals(code)) {
                boolean m = rs.next();
                if (m == true) {// "登录成功";
                    StudentBean student = StudentDAO.findStudentByID(logname);//logname--number
                    session.setAttribute("student",student);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("student.jsp");
                    dispatcher.forward(request, response);
                } else {
                    RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
                    dispatcher.forward(request, response);
                }
            } else {
                s = "false";
                session.setAttribute("news", s);
                RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
                dispatcher.forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
    protected void doGet (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

                this.doPost(request, response);
    }

}