<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2017/12/17
  Time: 8:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>教师页面</title>
        <link href="_css/top_css.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="head">
    <ul>
        <div class="dropdown">
            <a href="#" class="dropbtn">课程信息管理</a>
            <div class="dropdown-content">
                <a href="change_class.jsp">修改信息</a>
                <a href="look_total_stu.jsp">查看选课信息</a>
            </div>
        </div>
        <div class="dropdown">
            <a href="#" class="dropbtn">登录信息管理</a>
            <div class="dropdown-content">
                <a href="login_tea_change.jsp">修改登录密码</a>
                <a href="tea_mess_look.jsp">教师信息浏览 </a>
                <a href="tea_mess_add.jsp">教师信息增加修改</a>
            </div>
        </div>

        <div class="dropdown">
            <a href="#" class="dropbtn">课程管理</a>
            <div class="dropdown-content">
                <a href="total_class.jsp">已创建课程</a>
                <a href="add_class.jsp">新增选课</a>
            </div>
        </div>
        <a href="Login.jsp" style="text-decoration: solid;color: green ;float:right">注销</a>
    </ul>

</div>
</body>
</html>
