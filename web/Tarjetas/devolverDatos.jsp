<%-- 
    Document   : devolveratos
    Created on : Dec 25, 2018, 10:42:29 PM
    Author     : WebMaster
--%>

<%@page import="InfoCarrera.GetHorarioEstudiante"%>
<%@page import="InfoCarrera.ArrayOfHorarioEstudiante"%>
<%@page import="InfoCarrera.GetDatosCompletosEstudiante"%>
<%@page import="org.json.JSONObject"%>
<%@page import="Carrera.CLDatosCompletos"%>
<%
 
    try {
      String strCedula = request.getParameter("cedula");
//    String strCedula = "060452833-1";//Fabian
//    String strCedula = "080371506-9";//Jenny
//    String strCedula = "070429032-9";//mICHAEL
//    String strCedula = "070429032-9";//mICHAEL
    String json=null;
    CLDatosCompletos o= new CLDatosCompletos();
//    String Periodo=o.getPeriodoActual().getCodigo();
    int n=o.getInscripcionesEstudiante(strCedula).getInscripcion().size()-1;

    String codCarrera=o.getInscripcionesEstudiante(strCedula).getInscripcion().get(n).getCodCarrera();
    String DesCarrera=o.getInscripcionesEstudiante(strCedula).getInscripcion().get(n).getEscuela();
    String Nombre=o.getDatosCompletosEstudiante(strCedula).getNombres();
    String Apellido=o.getDatosCompletosEstudiante(strCedula).getApellidos();
    String Correo=o.getDatosCompletosEstudiante(strCedula).getEmail();
    
//     n=o.getMateriasEstudiante(codCarrera, strCedula, Periodo).getMateria().size();
//     for (int i = 0; i < n; i++) {
////             out.println("Codigo: "+o.getMateriasEstudiante(codCarrera, strCedula, Periodo).getMateria().get(i).getCodigo()+"<br>");
////             out.println("Materia: "+o.getMateriasEstudiante(codCarrera, strCedula, Periodo).getMateria().get(i).getNombre()+"<br>");
//         }
//  

      
  
   json="{'Nombre':'"+Nombre+"','Apellido':'"+Apellido+"','Correo':'"+Correo+"','CodCarrera':'"+codCarrera+"','DesCarrera':'"+DesCarrera+"'}";

    //out.println(obj);
//     json="{'nombre':'alex','Apellido':'Baldeon'}";
     JSONObject j=new JSONObject(json);
     out.print(j);
        } catch (Exception e) {
          response.sendRedirect("../index.jsp");
            
        }
   
%>
