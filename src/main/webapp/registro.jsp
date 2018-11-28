<%-- 
    Document   : registro
    Created on : Nov 25, 2018, 10:36:59 PM
    Author     : WebMaster
--%>
<div class="widget">
    <div class="widget-header">
        <h3><i class="fa fa-book"></i> Ingreso de nuevo docente</h3></div>
    <div class="widget-content">
        <form class="form-horizontal" role="form" >
            <fieldset>
                <legend>Ingrese la siguiente información</legend>
               
                <div class="form-group">
                    <label for="ticket-name" class="col-sm-3 control-label">Código de Tarjeta RFID</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="txtCodigo" placeholder="Código de Tarjeta RFID">
                    </div>
                    <div class="col-sm-3">
                        <button type="button" class="btn btn-default">
                            <i class="fa fa-eye"></i> 
                            Leer Tarjeta RFID
                        </button>
                       
                    </div>
                </div>
                
                 <div class="form-group">
                    <label for="ticket-type" class="col-sm-3 control-label">Tipo</label>
                    <div class="col-sm-9">
                        <select id="txtTipo" name="ticket-type" class="select-ticket-type">
                          
                            <option value="Docente">Docente</option>
                            
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
                        <a onclick="Mregistro()" >
                        <input type="button" class="btn btn-primary btn-block" value="Guardar"/>
                        </a>
                    </div>
                </div>
            </fieldset>
        </form>
    </div>
</div>
<!-- END SUPPORT TICKET FORM -->
<%@include file="footer.jsp" %>