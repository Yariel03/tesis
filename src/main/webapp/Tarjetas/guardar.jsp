<%-- 
    Document   : guardar
    Created on : Dec 9, 2018, 12:36:47 AM
    Author     : WebMaster
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="conexion.AccesoDatos"%>
<%@page import="org.json.JSONObject"%>

<%
        String sms = "";
        String obj = request.getParameter("getDatos");
        JSONObject j = new JSONObject(obj);

        AccesoDatos ac = new AccesoDatos();

        String cedula = j.get("cedula").toString();
        String codigo = j.get("codigo").toString();
        String tipo = j.get("tipo").toString();
        String nombres = j.get("nombre").toString();
        String apellidos = j.get("apellido").toString();
        String correo = j.get("email").toString();
try {
        if (ac.Connectar() == 2) {
            ac.BeginTran();
            String SQL = "INSERT INTO tbl_usuarios VALUES('" + cedula + "','" + apellidos + "','" + nombres + "','" + tipo + "','" + correo + "','" + codigo + "');";
            int consulta = ac.EjecutarUpdate(SQL);
            if (consulta > 0) {
                sms = apellidos+" Registrado con éxito";
                ac.CommitTran();
            }else
            {
                sms = "Ha ocurrido uin error, intentelo más tarde";
                ac.RollbackTran();
            }
        } else 
        {
            sms = "Error en el servidor al conectarse con la base de datos, intentelo más tarde";
        }
    } catch (Exception e) {
        response.sendRedirect("../index.jsp");
    }
%>
<h1>guardando...<%= sms%></h1>
