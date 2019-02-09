<%-- 
    Document   : consultaxMateria
    Created on : Dec 31, 2018, 11:14:41 PM
    Author     : WebMaster
--%>
  
<%@page import="org.json.JSONObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="conexion.AccesoDatos"%>


<%
     String codM=request.getParameter("codMateria");
 String sms = "";
     String json = "";
     AccesoDatos ac = new AccesoDatos();
     ac.Connectar();
     String SQL = "select  ROUND ( (cast( count(*)as decimal(3,2)) /(select max(h.maximo) from (select count(*) as maximo  from tbl_asistencia a inner join tbl_usuarios u on a.txtcedula=u.txtcedula where a.txtcodmateria='"+codM+"' group by u.txtnombres) h )*100),0) as porcentaje,u.txtcedula, u.txtapellidos,u.txtnombres,u.txttipo,u.txtcorreo from tbl_asistencia a inner join tbl_usuarios u on a.txtcedula=u.txtcedula where a.txtcodmateria='"+codM+"' group by (u.txtcedula,u.txtapellidos,u.txtnombres,u.txttipo,u.txtcorreo)";
     ac.EjecutarSQL(SQL);

     ResultSet rs = ac.getRs();

     json = "{'data': [";
     while (rs.next()) {
         json = json + "{'porcentaje':" + rs.getString("porcentaje") + ",";
         json = json + "'cedula':'" + rs.getString("txtcedula") + "',";
         json = json + "'apellidos':'" + rs.getString("txtapellidos") + "',";
         json = json + "'nombres':'" + rs.getString("txtnombres") + "',";
         json = json + "'tipo':'" + rs.getString("txttipo") + "',";
         json = json + "'correo':'" + rs.getString("txtcorreo") + "'},";
     }
     json = json + "]}";
      JSONObject j=new JSONObject(json);
     out.print(j);

     ac.Desconectar();

   %>




            
            