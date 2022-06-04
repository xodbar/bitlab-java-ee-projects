<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="step" value="${sessionScope.step}"/>
<header class="header">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#">Form Steps</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup"
                aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
            <div class="navbar-nav">
                <a class="nav-item nav-link"
                   href="${pageContext.request.contextPath}./lectures/lecture7/task1/index.jsp">
                    Step 1
                </a>
                <c:if test="${step > 1}">
                    <a class="nav-item nav-link <c:if test="${step == 2}">active</c:if>"
                       href="../step2.jsp">
                        Step 2
                    </a>
                    <c:if test="${step > 2}">
                        <a class="nav-item nav-link <c:if test="${step == 3}">active</c:if>"
                           href="../step3.jsp">
                            Step 3
                        </a>
                        <c:if test="${step > 3}">
                            <a class="nav-item nav-link <c:if test="${step == 4}">active</c:if>"
                               href="${pageContext.request.contextPath}../result.jsp">
                                Result
                            </a>
                        </c:if>
                    </c:if>
                </c:if>
            </div>
        </div>
    </nav>
</header>

