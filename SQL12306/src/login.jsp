<%--
  Created by IntelliJ IDEA.
  User: Alienware
  Date: 2020/11/23
  Time: 21:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page   pageEncoding="utf-8"%>
<%request.setCharacterEncoding("utf-8");%>
<html>
<head>
    <title>万里12306购票平台用户登录页</title>
    <style type="text/css">
        .divForm{
            position: absolute;/*绝对定位*/
            width: 300px;
            height: 230px;
            border: 1px;
            text-align: center;/*(让div中的内容居中)*/
            top: 50%;
            left: 50%;
            margin-top: -200px;
            margin-left: -150px;
            color: #cbcbcb;
            background-color: #f0f8ff;

        }
    </style>

</head>
<body background="loginbg.jpg">
<center>
    <br>
    <h1 style="color: aliceblue" style="background-color: aliceblue" >欢迎来到万里12306购票系统</h1>
    <div class="divForm">
    <form id="indexform" name="indexForm" action="logincheck.jsp" method="post">
        <table border="0" bgcolor="#f0f8ff" align="center">
            <tr>    <h3 style="color: black" style="background-color: aliceblue" >登录</h3></tr>
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
        <input type="submit" value="登录" style="color:#BC8F8F">
    </form>
    <form action="zhuce.jsp">
        <input type="submit" value="注册" style="color:#BC8F8F">
    </form>
    </div>
</center>
</body>
</html>