<%@ page import="java.util.ArrayList" %>
<%@ page import="lectures.lecture2.task2.entities.Task" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 19.05.2022
  Time: 16:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Task 2.2 | Lecture 2</title>
    <jsp:include page="/other/front-libs/libs.html"/>
</head>
<body>
<header>
    <jsp:include page="include/header.html"/>
</header>
<main>
    <div class="container mt-2">
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addTask">
            Add new task
        </button>

        <div class="modal fade" id="addTask" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
             aria-labelledby="addTaskLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addTaskLabel">Add Task</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="${pageContext.request.contextPath}/lec2task2?command=add" method="post">
                            <div class="mb-3 w-100">
                                <label for="title" class="form-label">Task title:</label>
                                <input type="text" class="form-control" id="title"
                                       placeholder="Enter name of a new task" name="newTask_name" required>
                            </div>
                            <div class="mb-3 w-100">
                                <label for="details">Task details:</label>
                                <textarea class="form-control" id="details" rows="3"
                                          required name="newTask_description">
                                </textarea>
                            </div>
                            <div class="mb-3 w-100">
                                <label for="deadline" class="form-label">Task deadline date:</label>
                                <input type="date" class="form-control" id="deadline" name="newTask_deadline" required>
                            </div>
                            <div class="form-check form-switch mb-5">
                                <input class="form-check-input" type="checkbox"
                                       id="isCompleted" name="newTask_status">
                                <label class="form-check-label" for="isCompleted">Completed</label>
                            </div>
                            <div class="mb-3 w-100">
                                <button class="btn btn-primary" type="submit">Add</button>
                                <button class="btn btn-secondary" type="reset">Reset</button>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancel</button>
                    </div>
                </div>
            </div>
        </div>
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Name</th>
                    <th scope="col">Done</th>
                    <th scope="col">Deadline</th>
                    <th scope="col" style="text-align: center">Details</th>
                </tr>
            </thead>
            <tbody>
                <%
                    ArrayList<Task> tasks = (ArrayList<Task>) request.getAttribute("tasksList");
                    
                    if (tasks != null) {
                        if (tasks.size() != 0) {
                            for (Task task : tasks) {
                %>
                <tr>
                    <th scope="row"><%=task.getTaskId()%></th>
                    <td><%=task.getTaskName()%></td>
                    <td>
                        <%
                            if (task.getCompleted()) {
                        %>
                        <span style="color: green">Yes</span>
                        <%
                            } else {
                        %>
                        <span style="color:red;">No</span>
                        <%
                            }
                        %>
                    </td>
                    <td>
                        <%=task.getDeadlineDate()%>
                    </td>
                    <td>
                        <a href="${pageContext.request.contextPath}
                        /lec2task2?command=showDetails&currentTaskId=<%=task.getTaskId()%>"
                           class="btn btn-primary w-100">
                            Details
                        </a>
                    </td>
                </tr>
                <%
                    }
                        } else {
                %>
                <tr>
                    <td colspan="5" style="text-align: center">No tasks available.
                        <a href="${pageContext.request.contextPath}/lec2task2?command=add" class="link-primary">
                            Add Task
                        </a>
                    </td>
                </tr>
                <%
                        }
                } else {
                %>
                <td colspan="5" style="text-align: center">Error while reading tasks. Try to
                    <a href="${pageContext.request.contextPath}/lec2task2" class="link-primary">
                        Reload the page
                    </a>
                </td>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
</main>
</body>
</html>
