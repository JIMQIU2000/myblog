<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Post</title>
    <link rel="stylesheet" href="./css/post.css">
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
                <li><a href="./home.jsp">Home</a></li>
                <li><a href="./add_post.jsp">Post</a></li>
                <li><a href="https://github.com/JIMQIU2000">Github</a></li>
                <li><a href="">About</a></li>
                <li><a href="./manager.jsp">Manage</a></li>
            </ul>
        </div>
    </header>

    <div class="container">
        <h1>POST</h1>
        <form action="post.jsp" method="GET">
            <table>
                <tr>
                    <td>NAME:</td>
                    <td><input class="username" name="username" value='<%=session.getAttribute("username")%>'></td>
                    <td>TITLE:</td>
                    <td><input class="title" type="text" name="title"></td>
                </tr>
                <tr>

                </tr>
                <tr>
                    <td>DATE:</td>
                    <td colspan="3"><input class="date" type="date" name="update_time"></td>
                </tr>
                <tr>
                    <td>CONTENT:</td>
                    <td colspan="3"><textarea class="content" name="content"></textarea></td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align:center;"><button type="submit">SUMBIT</button></td>
                </tr>
            </table>
        </form>
    </div>

</body>

</html>