<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2017/10/12
  Time: 20:07
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>

<html>
<head>
    <title>信息浏览[教师]</title>
    <script src="_js/jquery-3.2.1.min.js"></script>
    <link rel="stylesheet" href="_css/My_table.css">
    <link rel="stylesheet" href="_css/My_Button.css">
    <link rel="stylesheet" href="_css/My_site.css">

</head>
<body bgcolor="#f5f5dc">

<script >
    window.onload=function(){

        var arr=document.getElementsByTagName('button');
        if(arr!=null){
            for(var i = 0;i<arr.length;i++){
                arr[i].onclick = function(){
                    var t_appraise=prompt('请给该学生添加评价');
                    var check_id=this.id;
                    var message=check_id+" "+t_appraise;
                    window.location.href='in.jsp?str1='+encodeURI(encodeURI(message));

                }
            }
        }
    }

</script>
<%
    String My_id=(String)session.getAttribute("my_id");
    String My_ip=(String)session.getAttribute("my_ip");
    String My_time=(String)session.getAttribute("my_time");
    String login_info=My_id+"   "+My_ip+"   "+My_time;

%>
<ul>
    <li><a href="Login_in_info_teacher.jsp"><%=login_info%></a></li>
    <li style="float:right"><a href="Login.jsp" class="active">退出</a></li>
</ul>
<%

%>
<form>
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
<jsp:useBean id="read" class="myPackage.FirstBeen" scope="page"/>
        <%
            String sql="select * from info_stu_in";
            ResultSet rs=read.getRs(sql);
            while(rs.next()){
                %>
                    <tr>
                    <td><%=rs.getString(1)%></td>
                    <td><%=rs.getString(2)%></td>
                    <td><%=rs.getString(3)%></td>
                    <td><%=rs.getString(4)%></td>
                    <td><%=rs.getString(5)%></td>
                    <td><%=rs.getString(6)%></td>
                        <%
                            if(rs.getString(7)==null){
                                String str=rs.getString(1);
                                %>
                        <td><Button type="button"  class="button" style="vertical-align: middle" id=<%=str%> ><span>评价</span></Button></td>
                                <%
                            }else{
                                %>
                                <td><%=rs.getString(7)%></td>
                                <%
                            }
                        %>
                    </tr>
                <%

            }

        rs.close();

    %>

    </table>
</form>



</body>
</html>
