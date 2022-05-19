<%@ page import="java.util.ArrayList" %>
<%@ page import="lectures.lecture2.servlets.task1.entities.NewsArticle" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 19.05.2022
  Time: 12:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous">
    </script>

    <style>
        .card:hover {
            box-shadow: 5px 5px 5px 5px rgba(0, 0, 0, 0.1);
            transform: scale(102%);
            transition: .5s;
        }

        .card {
            box-shadow: none;
            transform: scale(100%);
            transition: .5s;
        }

        body {
            min-height: 100vh;
        }
    </style>

    <title>Task 1 | Lecture 2</title>
</head>
<body>
<header>
    <jsp:include page="include/header.html"/>
</header>
<main style="margin-top: 75px">
    <div class="container">
    <%
        ArrayList<NewsArticle> articles = (ArrayList<NewsArticle>) request.getAttribute("articlesList");
        for (NewsArticle article : articles) {
    %>
        <div class="card" style="margin-bottom: 25px">
            <div class="card-body">
                    <h5 class="card-title"><%=article.getTitle()%></h5>
                    <p><%=article.getDetails()%></p>
                    <h6 class="card-subtitle">Author: <%=article.getAuthor()%></h6>
            </div>
        </div>
    <%
        }
    %>
        <a href="${pageContext.request.contextPath}/lectures/lecture2/task1/add_article.jsp"
           class="btn btn-success w-100 mb-3" style="margin-left: auto; margin-right: auto">Add New Article</a>
    </div>
</main>
<footer class="footer bg-dark" style="text-align: center; padding-top: 15px; padding-bottom: 25px; bottom: 0">
    <jsp:include page="include/footer.html"/>
</footer>
</body>
</html>