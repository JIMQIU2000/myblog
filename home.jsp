<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/home.css">
    <link rel="stylesheet" href="./css/content.css">
    <link rel="stylesheet" href="./css/user.css">
    <title>Home</title>
</head>
<body>
    <header>
        <input type="checkbox" id="toggler">
        <label for="toggler">
            <div class="hamburger-contianer">
                <span></span>
                <span></span>
            </div>
        </label>
        <div class="nav-items">
            <ul>
                <li><a href="###">Home</a></li>
                <li><a href="./add_post.jsp">Post</a></li>
                <li><a href="https://github.com/JIMQIU2000">Github</a></li>
                <li><a href="">About</a></li>
                <li><a href="./manager.jsp">Manage</a></li>
            </ul>
        </div>
    </header>
    
    <div class="user">
        <h5>Wecome &nbsp<%=session.getAttribute("username")%>&nbsp to my blog!</h5>
        <hr>
        <a>My Setting →</a>
    </div>

    <%-- <div class="card">
        <div class="image">
            <img src="./image/G14_wallpaper_3840x2160.jpg" alt="">
        </div>
        <div class="content">
            <h4><a>ROG</a></h4>
            <div class="description">
                REPUBLIC OF GAMERS
            </div>
            <div class="description">
                JOIN THE REPUBLIC
            </div>
            <div class="description">
                USER: JIM
            </div>
            <div class="description">
                UPDATE TIME: 2077-7-7
            </div>
        </div>
    </div> --%>

    <%
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/myblog";
        String dbname = "root";
        String password = "86125007";
        Connection conn = DriverManager.getConnection(url, dbname, password);
        //connect to the database

        if(conn != null)
        {
            //out.println("The database is connected!");
            Statement stmt = null;
            ResultSet rs = null;
            String sql = "SELECT * FROM article order by id desc";
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);

            while(rs.next())
            {
                out.println("<div class='card'>");
                out.println("<div class='image'>");
                out.println("<img src='./image/G14_wallpaper_3840x2160.jpg'>");
                out.println("</div>");

                out.println("<div class='content'>");
                out.println("<h4><a href='details.jsp?id="+rs.getString("id")+"'>"+rs.getString("title")+"</a></h4>");

                out.println("<div class='description'>");
                out.println(rs.getString("content"));
                out.println("</div>");

                out.println("<div class='description'>");
                out.println("USER:&nbsp"+rs.getString("username"));
                out.println("</div>");

                out.println("<div class='description'>");
                out.println("UPDATE TIME:&nbsp"+rs.getString("update_time"));
                out.println("</div>");

                out.println("</div>");
                out.println("</div>");
            }
        }
        else
        {
            out.println("fail to connect");
        }

    }
    catch(Exception e)
    {
        out.println(e);
    }
%>
</body>
</html>