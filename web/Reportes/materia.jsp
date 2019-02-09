<%-- 
    Document   : materia
    Created on : Dec 31, 2018, 10:26:53 PM
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
                    <label class="col-sm-3 control-label">Código de materia</label>
                    <div class="col-sm-3">
                        <input type="text"required class="form-control" id="txtCodMateria" value="IS24178" placeholder="Código de materia" >
                    </div>
                   <div class="col-sm-3">
                        <a onclick="ConsultaxMateria()" >
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