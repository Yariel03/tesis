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
                <legend>Ingrese la siguiente informaci�n</legend>
               
                
                <div class="form-group">
                    <label class="col-sm-3 control-label">C�dula</label>
                    <div class="col-sm-6">
                        <input type="text"required class="form-control" id="txtCedula" value="0706705159" placeholder="C�dula del Docente" >
                    </div>
                    <div class="col-sm-3">
                        <a onclick="ComprobarEst()" >
                        <button type="button" class="btn btn-default" >
                            <i class="fa fa-eye"></i> 
                            Comprobar
                        </button>
                       </a>
                    </div>
                </div>
                
                
                <div class="form-group">
                    <label for="ticket-name" class="col-sm-3 control-label">C�digo de Tarjeta RFID</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="txtCodigo" value='sdf5767adsf' placeholder="C�digo de Tarjeta RFID" disabled>
                    </div>
                    <div class="col-sm-3">
                        <button type="button" class="btn btn-default" id="btnLeer" disabled>
                            <i class="fa fa-eye"></i> 
                            Leer Tarjeta RFID
                        </button>
                       
                    </div>
                </div>
                
                 <div class="form-group">
                    <label for="ticket-type" class="col-sm-3 control-label">Tipo</label>
                    <div  id="facultad" class="col-sm-9">
                        <select id="txtTipo" name="ticket-type" class="select-ticket-type">
                          
                            <option value="Docente">Docente</option>
                            <option value="Estudiante">Estudiante</option>
                            <option value="T�cnico">T�cnico</option>
                            
                        </select>
                    </div>
                </div>
                 <div class="form-group">
                    <label for="ticket-type" class="col-sm-3 control-label">Facultad</label>
                    <div  id="facultad" class="col-sm-9">
                        <select id="txtTipo" name="ticket-type" class="select-ticket-type">
                          
                            <option value=""></option>
                            <option value="FACULTAD DE INFORM�TICA Y ELECTR�NICA">FACULTAD DE INFORM�TICA Y ELECTR�NICA</option>
                            <option value="FACULTAD DE CIENCIAS">FACULTAD DE CIENCIAS</option>
                            <option value="FACULTAD DE CIENCIAS">FACULTAD DE ADMINISTRACION DE EMPRESAS</option>
                            
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label for="ticket-name" class="col-sm-3 control-label">Nombres</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="txtNombre" placeholder="Nombres">
                    </div>
                </div>
                <div class="form-group">
                    <label for="ticket-name" class="col-sm-3 control-label">Apellidos</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="txtApellido" placeholder="Apellidos">
                    </div>
                </div>
                <div class="form-group">
                    <label for="ticket-email" class="col-sm-3 control-label">Email</label>
                    <div class="col-sm-9">
                        <input type="email" class="form-control" id="txtEmail" placeholder="Email">
                    </div>
                </div>
               
                <div class="form-group">
                    <div class="col-sm-offset-3 col-sm-9">
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
<%@include file="../footer.jsp" %>