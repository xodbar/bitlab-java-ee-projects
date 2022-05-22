<%@ page import="java.util.ArrayList" %>
<%@ page import="lectures.lecture3.entities.Student" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 22.05.2022
  Time: 19:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <title>Students App</title>
    <jsp:include page="./../../../other/front-libs/libs.html"/>
</head>
<body>
<jsp:include page="./include/header.html"/>

<main>
    <div class="container">
        <%
            ArrayList<Student> students = (ArrayList<Student>) request.getAttribute("students");
        %>
        <table class="table table-hover">
            <thead style="font-weight: bold">
            <tr>
                <td>ID</td>
                <td>Name</td>
                <td>Surname</td>
                <td>Birth Date</td>
                <td>City</td>
            </tr>
            </thead>
            <tbody>
            <%
                for (Student student : students) {
            %>
            <tr>
                <td><%=student.getStudentId()%></td>
                <td><%=student.getStudentName()%></td>
                <td><%=student.getSurname()%></td>
                <td><%=student.getBirthDate()%></td>
                <td><%=student.getCity()%></td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>
</main>
</body>
</html>
