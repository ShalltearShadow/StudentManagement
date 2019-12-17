package dao;

import data.TeacherBean;
import java.sql.*;
import java.util.Vector;

public class TeacherDAO {

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

    public static TeacherBean findTeacherByID(String num) {
        Connection con = getConnection();
        TeacherBean tea = new TeacherBean();
        Statement sql;
        try {
            String condition = "select * from teacher where tno ='" + num + "'";
            sql = con.createStatement();
            ResultSet rs = sql.executeQuery(condition);

            if (rs.next()) {
                tea.setTno(rs.getString("tno"));
                tea.setTname(rs.getString("tname"));
                tea.setPwd(rs.getString("pwd"));
                tea.setCoures(rs.getString("course"));
                tea.setPhone(rs.getString("phone"));
            }
            closeAll(con, null, rs);
            sql.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return tea;
    }

    public static void addTeacherByBean (TeacherBean tea){
        Connection con = getConnection();
        PreparedStatement  st;
        try {
            String tno = tea.getTno();
            String tname = tea.getTname();
            String passwd = tea.getPwd();
            String course = tea.getCoures();
            String phone = tea.getPhone();

            String  SQL = "insert into teacher values(?,?,?,?,?)";
            st = con.prepareStatement(SQL);
            st.setString(1,tno);
            st.setString(2,passwd);
            st.setString(3,tname);
            st.setString(4,course);
            st.setString(5,phone);

            st.execute();

            closeAll(con,st,null);
        } catch (SQLException e) { }

    }

    public static void deleteTeacherByID(String id){
        Connection con = getConnection();
        Statement  st;
        boolean is = false;
        try {
            String  SQL = "delete from teacher where tno='"+id+"'";
            st =  con.createStatement();
            st.execute(SQL);
            closeAll(con,null,null);
            st.close();
        } catch (SQLException e) {}

    }

    public static void alterTeacherByBean(TeacherBean tea){
        //获取待删用户ID
        String id = tea.getTno();
        //删除
        deleteTeacherByID(id);
        //添加
        addTeacherByBean(tea);
    }

    public static Vector<TeacherBean> selectAllTeacher(){
        Vector<TeacherBean> tea = new Vector<TeacherBean>();
        Connection con = StudentDAO.getConnection();
        PreparedStatement st = null;
        ResultSet rs = null;

        try {
            String condition = "select * from teacher";
            st = con.prepareStatement(condition);
            rs = st.executeQuery(condition);

            while (rs.next()) {
                TeacherBean s = new TeacherBean();
                s = findTeacherByID(rs.getString("tno"));
                tea.add(s);
            }
            StudentDAO.closeAll(con, st, rs);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return tea;
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
