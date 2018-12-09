<%-- 
    Document   : control
    Created on : 07-nov-2018, 23:41:12
    Author     : WebMaster
--%>

<%@page import="jssc.SerialPortEvent"%>
<%@page import="jssc.SerialPortEventListener"%>
<%@page import="com.panamahitek.PanamaHitek_Arduino"%>
<!DOCTYPE html>
<%
         final PanamaHitek_Arduino Ard = new PanamaHitek_Arduino();
       

         
try {
      
      final SerialPortEventListener listener=new SerialPortEventListener() {
         @Override
         public void serialEvent(SerialPortEvent spe) {
             try {
                  
                      if (Ard.isMessageAvailable()) {
                     String variableArd=Ard.printMessage();
                     System.out.println(variableArd);
                     Ard.flushSerialPort();
                      

                 }
                 } catch (Exception e) {
                        
                 }
            
                
          
            
         }
     };
     


   
//    String estado = request.getParameter("op");
//    System.out.println(""+estado);
//    if (estado.equals("1")) {
//         Ard.arduinoTX("COM4", 9600);
//        Ard.sendData(estado);
//         Thread.sleep(5000);
//         Ard.killArduinoConnection();
//    } else { 
//         Ard.arduinoTX("COM4", 9600);
//        Ard.sendData(estado);
//                  Thread.sleep(5000);
//
//         Ard.killArduinoConnection();
//    }
//    
//
//
//   
//        response.sendRedirect("index.jsp?op="+estado);
    } catch (Exception e) {
           out.println("error:" +e.getMessage());
    }
   
   

  

//      

%>