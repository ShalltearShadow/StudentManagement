package dao;

import data.ManageBean;

import java.sql.*;

public class ManageDAO {
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

    public static ManageBean findManageByID(String num) {
        Connection con = getConnection();
        ManageBean man = new ManageBean();
        Statement sql;
        try {
            String condition = "select * from manage where gno ='" + num + "'";
            sql = con.createStatement();
            ResultSet rs = sql.executeQuery(condition);

            if (rs.next()) {
                man.setGno(rs.getString("gno"));
                man.setGname(rs.getString("gname"));
                man.setGpwd(rs.getString("gpwd"));
            }
            closeAll(con, null, rs);
            sql.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return man;
    }

    public static void addManageByBean (ManageBean man){
        Connection con = getConnection();
        PreparedStatement  st;
        try {
            String gno = man.getGno();
            String gname = man.getGname();
            String passwd = man.getGpwd();

            String  SQL = "insert into manage values(?,?,?)";
            st = con.prepareStatement(SQL);
            st.setString(1,gno);
            st.setString(2,passwd);
            st.setString(3,gname);

            st.execute();

            closeAll(con,st,null);
        } catch (SQLException e) { }

    }

    public static void deleteManageByID(String id){
        Connection con = getConnection();
        Statement  st;
        boolean is = false;
        try {
            String  SQL = "delete from manage where gno='"+id+"'";
            st =  con.createStatement();
            st.execute(SQL);
            closeAll(con,null,null);
            st.close();
        } catch (SQLException e) {}

    }

    public static void alterManageByBean(ManageBean man){
        //获取待删用户ID
        String id = man.getGno();
        //删除
        deleteManageByID(id);
        //添加
        addManageByBean(man);
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
