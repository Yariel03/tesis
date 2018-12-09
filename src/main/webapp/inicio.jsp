<%-- 
    Document   : inicio
    Created on : Nov 25, 2018, 10:13:03 PM
    Author     : WebMaster
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                        <center><img src="assets/img/rfid.png"></center>
                        <p class="lead"><span>Inicio Lorem ipsum dolor sit amet, consectetur adipisicing elit. Placeat, tempora nulla facilis vero repellat molestias atque quibusdam deleniti deserunt veritatis magnam fugit! Ducimus porro iusto sunt sequi ad dolores unde.</span>
                            <span>Quo, impedit nobis dolor unde illo ipsum maxime quas. Dolorum, laboriosam, fugiat, culpa, asperiores praesentium dolorem deleniti natus ullam ratione ad id quis expedita consequuntur non doloremque deserunt veritatis facilis!</span>
                            <span>Voluptates, suscipit, dolor, unde commodi nemo pariatur magnam eius maxime dolores corporis voluptatem velit distinctio labore et quaerat obcaecati consectetur. Ad deserunt eveniet molestias officia dolorum dolorem repudiandae sint praesentium!</span>
                            <span>Enim, ducimus eligendi placeat cum animi sed distinctio quia quae fugiat repudiandae beatae perferendis deserunt quo. Velit, sed, maxime, hic cumque officia soluta ut sit adipisci labore architecto incidunt accusantium.</span>
                        </br>
                        
                         <h1>Conexión WEB con Arduino</h1>
        <a onclick="comunicacion()"
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

         