<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Movie Ticket - Combo Management</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
</head>

<body id="page-top">
    <!-- Page Wrapper -->
    <div id="wrapper">
        <!-- Include Sidebar -->
        <jsp:include page="includes/sidebar.jsp" />

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">
            <!-- Main Content -->
            <div id="content">
                <!-- Include Topbar -->
                <jsp:include page="includes/topbar.jsp" />

                <!-- Begin Page Content -->
                <div class="container-fluid">
                    <!-- Page Heading -->
                    <h1 class="h3 mb-4 text-gray-800">Combo Management</h1>

                    <!-- Success/Error Messages -->
                    <c:if test="${not empty successMessage}">
                        <div class="alert alert-success alert-dismissible fade show" role="alert">
                            ${successMessage}
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                    </c:if>
                    <c:if test="${not empty errorMessage}">
                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                            ${errorMessage}
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                    </c:if>

                    <!-- Combo Management Content -->
                    <div class="row">
                        <!-- Add New Combo Card -->
                        <div class="col-xl-4 col-md-6 mb-4">
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                Add New Combo</div>
                                            <form action="ComboManagementServlet" method="POST" id="addComboForm">
                                                <input type="hidden" name="action" value="add">
                                                <div class="form-group">
                                                    <input type="text" class="form-control" name="comboName" id="comboName" 
                                                           placeholder="Combo Name" required>
                                                </div>
                                                <div class="form-group">
                                                    <textarea class="form-control" name="comboDescription" id="comboDescription" 
                                                              rows="3" placeholder="Description" required></textarea>
                                                </div>
                                                <div class="form-group">
                                                    <input type="number" class="form-control" name="comboPrice" id="comboPrice" 
                                                           placeholder="Price" step="0.01" min="0" required>
                                                </div>
                                                <button type="submit" class="btn btn-primary">Add Combo</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Existing Combos List -->
                        <div class="col-xl-8 col-md-6 mb-4">
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Existing Combos</h6>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-bordered" id="comboTable" width="100%" cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Name</th>
                                                    <th>Description</th>
                                                    <th>Price</th>
                                                    <th>Actions</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${combos}" var="combo">
                                                    <tr>
                                                        <td>${combo.id}</td>
                                                        <td>${combo.name}</td>
                                                        <td>${combo.description}</td>
                                                        <td>$${combo.price}</td>
                                                        <td>
                                                            <button class="btn btn-info btn-sm edit-btn" 
                                                                    data-id="${combo.id}"
                                                                    data-name="${combo.name}"
                                                                    data-description="${combo.description}"
                                                                    data-price="${combo.price}">
                                                                <i class="fas fa-edit"></i>
                                                            </button>
                                                            <form action="ComboManagementServlet" method="POST" style="display: inline;">
                                                                <input type="hidden" name="action" value="delete">
                                                                <input type="hidden" name="comboId" value="${combo.id}">
                                                                <button type="submit" class="btn btn-danger btn-sm delete-btn" 
                                                                        onclick="return confirm('Are you sure you want to delete this combo?')">
                                                                    <i class="fas fa-trash"></i>
                                                                </button>
                                                            </form>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Edit Combo Modal -->
                    <div class="modal fade" id="editComboModal" tabindex="-1" role="dialog" aria-labelledby="editComboModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="editComboModalLabel">Edit Combo</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <form action="ComboManagementServlet" method="POST">
                                    <div class="modal-body">
                                        <input type="hidden" name="action" value="edit">
                                        <input type="hidden" name="comboId" id="editComboId">
                                        <div class="form-group">
                                            <label for="editComboName">Combo Name</label>
                                            <input type="text" class="form-control" name="comboName" id="editComboName" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="editComboDescription">Description</label>
                                            <textarea class="form-control" name="comboDescription" id="editComboDescription" rows="3" required></textarea>
                                        </div>
                                        <div class="form-group">
                                            <label for="editComboPrice">Price</label>
                                            <input type="number" class="form-control" name="comboPrice" id="editComboPrice" step="0.01" min="0" required>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                        <button type="submit" class="btn btn-primary">Save Changes</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- End of Main Content -->

            <!-- Include Footer -->
            <jsp:include page="includes/footer.jsp" />
        </div>
        <!-- End of Content Wrapper -->
    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

    <!-- Page level custom scripts -->
    <script>
        $(document).ready(function() {
            // Handle edit button click
            $('.edit-btn').on('click', function() {
                const id = $(this).data('id');
                const name = $(this).data('name');
                const description = $(this).data('description');
                const price = $(this).data('price');

                $('#editComboId').val(id);
                $('#editComboName').val(name);
                $('#editComboDescription').val(description);
                $('#editComboPrice').val(price);

                $('#editComboModal').modal('show');
            });
        });
    </script>
</body>

</html>
