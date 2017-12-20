<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2017/10/15
  Time: 19:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
<html>
<head>
    <title>登录信息详情</title>
    <link rel="stylesheet" href="_css/My_table.css">
    <link rel="stylesheet" href="_css/My_site.css">
</head>
<body bgcolor="#f5f5dc">
<jsp:useBean id="read" class="myPackage.FirstBeen" scope="page"/>
<%
    String My_id=(String)session.getAttribute("my_id");
%>
<ul>
    <li style="float:right"><a href="Login.jsp" class="active">退出</a></li>
</ul>
<%
%>
<form>
    <table id="customers">
        <tr>
            <th>登录ID</th>
            <th>登录身份</th>
            <th>登录IP</th>
            <th>登录时间</th>
        </tr>
<%
   String sql="select * from Login_in_info where In_ID='"+My_id+"'";
    ResultSet rs=read.getRs(sql);
    while(rs.next()){
%>
        <tr>
            <td><%=rs.getString(1)%></td>
            <td><%=rs.getString(2)%></td>
            <td><%=rs.getString(3)%></td>
            <td><%=rs.getString(4)%></td>
        </tr>
        <%
            }
            rs.close();
        %>
    </table>
</form>
</body>
</html>
