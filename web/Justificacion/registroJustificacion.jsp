<%-- 
    Document   : registroTarjetas
    Created on : Dec 9, 2018, 12:31:25 AM
    Author     : WebMaster
--%>

<div class="widget">
    <div class="widget-header">
        <h3><i class="fa fa-book"></i> Justificaci�n</h3></div>
    <div class="widget-content">
        <form class="form-horizontal" role="form" >
            <fieldset>
                <legend>Ingrese la siguiente informaci�n</legend>
               
            
                
                <div class="form-group">
                    <label class="col-sm-3 control-label">C�digo de Materia</label>
                    <div class="col-sm-4">
                        <input type="text"required class="form-control" id="txtCodMateria" value="IS24178" placeholder="" >
                    </div>
               
                </div>
         
                <div class="form-group">
                    <label class="col-sm-3 control-label">C�dula</label>
                    <div class="col-sm-4">
                        <input type="text"required class="form-control" id="txtCedula" placeholder="C�dula" value="070469122-9">
                    </div>
               
                </div>
                
                <div class="form-group">
                    <label class="col-sm-3 control-label">Descripcion</label>
                    <div class="col-sm-4">
                        <input type="text"required class="form-control" id="txtDescripcion" placeholder="decripcion" >
                    </div>
               
                </div>
                
                <div class="form-group">
                    <label class="col-sm-3 control-label">D�a de Justificaci�n</label>
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

