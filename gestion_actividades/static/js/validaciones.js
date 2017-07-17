$(document).ready(function() {
    $("input:text,select,textarea,input:password").attr('class','form-control');
//    $('#josue').DataTable( {
//	responsive: true
//    } );
//$("input:submit,button,input:file").attr('class','btn btn-success');
    
////////////////////////////////////////////////////////////////////////////////////////////////////////
// Al seleccionar el codigo de la actividad trae el nombre de la actividad fecha de inicio y fecha pautada (Gerente)
////////////////////////////////////////////////////////////////////////////////////////////////////////
    $('#cod_actividad').change(function() {
        var id_act = $('#cod_actividad').val();

        //$('#id_cod_municipio,#id_cod_parroquia').find('option:gt(0)').remove().end().select2('val', '0');
        if (id_act > 0) {
            $.get('/menu/registros/actividad/busqueda_solicitud/', {'id':id_act}, function(data) {
            $.each(data, function(i) {
                var date = new Date(data[i].fields.fecha_i);
                var date1 = new Date(data[i].fields.fecha_p);
                var fecha_i =  date.getDate() + '/' +  (date.getMonth() +1)  + '/' +  date.getFullYear()
                var fecha_p =  date1.getDate() + '/' + (date1.getMonth() +1) + '/' +  date1.getFullYear();
                $('#nom_actividad').val(data[i].fields.nom_actividad)
                $('#fecha_i').val(fecha_i)
                $('#fecha_p').val(fecha_p)
                $('#des_actividad').val(data[i].fields.des_actividad)
            });
            }, 'json');
        }
    });
    
////////////////////////////////////////////////////////////////////////////////////////////////////////
// Al seleccionar el codigo de la actividad trae el nombre de la actividad y fecha de inicio (Asignar)
////////////////////////////////////////////////////////////////////////////////////////////////////////
    $('#id_cod_actividad').change(function() {
        var id_activi = $('#id_cod_actividad').val();
       
        if (id_activi > 0) {
            $.get('/menu/asignaciones/asignar/busqueda_actividad/', {'id':id_activi}, function(data) {
            $.each(data, function(i) {
                var a = new Date(data[i].fields.fecha_i);
                var b = new Date(data[i].fields.fecha_p)
                var fecha =  (a.getDate()+1) + '/' +  (a.getMonth() +1)  + '/' +  a.getFullYear()
                var fechaP = (b.getDate()+1) + '/' +  (b.getMonth() +1)  + '/' +  b.getFullYear()
                $('#nom_actividad').val(data[i].fields.nom_actividad)
                $('#id_des_actividad').val(data[i].fields.des_actividad)
                $('#id_fecha_i').val(fecha)
                $('#id_fecha_p').val(fechaP)
            });
            }, 'json');
        }
    });

    
////////////////////////////////////////////////////////////////////////////////////////////////////////
// Al seleccionar el codigo de la actividad trae el nombre de la actividad y fecha de inicio (Empleados)
////////////////////////////////////////////////////////////////////////////////////////////////////////
///////// los amarillos donde se va a guardar, los campos blancos del modelo de la busqueda ;-)
    $('#id_cod_actividad_e').change(function() {
        var id_tareas_e = $('#id_cod_actividad_e').val();
       
        if (id_tareas_e > 0) {
            $.get('/menu/empleados/asignar_tareas/buscar_empleados/', {'id':id_tareas_e}, function(data) {
            $.each(data, function(i) {
                var a = new Date(data[i].fields.fecha_i);
                var b = new Date(data[i].fields.fecha_p)
                var fecha_e =  (a.getDate()+1) + '/' +  (a.getMonth() +1)  + '/' +  a.getFullYear()
                var fechaP_e = (b.getDate()+1) + '/' +  (b.getMonth() +1)  + '/' +  b.getFullYear()
                $('#nom_actividad_e').val(data[i].fields.nom_actividad)
                $('#id_des_actividad_e').val(data[i].fields.des_actividad)
                $('#id_fecha_i_e').val(fecha_e)
                $('#id_fecha_p_e').val(fechaP_e)
            });
            }, 'json');
        }
    });

////////////////////////////////////////////////////////////////////////////////////////////////////////
// Funcion para Cargar foto 
////////////////////////////////////////////////////////////////////////////////////////////////////////

function PreviewImage() {
        var oFReader = new FileReader();
        oFReader.readAsDataURL(document.getElementById("id_foto").files[0]);

        oFReader.onload = function (oFREvent) {
            document.getElementById("uploadPreview").src = oFREvent.target.result;
        };
    }

////////////////////////////////////////////////////////////////////////////////////////////////////////
// Funcion global para depurar
////////////////////////////////////////////////////////////////////////////////////////////////////////
function eliminar_data(pk_id, url) {
    id_data= String(pk_id)
    r = confirm("¿Realmente desea eliminar el registro?!");
    if (r == true) {
        location.href=url+id_data;
    }
};
})