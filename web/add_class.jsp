<%--
  Created by IntelliJ IDEA.
  User: hpl
  Date: 2017/12/17
  Time: 9:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<html>
<head>
    <title>添加课程</title>
    <link href="_css/add_class.css" rel="stylesheet" type="text/css">
    <link href="_css/top_css.css" rel="stylesheet" type="text/css">
    <script type="text/javascript">
    function reback() {
        window.location.href='teacher_main.jsp';
    }
</script>
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
    <div><h1>输入新的课程信息</h1></div>
    <div>
        <label>class_no</label>
        <input type="text" value=""  name="no" >
    </div>
    <div >
        <label >class_name</label>
        <input type="text" value="" name="name" >
    </div>
    <div>
        <label>class_time</label>
        <input type="text" value="" name="time" >
    </div>
    <div>
        <label >class_area</label>
        <input type="text" value="" name="area" >
    </div>
    <div >
        <label >class_score</label>
        <input type="text" value="" name="score" >
    </div>
    <div>
        <label>class_teacher</label>
        <input type="text" value=""  name="teacher" >
    </div>
    <div>
        <input type="submit" class="button1"  value="修改"/>
        <input type="reset"  class="button2"value="重置"/>
        <input type="button" class="button3" onclick="reback()" value="返回"/>
    </div>
</form>
</div>
<%
    request.setCharacterEncoding("UTF-8");
    String no=request.getParameter("no");
    String name=request.getParameter("name");
    String time=request.getParameter("time");
    String area=request.getParameter("area");
    String score=request.getParameter("score");
    String teacher=request.getParameter("teacher");
        if(no!=null&&name!=null&&time!=null&&area!=null&&score!=null&&teacher!=null){
    	String driverName="com.mysql.jdbc.Driver";
        String userName="root";
        String userPassword="895772";
        String dbName="teamwork";
        String tableName="course_info";
        String url="jdbc:mysql://106.15.94.218/"+dbName+"?useUnicode=true&characterEncoding=UTF-8";
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        Connection conn = DriverManager.getConnection(url,userName,userPassword);
        Statement stmt = conn.createStatement();
        ResultSet rs=stmt.executeQuery("select * from course_info where c_id='"+no+"'");
        if(!rs.next()){
            String sql="INSERT into "+tableName+"(c_id,c_name,c_time,c_area,c_score,c_teacher)"+" values('"+no+"','"+name+"','"+time+"','"+area+"','"+score+"','"+teacher+"')";
            stmt.executeUpdate(sql);
            response.sendRedirect("teacher_main.jsp");
        }else{
            %>
<script>
    alert("课程已存在");
</script>
<%
    }

    rs.close();
    stmt.close();
    conn.close();
    }
    %>



</body>
</html>
