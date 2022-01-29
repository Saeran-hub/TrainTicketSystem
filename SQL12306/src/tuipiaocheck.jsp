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
java.io.FileInputStream,
java.io.FileNotFoundException,
java.io.FileOutputStream,
java.io.IOException,
java.util.Random,
java.io.File ,
java.io.Writer,
java.io.FileWriter ,
java.sql.*" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>身份验证</title>
</head>
<body>
<%
    String uid=request.getParameter("id");
    String password=request.getParameter("password");
    String tk=request.getParameter("ticket");

    System.out.println("开始");
    try {
        // 加载数据库驱动，注册到驱动管理器
        Class.forName("com.mysql.jdbc.Driver");
        // 数据库连接字符串
        String url = "jdbc:mysql://localhost:3306/wanli_12306?serverTimezone=UTC";
        // 数据库用户名
        String usename = "root";
        // 数据库密码
        String psw = "ssy0926";
        // 创建Connection连接
        Connection conn = DriverManager.getConnection(url,usename,psw);
        // 判断 数据库连接是否为空
        if(conn != null){
            //String sql="select * from user where id='"+username+"' and password='"+ password + "'";
            Statement stmt = conn.createStatement();
            //ResultSet rs=stmt.executeQuery(sql);
            String sql1="select * from ticket where id='"+uid+"' and ticketnum='"+tk+ "'";
            long startTime = System.currentTimeMillis();
            ResultSet rs1=stmt.executeQuery(sql1);

// 第4步、关闭输出流
            if(rs1.next()){
                CallableStatement cstmt = conn.prepareCall( "{call DELETE_ticket(?,?)}" );
                cstmt.setString( 1 ,uid);
                cstmt.setString( 2 ,tk);
                ResultSet rs111 = cstmt.executeQuery();
                out.println("<center><h1 style=\"background-color: deepskyblue \" style=\"color: red\">退票成功，请您留意绑定银行卡/支付账号的到账信息！</h1></center>");
            }else{
                out.println("<center><h1 style=\"background-color: deepskyblue \" style=\"color: red\">退票出错，请检查输入信息！</h1></center>");
%>
<%
            }
            // 输出连接信息
            //out.println("数据库连接成功！");
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