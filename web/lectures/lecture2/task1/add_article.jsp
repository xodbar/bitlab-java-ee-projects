<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 19.05.2022
  Time: 14:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
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
        body {
            min-height: 100vh;
        }
    </style>

    <title>Add | Task 2.1</title>
</head>
<body>
<header>
    <jsp:include page="include/header.html"/>
</header>
<main>
    <div class="container" style="margin-top: 75px">
        <form action="${pageContext.request.contextPath}/lec2task1" method="post">
            <div class="w-75 mb-3">
                <label for="title" class="form-label">Title:</label>
                <input type="text" class="form-control" id="title" name="newArticle_title">
            </div>
            <div class="w-75 mb-3">
                <label for="details" class="form-label">Details (Content):</label>
                <textarea class="form-control" id="details" rows="5" name="newArticle_details"></textarea>
            </div>
            <div class="w-75 mb-4">
                <label for="author" class="form-label">Author:</label>
                <input type="text" class="form-control" id="author" name="newArticle_author">
            </div>
            <div class="w-75 mb-3">
                <select class="form-select form-select-lg mb-3" aria-label=".form-select-lg example"
                        name="newArticle_category">
                    <option selected>Open this select menu</option>
                    <option value="culture">Culture</option>
                    <option value="sport">Sport</option>
                    <option value="cinema">Cinema</option>
                </select>
            </div>
            <div class="w-75 mb-3">
                <button class="btn btn-primary" type="submit">Add Article</button>
                <button class="btn btn-secondary" type="reset">Reset Fields</button>
            </div>
        </form>
    </div>
</main>
<footer class="footer bg-dark" style="text-align: center; padding-top: 15px; padding-bottom: 25px; bottom: 0">
    <jsp:include page="include/footer.html"/>
</footer>
</body>
</html>
