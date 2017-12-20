<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2017/10/12
  Time: 20:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
<html>
<head>
    <title>信息浏览[学生]</title>
    <link rel="stylesheet" href="_css/My_table.css">
    <link rel="stylesheet" href="_css/My_Button.css">
    <link rel="stylesheet" href="_css/My_site.css">
</head>
<body>
<jsp:useBean id="read" class="myPackage.FirstBeen" scope="page"/>

<%

%>
<%
    String Num=(String)session.getAttribute("num");
    String sql="select * from info_stu_in where stu_ID='"+Num+"'";
    ResultSet rs=read.getRs(sql);
    if(rs.next()){
    %>

      <table id="customers">
          <tr>
              <th>学号</th>
              <th>姓名</th>
              <th>性别</th>
              <th>电话</th>
              <th>班级</th>
              <th>爱好</th>
              <th>教师评价</th>
          </tr>
          <tr>
              <td><%=rs.getString(1)%></td>
              <td><%=rs.getString(2)%></td>
              <td><%=rs.getString(3)%></td>
              <td><%=rs.getString(4)%></td>
              <td><%=rs.getString(5)%></td>
              <td><%=rs.getString(6)%></td>
              <td><%=rs.getString(7)%></td>
          </tr>
      </table>
        <br>

<%
        }
        rs.close();

%>

</body>
</html>
