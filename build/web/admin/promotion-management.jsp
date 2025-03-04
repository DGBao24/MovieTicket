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

    <title>Movie Ticket - Promotion Management</title>

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
        <jsp:include page="sidebar.jsp" />

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">
            <!-- Main Content -->
            <div id="content">
                <!-- Include Topbar -->
                <jsp:include page="includes/topbar.jsp" />
                <jsp:include page="topbar.jsp" />

                <!-- Begin Page Content -->
                <div class="container-fluid">
                    <!-- Page Heading -->
                    <h1 class="h3 mb-4 text-gray-800">Promotion Management</h1>

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

                    <!-- Promotion Management Content -->
                    <div class="row">
                        <!-- Add New Promotion Card -->
                        <div class="col-xl-4 col-md-6 mb-4">
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                Add New Promotion</div>
                                            <form action="PromotionManagementServlet" method="POST" id="addPromotionForm">
                                                <input type="hidden" name="action" value="add">
                                                <div class="form-group">
                                                    <input type="text" class="form-control" name="promoCode" id="promoCode" 
                                                           placeholder="Promotion Code" required>
                                                </div>
                                                <div class="form-group">
                                                    <input type="number" class="form-control" name="discountPercent" id="discountPercent" 
                                                           placeholder="Discount Percent" min="0" max="100" required>
                                                </div>
                                                <div class="form-group">
                                                    <label for="startDate">Start Date</label>
                                                    <input type="date" class="form-control" name="startDate" id="startDate" required>
                                                </div>
                                                <div class="form-group">
                                                    <label for="endTime">End Date</label>
                                                    <input type="date" class="form-control" name="endTime" id="endTime" required>
                                                </div>
                                                <div class="form-group">
                                                    <select class="form-control" name="status" id="status" required>
                                                        <option value="1">Active</option>
                                                        <option value="0">Inactive</option>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <textarea class="form-control" name="description" id="description" 
                                                              rows="3" placeholder="Description"></textarea>
                                                </div>
                                                <div class="form-group">
                                                    <select class="form-control" name="customerId" id="customerId">
                                                        <option value="">Select Customer (Optional)</option>
                                                        <c:forEach items="${customers}" var="customer">
                                                            <option value="${customer.accountId}">${customer.username}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                                <button type="submit" class="btn btn-primary">Add Promotion</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Existing Promotions List -->
                        <div class="col-xl-8 col-md-6 mb-4">
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Existing Promotions</h6>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-bordered" id="promotionTable" width="100%" cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Code</th>
                                                    <th>Discount</th>
                                                    <th>Start Date</th>
                                                    <th>End Date</th>
                                                    <th>Status</th>
                                                    <th>Description</th>
                                                    <th>Customer</th>
                                                    <th>Actions</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${promotions}" var="promotion">
                                                    <tr>
                                                        <td>${promotion.promotionId}</td>
                                                        <td>${promotion.promoCode}</td>
                                                        <td>${promotion.discountPercent}%</td>
                                                        <td>${promotion.startDate}</td>
                                                        <td>${promotion.endTime}</td>
                                                        <td>
                                                            <span class="badge badge-${promotion.status ? 'success' : 'danger'}">
                                                                ${promotion.status ? 'Active' : 'Inactive'}
                                                            </span>
                                                        </td>
                                                        <td>${promotion.description}</td>
                                                        <td>${promotion.customerUsername}</td>
                                                        <td>
                                                            <button class="btn btn-info btn-sm edit-btn" 
                                                                    data-id="${promotion.promotionId}"
                                                                    data-code="${promotion.promoCode}"
                                                                    data-discount="${promotion.discountPercent}"
                                                                    data-start="${promotion.startDate}"
                                                                    data-end="${promotion.endTime}"
                                                                    data-status="${promotion.status}"
                                                                    data-description="${promotion.description}"
                                                                    data-customer="${promotion.customerId}">
                                                                <i class="fas fa-edit"></i>
                                                            </button>
                                                            <form action="PromotionManagementServlet" method="POST" style="display: inline;">
                                                                <input type="hidden" name="action" value="delete">
                                                                <input type="hidden" name="promotionId" value="${promotion.promotionId}">
                                                                <button type="submit" class="btn btn-danger btn-sm delete-btn" 
                                                                        onclick="return confirm('Are you sure you want to delete this promotion?')">
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

    <!-- Page level plugins -->
    <script src="vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page specific script -->
    <script>
        $(document).ready(function() {
            // Initialize DataTable
            $('#promotionTable').DataTable();

            // Set min date for date inputs to today
            const today = new Date().toISOString().split('T')[0];
            document.getElementById('startDate').min = today;
            document.getElementById('endTime').min = today;

            // Validate end date is after start date
            document.getElementById('startDate').addEventListener('change', function() {
                document.getElementById('endTime').min = this.value;
            });

            // Edit button click handler
            $('.edit-btn').click(function() {
                const id = $(this).data('id');
                const code = $(this).data('code');
                const discount = $(this).data('discount');
                const start = $(this).data('start');
                const end = $(this).data('end');
                const status = $(this).data('status');
                const description = $(this).data('description');
                const customer = $(this).data('customer');

                // Populate form
                $('#promoCode').val(code);
                $('#discountPercent').val(discount);
                $('#startDate').val(start);
                $('#endTime').val(end);
                $('#status').val(status ? '1' : '0');
                $('#description').val(description);
                $('#customerId').val(customer);

                // Change form action
                $('#addPromotionForm').attr('action', 'PromotionManagementServlet?action=update&promotionId=' + id);
                
                // Change button text
                $('#addPromotionForm button[type="submit"]').text('Update Promotion');

                // Scroll to form
                $('html, body').animate({
                    scrollTop: $("#addPromotionForm").offset().top
                }, 500);
            });
        });
    </script>
</body>
</html>
