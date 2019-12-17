package dao;

import data.StudentBean;
import java.sql.*;
import java.util.Vector;

public class StudentDAO {

    public static Connection getConnection() {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/mylqsql?serverTimezone=GMT";
            String name = "root";
            String pwd = "lq0522";

            Connection con = DriverManager.getConnection(url, name, pwd);//获取连接对象
            return con;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            return null;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public static StudentBean findStudentByID(String num) {
        Connection con = StudentDAO.getConnection();
        StudentBean stu = new StudentBean();
        Statement sql;
        try {
            String condition = "select * from student where number ='" + num + "'";
            sql = con.createStatement();
            ResultSet rs = sql.executeQuery(condition);

            if (rs.next()) {
                stu.setNumber(rs.getString("number"));
                stu.setName(rs.getString("name"));
                stu.setPasswd(rs.getString("passwd"));
                stu.setCname(rs.getString("cname"));
                stu.setIntroduce(rs.getString("introduce"));
                stu.setMath(rs.getString("math"));
                stu.setOs(rs.getString("os"));
                stu.setJava(rs.getString("java"));
            }
            StudentDAO.closeAll(con, null, rs);
            sql.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return stu;
    }

    public static boolean addStudentByBean (StudentBean stu){
        Connection con = StudentDAO.getConnection();
        PreparedStatement  st;
        boolean is = false;
        try {
            String number = stu.getNumber();
            String name = stu.getName();
            String passwd = stu.getPasswd();
            String cname = stu.getCname();
            String introduce = stu.getIntroduce();
            String math = stu.getMath();
            String os = stu.getOs();
            String java = stu.getJava();

            String  SQL = "insert into student values(?,?,?,?,?,?,?,?)";
            st = con.prepareStatement(SQL);
            st.setString(1,number);
            st.setString(2,name);
            st.setString(3,passwd);
            st.setString(4,cname);
            st.setString(5,introduce);
            st.setString(6,math);
            st.setString(7,os);
            st.setString(8,java);
            if(checkStudent(stu)){
                is = st.execute();
            }

            StudentDAO.closeAll(con,st,null);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return is;

    }

    public static void deleteStudentByID(String id){
        Connection con = StudentDAO.getConnection();
        Statement  st;
        boolean is = false;
        try {
            String  SQL = "delete from student where number='"+id+"'";
            st =  con.createStatement();
            st.execute(SQL);
            StudentDAO.closeAll(con,null,null);
            st.close();
        } catch (SQLException e) {}

    }

    public static void alterStudentByBean(StudentBean stu){
        //获取待删用户ID
        String id = stu.getNumber();
        //删除
        deleteStudentByID(id);
        //添加
        addStudentByBean(stu);
    }

    private static boolean checkStudent(StudentBean stu){

        String a=stu.getNumber(),b=stu.getName(),c=stu.getPasswd();

        if(a.equals("")||b.equals("")||c.equals(""))
            return false;
        else
            return true;
    }

    public static Vector<StudentBean> selectAllStudent(){
        Vector<StudentBean> stu = new Vector<StudentBean>();
        Connection con = StudentDAO.getConnection();
        PreparedStatement st = null;
        ResultSet rs = null;

        try {
            String condition = "select * from student";
            st = con.prepareStatement(condition);
            rs = st.executeQuery(condition);

            while (rs.next()) {
                StudentBean s = new StudentBean();
                s = findStudentByID(rs.getString("number"));
                stu.add(s);
            }
            StudentDAO.closeAll(con, st, rs);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return stu;
    }

    public static void closeAll(Connection conn, PreparedStatement ps, ResultSet rs) {
        try {
            if (rs != null) {
                rs.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            if (ps != null) {
                ps.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}