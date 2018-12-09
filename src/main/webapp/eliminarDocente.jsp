<%-- 
    Document   : eliminarDocente
    Created on : Dec 7, 2018, 4:48:30 AM
    Author     : WebMaster
--%>
<%@page import="conexion.AccesoDatos"%>
<%
    String correo = request.getParameter("correo");
String sms="";
 String json="";
    AccesoDatos ac=new AccesoDatos ();
    ac.Connectar();
        String SQL = "DELETE from tbl_usuarios WHERE(txtcorreo='"+correo +"')";
        ac.EjecutarSQL(SQL);
    
%>