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
        String cedula = j.get("cedula").toString();
        String codigo = j.get("codigo").toString();
        String tipo = j.get("tipo").toString();
        String nombres = j.get("nombre").toString();
        String apellidos = j.get("apellido").toString();
        String correo = j.get("email").toString();
        String descripcionCarrera = j.get("descripcion").toString();
        String codigoCarrera = j.get("codCarrera").toString();
try {
        if (ac.Connectar() == 2) 
        {
            ac.BeginTran();
            String SQL = "INSERT INTO tbl_usuarios VALUES('" + cedula + "','" + apellidos + "','" + nombres + "','" + tipo + "','" + correo + "');";
            int consulta = ac.EjecutarUpdate(SQL);
           
            if (consulta > 0)
            {
                ac.CommitTran();
                sms="Exito!";
                sms1 = apellidos+" Registrado con éxito";
            }else
            {
                sms = "Error!";
                sms1 = "Ha ocurrido un error, al insertar, el usuario ya existe";
                ac.RollbackTran();
            }
                
            SQL = "INSERT INTO tbl_carrera VALUES('" + codigoCarrera + "','" + descripcionCarrera+ "');";
            consulta = ac.EjecutarSQL(SQL);
            if (consulta>0) 
            {
                ac.CommitTran();
            }else
            {
                sms = "Error!";
                sms1 = "Ha ocurrido un error, al insertar, la carrera usuario";
                ac.RollbackTran();
            }

            SQL = "INSERT INTO tbl_uc VALUES('" + cedula + "','" + codigoCarrera+ "');";
            consulta = ac.EjecutarSQL(SQL);
            if (consulta>0) 
            {
                ac.CommitTran();
            }
              
            CLDatosCompletos o= new CLDatosCompletos();
            String Periodo=o.getPeriodoActual().getCodigo();
            int n=o.getMateriasEstudiante(codigoCarrera, cedula, Periodo).getMateria().size();
            String codigoMateria;
            String materia;
            for (int i = 0; i < n; i++) 
            {
                codigoMateria= o.getMateriasEstudiante(codigoCarrera, cedula, Periodo).getMateria().get(i).getCodigo();
                materia= o.getMateriasEstudiante(codigoCarrera, cedula, Periodo).getMateria().get(i).getNombre();
                SQL = "INSERT INTO tbl_materia VALUES('" + codigoMateria + "','" + materia+ "');";
                consulta = ac.EjecutarSQL(SQL);
                if (consulta>0) 
                {
                    ac.CommitTran();
                }
                SQL = "INSERT INTO tbl_um VALUES('" + codigoMateria + "','" + cedula+ "');";
                consulta = ac.EjecutarSQL(SQL);
                if (consulta>0) {ac.CommitTran();}
            }

            SQL = "INSERT INTO tbl_tarjeta VALUES('" + codigo + "',0,0);";
            consulta = ac.EjecutarSQL(SQL);
            if (consulta>0) {ac.CommitTran();}
            
            SQL = "INSERT INTO tbl_ut VALUES('" + cedula + "','"+ codigo +"');";
            consulta = ac.EjecutarSQL(SQL);
            if (consulta>0) {ac.CommitTran();}
            ac.Desconectar();
        }
    } catch (Exception e) 
    {
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





