<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/manager.css">
    <title>Manager</title>
</head>
<body>
    <div class="top_menu">
        <p>Welcome <%=session.getAttribute("username")%> to manage the blog &nbsp&nbsp&nbsp<a href="home.jsp">home</a></p>
    </div>
<%-- <hr style="margin: 10px;"> --%>

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
            Statement stmt = null;
            ResultSet rs = null;
            String namenow = (String)session.getAttribute("username");
            String sql = "SELECT * FROM article where username= '"+namenow+"' order by id desc";
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);

            out.println("<table><tr id='tr1'><td id='ft'>Title</td><td id='ft'>Update time</td><td id='ft'>User</td><td id='ft'>Manage</td></tr>");
            while(rs.next()){
                out.println("<tr>");

                out.println("<td>");
                out.println(rs.getString("title"));
                out.println("</td>");

                out.println("<td>");
                out.println(rs.getString("update_time"));
                out.println("</td>");

                out.println("<td>");
                out.println(rs.getString("username"));
                out.println("</td>");

                out.println("<td>");
                String GetId = "id=" + rs.getString("id");
                String GetUser = "&username=" + rs.getString("username");
                String Gettitle = "&title=" + rs.getString("title");
                String GetContent = "&content=" + rs.getString("content");
                String Getdate = "&update_time=" + rs.getString("update_time");  
                String edit = "<a target='_blank' href='edit.jsp?"+ GetId + Gettitle + GetUser + GetContent + Getdate +"'>edit</a>";
                String delete = "&nbsp&nbsp<a href='javascript:void(0);' onclick='Confirm_delete("+rs.getString("id")+")'>delete</a>";
                out.println(edit + delete);
                out.println("</td>");                
                
                out.println("</tr>");
            }
            out.println("</table>");
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

<script> 
    function Confirm_delete(id_Par) 
    {
        var r = confirm("Do you really want to delete the article where id is " + id_Par + "?")
        if(r == true)
        {
            console.log("Delete article where id is" + id_Par);
            let xhr = null;
            if(window.XMLHttpRequest)
            {
                xhr = new XMLHttpRequest();
            }
            else
            {
                var request = new ActiveXObject("Microsoft.XMLHTTP");
            }
            xhr.open("GET", "delete_ajax.jsp?id="+id_Par, true);
            xhr.send()
            xhr.onreadystatechange = function()
            {
                if (xhr.readyState === 4 && xhr.status === 200) 
                {
                    console.log(xhr.responseText);
                    if (xhr.responseText == 111) 
                    {
                        alert("delete successfully!");
                        location.reload();
                    }
                }
            }
        }       
        else
        {
            console.log("cancel to delete");
        }
    }
</script>