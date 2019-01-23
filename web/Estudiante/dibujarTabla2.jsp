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
     String json = "";
     AccesoDatos ac = new AccesoDatos();
     ac.Connectar();
     String SQL = "SELECT * FROM tbl_asistencia where txtcedula='"+ced+"'";
     ac.EjecutarSQL(SQL);
     ResultSet rs = ac.getRs();
//     json = "{'data': [";
//     while (rs.next()) {
//         json = json + "{'cedula':'" + rs.getString("txtcedula") + "',";
//         json = json + "'hora':'" + rs.getString("timehora") + "',";
//         json = json + "'fecha':'" + rs.getString("datefecha") + "'},";
//     }
//     json = json + "]}";
//      JSONObject j=new JSONObject(json);
//     out.print(j);
//     ac.Desconectar();
   
%>

<table id="example2" class="display top-bar widget" >
        <thead style="color: #fff">
            <tr>
                <th>Cédula</th>
                <th>Hora</th>
                <th>Fecha</th>
            </tr>
        </thead>
        <input onc="">
        <tbody>
        <%
        
             while (rs.next()) {%>
              <tr>
           <td><%= rs.getString("txtcedula")%>  </td>
           <td><%= rs.getString("timehora")%>  </td>
           <td><%= rs.getString("datefecha")%>  </td>
          
        </tr>
       
     <%} %>
        
        
        </tbody>
    </table>


 <script>
//    $(document).ready(function() {
//     var table = $('#example2').DataTable(
//             {
//                 "destroy":"true",
//    language: {
//        "decimal": "",
//        "emptyTable": "No hay información",
//        "info": "Mostrando _START_ a _END_ de _TOTAL_ Usuarios",
//        "infoEmpty": "Mostrando 0 to 0 of 0 Usuarios",
//        "infoFiltered": "(Total de usuarios: _MAX_ )",
//        "infoPostFix": "",
//        "thousands": ",",
//        "lengthMenu": "Mostrar de _MENU_ Usuarios",
//        "loadingRecords": "Cargando...",
//        "processing": "Procesando...",
//        "search": "Buscar:",
//        "zeroRecords": "Sin resultados encontrados",
//        "paginate": {
//            "first": "Primero",
//            "last": "Ultimo",
//            "next": "Siguiente",
//            "previous": "Anterior"
//        }},
//    "ajax":{
//        "type":"POST",
//        "url":"Estudiante/listadoAsistencia.jsp?cedula="+
//        },
//        "columns":[
//            {"data":"cedula"},
//            {"data":"hora"},
//            {"data":"fecha"}
//        ]
//             
//      } );
//  });
//  
    </script> 
