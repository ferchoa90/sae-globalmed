<?php
use backend\components\Objetos;
use backend\components\Bloques;
use backend\components\Botones;
use backend\components\Iconos;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */

$this->title = "Editar cita";
$this->params['breadcrumbs'][] = $this->title;


$objeto= new Objetos;
$div= new Bloques;
$urlpost='formeditarcita';

 $contenido=$objeto->getObjetosArray(
    array(
        array('tipo'=>'input','subtipo'=>'oculto', 'nombre'=>'idcita', 'id'=>'idcita', 'valor'=>$citamedica->id, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false, 'col'=>'col-3 col-md-3', 'adicional'=>''),
        array('tipo'=>'select','subtipo'=>'', 'nombre'=>'paciente', 'id'=>'paciente', 'valor'=>$pacientes, 'valordefecto'=>$citamedica->idusuario, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Paciente: ', 'col'=>'col-12 col-md-12', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'fecha', 'id'=>'fecha', 'valor'=>$citamedica->fechacita, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'calendario','boxbody'=>false,'etiqueta'=>'Fecha Cita: ', 'col'=>'col-6 col-md-3', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'hora', 'id'=>'hora', 'valor'=>$citamedica->horacita, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Hora: ', 'col'=>'col-6 col-md-3', 'adicional'=>''),
        array('tipo'=>'select','subtipo'=>'', 'nombre'=>'optometrista', 'id'=>'optometrista', 'valor'=>$optometrista, 'valordefecto'=>$citamedica->idoptometrista, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Optometrista: ', 'col'=>'col-12 col-md-6', 'adicional'=>''),
        array('tipo'=>'select','subtipo'=>'', 'nombre'=>'doctor', 'id'=>'doctor', 'valor'=>$doctores, 'valordefecto'=>$citamedica->iddoctor, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Doctor: ', 'col'=>'col-12 col-md-6', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'textarea', 'nombre'=>'observacion', 'id'=>'observacion', 'valor'=>$citamedica->observacion, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Observación: ', 'col'=>'col-12 col-md-12', 'adicional'=>''),

    ),true
);

 $botones= new Botones; $botonC=$botones->getBotongridArray(
    array(
        array('tipo'=>'separador','clase'=>'', 'estilo'=>'', 'color'=>''),
        array('tipo'=>'link','nombre'=>'guardar', 'id' => 'guardar', 'titulo'=>'&nbsp;Guardar', 'link'=>'', 'onclick'=>'' , 'clase'=>'', 'style'=>'', 'col'=>'', 'tipocolor'=>'verde', 'icono'=>'guardar','tamanio'=>'pequeño',  'adicional'=>''),
        array('tipo'=>'link','nombre'=>'regresar', 'id' => 'regresar', 'titulo'=>'&nbsp;Regresar', 'link'=>'', 'onclick'=>'history.back()' , 'clase'=>'', 'style'=>'', 'col'=>'', 'tipocolor'=>'azul', 'icono'=>'regresar','tamanio'=>'pequeño',  'adicional'=>'')

));


 $contenido2='<div style="line-height:25px;"><b>Estatus:</b>&nbsp;&nbsp;&nbsp;<span class="badge badge-success"><i class="fa fa-circle"></i>&nbsp; ACTIVO</span><br>';
 $contenido2.='<hr style="color: #0056b2;"></div>';
 $form = ActiveForm::begin(['id'=>'frmDatos']);

 echo $div->getBloqueArray(
    array(
        array('tipo'=>'bloquediv','nombre'=>'bloque1','id'=>'bloque1','titulo'=>'Datos de la cita','clase'=>'col-md-9 col-xs-12 ','style'=>'','col'=>'','tipocolor'=>'','adicional'=>'','contenido'=>$contenido.$botonC),
        array('tipo'=>'bloquediv','nombre'=>'bloque2','id'=>'bloque2','titulo'=>'Información','clase'=>'col-md-3 col-xs-12 ','style'=>'','col'=>'','tipocolor'=>'gris','adicional'=>'','contenido'=>$contenido2),

    )
);
ActiveForm::end();
//var_dump($objeto);
?>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.css" rel="stylesheet"/>

<script>

        $('#fecha').datepicker({
            //language: "es-ES",
            todayHighlight: true,
            dateFormat: 'yyyy-mm-dd',
            format: 'yyyy-mm-dd',
            autoclose: true,
            autoclose: true,
            changeMonth: true,
            changeYear: false,
            clearBtn: true,
            startDate: new Date()
        })
        $('#hora').datetimepicker({
            datepicker: false,
          format: 'H:i',
          step:30,
  });
       $(document).ready(function(){
        $("#guardar").on('click', function() {
            if (validardatos()==true){
                var form    = $('#frmDatos');
                $.ajax({
                    url: '<?= $urlpost ?>',
                    async: 'false',
                    cache: 'false',
                    type: 'POST',
                    data: form.serialize(),
                    success: function(response){
                    data=JSON.parse(response);
                    console.log(response);
                    console.log(data.success);
                    if ( data.success == true ) {
                        // ============================ Not here, this would be too late
                        notificacion(data.mensaje,data.tipo);
                        //$this.data().isSubmitted = true;
                        //$('#frmDatos')[0].reset();
                        return true;
                    }else{
                        notificacion(data.mensaje,data.tipo);
                    }
                }
            });
            }else{
                notificacion("Faltan campos obligatorios","error");
                //e.preventDefault(); // <=================== Here
                return false;
            }
        });
        $('#frmDatos').on('submit', function(e){
            e.preventDefault(); // <=================== Here
            $this = $(this);
            if ($this.data().isSubmitted) {
                return false;
            }
        });
       });
       function validardatos()
       {
           //console.log("validardatos");
           if ($('#paciente').val()!=-1){
                if ($('#fecha').val()!=""){
                    if ($('#hora').val()!=""){
                        if ($('#optometrista').val()!=-1){
                            if ($('#doctor').val()!=-1){
                                if ($('#observación').val()!=-1){
                                    return true;
                                }else{
                                    $('#observación').focus();
                                    return false;
                                }
                            }else{
                                $('#doctor').focus();
                                return false;
                            }
                        }else{
                            $('#optometrista').focus();
                            return false;
                        }
                    }else{
                        $('#hora').focus();
                        return false;
                    }
                }else{
                    $('#fecha').focus();
                    return false;
                }
            }else{
                $('#paciente').focus();
                return false;
            }
       }
  </script>
<style>
    input[type=number]::-webkit-inner-spin-button,
input[type=number]::-webkit-outer-spin-button {
  -webkit-appearance: none;
  margin: 0;
}
input[type=number] { -moz-appearance:textfield; }
</style>
