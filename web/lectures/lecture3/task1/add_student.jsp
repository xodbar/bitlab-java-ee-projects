<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 22.05.2022
  Time: 21:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <title>Add Student</title>
    <jsp:include page="../../../other/front-libs/libs.html"/>
</head>
<body>
<jsp:include page="include/header.html"/>

<main>
    <div class="container" style="display: flex; flex-direction: column; align-items: center">
        <form action="${pageContext.request.contextPath}/lec3task1" method="post" style="width: 250px;">
            <div class="form-group">
                <label for="student_name">Name:</label>
                <input required class="form-control" type="text" id="student_name" name="student_name">
            </div>
            <div class="form-group">
                <label for="student_surname">Surname:</label>
                <input required class="form-control" type="text" id="student_surname" name="student_surname">
            </div>
            <div class="form-group">
                <label for="student_birth_date">Birth Date:</label>
                <input required class="form-control" type="date" id="student_birth_date" name="student_birth_date">
            </div>
            <div class="form-group">
                <label for="student_city">City:</label>
                <select class="form-select" id="student_city" name="student_city" required>
                    <option value="Almaty">Almaty</option>
                    <option value="Taldykorgan">Taldykorgan</option>
                    <option value="Aktau">Aktau</option>
                    <option value="Shymkent">Shymkent</option>
                </select>
            </div>
            <div class="form-group" style="display:flex; justify-content: space-between; flex-wrap: wrap">
                <button type="submit" class="btn btn-primary">Add</button>
                <a href="${pageContext.request.contextPath}/lec3task1" class="btn btn-secondary w-25">Back to List</a>
            </div>
        </form>
    </div>
</main>
</body>
</html>
