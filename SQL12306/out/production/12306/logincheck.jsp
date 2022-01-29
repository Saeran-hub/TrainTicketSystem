<%--
  Created by IntelliJ IDEA.
  User: Alienware
  Date: 2020/11/23
  Time: 21:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.sql.Connection,
java.sql.DriverManager,
java.sql.Statement,
java.sql.ResultSet,
java.sql.SQLException,
java.util.Random,
java.sql.*" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Server Page Depend !</title>
</head>
<body>
<body>
<%
    String username=request.getParameter("usename");
    String password=request.getParameter("password");
    username="729635931297849800";
    password="u";
    System.out.println("开始");
    try {
        // 加载数据库驱动，注册到驱动管理器
        Class.forName("com.mysql.jdbc.Driver");
        // 数据库连接字符串
        String url = "jdbc:mysql://localhost:3306/wanli_12306_system?serverTimezone=UTC";
        // 数据库用户名
        String usename = "root";
        // 数据库密码
        String psw = "ssy0926";
        // 创建Connection连接
        Connection conn = DriverManager.getConnection(url,usename,psw);
        // 判断 数据库连接是否为空
        if(conn != null){
            String sql="select * from user where id='"+username+"' and password='"+ password + "'";
            Statement stmt = conn.createStatement();
            ResultSet rs=stmt.executeQuery(sql);
            if(rs.next()){
                response.sendRedirect("home.jsp");
            }else{
                out.print("用户名或密码错误，请重新输入！");
%>
< a href=" ">返回</ a>
<%
            }
            // 输出连接信息
            //out.println("数据库连接成功！");
            // 关闭数据库连接
            conn.close();
        }else{
            // 输出连接信息
            out.println("数据库连接失败！");
        }
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
</body>

</html>