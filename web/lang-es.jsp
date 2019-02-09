<%-- 
    Document   : lang-es
    Created on : Jan 22, 2019, 1:37:27 AM
    Author     : WebMaster
--%>

 <script>
    $(document).ready(function() {
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
        }}
      } );
  });
  
    </script> 