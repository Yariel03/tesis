/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

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

//Comprueba en el sistema de la ESPOCH si exite la persona

function ComprobarEst()
{
    $.ajax({
        url: "Tarjetas/devolverDatos.jsp?cedula="+$('#txtCedula').val(),
        success: function(html) {
//            html = html.replace(/\n|\r/g, "");
            var obj=JSON.parse(html);
            $('#txtNombre').val(obj['Nombre']);
            $('#txtApellido').val(obj['Apellido']);
            $('#txtEmail').val(obj['Correo']);
            $('#txtCodigoCar').val(obj['CodCarrera']);
            $('#txtCarrera').val(obj['DesCarrera']);
            $('#btnLeer').removeAttr('disabled');
        }
    });
}

function LeerTarjeta()
{
    alert("listo para escanear tarjeta")
     $.ajax({
        url: "http://192.168.1.200:80/",
        success: function(html) {
//            html = html.replace(/\n|\r/g, "");
            $('#txtCodigo').val(html);
           
        }
    });
    
}

function guardarJustificacion()
{
//    
//    var dateString = '2017/01/10';
//console.log(convertDateFormat(dateString));

// @param string (string) : Fecha en formato YYYY-MM-DD
// @return (string)       : Fecha en formato DD/MM/YYYY
//function convertDateFormat(string) {
//  var info = string.split('/');
//  return info[2] + '-' + info[1] + '-' + info[0];
//}
       var setDatos = {
        materia: $('#txtCodMateria').val(), cedula: $('#txtCedula').val(),
        descripcion: $('#txtDescripcion').val(), fecha: $('#txtFecha').val()
    };
    alert(JSON.stringify(setDatos));
       $.ajax({
        type: 'POST',
        url: "Justificacion/guardar.jsp",
        data: {

            getDatos: JSON.stringify(setDatos)},
        success: function (html) {
//                            alert(JSON.stringify(setDatos));

            $('#main-content-wrapper').html(html);
        }
    });
}

function guardarTarjetas()
{
  
    var setDatos = {
        cedula: $('#txtCedula').val(), codigo: $('#txtCodigo').val(), tipo: $('#txtTipo').val(),
        nombre: $('#txtNombre').val(), apellido: $('#txtApellido').val(), email: $('#txtEmail').val(),
        codCarrera:$('#txtCodigoCar').val(),descripcion:$('#txtCarrera').val()
    };

    $.ajax({
        type: 'POST',
        url: "Tarjetas/guardar.jsp",
        data: {getDatos: JSON.stringify(setDatos)},
        success: function (html) {
//                            alert(JSON.stringify(setDatos));
            $('#main-content-wrapper').html(html);
        }
    });
}

//-------------------------------------------------------Fin Tarjetas


function justificar()
{
        $.ajax({
        type: 'POST',
        url: "Justificacion/registroJustificacion.jsp",
        success: function (html) {
            $('#main-content-wrapper').html(html);
        }
    });
}
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


function porMateria()
{
    $.ajax({
        type: 'POST',
        url: "Reportes/materia.jsp",
        success: function (html) {
            $('#main-content-wrapper').html(html);
        }
    });
}




function verAsistencia(ced)
{
    $.ajax({
        type: 'POST',
        url: "Estudiante/dibujarTabla2.jsp?cedula="+ced,
        success: function (html) {
            $('#tabla2').html(html);
        }
    });
    
    
    
    
}

function ConsultaxMateria()
{   var printCounter = 0;
  
     $('#example').DataTable(
             {"destroy":"true",
    language: {
        "decimal": "",
        "emptyTable": "No hay información",
        "info": "Mostrando _START_ a _END_ de _TOTAL_ Usuarios",
        "infoEmpty": "Mostrando 0 to 0 of 0 Usuarios",
        "infoFiltered": "(Total de usuarios: _MAX_ )",
        "infoPostFix": "",
        "thousands": ",",
        "lengthMenu": "Mostrar de _MENU_ Usuarios",
        "loadingRecords": "Cargando...",
        "processing": "Procesando...",
        "search": "Buscar:",
        "zeroRecords": "Sin resultados encontrados",
        "paginate": {
            "first": "Primero",
            "last": "Ultimo",
            "next": "Siguiente",
            "previous": "Anterior"
        }},
    "ajax":{
        "type":"POST",
        "url":"Reportes/consultaxMateria.jsp?codMateria="+$('#txtCodMateria').val()
     
        },
        "columns":[
            {"data":"porcentaje", "render": function ( data, type, row, meta ) {
                return  data  < 70  
                ? 
                '<span class="label label-critical">'+data+' %</span>'
                :'<span class="label label-success">'+data+' %</span>';  }},
            {"data":"cedula"},
            {"data":"apellidos"},
            {"data":"nombres"},
            {"data":"correo"},
             {"data":"cedula",
                "render": function ( data, type, row, meta ) {
                return '<button onclick="verAsistencia(\''+data.toString()+'\')" type="button" class="btn btn-info"><i class="fa fa-eye"></i></button></td>'; }}
        ],
                 dom: 'Bfrtip',
        buttons: [
            
            {
                extend: 'excel',
                messageTop: null
            },
            {
                extend: 'pdf',
                messageBottom: null
            },
            {
                extend: 'print',
                messageTop: function () {
                    printCounter++;
 
                    if ( printCounter === 1 ) {
                        return 'This is the first time you have printed this document.';
                    }
                    else {
                        return 'You have printed this document '+printCounter+' times';
                    }
                },
                messageBottom: null
            }
        ]
             
      
       
             
        });
//     var setDatos = {
//        txtcodMateria: $('#txtCodMateria').val()
//    };
//
//    alert(JSON.stringify(setDatos));
//      $.ajax({
//        type: 'POST',
//        url: "Reportes/consultaxMateria.jsp",
//       
//        success: function (html) {
//            $('#main-content-wrapper').append(html);
//        }
//    } );
    
}


function ConsultaxEstudiante()
{   var printCounter = 0;
  
     $('#example').DataTable(
             {"destroy":"true",
    language: {
        "decimal": "",
        "emptyTable": "No hay información",
        "info": "Mostrando _START_ a _END_ de _TOTAL_ Usuarios",
        "infoEmpty": "Mostrando 0 to 0 of 0 Usuarios",
        "infoFiltered": "(Total de usuarios: _MAX_ )",
        "infoPostFix": "",
        "thousands": ",",
        "lengthMenu": "Mostrar de _MENU_ Usuarios",
        "loadingRecords": "Cargando...",
        "processing": "Procesando...",
        "search": "Buscar:",
        "zeroRecords": "Sin resultados encontrados",
        "paginate": {
            "first": "Primero",
            "last": "Ultimo",
            "next": "Siguiente",
            "previous": "Anterior"
        }},
    "ajax":{
        "type":"POST",
        "url":"Reportes/consultaxMateria.jsp?codMateria="+$('#txtCodMateria').val()
     
        },
        "columns":[
            {"data":"porcentaje", "render": function ( data, type, row, meta ) {
                return  data  < 70  
                ? 
                '<span class="label label-critical">'+data+' %</span>'
                :'<span class="label label-success">'+data+' %</span>';  }},
            {"data":"cedula"},
            {"data":"apellidos"},
            {"data":"nombres"},
            {"data":"materia"},
             {"data":"cedula",
                "render": function ( data, type, row, meta ) {
                return '<button onclick="verAsistencia(\''+data.toString()+'\')" type="button" class="btn btn-info"><i class="fa fa-eye"></i></button></td>'; }}
        ],
                 dom: 'Bfrtip',
        buttons: [
            
            {
                extend: 'excel',
                messageTop: null
            },
            {
                extend: 'pdf',
                messageBottom: null
            },
            {
                extend: 'print',
                messageTop: function () {
                    printCounter++;
 
                    if ( printCounter === 1 ) {
                        return 'This is the first time you have printed this document.';
                    }
                    else {
                        return 'You have printed this document '+printCounter+' times';
                    }
                },
                messageBottom: null
            }
        ]
             
      
       
             
        });
//     var setDatos = {
//        txtcodMateria: $('#txtCodMateria').val()
//    };
//
//    alert(JSON.stringify(setDatos));
//      $.ajax({
//        type: 'POST',
//        url: "Reportes/consultaxMateria.jsp",
//       
//        success: function (html) {
//            $('#main-content-wrapper').append(html);
//        }
//    } );
    
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


function BuscarDocente()
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
        url: "Estudiante/tablaEstudiante.jsp",
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


//function ComprobarEst()
//{
//
//    $.ajax({
//        url: "http://servicioscentral.espoch.edu.ec/Central/ServiciosPersona.svc/ObtenerPorDocumento/" + $('#txtCedula').val(),
//        success: function (html) {
//
//
//            if (html == "") {
//                $('#btnLeer').attr("disabled", true);
//                //$('#btnGuardar').attr("disabled", true);
//                alert("No existen sus datos en el sistema lo sentimos");
//
//            } else
//            {
//               $('#txtNombre').val(html['per_nombres']);
//                $('#txtApellido').val(html['per_primerApellido'] + " " + html['per_segundoApellido']);
//                $('#txtEmail').val(html['per_email']);
//                //  $('#txtCodigo').val(html['per_email']);       Aqui cuando tenga el codigo
//
//                $('#btnLeer').attr("disabled", false);
//
////                     $('#btnGuardar').attr("disabled", false);
//
//            }
//        }
//    });
//}



function  quitar()
{
    $('#alerta').remove();
}
