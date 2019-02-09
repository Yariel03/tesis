<%-- 
    Document   : index
    Created on : Dec 25, 2018, 9:02:10 PM
    Author     : WebMaster
--%>


<!DOCTYPE html>

<html lang="es" class="no-js">

    <%@include file="head.jsp" %> 

    <body class="sidebar-fixed topnav-fixed dashboard">
        <!-- WRAPPER -->
        <div id="wrapper" class="wrapper">
            <!-- TOP BAR -->
            <div class="top-bar navbar-fixed-top">
                <div class="container">
                    <div class="clearfix">
                        <a href="#" class="pull-left toggle-sidebar-collapse"><i class="fa fa-bars"></i></a>
                        <!-- logo -->
                        <div class="pull-left left logo">
                            <a href="index.jsp"><img src="assets/img/kingadmin-logo-white2.png" alt="KingAdmin - Admin Dashboard" /></a>
                            <h1 class="sr-only">RFID</h1>
                        </div>
                        <!-- end logo -->
                        <div class="pull-right right">
                            
                            <!-- top-bar-right -->
                            <div class="top-bar-right">
                               
                                <!-- logged user and the menu -->
                                <div class="logged-user">
                                    <div class="btn-group">
                                        <a href="#" class="btn btn-link dropdown-toggle" data-toggle="dropdown">
                                            <img src="assets/img/user-avatar1.png" alt="User Avatar" />
                                            <span class="name">Admin</span> <span class="caret"></span>
                                        </a>
                                        <ul class="dropdown-menu" role="menu">
                                            <li>
                                                <a href="#">
                                                    <i class="fa fa-user"></i>
                                                    <span class="text">Profile</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <i class="fa fa-cog"></i>
                                                    <span class="text">Settings</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <i class="fa fa-power-off"></i>
                                                    <span class="text">Logout</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <!-- end logged user and the menu -->
                            </div>
                            <!-- end top-bar-right -->
                        </div>
                    </div>
                </div>
                <!-- /container -->
            </div>
            <!-- END TOP BAR -->
            <!-- LEFT SIDEBAR -->
            <div id="left-sidebar" class="left-sidebar ">
                <!-- main-nav -->
                <div class="sidebar-scroll">
                    <nav class="main-nav">
                           <ul class="main-menu">
                            
                            	
                            
                            
                            <li style='cursor: pointer' title="Inicio">
                                <a href="index.jsp" >
                                    <i class="fa fa-home"></i><span class="text">Inicio</span>
                                </a>
                            </li>
                            
                            
                            <li><a href="#" class="js-sub-menu-toggle"><i class="fa  fa-bookmark fa-fw"></i><span class="text">Gestionar docente</span>
                                    <i class="toggle-icon fa fa-angle-down"></i></a>
                                <ul class="sub-menu ">
                                    <li style='cursor: pointer' title="Buscar Docente" ><a onclick="BuscarDocente()"><span class="text">Buscar docente</span></a></li>
                                   
                                </ul>
                            </li>
                            
                            <li><a href="#" class="js-sub-menu-toggle"><i class="fa  fa-bookmark-o fa-fw"></i><span class="text">Gestionar estudiante</span>
                                    <i class="toggle-icon fa fa-angle-down"></i></a>
                                <ul class="sub-menu ">
                                    <li><a  onclick="BuscarEstudiante()" style='cursor: pointer' title="Buscar estudiantes" ><span class="text">Buscar estudiante</span></a></li>
                                    <li><a  onclick="justificar()" style='cursor: pointer' title="Justificar" ><span class="text">Justificar Estudiante</span></a></li>
                                   
                                </ul>
                            </li>

                            <li style='cursor: pointer' title="Registro de Tarjetas">
                                <a onclick="registroTarjetas()" >
                                    <i class="fa fa-book"></i><span class="text">Registro de Tarjetas</span>
                                </a>
                            </li>
                            <li style='cursor: pointer' title="Modificación de tarjetas">
                                <a onclick="" >
                                    <i class="fa fa-edit"></i><span class="text">Modificación de tarjetas</span>
                                </a>
                            </li>
                            <li style='cursor: pointer' title="Eliminación de Tarjetas">
                                <a onclick="" >
                                    <i class="fa fa-delicious"></i><span class="text">Eliminación de Tarjetas</span>
                                </a>
                            </li>
                           
                            
                            
                            <li><a href="#" class="js-sub-menu-toggle"><i class="fa  fa-bar-chart-o"></i><span class="text">Reportes</span>
                                   <i class="toggle-icon fa fa-angle-down"></i> </a>
                                <ul class="sub-menu ">
                                    <li style='cursor: pointer' title="Por materia" ><a onclick="porMateria()"><span class="text">Por materia</span></a></li>
                                    <li style='cursor: pointer' title="Por alumno" ><a onclick=""><span class="text">Por alumno</span></a></li>
                                    <li style='cursor: pointer' title="Por docente" ><a onclick=""><span class="text">Por docente</span></a></li>
                                   
                                </ul>
                            </li>
                            
                            
                            
                        </ul>
                    </nav>
                    <!-- /main-nav -->
                </div>
            </div>
            <!-- END LEFT SIDEBAR -->
            <!-- MAIN CONTENT WRAPPER -->
        <!-- MAIN CONTENT WRAPPER -->
        <div id="main-content-wrapper" class="content-wrapper ">
            <!-- main -->
            <div class="content">
                <div class="main-header">
                    <h2>Inicio</h2>
                    <em>Sistema de Control de Asistencia a clases con RFID</em>
                </div>
                <div class="main-content">
                    <BR><BR>
                    <center>
                        
                    <img src="assets/img/rfid.png" />
                    <br>
                    <br>
                    <h1 style="font-weight: bold">Controlar la asistencia ahora es más sencillo</h1>  
                                        <br>

                    <h5>Con RFID solo tomara unos pocos segundos, para continuar escoja una opcion del menú a la derecha</h5>  
                    </center>
                    <br>
                    <br>
                </div>
            </div>
            <!-- /main -->
            <!-- FOOTER -->
            <%@include file="footer.jsp" %>
            <!-- END FOOTER -->
        </div>
		<!-- END CONTENT WRAPPER -->
            <!-- END CONTENT WRAPPER -->
        </div>
        <!-- END WRAPPER -->
   
        <!-- Javascript -->
        <%@include file="script.jsp" %>
    </body>

</html>
