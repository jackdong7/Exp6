<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2017/10/12
  Time: 20:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="java.sql.*"%>
<%@ page import="myPackage.*"%>
<html>
<head>
    <title>信息录入</title>

    <link rel="stylesheet" href="_css/login.css"/>
    <script src="_js/login.js" type="text/javascript"></script>
    <script src="_js/jquery.min.js" type="text/javascript"></script>
</head>
<body >

<%  String Num=(String)session.getAttribute("num"); %>
<div class="page">
    <div class="loginwarrp">
        <div class="logo">信息录入</div>
        <div class="login_form">
            <form method="post">
                <ul class="login-item">
                    <span>学号:</span>
                    <input type="text" name="ID" class="login_input" value="<%out.print(Num);%>" readonly="true">
                </ul>
                <ul class="login-item">
                    <span>姓名:</span>
                    <input type="text" name="Name" class="login_input">
                </ul>
                <ul class="login-item">

                    <span>性别:</span>

                    <input type="radio" name="Sex" value="男">男

                    <input type="radio" name="Sex" value="女">女
                </ul>
                <ul class="login-item">
                    <span>电话:</span>
                    <input type="text" name="Tel" class="login_input">
                </ul>
                <ul class="login-item">
                    <span>班级:</span>
                    <select name="Grade"><option value="大学一年级">大学一年级</option><option value="大学二年级">大学二年级</option>
                        <option value="大学三年级">大学三年级</option><option value="大学四年级">大学四年级</option></select>
                    <select name="Profession"><option value="计算机科学与技术">计算机科学与技术</option><option value="软件工程">软件工程</option>
                    </select>
                    <select name="Class_num"><option value="1班">1班</option><option value="2班">2班</option></select>
                </ul>
                <ul class="login-item">
                    <span>爱好:</span>
                    <input type="checkbox" name="Hobby" value="运动">运动
                    <input type="checkbox" name="Hobby" value="阅读">阅读
                    <input type="checkbox" name="Hobby" value="游戏">游戏
                    <br>
                    <span>其他:</span>
                    <input type="text" name="Other_Hobby">
                </ul>
                <ul class="login-sub">
                        <input type="submit" name="Submit" value="提交" />
                </ul>
            </form>
            </div>
    </div>
</div>


</form>
<jsp:useBean id="write" class="myPackage.FirstBeen"/>
<%
    request.setCharacterEncoding("UTF-8");
    String id=request.getParameter("ID");
    String name=request.getParameter("Name");
    String sex=request.getParameter("Sex");
    String tel=request.getParameter("Tel");
    String class_num=request.getParameter("Grade")+" "+request.getParameter("Profession")+" "+request.getParameter("Class_num");
    StringBuilder sb=new StringBuilder();
    String check[]=request.getParameterValues("Hobby");
    if(check!=null){
        for(String x:check){
            sb.append(x+" ");
        }
    }
    sb.append(request.getParameter("Other_Hobby"));
    String hobby=sb.toString();
    if(id!=null&&name!=null&&sex!=null&&tel!=null&&class_num!=null&&hobby!=null){
        String tel_standard="\\d{11}";   //正则表达式验证手机号是否符合要求
        if(tel.matches(tel_standard)){
            String sql="insert into info_stu_in(stu_ID,stu_Name,stu_Sex,stu_Tel,stu_Classroom,stu_Hobby) values('"+id+"','"+name+"','"+sex+"','"+tel+"','"+class_num+"','"+hobby+"')";
            write.write_in(sql);
            %>
                <script>
                    alert('信息录入成功');
                </script>
                <%
                   response.sendRedirect("student_main.jsp");
                %>
            <%
        }else{
            %>
                <script>
                    alert('手机号输入有误');
                </script>
            <%
        }
    }
%>
</body>
</html>
