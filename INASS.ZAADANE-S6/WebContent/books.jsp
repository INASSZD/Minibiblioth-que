<%@page import="com.util.User"%>
<%@page import="com.util.book"%>
<%@page import="java.util.List"%>
<%@page import="com.util.bookManager"%>
<%@page import="com.util.UserManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
    User ut=(User)session.getAttribute("user");
    %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Books</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/adminlte.min.css">
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">

  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-white navbar-light">
  
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="#" class="nav-link">Books</a>
      </li>
       <%if(ut.getRole().equalsIgnoreCase("admin")){ %>  <li class="nav-item d-none d-sm-inline-block">
        <a href="starter.jsp" class="nav-link">  Users</a>
      </li>
    </ul> <%} %> 

  
      </li>

      <!-- Messages Dropdown Menu -->
      <li class="nav-item dropdown">
       
      
      
      <li class="nav-item">
        <a class="nav-link" data-widget="fullscreen" href="#" role="button">
          <i class="fas fa-expand-arrows-alt"></i>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" data-widget="control-sidebar" data-slide="true" href="#" role="button">
          <i class="fas fa-th-large"></i>
        </a>
      </li>
    </ul>
  </nav>
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="#" class="brand-link">
      <img src="dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
  
      <%if(ut.getRole().equalsIgnoreCase("admin")){ %>    <span class="brand-text font-weight-light">Espace Admin </span>
   
<%} %>
<%if(ut.getRole().equalsIgnoreCase("guest")){ %>  <span class="brand-text font-weight-light"> Espace guest </span>

<%} %>
    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        
       <i class="far fa-user"> <a href="#" class="d-block"><%=ut.getLog() %></a></i>
        </div>
     
      </div>

      <!-- SidebarSearch Form -->
 

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->  
               <%if(ut.getRole().equalsIgnoreCase("admin")){ %>
            
          <%} %>
                    <%if(ut.getRole().equalsIgnoreCase("admin")){ %> <li class="nav-item">
            <a href="Users" class="nav-link">
              <i class="nav-icon fas fa-th"></i>
              <p>
                All Users
               
              </p>
              
            </a>
          </li>
          <%} %>
                <li class="nav-item menu-open">
            <a href="#" class="nav-link active">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>
               All Book's Category
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
         
       
              <ul class="nav nav-treeview">
             
              <li class="nav-item">
            <a href="RomanPolicier.jsp" class="nav-link">
              <i class="nav-icon fas fa-th"></i>
              <p name="RomanPolicier">Roman policier </p> </a>
             
          </li>
             <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-th"></i>
              <p>Science fiction</p> </a>
          </li>
            <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-th"></i>
              <p name="science">Science </p> </a>
          </li>
            <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-th"></i>
              <p name="narration">Narration </p> </a>
          </li>
            </ul>
         
          </li>
          <!--        ----------------------------     put a link here  -->
           <!--  ---------------------------             put a link here  -->
     
               
              </p>
           
        
      </nav>
        
           <!--  ---------------------------             put a link here  -->
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">All Users</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">All books</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->
<%
bookManager um=new bookManager();

if(request.getParameter("op")!=null)
{
	if(request.getParameter("op").equals("delete"))
	{
		int id = Integer.parseInt(request.getParameter("id"));
		um.deleteBook(id);
	}
	
}
List <book> us=um.allBooks();
%>
    <!-- Main content -->
    <div class="content">
      <div class="container-fluid">
        <div class="row">
        <%for(book u : us){ %>
        
        <div class="col-md-4">
            <!-- Widget: user widget style 1 -->
            <div class="card card-widget widget-user">
              <!-- Add the bg color to the header using any of the bg-* classes -->
              <div class="widget-user-header text-white" style="background: url('dist/img/bib.jpg') center center;">
                <h2 class="widget-user-username text-right"><bold><%=u.getName() %><bold></h2>
                <h5 class="widget-user-desc text-right"><%=u.getCategory() %></h5>
                 <h5 class="widget-user-desc text-left"><%=u.getAuthor() %></h5>
              </div>
              <div class="widget-user-image">
                   
             
              </div>
              <div class="card-footer">
                <div class="row"> 
                  <div class="col-sm-4 border-right">
                    <div class="description-block">
                   
                      <h5 class="description-header"></h5>
                    
                     
                     
                     
                    </div>
                    <!-- /.description-block -->
                  </div>
                  <!-- /.col -->
                  <div class="col-sm-4 border-right">
                  
                  
                  
                 </button></a>
                    <!-- /.description-block -->
                  </div>
                  <!-- /.col -->
                </div>
                <!-- /.row -->
              </div>
            </div>
            <!-- /.widget-user -->
          </div>
        
        <%} %>
<div class="col-md-4">
            <!-- Widget: user widget style 1 -->
            <div class="card card-widget widget-user">
    <a href="formAddBook.jsp"> <button type="submit" class="btn btn-dark" style="text-align:center;color:white; width:336px; height:235px" >
   <i class="fa fa-plus" aria-hidden="true" style="size:40px"></i></button></a>
  </div>
</div>
      
         
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
    <div class="p-3">
      <h5>My biblioteque</h5>
      <p>books from  different category</p>
    </div>
  </aside>
  <!-- /.control-sidebar -->

  <!-- Main Footer -->
  <footer class="main-footer">
    <!-- To the right -->
    <div class="float-right d-none d-sm-inline">
      all books
    </div>
    <!-- Default to the left -->
    <strong> All rights reserved.
  </footer>
</div>
<!-- ./wrapper -->

<!-- REQUIRED SCRIPTS -->

<!-- jQuery -->
<script src="plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.min.js"></script>
</body>
</html>
