<%-- 
    Document   : registroTarjetas
    Created on : Dec 9, 2018, 12:31:25 AM
    Author     : WebMaster
--%>

<div class="widget">
    <div class="widget-header">
        <h3><i class="fa fa-book"></i> Justificación</h3></div>
    <div class="widget-content">
        <form class="form-horizontal" role="form" >
            <fieldset>
                <legend>Ingrese la siguiente información</legend>
               
            
                
                <div class="form-group">
                    <label class="col-sm-3 control-label">Código de Materia</label>
                    <div class="col-sm-4">
                        <input type="text"required class="form-control" id="txtCodMateria" value="IS24178" placeholder="" >
                    </div>
               
                </div>
         
                <div class="form-group">
                    <label class="col-sm-3 control-label">Cédula</label>
                    <div class="col-sm-4">
                        <input type="text"required class="form-control" id="txtCedula" placeholder="Cédula" value="070469122-9">
                    </div>
               
                </div>
                
                <div class="form-group">
                    <label class="col-sm-3 control-label">Descripcion</label>
                    <div class="col-sm-4">
                        <input type="text"required class="form-control" id="txtDescripcion" placeholder="decripcion" >
                    </div>
               
                </div>
                
                <div class="form-group">
                    <label class="col-sm-3 control-label">Día de Justificación</label>
                    <div class="col-sm-4">
                        <input type="date"required class="form-control" id="txtFecha" placeholder="decripcion" >
                    </div>
               
                </div>
              
               
                <div class="form-group">
                    <div class="col-sm-offset-3 col-sm-4">
                        <a onclick="guardarJustificacion()" >
                            <input type="button" id="btnGuardar" class="btn btn-primary btn-block" value="Guardar"/>
                        </a>
                    </div>
                </div>
            </fieldset>
        </form>
    </div>
</div>
<!-- END SUPPORT TICKET FORM -->

