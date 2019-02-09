<%-- 
    Document   : asistencia
    Created on : 8/02/2019, 11:56:33 PM
    Author     : WebMaster
--%>


<%@page import="org.json.JSONObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="conexion.AccesoDatos"%>
<%
    String codigo=request.getParameter("codigo");
    String codigodb="";
    AccesoDatos ac = new AccesoDatos();
    ac.Connectar();
    String SQL = "SELECT txtcodtarjeta from tbl_tarjeta where txtcodtarjeta='"+ codigo +"'";
    ac.EjecutarSQL(SQL);
    ResultSet rs = ac.getRs();
    while (rs.next()) 
    {
        codigodb= rs.getString("txtcodtarjeta");
    }
    
    if(codigo.equals(codigodb))
    {
        ac.BeginTran();
        SQL = "INSERT INTO tbl_usuarios VALUES('" + cedula + "','" + apellidos + "','" + nombres + "','" + tipo + "','" + correo + "');";
        int consulta = ac.EjecutarUpdate(SQL);
        if (consulta > 0)
        {
            ac.CommitTran();
        }else
        {
           ac.RollbackTran();
        }
    }else
    {
        out.println("No existe");
    }
    ac.Desconectar();
%>