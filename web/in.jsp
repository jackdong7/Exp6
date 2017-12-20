<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2017/10/15
  Time: 9:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
<html>
<head>
    <title>Title</title>
    <meta http-equiv="content-type" content="text/html;charset=UTF-8">
</head>
<body>
<jsp:useBean id="write" class="myPackage.FirstBeen" scope="page"/>
<%
    request.setCharacterEncoding("UTF-8");
    String message=request.getParameter("str1");
    message=java.net.URLDecoder.decode(message, "UTF-8");
    String[] Message=message.split(" ");

    if(Message[0]!=null&&Message[1]!=null){
        String sql="update info_stu_in set stu_Appraise='"+Message[1]+"' where stu_ID='"+Message[0]+"'";
        write.write_in(sql);
        response.sendRedirect("info_teacher.jsp");
    }
%>
</body>
</html>
