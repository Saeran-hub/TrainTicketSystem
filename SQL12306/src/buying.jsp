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
java.util.Random,
java.sql.*" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>购买页</title>
</head>
<body>

<%

    request.setCharacterEncoding("utf-8");
    String tn=request.getParameter("trainnum");
    String tim=request.getParameter("time");
    //String seat=request.getParameter("spaceseat");
    String uuid=request.getParameter("uid");
    String o=request.getParameter("o");
    String d=request.getParameter("d");
    String p=request.getParameter("p");
    String tickt="";
    System.out.println("开始");
    //out.print(tim);
    //out.print("<center><h1 color='red' size='20'>你好，world2！</h1></center>");
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
            String sql1="select trip.nowmem,trip.trainnum from trip where trainnum='"+tn+"' and time='"+ tim + "'";
            ResultSet rs1=stmt.executeQuery(sql1);
// 将内容输出，保存文件
// 第4步、关闭输出流
            //out.print(rs1.getString(1));
            if(rs1.next()){
                if(rs1.getString(1).equals("0")) {
                    out.print("<center><h1 color='red' size='20'>暂无余票</h1></center>");
                }
                else{
                    String str="0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
                    Random random=new Random();
                    StringBuffer sb=new StringBuffer();
                    for(int i=0;i<9;i++){
                        int number=random.nextInt(35);
                        sb.append(str.charAt(number));
                    }String nextp=sb.toString();
                    tickt=tn+nextp;
                    String sql="select seatnum from seat where trainnum='"+tn+"'"+"and time LIKE'"+tim+"%' and sit=0";
                    ResultSet rs0=stmt.executeQuery(sql);
                    String sn="";
                    while(rs0.next()){
                        sn=rs0.getString(1);
                    }
                    CallableStatement cstmt = conn.prepareCall( "{call CREATE_TICKET(?,?,?,?,?)}" );
                    cstmt.setString( 1 ,tickt);
                    cstmt.setString( 2 ,sn);
                    cstmt.setString( 3 ,tn);
                    cstmt.setString( 4 ,tim);
                    cstmt.setString( 5 ,uuid);
                    ResultSet rs111 = cstmt.executeQuery();
                    //=String.valueOf(System.currentTimeMillis());
                    //CallableStatement cstmt2 = conn.prepareCall( "{call CREATE_PCR(?,?)}" );
                   // cstmt2.setString( 1 ,uid);
                    //cstmt2.setString( 2 ,tickt);
                    int aa=Integer.valueOf(sn);
                    int chexiang=1+aa/60;
                    String sql5="select name from user where id='"+uuid+"'";
                    stmt.executeQuery(sql5);
                    ResultSet rs5=stmt.executeQuery(sql5);
                    String nam="";
                    while(rs5.next()){
                       nam=rs5.getString(1);
                    }
                    out.println("<center><h1 style=\"background-color: deepskyblue \" style=\"color: red\">购买成功！</h1></center>");
                    out.println("<h1 color='red' size='20'>为您打印车票信息，请留存：</h1>");
                    out.println("                               车票编号："+tickt);
                    out.print("<br>");
                    out.println("                               车厢："+chexiang);
                    out.print("<br>");
                    out.println("                               座位："+sn);
                    out.print("<br>");
                    out.println("                               姓名："+nam+"<br>"+"身份证号："+uuid);
                    out.print("<br>");
                    out.println("                               价格："+p);
                    out.print("<br>");
                    out.println("出发时间："+tim);

                }
                //response.sendRedirect("loginsuccess.jsp");
            }else{
                out.print("<center><h1 color='red' size='20'>你好，world2！</h1></center>");
                response.sendRedirect("loginfail.jsp");
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