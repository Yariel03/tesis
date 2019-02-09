<%-- 
    Document   : estudiante
    Created on : Feb 1, 2019, 12:04:26 PM
    Author     : WebMaster
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../lang-es.jsp" %> 

<div class="widget" id="contenedor">
    <div class="widget-header">
        <h3><i class="fa fa-book"></i> Reportes por materias</h3></div>
    <div class="widget-content">
        <form class="form-horizontal" role="form" >
            <fieldset>
                <legend>Consulta por materia y fecha</legend>

                <div class="form-group">
                    <label class="col-sm-3 control-label">Cédula</label>
                    <div class="col-sm-3">
                        <input type="text"required class="form-control" id="txtCedula" value="070469122-9" placeholder="Cédula" >
                    </div>
                   <div class="col-sm-3">
                        <a onclick="ConsultaxEstudiante()" >
                            <input type="button" id="btnGuardar" class="btn btn-primary btn-block" value="GENERAR"/>
                        </a>
                    </div>
                </div>
                
                
        
               
               
               
            </fieldset>
        </form>
    </div>
</div>
<!-- END SUPPORT TICKET FORM -->


<table id="example" class="display top-bar widget" >
    
        <thead style="color: #fff">
            <tr>
                <th>Porcentaje</th>
                <th>Cédula</th>
                <th>Apellidos</th>
                <th>Nombres</th>
                <th>Correo</th>
                <th>Detalles</th>
              

            </tr>
        </thead>
       
        
    </table>
<div id='tabla2'>
    
</div>