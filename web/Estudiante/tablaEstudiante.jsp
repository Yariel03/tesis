<%-- 
    Document   : tablaEstudiante
    Created on : Jan 1, 2019, 6:20:33 PM
    Author     : WebMaster
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- 
    Document   : materia
    Created on : Dec 31, 2018, 10:26:53 PM
    Author     : WebMaster
--%>


 <script>
    $(document).ready(function() {
         var printCounter = 0;
     
        
     var table = $('#example').DataTable(
             {
                 "destroy":"true",
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
        }},"ajax":{
        "type":"POST",
        "url":"Estudiante/listadoEstudiante.jsp"
        },
        "columns":[
            {"data":"cedula"},
            {"data":"apellidos"},
            {"data":"nombres"},
            {"data":"estado"},
            {"data":"correo"},
            {"data":"cedula",
                "render": function ( data, type, row, meta ) {
                return '<button onclick="hola('+data+')" type="button" class="btn btn-warning"><i class="fa fa-pencil-square-o"></i></button></td>\n\
                        <button onclick="eliminarDocente('+data+')" type="button" class="btn btn-danger"><i class="fa fa-trash-o"></i> </button></td>'; }}
           
            
            
        ],  dom: 'Bfrtip',
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
             
      } );
      
  
     
    
  });
  
    </script> 

<table id="example" class="display top-bar widget" >
        <thead style="color: #fff">
            <tr>
                <th>Cédula</th>
                <th>Apellidos</th>
                <th>Nombres</th>
                <th>Estado</th>
                <th>Correo</th>
                <th>Operación</th>
              

            </tr>
        </thead>
        <tbody></tbody>
       
        
    </table>