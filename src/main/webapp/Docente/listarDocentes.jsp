<%-- 
    Document   : listarDocentes
    Created on : Dec 7, 2018, 2:09:27 AM
    Author     : WebMaster
--%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="org.json.JSONObject"%>
<%@page import="conexion.AccesoDatos"%>
<%
        
 String sms="";
 String json="";
    AccesoDatos ac=new AccesoDatos ();
    ac.Connectar();
        String SQL = "SELECT * from tbl_usuarios";
        ac.EjecutarUpdate(SQL);
        try 
        {
        
            ResultSet rs = ac.getRs();
         json="{'data':[";
            while (rs.next())
            {
               json=json+"['"+ rs.getString("txtcorreo")+"',";
               json=json+"'"+ rs.getString("txtcodigot")+"',";
               json=json+"'"+ rs.getString("txttipo")+"'],";
            }
            json=json+"]}";
            ac.Desconectar();
            
        } catch (SQLException e) 
        {
            Logger log = Logger.getLogger(this.getClass().getName());
            log.severe(e.getMessage());
            ac.RollbackTran();
            System.out.println("Error");
        }
       
    
    
    
    
//    
//    
// String sms="";
//   
//
//
//
// String codigo=j.get("codigo").toString();
// String tipo=j.get("tipo").toString();
// String nombre=j.get("nombre").toString();
// String apellido=j.get("apellido").toString();
// String correo=j.get("email").toString();
//         sms = "conectado";
//Integer ff;
////j.get("codigo");
//try {
//        if (ac.Connectar() == 2) {
//            
//            ac.BeginTran();
//            String SQL = "INSERT INTO tbl_usuarios VALUES('" + correo + "','" + codigo + "','" + tipo + "');";
//          
//            
//              
//               
//            PreparedStatement consulta = ac.getCon().prepareStatement(SQL);
//          ff=consulta.executeUpdate();
//           if (ff>0) {
//                       sms="Datos Guardados";
//                       ac.CommitTran();
//                   }
//    
//
//
//    } else {
//        sms = "No conectado";
//    }
//
//    } catch (Exception e) {
//        out.println("EROOR:::"+e.getMessage());
//    }
//
//          
//            
//
////
////        sms="Registro de docente satisfactorio";
////      sms="El ingreso no se realizo";
//      
//      
//
//  
%>
<!--<h1>guardando...<%=//j.get("codigo") %></h1>
<h1>guardando...<%= //sms%></h1>-->
%>
