<%-- 
    Document   : guardar
    Created on : Dec 9, 2018, 12:36:47 AM
    Author     : WebMaster
--%>

<%@page import="Carrera.CLDatosCompletos"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="conexion.AccesoDatos"%>
<%@page import="org.json.JSONObject"%>

<%
        String sms = "";
        String sms1 = "";
        String obj = request.getParameter("getDatos");
        JSONObject j = new JSONObject(obj);
        AccesoDatos ac = new AccesoDatos();
     
        String materia = j.get("materia").toString();
        String cedula = j.get("cedula").toString();
        String descripcion = j.get("descripcion").toString();
        String fecha = j.get("fecha").toString();
       
        
        
try {
        if (ac.Connectar() == 2) {
            ac.BeginTran();
            String SQL = "INSERT INTO tbl_justificacion(txtcedula,txtcodmateria,txtdescripcion,datedia,intinasistencia) VALUES('" + cedula + "','" + materia + "','" + descripcion + "','" + fecha + "',1);";
            int consulta = ac.EjecutarUpdate(SQL);
           
            if (consulta > 0) {
                ac.CommitTran();
          
                sms="Exito!";
                sms1 =" Registrado con éxito";
            }else
            {
                sms = "Error!";
                sms1 = "Ha ocurrido un error, intentelo más tarde";
                ac.RollbackTran();
            }
          

      
            
             
         }
            
         
           
       
    } catch (Exception e) {
        response.sendRedirect("../index.jsp");
    }
%>

<!-- ALERTS -->
<div class="widget">
    <div class="widget-header">
        <h3>Información</h3>
    </div>
    <div class="widget-content">
        <div class="alert alert-success alert-dismissable" id="alerta">
            <a onclick="quitar()" class="close">&times;</a>
            <strong><%=sms%></strong>&nbsp;<%=sms1%>.
        </div>
     
       
    </div>
</div>
<!-- END ALERTS -->





