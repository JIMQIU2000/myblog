<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>reg.jsp</title>
    <link rel="stylesheet" href="./css/loading.css">
</head>
<body>
    <div class="loading">
        <h1>Loading</h1>
        <div class="wrapper">
            <div class="item"></div>
            <div class="item"></div>
            <div class="item"></div>
            <div class="item"></div>
            <div class="item"></div>
        </div>
    </div>
<%
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/myblog";
        String dbname = "root";
        String password = "86125007";
        Connection conn = DriverManager.getConnection(url, dbname, password);
        //connect to the database

        String name = request.getParameter("username");
        String title = request.getParameter("title");
        String update_time = request.getParameter("update_time");
        String content = request.getParameter("content");


        if(conn != null)
        {
            //out.println("The database is connected!");
            Statement stmt = null;
            ResultSet rs = null;
            String sql = "INSERT INTO article (username, update_time, title, content) VALUES ('"+name+"','"+update_time+"','"+title+"','"+content+"')";
            stmt = conn.createStatement();
            stmt.execute(sql);
            
            out.println("<div class='res'>");
            out.println("post successfuly!");
            out.println("</div>");

            response.setHeader("refresh", "2;URL=home.jsp");
        }
        else
        {
            out.println("<div class='res'>");
            out.println("Fail to conect!");
            out.println("</div>");
        }


    }
    catch(Exception e)
    {
        out.println(e);
    }
%>
</body>
</html>