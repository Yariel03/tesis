
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Map"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.jasig.cas.client.authentication.AttributePrincipal"%>
<%@page contentType='text/html' pageEncoding='UTF-8'%>
<html lang="es" >
    <head>
        <title>RFID</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

        <style>
            a{
                text-decoration: none;
            }
        </style>
        <!-- CSS -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="assets/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href="assets/css/main.css" rel="stylesheet" type="text/css">
        <link href="assets/css/my-custom-styles.css" rel="stylesheet" type="text/css">
       

        <!-- Fav and touch icons -->
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/ico/kingadmin-favicon144x144.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets/ico/kingadmin-favicon114x114.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets/ico/kingadmin-favicon72x72.png">
        <link rel="apple-touch-icon-precomposed" sizes="57x57" href="assets/ico/kingadmin-favicon57x57.png">
        <link rel="shortcut icon" href="assets/ico/favicon.ico">


        <link href="js/css/dtic.css" rel="stylesheet" type="text/css"/>
        <script src="js/ejemplo.js" type="text/javascript"></script>
        <script src="js/direcion.js" type="text/javascript"></script>
    </head>

    <%

        String tipoLogueo = "";
        Boolean estado = false;
        session.setAttribute("tipousuario2", "");
        session.setAttribute("TipoUser", "");
        session.setAttribute("ingreso", "false");
        String codigocas = "";
        String cedulacas = "";
        try {

            if (request.getUserPrincipal() != null) {
                AttributePrincipal principal = (AttributePrincipal) request.getUserPrincipal();
                final Map attributes = principal.getAttributes();
                String[] cadena = attributes.toString().split("=");

                for (String i : cadena) {
                    if (i.contains("cedula")) {
                        session.setAttribute("existe", "true");
                        estado = true;
                    }
                }
                if (attributes != null) {
                    Iterator attributeNames = attributes.keySet().iterator();
                    if (attributeNames.hasNext()) {
                        for (; attributeNames.hasNext();) {
                            String attributeName = (String) attributeNames.next();
                            final Object attributeValue = attributes.get(attributeName);
                            if (attributeValue instanceof List) {
                                final List values = (List) attributeValue;
                            } else {
                                if (attributeName == "perid") {
                                    session.setAttribute("ingreso", "true");
                                    codigocas = attributeValue.toString();
                                    session.setAttribute("tipousuario2", "");
                                }
                                if (attributeName == "cedula") {
                                    cedulacas = attributeValue.toString();
                                }
                                if (attributeName == "clientName") {
                                    session.setAttribute("tipousuario2", attributeValue.toString());
                                }
                                
                                  if (attributeName == "name") {
                                   
                                    session.setAttribute("name", attributeValue.toString());
                                }
                            }
                        }
                    } else {
                        out.println("<pre>The attribute map is empty. Review your CAS filter configurations.</pre>");
                    }
                } else {
                    out.println("<pre>The user principal is empty from the request object. Review the wrapper filter configuration.</pre>");
                }
            }
            if (estado == true) {
                if (!codigocas.equals("")) {
                    //tipo de sesion
                    if (session.getAttribute("tipousuario2").toString().isEmpty()) {
                        tipoLogueo = "Oasis";
                    } else {
                        tipoLogueo = "Institucional";
                    }
                    
                    //aqui desarrollo
                }
            }
             

        } catch (Exception e) {
        } finally {

        }
    %>
    <link href="assets/css/skins/darkblue.css" rel="stylesheet" type="text/css"/>
    <body class="sidebar-fixed topnav-fixed dashboard">
        <div id="Logeo" name="Logeo" ><div style="display:none;"><% out.println(tipoLogueo); %></div></div>
      
        <!-- WRAPPER -->
        <div id="wrapper" class="wrapper">
            <!-- TOP BAR -->
            <div class="top-bar navbar-fixed-top">
                <div class="container">
                    <div class="clearfix">
                        <!-- logo -->
                        <div class="pull-left left logo">
                            <a href="index.jsp"><img src="assets/img/logoRFID.png"  /></a>
                        </div>
                        <!-- end logo -->
                        <div class="pull-right right">
                            <!-- top-bar-right -->
                            <div class="top-bar-right">
                                <!-- logged user and the menu -->
                                <div class="logged-user">
                                    <div id="btnUser" class="btn-group">
                                        <a  class="btn btn-link dropdown-toggle" data-toggle="dropdown" >
                                            <img src="assets/img/user-avatar.png" alt="User Avatar" />
                                            <span class='name'><%= session.getAttribute("name") %>
                                            </span><span class='caret'></span>
                                               

                                        </a>
                                        <ul class="dropdown-menu" role="menu" >
<!--                                            <li>
                                                <a onclick="fncLnkAdmin();" style='cursor: pointer'>
                                                    <i class="fa fa-user"></i>
                                                    <span class="text">Menu 1</span>
                                                </a>
                                            </li>-->
                                            <li>
                                                <a onclick="Matar();" style='cursor: pointer' >
                                                    <i class="fa fa-power-off"></i>
                                                    <span class="text">SALIR</span>
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
            <div id="left-sidebar" class="left-sidebar">
                <div class="sidebar-minified js-toggle-minified">
                    <i class="fa fa-exchange"></i>
                </div>
                <div class="sidebar-scroll">
                    <nav class="main-nav">
                        <ul class="main-menu">
                            
                            	
                            
                            
                            <li style='cursor: pointer' title="Inicio">
                                <a onclick="inicio()" >
                                    <i class="fa fa-home"></i><span class="text">Inicio</span>
                                </a>
                            </li>
                            
                            
                            <li><a href="#" class="js-sub-menu-toggle"><i class="fa  fa-bookmark fa-fw"></i><span class="text">Gestionar Docentes</span>
                                    <i class="toggle-icon fa fa-angle-down"></i></a>
                                <ul class="sub-menu ">
                                    <li style='cursor: pointer' title="Ingreso de nuevo docente" ><a onclick="registro()"><span class="text">Ingreso de nuevo docente</span></a></li>
                                    <li><a href="#"><span class="text">Modificación de docente</span></a></li>
                                    <li><a href="#"><span class="text">Eliminación de docente</span></a></li>
                                </ul>
                            </li>
                            
                            <li><a href="#" class="js-sub-menu-toggle"><i class="fa  fa-bookmark-o fa-fw"></i><span class="text">Gestionar Estudiante</span>
                                    <i class="toggle-icon fa fa-angle-down"></i></a>
                                <ul class="sub-menu ">
                                    <li><a onclick=" registroEstudiante()"><span class="text">Ingreso de nuevo Estudiante</span></a></li>
                                    <li><a  onclick="BuscarEstudiante()" ><span class="text">Buscar Estudiante</span></a></li>
                                    <li><a href="#"><span class="text">Modificación de Estudiante</span></a></li>
                                    <li><a href="#"><span class="text">Eliminación de Estudiante</span></a></li>
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
                            <li style='cursor: pointer' title="Reportes">
                                <a onclick="" >
                                    <i class="fa fa-bar-chart-o"></i><span class="text">Reportes</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </div>

            </div>
            <!-- END LEFT SIDEBAR -->
            <!-- MAIN CONTENT WRAPPER -->
            <div id="main-content-wrapper" class="content-wrapper">
                <div class="row">
                    <div class="col-lg-12 ">
                        <ul id='divSeguimiento' class="breadcrumb">
                            <li><i class="fa fa-home"></i><a href="index.jsp">Inicio</a></li>
                        </ul>
                    </div>
                </div>
                <!-- main -->
                <div id='contenidoDinamico' class="content">
                    <div class="main-header">
                        <h2>Avance</h2>
                        <em>Sistema de Control de Asistencia a clases con RFID</em>
                    </div>
                    <div id='contenidoInferior' class="main-content">
                        <p class="lead"><span>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Placeat, tempora nulla facilis vero repellat molestias atque quibusdam deleniti deserunt veritatis magnam fugit! Ducimus porro iusto sunt sequi ad dolores unde.</span>
                            <span>Quo, impedit nobis dolor unde illo ipsum maxime quas. Dolorum, laboriosam, fugiat, culpa, asperiores praesentium dolorem deleniti natus ullam ratione ad id quis expedita consequuntur non doloremque deserunt veritatis facilis!</span>
                            <span>Voluptates, suscipit, dolor, unde commodi nemo pariatur magnam eius maxime dolores corporis voluptatem velit distinctio labore et quaerat obcaecati consectetur. Ad deserunt eveniet molestias officia dolorum dolorem repudiandae sint praesentium!</span>
                            <span>Enim, ducimus eligendi placeat cum animi sed distinctio quia quae fugiat repudiandae beatae perferendis deserunt quo. Velit, sed, maxime, hic cumque officia soluta ut sit adipisci labore architecto incidunt accusantium.</span>
                        </br>
                        
                         <h1>Conexión WEB con Arduino</h1>
        <a href="control.jsp?op=1">
            <button class="btn btn-primary">Abrir Puerta</button>
        </a>
        <a href="control.jsp?op=0">
            <button class="btn btn-primary">Cerrar Puerta</button>

        </a>
        <div id="repuesta">
            <%
                if (request.getParameter("op") != null) {
                        String op = request.getParameter("op");
                        if (op.equals("0")) {
                            op = "Puerta Cerrada";
                        } else {
                            op = "Puerta Abierta";
                        }
                        %>
                        
                        <h1><%=op%></h1>
                        <%   
                }



            %>
            
         
           
        </div>
                        
                        
                        <div class="bottom-30px"></div>
                    </div>

                </div>
                <!-- /main -->
                <!-- FOOTER -->
                <%@include file="footer.jsp" %>
                <!-- END FOOTER -->
            </div>

            <!-- END CONTENT WRAPPER -->
        </div>
        <!-- END WRAPPER -->
        <!-- Javascript -->
        <script src="assets/js/jquery/jquery-2.1.0.min.js"></script>
    <script src="assets/js/bootstrap/bootstrap.js"></script>
      <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
              <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
    <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
        <script src="assets/js/plugins/modernizr/modernizr.js"></script>
        <script src="assets/js/plugins/bootstrap-tour/bootstrap-tour.custom.js"></script>
        <script src="assets/js/plugins/jquery-slimscroll/jquery.slimscroll.min.js"></script>
        <script src="assets/js/king-common.js"></script>
        <script src="assets/js/plugins/stat/jquery.easypiechart.min.js"></script>
        <script src="assets/js/plugins/raphael/raphael-2.1.0.min.js"></script>
        <script src="assets/js/plugins/stat/flot/jquery.flot.min.js"></script>
        <script src="assets/js/plugins/stat/flot/jquery.flot.resize.min.js"></script>
        <script src="assets/js/plugins/stat/flot/jquery.flot.time.min.js"></script>
        <script src="assets/js/plugins/stat/flot/jquery.flot.pie.min.js"></script>
        <script src="assets/js/plugins/stat/flot/jquery.flot.tooltip.min.js"></script>
        <script src="assets/js/plugins/jquery-sparkline/jquery.sparkline.min.js"></script>
        <script src="assets/js/plugins/datatable/jquery.dataTables.min.js"></script>
        <script src="assets/js/plugins/datatable/dataTables.bootstrap.js"></script>
        <script src="assets/js/plugins/jquery-mapael/jquery.mapael.js"></script>
        <script src="assets/js/plugins/raphael/maps/usa_states.js"></script>
        <script src="assets/js/king-chart-stat.js"></script>
        <script src="assets/js/king-table.js"></script>
        <script src="assets/js/king-components.js"></script>
        
        
        <script src="js/validacion.js" type="text/javascript"></script>
        <script src="js/dtic.js" type="text/javascript"></script>
        
        <script src="assets/js/plugins/jqgrid/jquery.jqGrid.min.js"></script>
        <script src="assets/js/plugins/jqgrid/i18n/grid.locale-en.js"></script>
        <script src="assets/js/plugins/jqgrid/jquery.jqGrid.fluid.js"></script>
        <script src="assets/js/plugins/bootstrap-datepicker/bootstrap-datepicker.js"></script><!--
        -->
        
        

    </body>
</html>
