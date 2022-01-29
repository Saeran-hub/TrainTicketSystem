<%--
  Created by IntelliJ IDEA.
  User: Alienware
  Date: 2020/12/1
  Time: 15:08
  To change this template use File | Settings | File Templates.
--%>
<span style="font-size:12px;"><span style="font-size:14px;"><%@ page language="java" import="java.sql.*,java.io.*,java.util.*"%>
<%@ page contentType="text/html;charset=utf-8"%>
<html>
<head>
<style type="text/css">
table {
    border-collapse: collapse;
    border-spacing: 0;
}

td,th {
    padding: 0;
}

.pure-table {
    border-collapse: collapse;
    border-spacing: 0;
    empty-cells: show;
    border: 1px solid #cbcbcb;
}

.pure-table caption {
    color: #000;
    font: italic 85%/1 arial,sans-serif;
    padding: 1em 0;
    text-align: center;
}

.pure-table td,.pure-table th {
    border-left: 1px solid #cbcbcb;
    border-width: 0 0 0 1px;
    font-size: inherit;
    margin: 0;
    overflow: visible;
    padding: .5em 1em;
}

.pure-table thead {
    background-color: #e0e0e0;
    color: #000;
    text-align: left;
    vertical-align: bottom;
}

.pure-table td {
    background-color: transparent;
}

.pure-table-odd td {
    background-color: #f2f2f2;
}

td,th {
    height: 30px;
    border: #CCCCCC 1px solid;
}
</style>
</head>
<body background="cx.jpg">
<br>

<center>
<h1 style="color: aliceblue">车票查询结果</h1></center>
<br>
    <%
        request.setCharacterEncoding("utf-8");
        String origin=request.getParameter("origin");
        String destination=request.getParameter("destination");
        String year=request.getParameter("year");
        String month=request.getParameter("month");
        String day=request.getParameter("day");
        String uid=request.getParameter("uid");
        String time=year+"-"+month+"-"+day;
        //2019-03-05
        // 加载数据库驱动，注册到驱动管理器
        Class.forName("com.mysql.jdbc.Driver");
        // 数据库连接字符串
        String url = "jdbc:mysql://localhost:3306/wanli_12306?serverTimezone=UTC&useUnicode=true&characterEncoding=UTF-8";
        // 数据库用户名
        String usename = "root";
        // 数据库密码
        String psw = "ssy0926";
        // 创建Connection连接
        Connection conn = DriverManager.getConnection(url,usename,psw);
        Statement stmt = conn.createStatement();
        String sql="SELECT train.trainnum,train.origin,train.destination,trip.time,trip.arrive,trip.nowprice,trip.nowmem " +
                "FROM train,trip where train.trainnum=trip.trainnum and train.origin='"+origin+"'and train.destination='"+destination+"'"+" and trip.time LIKE'%"+time+"%'";
        ResultSet rs=stmt.executeQuery(sql);

    %>
    <br>
    <br>
    <table align="center" class="pure-table">
        <tr bgcolor="#00bfff">
            <th>
                <%
                    out.print("列车");
                %>
            </th>
            <th>
                <%
                    out.print("出发地");
                %>
            </th>
            <th>
                <%
                    out.print("目的地");
                %>
            </th>
            <th>
                <%
                    out.print("发车时间");
                %>
            </th>
            <th>
                <%
                    out.print("到达时间");
                %>
            </th>
            <th>
                <%
                    out.print("价格");
                %>
            </th>
            <th>
                <%
                    out.print("空座数");
                %>
            </th>
            <th>
                购买链接
            </th>

        </tr>

        <%
            while (rs.next()) {

                    String tn=rs.getString(1);
                    String ori=rs.getString(2);
                    String des=rs.getString(3);
                    String tim=rs.getString(4);
                    String arr=rs.getString(5);
                    String pri=rs.getString(6);
                    String nowm=rs.getString(7);
        %>
            <tr bgcolor="#f0f8ff" >

            <td>
                <%
                    out.print(rs.getString(1));
                %>
            </td>
            <td>
                <%
                    out.print(rs.getString(2));
                %>
            </td>
            <td>
                <%
                    out.print(rs.getString(3));
                %>
            </td>
            <td>
                <%
                    out.print(rs.getString(4));
                %>
            </td>
            <td >
                <%
                    out.print(rs.getString(5));
                %>
            </td>
                <td>
                <%
                    out.print(rs.getString(6));
                %>
            </td>
                <td>
                <%
                    out.print(rs.getString(7));
                %>
            </td>
                <td> <a href="buying.jsp?trainnum=<%=tn%>&time=<%=tim%>&o=<%=origin%>&d=<%=destination%>&p=<%=pri%>&uid=<%=uid%>" charset="utf-8" >购买</a></td>
        </tr>
        <%
            }

        %>
    </table>
    <div align="center">
        <br> <br> <br>
        <%
            out.print("数据查询成功，恭喜你");
        %>
    </div>
    <%
        rs.close();
        stmt.close();
        conn.close();
    %>
</body>
</html></span><span style="font-size:24px;color: rgb(255, 0, 0);">
</span></span>
