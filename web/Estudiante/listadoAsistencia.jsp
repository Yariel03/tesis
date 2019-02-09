<%-- 
    Document   : listadoAsistencia
    Created on : Jan 22, 2019, 2:18:55 AM
    Author     : WebMaster
--%>

<%@page import="org.json.JSONObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="conexion.AccesoDatos"%>


<%
    
    String ced=request.getParameter("cedula");
     String json = "";
     AccesoDatos ac = new AccesoDatos();
     ac.Connectar();
     String SQL = "SELECT * FROM tbl_asistencia where txtcedula='"+ced+"'";
     ac.EjecutarSQL(SQL);
     ResultSet rs = ac.getRs();
     json = "{'data': [";
     while (rs.next()) {
         json = json + "{'cedula':'" + rs.getString("txtcedula") + "',";
         json = json + "'hora':'" + rs.getString("timehora") + "',";
         json = json + "'fecha':'" + rs.getString("datefecha") + "'},";
     }
     json = json + "]}";
      JSONObject j=new JSONObject(json);
     out.print(j);
     ac.Desconectar();
   %>