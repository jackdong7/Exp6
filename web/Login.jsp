<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2017/10/12
  Time: 10:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<html>
<head>
    <title>欢迎登陆</title>
    <link rel="stylesheet" href="_css/login.css"/>
    <link rel="stylesheet" href="_css/My_Button.css"/>
    <link rel="stylesheet" href="assets/css/reset.css"/>
    <link rel="stylesheet" href="assets/css/supersized.css"/>
    <script src="_js/login.js" type="text/javascript"></script>
    <script src="_js/jquery.min.js" type="text/javascript"></script>

</head>
<body>
<div class="page">
    <div class="loginwarrp">
        <div class="logo">用户登陆</div>
        <div class="login_form">
            <form method="post" id="Login">
                <ul class="login-item">
                    <span>账号:</span>
                    <input type="text" name="ID" class="login_input">
                </ul>
                <ul class="login-item">
                    <span>密码:</span>
                    <input type="password" name="Password" class="login_input">
                </ul>
                <ul class="login-item">

                    <span>身份:</span>

                    <input  type="radio" name="Identity" value="学生">学生

                    <input  type="radio" name="Identity" value="教师">教师
                </ul>
                <ul class="login-sub">
                    <button type="submit" class="button" style="vertical-align: middle" ><span>登录</span></button>
                    <button  type="button"  class="button" style="vertical-align: middle" onclick="javascript:location.href='registration.jsp'"><span>注册</span></button>
                </ul>

            </form>
        </div>
    </div>
</div>
<jsp:useBean id="read1" class="myPackage.FirstBeen" scope="page"/>
<jsp:useBean id="read2" class="myPackage.FirstBeen" scope="page"/>
<jsp:useBean id="write" class="myPackage.FirstBeen" scope="page"/>
<%
    request.setCharacterEncoding("UTF-8");
    String id=request.getParameter("ID");
    String password=request.getParameter("Password");
    String identity=request.getParameter("Identity");
    int found=0;
    if(id!=null&&password!=null&&identity!=null){
        String sql="select * from login_info";
        ResultSet rs=read1.getRs(sql);
        while(rs.next()){
            if(rs.getString(1).equals(id)&&rs.getString(2).equals(password)&&rs.getString(3).equals(identity)){
                if(rs.getString(3).equals("学生")){
                    session.setAttribute("num",id);
                    found=1;
                    String sql3="select * from login_info where login_id='"+id+"'";
                    ResultSet rs2=read2.getRs(sql3);
                    if(rs2.next()){
                        response.sendRedirect("student_main.jsp");
                    }else{
%>
<script>
    alert("个人信息不完整，请完善");
</script>
<%
                    response.sendRedirect("student_main.jsp");
                }
                rs2.close();
            }
            else {
                found=2;
                String message=id+" "+identity;
                session.setAttribute("num",message);
                response.sendRedirect("teacher_main.jsp");
            }
        }
    }
    if(found==0){
%>
<script>
    alert("登录信息错误或不存在");
</script>
<%
        }
        rs.close();
    }
%>
<script type="text/javascript">
    window.onload = function() {
        var config = {
            vx : 4,
            vy : 4,
            height : 2,
            width : 2,
            count : 100,
            color : "121, 162, 185",
            stroke : "100, 200, 180",
            dist : 6000,
            e_dist : 20000,
            max_conn : 10
        }
        CanvasParticle(config);
    }
</script>
<script type="text/javascript" src="_js/canvas-particle.js"></script>
<script src="assets/js/jquery-1.8.2.min.js"></script>
<script src="assets/js/supersized.3.2.7.min.js"></script>
<script src="assets/js/supersized-init.js"></script>
<script src="assets/js/scripts.js"></script>

</body>
</html>
