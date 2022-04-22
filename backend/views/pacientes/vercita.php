<?php
use backend\components\Objetos;
use backend\components\Bloques;
use backend\components\Botones;
use backend\components\Iconos;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\widgets\ActiveForm;
use backend\components\Modal;
/* @var $this yii\web\View */

$this->title = "Ver Cita";
$this->params['breadcrumbs'][] = ['label' => 'Citas médicas', 'url' => ['citas']];
$this->params['breadcrumbs'][] = $this->title;

$urlpost='gestionarpedido';


$btnatendido=array('tipo'=>'link','nombre'=>'atendendida', 'id' => 'atendendida', 'titulo'=>'&nbsp;Atendendida', 'link'=>'', 'onclick'=>'estado=\'ATENDIDA\';$(\'#modalAtender\').modal(\'show\');' , 'clase'=>'', 'style'=>'', 'col'=>'', 'tipocolor'=>'plomo', 'icono'=>'aceptar','tamanio'=>'pequeño',  'adicional'=>'');
$btncancelar=array('tipo'=>'link','nombre'=>'cancelar', 'id' => 'cancelar', 'titulo'=>'&nbsp;Cancelar', 'link'=>'', 'onclick'=>'estado=\'CANCELADA\';$(\'#modalCancelar\').modal(\'show\');' , 'clase'=>'', 'style'=>'', 'col'=>'', 'tipocolor'=>'rojo', 'icono'=>'cancelar','tamanio'=>'pequeño',  'adicional'=>'');
$btnatender= array('tipo'=>'link','nombre'=>'atender', 'id' => 'atender', 'titulo'=>'&nbsp;En atención', 'link'=>'', 'onclick'=>'estado=\'EN ATENCIÓN\';$(\'#modalAtencion\').modal(\'show\');' , 'clase'=>'', 'style'=>'', 'col'=>'', 'tipocolor'=>'verde', 'icono'=>'aceptar','tamanio'=>'pequeño',  'adicional'=>'');
$btnreagendar=array('tipo'=>'link','nombre'=>'reagendar', 'id' => 'reagendar', 'titulo'=>'&nbsp;Reagendar', 'link'=>'', 'onclick'=>'estado=\'REAGENDADA\';$(\'#modalReagendar\').modal(\'show\');' , 'clase'=>'', 'style'=>'', 'col'=>'', 'tipocolor'=>'naranja', 'icono'=>'aceptar','tamanio'=>'pequeño',  'adicional'=>'');
$btnconfirmar=array('tipo'=>'link','nombre'=>'confirmar', 'id' => 'confirmar', 'titulo'=>'&nbsp;Confirmar', 'link'=>'', 'onclick'=>'estado=\'CONFIRMADA\';$(\'#modalConfirmada\').modal(\'show\');' , 'clase'=>'', 'style'=>'', 'col'=>'', 'tipocolor'=>'verde', 'icono'=>'aceptar','tamanio'=>'pequeño',  'adicional'=>'');
$btnatendido=array();$btncancelar=array();$btnenatencion=array();$btnreagendar=array();$btnconfirmar=array();
$btnatender=array();
switch ($cita->estatuscita) {
    case 'AGENDADA':
        $stylestatuscit='badge-primary';
        $btncancelar=array();$btnenatencion=array();$btnconfirmar=array();
        break;

        case 'CONFIRMADA':
            $stylestatuscit='badge-success';
             $btncancelar=array();$btnenatencion=array();$btnconfirmar=array();
            break;

    case 'REENVIADO':
        $stylestatuscit='badge-primary';
        break;

    case 'CANCELADA':
        $stylestatuscit='badge-danger';
        $btnatendido=array();$btncancelar=array();

        break;

    case 'ATENDIDA':
        $stylestatuscit='badge-secondary';
        $btnatendido=array();$btncancelar=array();$btnatender=array();$btnreagendar=array();$btnconfirmar=array();
        break;

    case 'EN ATENCIÓN':
        $stylestatuscit='badge-info';
        $btnatender=array();$btnconfirmar=array();$btnreagendar=array();
        break;

    case 'REAGENDADA':
        $stylestatuscit='badge-info';
        $btnatendido=array();$btnatender=array();
        break;

    default:
        # code...
        break;
}

$objeto= new Objetos;
$div= new Bloques;

 $botones= new Botones; $botonC=$botones->getBotongridArray(
    array(
        array('tipo'=>'separador','clase'=>'', 'estilo'=>'', 'color'=>''),
       // array('tipo'=>'link','nombre'=>'guardar', 'id' => 'guardar', 'titulo'=>'&nbsp;Guardar', 'link'=>'', 'onclick'=>'' , 'clase'=>'', 'style'=>'', 'col'=>'', 'tipocolor'=>'verde', 'icono'=>'guardar','tamanio'=>'pequeño',  'adicional'=>''),
        array('tipo'=>'link','nombre'=>'regresar', 'id' => 'guardar', 'titulo'=>'&nbsp;Regresar', 'link'=>'', 'onclick'=>'history.back()' , 'clase'=>'', 'style'=>'', 'col'=>'', 'tipocolor'=>'azul', 'icono'=>'regresar','tamanio'=>'pequeño',  'adicional'=>''),
        $btnconfirmar,
        $btnatender,
        $btnatendido,
        $btnreagendar,
        $btncancelar,


));

$contenido='<div style="line-height:30px;" class="row"><div class="col-4 col-md-4"><b>Cita #:  </b>'.$cita->id.'<br></div>';
$contenido.='<div class="col-4 col-md-4"><b>Fecha :  </b>'.$cita->fechacita.'<br></div>';
$contenido.='<div class="col-4 col-md-4"><b>Fecha :  </b>'.$cita->horacita.'<br></div>';
$contenido.='<div class="col-12 col-md-12"><hr style="color: #0056b2;"></div>';
$contenido.='<div class="col-6 col-md-12"><b>Paciente:</b>&nbsp; '.$cita->idusuario0->apellidos.' '.$cita->idusuario0->nombres.'</span><br></div>';
$contenido.='<div class="col-6 col-md-9"><b>Observación:</b>&nbsp; '.$cita->observacion.'</span><br></div>';
//$contenido.='<div class="col-12 col-md-12"><b>Cliente:</b>&nbsp; '.$cita->cliente0->razonsocial.'</span><br></div>';
$contenido.='<div class="col-6 col-md-3"><b>Doctor:</b>&nbsp; '.$cita->iddoctor0->apellidos.' '.$cita->iddoctor0->nombres.'</span><br></div>';
//$contenido.='<div class="col-12 col-md-12"><hr style="color: #0056b2;"></div>';
$contenido.='</div>';



 if ($cita->estatus=="ACTIVO"){ $stylestatus="badge-success"; }else{ $stylestatus="badge-secondary" ; }
 $contenido2='<div style="line-height:30px;"><b>Estatus Cita:</b>&nbsp;&nbsp;&nbsp;<span class="badge '.$stylestatuscit.'"><i class="fa fa-circle"></i>&nbsp;&nbsp;'.$cita->estatuscita.'</span><br>';
 $contenido2.='<b>Estatus:</b>&nbsp;&nbsp;&nbsp;<span class="badge '.$stylestatus.'"><i class="fa fa-circle"></i>&nbsp;&nbsp;'.$cita->estatus.'</span><br>';
 $contenido2.='<hr style="color: #0056b2;">';
 $contenido2.='<b>Fecha C.:</b>&nbsp; '.$cita->fechacreacion.'</span><br>';
 $contenido2.='<b>Usuario C.:</b>&nbsp; '.$cita->usuariocreacion0->username. '</span><br>';
 $contenido2.='<hr style="color: #0056b2;">';
 $contenido2.='<b>Fecha M.:</b>&nbsp;'.$cita->usuarioactualizacion0->username. '</span><br>';
 $contenido2.='<b>Usuario M.:</b>&nbsp;'.$cita->fechaact. '</span><br>';
 $contenido2.='<hr style="color: #0056b2;">';
 $contenido2.='</div>';

 $tabla='';

$form = ActiveForm::begin(['id'=>'frmDatos']);
echo '<input type="hidden" id="estado" name="estado" /> ';
echo '<input type="hidden" id="cita" name="cita" value="'.$cita->id.'" /> ';
 echo $div->getBloqueArray(
    array(
        array('tipo'=>'bloquediv','nombre'=>'pedido','id'=>'pedido','titulo'=>'Detalle de la cita','clase'=>'col-md-9 col-xs-12 ','style'=>'','col'=>'','tipocolor'=>'','adicional'=>'','contenido'=>$contenido.$botonC),
        array('tipo'=>'bloquediv','nombre'=>'bloc1','id'=>'bloc1','titulo'=>'Información','clase'=>'col-md-3 col-xs-12 ','style'=>'','col'=>'','tipocolor'=>'gris','adicional'=>'','contenido'=>$contenido2),
    )
);
$modal= New Modal;
$estatusmen="cambiar el estatus";

$modalAtender= $modal->getModal('okcancel','modalAtender','modalAtender', '', '¿Desea atender la cita médica?', '', '', '','','cambiarEstado(false)','$(\'#modalAtender\').modal(\'hide\');','' );
$modalCancelar= $modal->getModal('okcancel','modalCancelar','modalCancelar', '', '¿Desea cancelar la cita médica?', '', '', '','','cambiarEstado(false)','$(\'#modalCancelar\').modal(\'hide\');','' );
$modalAtencion= $modal->getModal('okcancel','modalAtencion','modalAtencion', '', '¿Desea atender la cita médica?', '', '', '','','cambiarEstado(false)','$(\'#modalAtencion\').modal(\'hide\');','' );
$modalConfirmar= $modal->getModal('okcancelinput','modalConfirmar','modalConfirmar', '', '¿Desea confirmar la cita médica?', '', '', '','','cambiarEstado(false)','$(\'#modalConfirmar\').modal(\'hide\');','' );
$modalReagendar= $modal->getModal('okcancelinput','modalReagendar','modalReagendar', '', '¿Desea reagendar la cita médica?', '', '', '','','cambiarEstado(false)','$(\'#modalReagendar\').modal(\'hide\');','' );
echo $modalAtender;
echo $modalCancelar;
echo $modalAtencion;
echo $modalConfirmar;
echo $modalReagendar;
//if ($pedido->estatuspedido=="AGENDADA"){echo $modalDevolver;}
ActiveForm::end();
?>

<script>
      var estado='';
        function cambiarEstado(mensaje) {
            //console.log("Cambiar estado: "+estado);

            $('#estado').val(estado);
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
                        notificacion(data.mensaje,data.tipo);
                        //$this.data().isSubmitted = true;
                        //$('#frmDatos')[0].reset();
                        location.reload();
                        return true;
                    }else{
                        notificacion(data.mensaje,data.tipo);
                    }
                }
            });

        }
        $('#frmDatos').on('submit', function(e){
            e.preventDefault(); // <=================== Here
            $this = $(this);
            if ($this.data().isSubmitted) {
                return false;
            }
        });
  </script>
<style>
    input[type=number]::-webkit-inner-spin-button,
input[type=number]::-webkit-outer-spin-button {
  -webkit-appearance: none;
  margin: 0;
}
input[type=number] { -moz-appearance:textfield; }
</style>