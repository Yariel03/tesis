<%-- 
    Document   : listadoEstudiante
    Created on : Jan 1, 2019, 6:12:31 PM
    Author     : WebMaster
--%>

<%@page import="conexion.AccesoDatos"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="org.json.JSONObject"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
     String json = "";
     AccesoDatos ac = new AccesoDatos();
     ac.Connectar();
     String SQL = "SELECT ut.txtcedula,us.txtapellidos,us.txtnombres,ta.intestado,us.txtcorreo from tbl_usuarios us inner join tbl_ut ut on us.txtcedula=ut.txtcedula inner join tbl_tarjeta ta on ta.txtcodtarjeta= ut.txtcodtarjeta where us.txttipo='Estudiante'";
     ac.EjecutarSQL(SQL);
     ResultSet rs = ac.getRs();
     json = "{'data': [";
     while (rs.next()) {
         json = json + "{'cedula':'" + rs.getString("txtcedula") + "',";
         json = json + "'apellidos':'" + rs.getString("txtapellidos") + "',";
         json = json + "'nombres':'" + rs.getString("txtnombres") + "',";
         if (rs.getString("intestado").equals("0")) {
                 json = json + "'estado':'Bloqueado',";
             } else {
                 json = json + "'estado':'Activo',";
             }
         json = json + "'correo':'" + rs.getString("txtcorreo") + "'},";
     }
     json = json + "]}";
      JSONObject j=new JSONObject(json);
     out.print(j);
     ac.Desconectar();
   %>