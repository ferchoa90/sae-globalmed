<?php
use backend\components\Objetos;
use backend\components\Botones;
use backend\components\Bloques;
use backend\components\Modal;
use backend\components\Grid;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\web\View;
use backend\assets\AppAsset;
/* @var $this yii\web\View */

$this->title = "Citas Médicas";
$this->params['breadcrumbs'][] = $this->title;

$grid= new Grid;
$botones= new Botones;

?>
<div class="row col-12 p-2" >
<?php
echo $botones->getBotongridArray(
    array(
        array('tipo'=>'link','nombre'=>'ver', 'id' => 'new', 'titulo'=>' Agregar Cita', 'link'=>'nuevacita', 'onclick'=>'' , 'clase'=>'', 'style'=>'', 'col'=>'', 'tipocolor'=>'verde', 'icono'=>'nuevo','tamanio'=>'pequeño',  'adicional'=>''),
        array('tipo'=>'link','nombre'=>'filtro', 'id' => 'filtro', 'titulo'=>' Filtrar', 'link'=>'#', 'onclick'=>'filtrar();' , 'clase'=>'', 'style'=>'', 'col'=>'', 'tipocolor'=>'azul', 'icono'=>'filtro','tamanio'=>'pequeño',  'adicional'=>''),
    )
);

?>
</div>
<?php
$columnas= array(
    array('columna'=>'#', 'datareg' => 'num', 'clase'=>'', 'estilo'=>'', 'ancho'=>''),
    array('columna'=>'Paciente', 'datareg' => 'paciente', 'clase'=>'', 'estilo'=>'', 'ancho'=>''),
    array('columna'=>'Observación', 'datareg' => 'observacion', 'clase'=>'', 'estilo'=>'', 'ancho'=>''),
    array('columna'=>'Tipo Cita', 'datareg' => 'tipocita', 'clase'=>'', 'estilo'=>'', 'ancho'=>''),
    array('columna'=>'Fecha', 'datareg' => 'fechacita', 'clase'=>'', 'estilo'=>'', 'ancho'=>''),
    array('columna'=>'Hora', 'datareg' => 'horacita', 'clase'=>'', 'estilo'=>'', 'ancho'=>''),
    array('columna'=>'Doctor', 'datareg' => 'doctor', 'clase'=>'', 'estilo'=>'', 'ancho'=>''),
    array('columna'=>'Fecha Creación', 'datareg' => 'fechacreacion', 'clase'=>'', 'estilo'=>'', 'ancho'=>'')  ,
    array('columna'=>'Usuario c.', 'datareg' => 'usuariocreacion', 'clase'=>'', 'estilo'=>'', 'ancho'=>''),
    array('columna'=>'Estatus Cita', 'datareg' => 'estatuscita', 'clase'=>'', 'estilo'=>'', 'ancho'=>''),
    array('columna'=>'Estatus', 'datareg' => 'estatus', 'clase'=>'', 'estilo'=>'', 'ancho'=>'')  ,
    array('columna'=>'Acciones', 'datareg' => 'acciones', 'clase'=>'', 'estilo'=>'', 'ancho'=>'')  ,
);

echo $grid->getGrid(
        array(
            array('tipo'=>'datagrid','nombre'=>'table','id'=>'table','columnas'=>$columnas,'clase'=>'','style'=>'','col'=>'','adicional'=>'','url'=>'citasmedicasreg')
        )
);
$objeto= new Objetos;
$modal= New Modal;
$fechas=$objeto->getObjetosArray(
    array(
        array('tipo'=>'input','subtipo'=>'fecha', 'nombre'=>'fechadesde', 'id'=>'fechadesde', 'valor'=>date("Y-m-d"), 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'calendario','boxbody'=>false,'etiqueta'=>'Desde: ', 'col'=>'col-12 col-md-6', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'fecha', 'nombre'=>'fechahasta', 'id'=>'fechahasta', 'valor'=>date("Y-m-d"), 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'calendario','boxbody'=>false,'etiqueta'=>'Hasta: ', 'col'=>'col-12 col-md-6', 'adicional'=>''),
    ),true
);
$html=$fechas;
$modalFiltro= $modal->getModal('okcancelhtml','modalFiltro','modalFiltro', '', 'Ingrese el rango de fechas a buscar: <br><br>'.$html, '', '', '','width: 90%;','actualizarGrid()','$(\'#modalFiltro\').modal(\'hide\');','' );
echo $modalFiltro;

?>
<script>
    function filtrar()
    {
        console.log("filtro");
        $('#modalFiltro').modal('show');
    }

    function actualizarGrid()
    {
        loading(1);
        var desde=$('#fechadesde').val();
        var hasta=$('#fechahasta').val();
        $('#bodydiv').html('<table id="table"  name="table" class="table table-striped table-bordered table-hover"><thead><tr class="tableheader"><th >#</th><th >Paciente</th><th >Observación</th><th >Fecha</th><th >Hora</th><th >Doctor</th><th >Fecha Creación</th><th >Usuario c.</th><th >Estatus Cita</th><th >Estatus</th><th >Acciones</th></tr></thead><tbody></tbody> </table>');

    var url = 'citasmedicasrango';
    var token='<?=Yii::$app->request->getCsrfToken() ?>'
        $.post(url, { '_csrf-backend': token, '_csrf-frontend': token,'desde':desde,'hasta':hasta })
        .done(function(data) {
        var data = JSON.parse(data);
        $('table').DataTable({
                "paging": true,
                "fixedHeader": true,
                "lengthChange": true,
                "scrollX": true,
                "colReorder": true,
                "searching": true,
                "orderCellsTop": true,
                "ordering": true,
                "info": true,
                "autoWidth": false,
                "retrieve": true,
                "pageLength": 15,
                "data": data,
                "language": {
                    "search": "Buscar: ",
                    "zeroRecords": "No se encontraron registros para la búsqueda.",
                    "info": "Página _PAGE_ de _PAGES_ |  Total: _MAX_ registros",
                    "infoEmpty": "No existen registros.",
                    "lengthMenu": "Registros por página  _MENU_",
                    "infoFiltered": "(Filtrado de _MAX_ registros).",
                    "loadingRecords": "Cargando...",
                    "processing": "Procesando...",
                    "paginate": {
                            "first": "Inicio",
                        "last": "Final",
                        "next": "Siguiente",
                        "previous": "Anterior"
                    },
                },
                "columns": [
                        { "data": "num" },{ "data": "paciente" },{ "data": "observacion" },{ "data": "fechacita" },{ "data": "horacita" },{ "data": "doctor" },{ "data": "fechacreacion" },{ "data": "usuariocreacion" },{ "data": "estatuscita" },{ "data": "estatus" },{ "data": "acciones" },
                ]
            });
            loading(0);
        });
    }
</script>