<%-- 
    Document   : registroTarjetas
    Created on : Dec 9, 2018, 12:31:25 AM
    Author     : WebMaster
--%>

<div class="widget">
    <div class="widget-header">
        <h3><i class="fa fa-book"></i> Registro de Tarjeta</h3></div>
    <div class="widget-content">
        <form class="form-horizontal" role="form" >
            <fieldset>
                <legend>Ingrese la siguiente información</legend>
               
            
                
                
                
                <div class="form-group">
                    <label class="col-sm-3 control-label">Cédula</label>
                    <div class="col-sm-4">
                        <input type="text"required class="form-control" id="txtCedula" value="060452833-1" placeholder="Cédula del Docente" >
                    </div>
                    <div class="col-sm-4">
                        <a onclick="ComprobarEst()" >
                            
                        <button type="button" class="btn btn-default btn-ajax" >
                            <i class="fa fa-eye"></i> 
                            Comprobar
                        </button>
                       </a>
                    </div>
                </div>
                
                
                <div class="form-group">
                    <label for="ticket-name" class="col-sm-3 control-label">Código de Tarjeta RFID</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="txtCodigo" value='' placeholder="Código de Tarjeta RFID" disabled>
                    </div>
                    <div class="col-sm-4">
                        <a onclick="LeerTarjeta()">
                            
                        <button type="button" class="btn btn-default" id="btnLeer" disabled>
                            <i class="fa fa-eye"></i> 
                            Leer Tarjeta RFID
                        </button>
                        </a>
                       
                    </div>
                </div>
                
                 <div class="form-group">
                    <label for="ticket-type" class="col-sm-3 control-label">Tipo</label>
                    <div  id="facultad" class="col-sm-4">
                        <select id="txtTipo" name="ticket-type" class="select-ticket-type">
                          
                            <option value="Docente">Docente</option>
                            <option value="Estudiante">Estudiante</option>
                            <option value="Técnico">Técnico</option>
                            
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label for="ticket-name" class="col-sm-3 control-label">Nombres</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="txtNombre" placeholder="Nombres">
                    </div>
                </div>
                <div class="form-group">
                    <label for="ticket-name" class="col-sm-3 control-label">Apellidos</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="txtApellido" placeholder="Apellidos">
                    </div>
                </div>
                <div class="form-group">
                    <label for="ticket-email" class="col-sm-3 control-label">Email</label>
                    <div class="col-sm-4">
                        <input type="email" class="form-control" id="txtEmail" placeholder="Email">
                    </div>
                </div>
               
                <div class="form-group">
                    <label  class="col-sm-3 control-label">Código Carrera</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="txtCodigoCar" placeholder="Codigo Carrera">
                    </div>
                </div>
               
                <div class="form-group">
                    <label  class="col-sm-3 control-label">Carrera</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="txtCarrera" placeholder="Carrera">
                    </div>
                </div>
               
                <div class="form-group">
                    <div class="col-sm-offset-3 col-sm-4">
                        <a onclick="guardarTarjetas()" >
                            <input type="button" id="btnGuardar" class="btn btn-primary btn-block" value="Guardar"/>
                        </a>
                    </div>
                </div>
            </fieldset>
        </form>
    </div>
</div>
<!-- END SUPPORT TICKET FORM -->

