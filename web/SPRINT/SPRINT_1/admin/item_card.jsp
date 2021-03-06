<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <title>Item Card | WebCommerce</title>
    <jsp:include page="../../../other/front-libs/libs.html"/>
</head>
<body>
<jsp:include page="../include/header.jsp"/>

<main>
<div class="container mt-4">
    <c:set var="currentItemEditObject" value="${requestScope.current_item_edit}"/>
    <c:set var="brandsList" value="${requestScope.brands_list}"/>
    <c:choose>
        <c:when test="${not empty currentItemEditObject}">
            <c:choose>
            <c:when test="${not empty brandsList}">
            <h1 class="h1 text-center">Item: ${currentItemEditObject.getItemName()}</h1>
            <h3 class="fw-light text-dark mb-4 text-center">This is editing item page</h3>
            <div class="mx-auto" style="width: 550px">
                <form 
                        action="${pageContext.request.contextPath}/sprint1_admin?entity=item&command=2&id=${currentItemEditObject.getItemId()}"
                        method="post"
                        class="w-100">
                    <input type="hidden" name="2">
                    <input type="hidden" name="edit_item_id" value="${currentItemEditObject.getItemId()}"/>
                    <div class="input-group mb-1">
                        <span class="input-group-text w-25 m-0" id="addon1">Name</span>
                        <input type="text" class="form-control w-50 m-0" aria-label="Name"
                               aria-describedby="addon1" value="${currentItemEditObject.getItemName()}"
                               id="edit_item_name" name="edit_item_name" onchange="checkChanges()"
                               readonly required>
                        <button class="btn btn-light w-25 m-0" type="button"
                                onclick="allowEditing('edit_item_name', 'edit_item_name_button')"
                                id="edit_item_name_button">
                            Edit
                        </button>
                    </div>
                    <div class="input-group mb-1">
                        <span class="input-group-text w-25 m-0" id="addon2">Price</span>
                        <input type="number" class="form-control w-50 m-0" aria-label="Price" max="999999.99" min="0.99"
                               step="1.01" aria-describedby="addon2" value="${currentItemEditObject.getPrice()}"
                               id="edit_item_price" name="edit_item_price" onchange="checkChanges()"
                               readonly required>
                        <button class="btn btn-light w-25 m-0" type="button"
                                onclick="allowEditing('edit_item_price', 'edit_item_price_button')"
                                id="edit_item_price_button">
                            Edit
                        </button>
                    </div>
                    <div class="input-group mb-1">
                        <span class="input-group-text w-25 m-0" id="addon3">Brand</span>
                        <select class="form-control w-50 m-0" aria-label="Brand"
                                aria-describedby="addon3"
                                id="edit_item_brand_id" name="edit_item_brand_id"
                                readonly required onchange="checkChanges()">
                            <c:forEach var="brand" items="${brandsList}">
                                <option value="${brand.getBrandId()}">${brand.getBrandName()}</option>
                            </c:forEach>
                        </select>
                        <button class="btn btn-light w-25 m-0" type="button"
                                onclick="allowEditing('edit_item_brand_id', 'edit_item_brand_id_button')"
                                id="edit_item_brand_id_button">
                            Edit
                        </button>
                    </div>
                    <div class="input-group mb-1">
                        <span class="input-group-text w-25 m-0" id="addon4">Description</span>
                        <textarea class="form-control w-50 m-0" aria-label="Name"
                                  aria-describedby="addon4" onchange="checkChanges()"
                                  id="edit_item_description" name="edit_item_description"
                                  readonly required>${currentItemEditObject.getDescription()}</textarea>
                        <button class="btn btn-light w-25 m-0" type="button"
                                onclick="allowEditing('edit_item_description', 'edit_item_description_button')"
                                id="edit_item_description_button" >
                            Edit
                        </button>
                    </div>
                    <div class="input-group mt-2 mb-3">
                        <button type="submit" class="btn-secondary btn-outline-secondary w-100"
                                id="sendChanges" disabled>
                            Save Changes
                        </button>
                    </div>
                </form>
                <button type="button" class="btn btn-danger w-100"
                        data-bs-toggle="modal" data-bs-target="#deleteItemModal">
                    Delete Item
                </button>

                <div class="modal fade" id="deleteItemModal" tabindex="-1" aria-labelledby="deleteItemModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="deleteItemModalLabel">Are you sure?</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                                </button>
                            </div>
                            <div class="modal-body">
                                Are you really want to delete this item?
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                <form action="${pageContext.request.contextPath}/sprint1_admin" method="post">
                                    <input type="hidden" name="entity" value="item">
                                    <input type="hidden" name="command" value="3">
                                    <input type="hidden" name="delete_item_id"
                                           value="${currentItemEditObject.getItemId()}">

                                    <button type="submit" class="btn btn-danger">Delete</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </c:when>
                <c:otherwise>
                    <h3 class="h3">
                        An error was occurred while loading the page.
                        Back to the <a href="${pageContext.request.contextPath}/sprint1_admin?entity=items">list</a>?
                    </h3>
                </c:otherwise>
            </c:choose>
        </c:when>
        <c:otherwise>
            <h3 class="h3">
                An error was occurred while loading the page.
                Back to the <a href="${pageContext.request.contextPath}/sprint1_admin?entity=items">list</a>?
            </h3>
        </c:otherwise>
    </c:choose>
</div>
</main>
</body>

<script>
    <c:choose>
    <c:when test="${not empty currentItemEditObject}">
    const default_name = '${currentItemEditObject.getItemName()}',
        default_price = parseFloat('${currentItemEditObject.getPrice()}'),
        default_description = '${currentItemEditObject.getDescription()}',
        default_brand_id = '${currentItemEditObject.getBrandId()}';

    function allowEditing(elementId, buttonId) {
        if (document.getElementById(buttonId).classList.contains('btn-light')) {
            document.getElementById(elementId).removeAttribute('readonly');

            document.getElementById(buttonId).classList.remove('btn-light')
            document.getElementById(buttonId).classList.add('btn-danger');
            document.getElementById(buttonId).setAttribute("onclick", "cancelEditing('" + elementId + "', '"
                + buttonId + "')");
            document.getElementById(buttonId).innerText = 'Cancel';
        }
    }

    function cancelEditing(elementId, buttonId) {
        if (document.getElementById(buttonId).classList.contains('btn-danger')) {
            switch (elementId) {
                case "edit_item_name":
                    document.getElementById(elementId).value = default_name;
                    break;
                case "edit_item_price":
                    document.getElementById(elementId).value = default_price;
                    break;
                case "edit_item_description":
                    document.getElementById(elementId).value = default_description;
                    break;
                case "edit_item_brand_id":
                    document.getElementById(elementId).value = default_brand_id;
                    break;
            }
            document.getElementById(elementId).setAttribute('readonly', "readonly");


            document.getElementById(buttonId).classList.remove('btn-danger')
            document.getElementById(buttonId).classList.add('btn-light');
            document.getElementById(buttonId).setAttribute("onclick", "allowEditing('" + elementId + "', '"
                + buttonId + "')");
            document.getElementById(buttonId).innerText = 'Edit';

            checkChanges();
        }
    }

    function checkChanges() {
        if (document.getElementById("edit_item_name").value === default_name
        && document.getElementById("edit_item_price").value === default_price
        && document.getElementById("edit_item_brand_id").value === default_brand_id
        && document.getElementById("edit_item_description").value === default_description) {
            document.getElementById("sendChanges").setAttribute("disabled", "disabled");
        } else document.getElementById("sendChanges").removeAttribute("disabled");
    }
    </c:when>
    </c:choose>
</script>
</html>
