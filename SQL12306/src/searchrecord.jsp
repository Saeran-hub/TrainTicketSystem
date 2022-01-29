<%--
  Created by IntelliJ IDEA.
  User: Alienware
  Date: 2020/12/1
  Time: 13:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page   pageEncoding="utf-8"%>
<%request.setCharacterEncoding("utf-8");%>
<html>
<head>
    <title>万里12306购票平台查询车票页</title>
</head>
<body background="cx.jpg">
<center>
    <br>
    <h1 style="color: aliceblue" >查询你的购买记录</h1>
    <br>
    <h3 style="color:aliceblue" style="background-color: aliceblue" >请您输入密码验证</h3>
    <form id="indexform" name="indexForm" action="searchrecordcheck.jsp" method="post">
        <table border="0" bgcolor="#f0f8ff">

            <tr>
                <td>账号：</td>
                <td><input type="text" name="id"></td>
            </tr>
            <tr>
                <td>密码：</td>
                <td><input type="password" name="password">
                </td>
            </tr>
        </table>
        <br>
        <input type="submit" value="查询" style="color:#BC8F8F">
    </form>
</center>
</body>
</html>