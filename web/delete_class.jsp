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
    <title>Title</title>
    <script type="text/javascript">
        function reback() {
            window.location.href='teacher_main.jsp';
        }
    </script>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    String message=request.getParameter("str1");
        String driverName="com.mysql.jdbc.Driver";
        String userName="root";
        String userPassword="895772";
        String dbName="teamwork";
        String tableName="course_info";
        String url="jdbc:mysql://106.15.94.218/"+dbName+"?useUnicode=true&characterEncoding=UTF-8";
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        Connection conn = DriverManager.getConnection(url,userName,userPassword);
        Statement stmt = conn.createStatement();
        ResultSet rs=stmt.executeQuery("select * from course_info where c_id='"+message+"'");
        if(rs.next()){
            String sql1=("delete from course_info where c_id='"+message+"'");
                stmt.executeUpdate(sql1);
            response.sendRedirect("total_class.jsp");
        }else{
%>
<script>
    alert("未找到该课程");
    window.location.href="total_class.jsp"
</script>
<%
        }
        rs.close();
        stmt.close();
        conn.close();
%>
</body>
</html>
