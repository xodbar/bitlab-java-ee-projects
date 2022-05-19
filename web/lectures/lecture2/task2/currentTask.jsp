<%@ page import="lectures.lecture2.task2.entities.Task" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 19.05.2022
  Time: 17:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Task 2.2 | Lecture 2</title>
    <jsp:include page="../../../other/front-libs/libs.html"/>
</head>
<body>
<header>
    <jsp:include page="include/header.html"/>
</header>
<main>
    <div class="container mt-2">
        <%
            Task currentTaskObject = (Task) request.getAttribute("currentTask");
        %>
        <form action="${pageContext.request.contextPath}/lec2task2?command=overwrite&currentTaskId=<%=currentTaskObject.getTaskId()%>" method="post">
            <div class="mb-3 w-100">
                <label for="title" class="form-label">Task title:</label>
                <input type="text" class="form-control" id="title"
                       placeholder="Enter name of a new task" name="task_name"
                       value="<%=currentTaskObject.getTaskName()%>" required>
            </div>
            <div class="mb-3 w-100">
                <label for="details">Task details:</label>
                <textarea class="form-control" id="details" rows="3"
                          required name="task_description">
                                <%=currentTaskObject.getDescription()%></textarea>
            </div>
            <div class="mb-3 w-100">
                <label for="deadline" class="form-label">Task deadline date:</label>
                <input type="date" class="form-control" id="deadline" name="task_deadline" required
                       value="<%=currentTaskObject.getDeadlineDate()%>">
            </div>
            <div class="form-check form-switch mb-5 w-100" style="margin-left: auto; margin-right: auto">
                <input class="btn-check w-100" type="checkbox"
                       id="isCompleted" name="task_status"
                       checked="<%=(currentTaskObject.getCompleted() ? "checked" : null)%>">
                <label class="btn btn-outline-primary w-100" for="isCompleted">
                    Click to Complete/Incomplete the task
                </label>
            </div>
            <div class="mb-3 w-100" style="display:flex; justify-content: space-around; flex-wrap: wrap;
            margin-left: auto; margin-right: auto">
                <button class="btn btn-success" type="submit" style="width: 45%">Save</button>
                <button class="btn btn-secondary" type="reset" style="width: 45%">Reset</button>
            </div>
        </form>
        <form action="${pageContext.request.contextPath}/lec2task2?command=delete&currentTaskId=<%=currentTaskObject.getTaskId()%>" method="post">
            <button class="btn btn-danger w-100 btn-lg">Delete Task</button>
        </form>
    </div>
</main>
<footer>

</footer>
</body>
</html>
