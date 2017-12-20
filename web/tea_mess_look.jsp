<%--
  Created by IntelliJ IDEA.
  User: hpl
  Date: 2017/12/17
  Time: 10:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="myPackage.*"%>
<html>
<head>
    <title>预览教师信息</title>
    <link href="_css/class_table.css" rel="stylesheet" type="text/css">
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
<div class="divv">
    <form>
        <div align="center">
            <table id="total_class" border="1px" class="gridtable" >
                <tr>
                    <th>tea_id</th>
                    <th>tea_name</th>
                    <th>tea_sex</th>
                    <th>tea_tel</th>
                    <th>tea_area</th>
                </tr>
                <%
                    String user=(String) session.getAttribute("num");
                    String[] Message=user.split(" ");
                    String sql=("select * from tea_info where tea_id='"+Message[0]+"'");
                    Bean fb = new Bean();
                    ResultSet rs = fb.getRS(sql);
                    if(rs.next())
                    {
                %>
                <tr>
                    <td><%=rs.getString(1)%></td>
                    <td><%=rs.getString(2)%></td>
                    <td><%=rs.getString(3)%></td>
                    <td><%=rs.getString(4)%></td>
                    <td><%=rs.getString(5)%></td>
                </tr>
                <%
                    }
                    else{
                        %>
                <script>
                    alert("该教师信息未填写");
                    window.location.href="tea_mess_add.jsp"
                </script>
                <%
                    }
                    rs.close();
                %>
            </table>
        </div>
    </form>
</div>
</body>
</html>
