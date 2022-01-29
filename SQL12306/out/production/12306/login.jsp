<%--
  Created by IntelliJ IDEA.
  User: Alienware
  Date: 2020/11/23
  Time: 21:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>万里12306购票平台用户登录页</title>
</head>
<body>
<center>
    <h1 style="color:red">登录</h1>
    <form id="indexform" name="indexForm" action="../web/WEB-INF/logincheck.jsp" method="post">
        <table border="0">
            <tr>
                <td>账号：</td>
                <td><input type="text" name="usename"></td>
            </tr>
            <tr>
                <td>密码：</td>
                <td><input type="password" name="password">
                </td>
            </tr>
        </table>
        <br>
        <input type="submit" value="登录" style="color:#BC8F8F">
    </form>
    <form action="zhuce.jsp">
        <input type="submit" value="注册" style="color:#BC8F8F">
    </form>
</center>
</body>
</html>