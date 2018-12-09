<%-- 
    Document   : guardar
    Created on : Nov 26, 2018, 3:38:45 AM
    Author     : WebMaster
--%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="conexion.AccesoDatos"%>
<%@page import="org.json.JSONObject"%>

<%
  
        String sms = "";
        String obj = request.getParameter("dato");
        JSONObject j = new JSONObject(obj);

        AccesoDatos ac = new AccesoDatos();

        String codigo = j.get("codigo").toString();
        String tipo = j.get("tipo").toString();
        String nombre = j.get("nombre").toString();
        String apellido = j.get("apellido").toString();
        String correo = j.get("email").toString();
        Integer ff;
//j.get("codigo");
try {
        if (ac.Connectar() == 2) {
            
            ac.BeginTran();
            String SQL = "INSERT INTO tbl_usuarios VALUES('" + correo + "','" + codigo + "','" + tipo + "');";
          
            
              
               
            PreparedStatement consulta = ac.getCon().prepareStatement(SQL);
          ff=consulta.executeUpdate();
           if (ff>0) {
                       sms="Datos Guardados";
                       ac.CommitTran();
                   }
    


    } else {
        sms = "No conectado";
    }

    } catch (Exception e) {
        out.println("EROOR:::"+e.getMessage());
    }

          
            

//
//        sms="Registro de docente satisfactorio";
//      sms="El ingreso no se realizo";
      
      

  
%>
<h1>guardando...<%=j.get("codigo") %></h1>
<h1>guardando...<%= sms%></h1>