<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" errorPage="error.jsp" isELIgnored="false"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="ISO-8859-1">
  	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Admin</title>

    <!-- Custom fonts for this template -->
    <link href="https://ngocthien2306.github.io/Admin-Site/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="https://ngocthien2306.github.io/Admin-Site/css/sb-admin-2.min.css" rel="stylesheet">


    <!-- Custom styles for this page -->
    <link href="https://ngocthien2306.github.io/Admin-Site/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
		<c:import url="shareCode/leftHeader.jsp"></c:import>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">
	
            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
				<c:import url="shareCode/headerUser.jsp"></c:import>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">Tables</h1>


                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">List of Product</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>NXB</th>
                                            <th>SKU</th>
                                            <th>Code</th>
                                            <th>Author Name</th>
                                            <th>Title</th>
                                            <th>Price</th>
											<th>Active</th>
                                        </tr>
                                    </thead>
                                    <tbody>
										<c:forEach var="item" items="${list}">
										<c:url var="link" value="product">
						                  <c:param name="command" value="Load" />
						                  <c:param name="id" value="${item.id}" />
						                </c:url>
						                <c:url var="remove" value="product">
						                  <c:param name="command" value="Delete" />
						                  <c:param name="id" value="${item.id}" />
						                </c:url>
										<tr>
                                            <th>${item.NXB}</th>
                                            <th>${item.getSku()}</th>
                                            <th>${item.codeProduct}</th>
                                            <th>${item.nameAuthor}</th>
                                            <th> <span
												style="display: block;
												width: 320px;
												overflow: hidden;
												white-space: nowrap;
												text-overflow: ellipsis;">
												${item.getProductName()}
												</span>
											</th>
                                            <th>${item.price}</th>
                                            <th>
                                            	<a href="${link}">
                                            		<input type="hidden" name="pId" value=""/>
													<span><button type="submit"
													style="border: none; color: #2196f3; background: transparent;"> 
														<i class="fas fa-edit"></i> 
													</button>  
													</span>
												</a>
												<a href="${remove}">
													<span><button type="submit"
													style="border: none; color: #E74C3C; background: transparent;"> 
														<i class="fas fa-trash-alt"></i> 
													</button>  
													</span>                                 	
												</a>
                                            </th>
                                        </tr>
										</c:forEach>
									</tbody>
                                    <tfoot>
                                        <tr>
                                            <th>NXB</th>
                                            <th>SKU</th>
                                            <th>Code</th>
                                            <th>Author Name</th>
											<th>Title</th>
                                            <th>Price</th>
											<th>Active</th>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2020</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="https://ngocthien2306.github.io/Admin-Site/vendor/jquery/jquery.min.js"></script>
    <script src="https://ngocthien2306.github.io/Admin-Site/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="https://ngocthien2306.github.io/Admin-Site/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="https://ngocthien2306.github.io/Admin-Site/js/sb-admin-2.min.js"></script>
    <!-- Page level plugins -->
	<script src="https://ngocthien2306.github.io/Admin-Site/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="https://ngocthien2306.github.io/Admin-Site/vendor/datatables/dataTables.bootstrap4.min.js"></script>
	
    <!-- Page level custom scripts -->
    <script src="https://ngocthien2306.github.io/Admin-Site/js/demo/datatables-demo.js"></script>

</body>

</html>
