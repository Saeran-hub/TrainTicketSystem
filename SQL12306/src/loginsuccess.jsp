<%--
  Created by IntelliJ IDEA.
  User: Alienware
  Date: 2020/11/24
  Time: 17:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%request.setCharacterEncoding("utf-8");%>
<html>
<head>
    <title>Title</title>
</head>
<center>
<body background="logsuc.jpg">
<%
    String userid=request.getParameter("message");

%>
<br>
<h1 style="color: aliceblue">欢迎您！用户：<%out.println(userid);%></h1>
<h2 style="background: coral" >导览：<font color="red"><a href="login.jsp">退出登录</a>
    <a href="tuipiao.jsp">退票</a>   <a href="searchrecord.jsp">查询我的购买记录</a>   <a href="login.jsp">联系客服</a>
</font></h2>
<img src="gdxq.png" align="center" style="border:5px solid #ff7f50;">
<br>
<form id="indexform" name="indexForm" action="maichepiaocheck.jsp?uid=<%=userid%>" method="post" accept-charset="utf-8">
    <br>
    <table border="0" bgcolor="#ff7f50">
        <tr>
            <td style="color: aliceblue">出发地：</td>
            <td><input type="text" name="origin"></td>
            <td style="color: aliceblue">目的地：</td>
            <td><input type="text" name="destination">
            </td>
            <td><input type="text" name="year"></td>
            <td style="color: aliceblue">年</td>
            <td><input type="text" name="month"></td>
            <td style="color: aliceblue">月</td>
            <td><input type="text" name="day"></td>
            <td style="color: aliceblue">日</td>
        </tr>
    </table>
    <br>
    <input type="submit" value="查询" style="color:#BC8F8F">
</form>
</body>
</center>

