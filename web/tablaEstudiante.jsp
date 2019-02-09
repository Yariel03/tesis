<%-- 
    Document   : tablaDocente
    Created on : Dec 3, 2018, 2:50:05 PM
    Author     : WebMaster
--%>
   
<%@page import="java.util.logging.Logger"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="conexion.AccesoDatos"%>
<%@page import="conexion.AccesoDatos"%>


<%
 String sms="";
 String json="";
    AccesoDatos ac=new AccesoDatos ();
    ac.Connectar();
        String SQL = "SELECT ut.txtcedula,us.txtapellidos,us.txtnombres,ta.intestado,us.txtcorreo from tbl_usuarios us inner join tbl_ut ut on us.txtcedula=ut.txtcedula inner join tbl_tarjeta ta on ta.txtcodtarjeta= ut.txtcodtarjeta where us.txttipo='Estudiante'";
        ac.EjecutarSQL(SQL);
    
            ResultSet rs = ac.getRs();
//         json="{'data':[";
//            while (rs.next()) 
//            {
//               json=json+"['"+ rs.getString("txtcorreo")+"',";
//               json=json+"'"+ rs.getString("txtcodigot")+"',";
//               json=json+"'"+ rs.getString("txttipo")+"'],";
//               System.out.println("aca:;"+json);
//            }
//            json=json+"]}";
//            System.out.println("json: "+json);
//            ac.Desconectar();
//            
       
       
    
   %>



   <script>
    $(document).ready(function() {
     var table = $('#example').DataTable(
             {
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
        }}
             
        });
        
        
       
       
      
      } );
    
    

    </script> 
 
    <table id="example" class="display top-bar widget" >
        <thead style="color: #fff">
            <tr>
                <th>Cedula</th>
                <th>Apellidos</th>
                <th>Nombres</th>
                <th>Estado</th>
                <th>Correo</th>
                <th>Editar</th>
                <th>Eliminar</th>

            </tr>
        </thead>
        <tbody>
            <%    while (rs.next()) {%>
            <tr>
                <td><%= rs.getString("txtcedula")%></td>
                <td><%= rs.getString("txtapellidos")%></td>
                <td><%= rs.getString("txtnombres")%></td>
                <%
                    String estado = "";
                        if (rs.getString("intestado").equals("0")) {
                            estado = "Bloqueado";
                        } else {
                            estado = "Activo";

                        }
                %>
                <td><%= estado%></td>
                <td><%= rs.getString("txtcorreo")%></td>
                <td ><button type="button" class="btn btn-warning"><i class="fa fa-pencil-square-o"></i> editar</button></td>
                <td onclick="eliminarDocente('<%= rs.getString("txtcorreo")%>','1')"><button type="button" class="btn btn-danger"><i class="fa fa-trash-o"></i> eliminar</button></td>
            </tr>
            <%
                }
            %>


        </tbody>
        
    </table>
            
            
            
