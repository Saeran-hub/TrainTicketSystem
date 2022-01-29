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
<center><h1 style="color: aliceblue">车票查询结果</h1></center>
    <%
        String uid=request.getParameter("id");
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
        CallableStatement cstmt = conn.prepareCall( "{call purchaseRecordsearch(?)}" );
        cstmt.setString( 1 ,uid);
        ResultSet rs=cstmt.executeQuery();
    %>
    <br>
    <br>
    <table align="center" class="pure-table">
        <tr bgcolor="#00bfff">
                        <th>
                <%
                    out.print("用户");
                %>
            </th>
            <th>
                <%
                    out.print("车票");
                %>
            </th>
            <th>
                <%
                    out.print("车次");
                %>
            </th>
            <th>
                <%
                    out.print("发车时间");
                %>
            </th>
            <th>
                <%
                    out.print("座位号");
                %>
            </th>
            <th>
                <%
                    out.print("价格");
                %>
            </th>
        </tr>

        <%
            while (rs.next()) {
        %>
            <tr bgcolor="#f0f8ff">
                <td>
                   <% out.print(uid);%>
            </td>
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
            <td>
                <%
                    out.print(rs.getString(5));
                %>
            </td>
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
        cstmt.close();
        conn.close();
    %>
</body>
</html></span><span style="font-size:24px;color: rgb(255, 0, 0);">
</span></span>
