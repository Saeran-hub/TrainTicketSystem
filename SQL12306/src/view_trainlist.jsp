<%--
  Created by IntelliJ IDEA.
  User: Alienware
  Date: 2020/11/30
  Time: 14:23
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
<body bgcolor="#f0ffff">
    <%
        //驱动程序名
        String driverName = "com.mysql.jdbc.Driver";
        //数据库用户名
        String userName = "root";
        //密码
        String userPasswd = "ssy0926";

        //表名
        String tableName = "student";
        //联结字符串
        String url = "jdbc:mysql://localhost:3306/wanli_12306?serverTimezone=UTC";
        Connection connection = DriverManager.getConnection(url,userName,userPasswd);
        Statement statement = connection.createStatement();
        String sql = "call trainLIST()";
        ResultSet rs = statement.executeQuery(sql);
    %>
    <br>
    <br>
    <table align="center" class="pure-table">
        <tr bgcolor="#00bfff">
            <th>
                <%
                    out.print("列车车号");
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
                    out.print("满载人数");
                %>
            </th>
            <th>
                <%
                    out.print("基础价格");
                %>
            </th>
        </tr>

        <%
            while (rs.next()) {
        %>
            <tr bgcolor="#f0f8ff">
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
        statement.close();
        connection.close();
    %>
</body>
</html></span><span style="font-size:24px;color: rgb(255, 0, 0);">
</span></span>

