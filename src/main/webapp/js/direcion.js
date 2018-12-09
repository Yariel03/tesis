/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function inicio()
{
    $.ajax({
        type: 'POST',
        url: "inicio.jsp",
        success: function (html) {
            $('#main-content-wrapper').html(html);
        }
    });
}

//-------------------------------------------------------Inicio Tarjetas---------------------------------------
//Muestra el formaulario de Registro de Tarjetas
function registroTarjetas()
{
    $.ajax({
        type: 'GET',
        url: "Tarjetas/registroTarjetas.jsp",
        success: function (html) {
            $('#main-content-wrapper').html(html);
        }
    });
}
function guardarTarjetas()
{
   alert("Hola");
    var setDatos = {cedula: $('#txtCedula').val(), codigo: $('#txtCodigo').val(), tipo: $('#txtTipo').val(),
        nombre: $('#txtNombre').val(), apellido: $('#txtApellido').val(), email: $('#txtEmail').val()
    };
    alert("alert" + JSON.stringify(setDatos));
    $.ajax({
        type: 'POST',
        url: "Tarjetas/guardar.jsp",
        data: {getDatos: JSON.stringify(setDatos)},
        success: function (html) {
            $('#main-content-wrapper').html(html);
        }
    });
}

//-------------------------------------------------------Fin Tarjetas

function registro()
{
    $.ajax({
        type: 'POST',
        url: "registro.jsp",
        success: function (html) {
            $('#main-content-wrapper').html(html);
        }
    });
}


function registroEstudiante()
{
    $.ajax({
        type: 'POST',
        url: "registroEstudiante.jsp",
        success: function (html) {
            $('#main-content-wrapper').html(html);
        }
    });
}



function Mregistro()
{
    var valores = {cedula: $('#txtCedula').val(),codigo: $('#txtCodigo').val(), tipo: $('#txtTipo').val(),
        nombre: $('#txtNombre').val(), apellido: $('#txtApellido').val(), email: $('#txtEmail').val()
    };
    alert("alert" + JSON.stringify(valores));
    $.ajax({
        type: 'POST',
        url: "guardar.jsp",
        data: {dato: JSON.stringify(valores)},
        success: function (html) {
            $('#main-content-wrapper').html(html);
        }
    });
}



function comunicacion()
{

    $.ajax({
        type: 'POST',
        url: "control.jsp",
     
        success: function (html) {
            
            
            $('#main-content-wrapper').html(html);
        }
    });
    
    
  
}


function BuscarDocentes()
{
    $.ajax({
        type: 'POST',
        url: "tablaDocente.jsp",
        success: function (html) {
            $('#main-content-wrapper').html(html);
        }
    });
}

function BuscarEstudiante()
{

    $.ajax({
        type: 'POST',
        url: "tablaEstudiante.jsp",
        success: function (html) {
            $('#main-content-wrapper').html(html);
        }
    });
}


function eliminarDocente(correo,opc)
{
    alert("Hola"+correo);
  
    if (opc.equals('1')) 
    {
        $.ajax({
            type: 'POST',
            url: "eliminarDocente.jsp",
            data: {correo: correo},
            success: function (html) {
                BuscarDocentes();
            }
        });
    }else
    {
      
          $.ajax({
        type: 'POST',
        url: "eliminarDocente.jsp",
        data:  {correo:correo},
        success: function (html) {
            BuscarEstudiante();
        }
    });
    }
}


function ComprobarEst()
{

    $.ajax({
        url: "http://servicioscentral.espoch.edu.ec/Central/ServiciosPersona.svc/ObtenerPorDocumento/" + $('#txtCedula').val(),
        success: function (html) {


            if (html == "") {
                $('#btnLeer').attr("disabled", true);
                //$('#btnGuardar').attr("disabled", true);
                alert("No existen sus datos en el sistema lo sentimos");

            } else
            {
               $('#txtNombre').val(html['per_nombres']);
                $('#txtApellido').val(html['per_primerApellido'] + " " + html['per_segundoApellido']);
                $('#txtEmail').val(html['per_email']);
                //  $('#txtCodigo').val(html['per_email']);       Aqui cuando tenga el codigo

                $('#btnLeer').attr("disabled", false);

//                     $('#btnGuardar').attr("disabled", false);

            }
        }
    });
}
