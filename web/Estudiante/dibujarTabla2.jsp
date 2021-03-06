<%-- 
    Document   : dibujarTabla2
    Created on : Jan 22, 2019, 3:08:40 AM
    Author     : WebMaster
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="conexion.AccesoDatos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
String ced=request.getParameter("cedula");
%>


 <script>
    $(document).ready(function() {
     var table = $('#example2').DataTable(
             {
                 "destroy":"true",
    language: {
        "decimal": "",
        "emptyTable": "No hay información",
        "info": "Mostrando _START_ a _END_ de _TOTAL_ Usuarios",
        "infoEmpty": "Mostrando 0 to 0 of 0 Usuarios",
        "infoFiltered": "(Total de usuarios: _MAX_ )",
        "infoPostFix": "",
        "thousands": ",",
        "lengthMenu": "Mostrar de _MENU_ Usuarios",
        "loadingRecords": "Cargando...",
        "processing": "Procesando...",
        "search": "Buscar:",
        "zeroRecords": "Sin resultados encontrados",
        "paginate": {
            "first": "Primero",
            "last": "Ultimo",
            "next": "Siguiente",
            "previous": "Anterior"
        }},
    "ajax":{
        "type":"POST",
        "url":"Estudiante/listadoAsistencia.jsp?cedula=<%=ced%>"
        },
        "columns":[
            {"data":"cedula"},
            {"data":"hora"},
            {"data":"fecha"}
        ],
                 dom: 'Bfrtip',
        buttons: [
            
            {
                extend: 'excel',
                messageTop: null
            },
            {
                extend: 'pdf',
                messageBottom: null
            },
            {
                extend: 'print',
                messageTop: function () {
                    printCounter++;
 
                    if ( printCounter === 1 ) {
                        return 'This is the first time you have printed this document.';
                    }
                    else {
                        return 'You have printed this document '+printCounter+' times';
                    }
                },
                messageBottom: null
            }
        ]
             
      
             
      } );
  });
  
    </script> 


<table id="example2" class="display top-bar widget" >
        <thead style="color: #fff">
            <tr>
                <th>Cédula</th>
                <th>Hora</th>
                <th>Fecha</th>
            </tr>
        </thead>
        <tbody>
        
        
        </tbody>
    </table>


