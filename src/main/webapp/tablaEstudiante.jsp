<%-- 
    Document   : tablaEstudiante
    Created on : Dec 7, 2018, 3:16:53 PM
    Author     : WebMaster
--%>

   
<%@page import="java.util.logging.Logger"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="conexion.AccesoDatos"%>
<%@page import="conexion.AccesoDatos"%>
<!--  <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
    
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>-->

<%
    String sms = "";
    String json = "";
    AccesoDatos ac = new AccesoDatos();
    ac.Connectar();
    String SQL = "SELECT * from tbl_usuarios where(txttipo='Estudiante')";
    ac.EjecutarSQL(SQL);
    ResultSet rs = ac.getRs();
%>



   <script>
    $(document).ready(function() {
     var table = $('#example').DataTable();
        
        
       
       
      
      } );
    
    

    </script> 
 
    <table id="example" class="display top-bar widget" >
        <thead style="color: #fff">
            <tr>
                <th>Correo</th>
                <th>C�digo Tarjeta</th>
                <th>Tipo</th>
                <th>Editar</th>
                <th>Eliminar</th>

            </tr>
        </thead>
        <tbody>
            <%    while (rs.next()) {%>
            <tr>
                <td><%= rs.getString("txtcorreo")%></td>
                <td><%= rs.getString("txtcodigot")%></td>
                <td><%= rs.getString("txttipo")%></td>
                <td ><button type="button" class="btn btn-warning"><i class="fa fa-pencil-square-o"></i> editar</button></td>
                <td onclick="eliminarDocente('<%= rs.getString("txtcorreo")%>','2')"><button type="button" class="btn btn-danger"><i class="fa fa-trash-o"></i> eliminar</button></td>
            </tr>
            <%
                }
            %>


        </tbody>
        
    </table>
            
            
            