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
    String username=request.getParameter("id");
    String password=request.getParameter("password");

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
            String sql1="select * from user where id='"+username+"' and password='"+ password + "'";
            long startTime = System.currentTimeMillis();
            ResultSet rs1=stmt.executeQuery(sql1);
            long endTime = System.currentTimeMillis();    //获取结束时间
            long tim=endTime-startTime;
            File f= new File("d:" + File.separator + "Usersearch_timerecord.txt") ;
            Writer outter=null; // 准备好一个输出的对象
            outter = new FileWriter(f,true) ; // 通过对象多态性，进行实例化
// 将内容输出，保存文件
// 第4步、关闭输出流
            if(rs1.next()){
                String strr = "User: "+username+" login success "+"usingtime: "+tim+" ms\r\n" ;// 准备一个字符串
                outter.write(strr) ;
                response.sendRedirect("loginsuccess.jsp?message="+username);
            }else{
                String strr1 = "User: "+username+" login fail "+"usingtime: "+tim+" ms\r\n" ;// 准备一个字符串
                outter.write(strr1) ;
                response.sendRedirect("loginfail.jsp");
%>
< a href=" ">返回</ a>
<%
            }
            // 输出连接信息
            //out.println("数据库连接成功！");
            // 关闭数据库连接
            outter.close() ;
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