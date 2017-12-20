<%--
  Created by IntelliJ IDEA.
  User: hpl
  Date: 2017/12/17
  Time: 21:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="myPackage.FirstBeen"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<html>
<head>
    <title>修改当前用户登录密码</title>
    <link href="_css/add_class.css" rel="stylesheet" type="text/css">
    <script type="text/javascript">
        function reback() {
            window.location.href='teacher_main.jsp';
        }
    </script>
    <style>
        .divv {
            position: absolute;
            top:20%;
            left:25%;
            right: 25%;
        }
        .head{
            position: fixed;
            top:0;
            width:100%;
            background-color:#333;
            margin:0;
            padding:0;
            height:5%;
        }

        ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            overflow: hidden;
            background-color: #333;
        }

        li {
            float: left;
        }

        li a, .dropbtn {
            display: inline-block;
            color: white;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }

        li a:hover, .dropdown:hover .dropbtn {
            background-color: #111;
        }

        .dropdown {
            margin:0px 20px;
            display: inline-block;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
        }

        .dropdown-content a {
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }
        .dropdown-content a:hover {background-color: #f1f1f1}

        .dropdown:hover .dropdown-content {
            display: block;
        }
    </style>
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
<div style="text-align: center;" class="divv">
    <form method="post" action="" class="smart-green">
        <div><h1>输入新的密码</h1></div>
        <div>
            <label>new_password</label>
            <input type="text" value=""  name="password" >
        </div>
        <div>
            <input type="submit" class="button1"  value="确认"/>
            <input type="reset"  class="button2"  value="重置"/>
            <input type="button" class="button3" onclick="reback()" value="返回"/>
        </div>
    </form>
</div>
<jsp:useBean id="write" class="myPackage.FirstBeen" scope="page"/>
<%String user=(String) session.getAttribute("num");
    String[] Message=user.split(" ");
    request.setCharacterEncoding("UTF-8");
    String password=request.getParameter("password");
    String driverName="com.mysql.jdbc.Driver";
    String userName="root";
    String userPassword="895772";
    String dbName="teamwork";
    String url="jdbc:mysql://106.15.94.218/"+dbName+"?useUnicode=true&characterEncoding=UTF-8";
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection conn = DriverManager.getConnection(url,userName,userPassword);
    Statement stmt = conn.createStatement();
    ResultSet rs=stmt.executeQuery("select * from login_info where login_id='"+Message[0]+"'");
    String sql1 = ("delete from login_info where login_id='" + Message[0] + "'");
    stmt.executeUpdate(sql1);
    String sql = "INSERT into login_info(login_id,login_pswd,login_identity)" + " values('" + Message[0] + "','" + password + "','" +Message[1] + "')";
    stmt.executeUpdate(sql);
    rs.close();
    stmt.close();
    conn.close();
%>
</body>
</html>
