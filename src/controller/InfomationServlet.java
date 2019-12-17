package controller;

import dao.StudentDAO;
import data.StudentBean;
import net.sf.json.JSONArray;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Vector;

public class InfomationServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        resp.setContentType("application/x-json");
        resp.setCharacterEncoding("UTF-8");

        PrintWriter out = resp.getWriter();
        String num = req.getParameter("num");
        Vector<StudentBean> studentBeanList = new Vector<StudentBean>();
        if(num==null) {
            //获取全部学生的bean
            studentBeanList = StudentDAO.selectAllStudent();
        }else {
            studentBeanList.add(StudentDAO.findStudentByID(num));
        }
        JSONArray stu = JSONArray.fromObject(studentBeanList);
        out.print(stu.toString());
        out.flush();
        out.close();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
