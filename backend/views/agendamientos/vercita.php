<?php
use backend\components\Objetos;
use backend\components\Bloques;
use backend\components\Botones;
use backend\components\Iconos;
use yii\helpers\Html;
use yii\helpers\Url;
/* @var $this yii\web\View */

$this->title = "Ver Cita";
$this->params['breadcrumbs'][] = ['label' => 'Citas médicas', 'url' => ['citas']];
$this->params['breadcrumbs'][] = $this->title;

$btnatendido=array();$btncancelar=array();$btnenatencion=array();$btnreagendar=array();$btnconfirmar=array();

$btnatendido=array('tipo'=>'link','nombre'=>'atendendida', 'id' => 'atendendida', 'titulo'=>'&nbsp;Atendendida', 'link'=>'', 'onclick'=>'cambiarEstado("ACEPTAR")' , 'clase'=>'', 'style'=>'', 'col'=>'', 'tipocolor'=>'plomo', 'icono'=>'aceptar','tamanio'=>'pequeño',  'adicional'=>'');
$btncancelar=array('tipo'=>'link','nombre'=>'cancelar', 'id' => 'cancelar', 'titulo'=>'&nbsp;Cancelar', 'link'=>'', 'onclick'=>'cambiarEstado("DEVOLVER")' , 'clase'=>'', 'style'=>'', 'col'=>'', 'tipocolor'=>'rojo', 'icono'=>'cancelar','tamanio'=>'pequeño',  'adicional'=>'');
$btnatender= array('tipo'=>'link','nombre'=>'atender', 'id' => 'atender', 'titulo'=>'&nbsp;En atención', 'link'=>'', 'onclick'=>'cambiarEstado("ACEPTAR")' , 'clase'=>'', 'style'=>'', 'col'=>'', 'tipocolor'=>'verde', 'icono'=>'aceptar','tamanio'=>'pequeño',  'adicional'=>'');
$btnreagendar=array('tipo'=>'link','nombre'=>'reagendar', 'id' => 'reagendar', 'titulo'=>'&nbsp;Reagendar', 'link'=>'', 'onclick'=>'cambiarEstado("ACEPTAR")' , 'clase'=>'', 'style'=>'', 'col'=>'', 'tipocolor'=>'naranja', 'icono'=>'aceptar','tamanio'=>'pequeño',  'adicional'=>'');
$btnconfirmar=array('tipo'=>'link','nombre'=>'confirmar', 'id' => 'confirmar', 'titulo'=>'&nbsp;Confirmar', 'link'=>'', 'onclick'=>'cambiarEstado("ACEPTAR")' , 'clase'=>'', 'style'=>'', 'col'=>'', 'tipocolor'=>'verde', 'icono'=>'aceptar','tamanio'=>'pequeño',  'adicional'=>'');

switch ($cita->estatuscita) {
    case 'AGENDADA':
        $stylestatuscit='badge-primary';
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



 echo $div->getBloqueArray(
    array(
        array('tipo'=>'bloquediv','nombre'=>'pedido','id'=>'pedido','titulo'=>'Detalle de la cita','clase'=>'col-md-9 col-xs-12 ','style'=>'','col'=>'','tipocolor'=>'','adicional'=>'','contenido'=>$contenido.$botonC),
        array('tipo'=>'bloquediv','nombre'=>'bloc1','id'=>'bloc1','titulo'=>'Información','clase'=>'col-md-3 col-xs-12 ','style'=>'','col'=>'','tipocolor'=>'gris','adicional'=>'','contenido'=>$contenido2),
    )
);

//var_dump($objeto);
?>
<script>
       $(document).ready(function(){
        //$("#frmDatos").find(':input').each(function() {
        // var elemento= this;
         //console.log("elemento.id="+ elemento.id + ", elemento.value=" + elemento.value);
        //});
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
                        $('#frmDatos')[0].reset();
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
           console.log("validardatos");
            if ($('#nombre').val()!=""){
                if ($('#icono').val()!=""){
                    if ($('#link').val()!=""){
                        if ($('#orden').val()!=""){
                            return true;                            
                        }else{
                            $('#orden').focus();
                            return false;
                        }
                    }else{
                        $('#link').focus();
                        return false;
                    }
                }else{
                    $('#icono').focus();
                    return false;
                }
            }else{
                $('#nombre').focus();
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

