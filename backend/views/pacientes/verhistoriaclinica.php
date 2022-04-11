<?php
use backend\components\Objetos;
use backend\components\Bloques;
use backend\components\Botones;
use backend\components\Iconos;
use backend\components\Contenido;
use backend\components\Navs;
use yii\helpers\Html;
use yii\helpers\Url;
/* @var $this yii\web\View */

$this->title = "Ver historia clínica";
$this->params['breadcrumbs'][] = ['label' => 'Paciente', 'url' => ['historiaclinica']];
$this->params['breadcrumbs'][] = $this->title;

$nav= new Navs;
$objeto= new Objetos;
$div= new Bloques;

 $botones= new Botones; $botonC=$botones->getBotongridArray(
    array(
        array('tipo'=>'separador','clase'=>'', 'estilo'=>'', 'color'=>''),
        array('tipo'=>'link','nombre'=>'regresar', 'id' => 'guardar', 'titulo'=>'&nbsp;Regresar', 'link'=>'', 'onclick'=>'history.back()' , 'clase'=>'', 'style'=>'', 'col'=>'', 'tipocolor'=>'azul', 'icono'=>'regresar','tamanio'=>'pequeño',  'adicional'=>'')
));


$contenidoClass= new contenido;
$contenido=$contenidoClass->getContenidoArrayr(
        array(
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'ID:','contenido'=>$paciente->id,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-12', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'idhistoriac', 'id' => 'idhistoriac', 'titulo'=>'ID:','contenido'=>$paciente->idhistorialc,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-12', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'separador','clase'=>'', 'estilo'=>'', 'color'=>''),
            array('tipo'=>'div','nombre'=>'nombres', 'id' => 'nombres', 'titulo'=>'Nombres:','contenido'=>$paciente->apellidos.' '.$paciente->nombres, 'col'=>'col-12 col-md-9','clase'=>'', 'style'=>'', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'tiposangre', 'id' => 'tiposangre', 'titulo'=>'Dirección:','contenido'=>$paciente->direccion, 'col'=>'col-5 col-md-9','clase'=>'', 'style'=>'', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'tiposangre', 'id' => 'tiposangre', 'titulo'=>'Correo:','contenido'=>$paciente->correo, 'col'=>'col-5 col-md-9','clase'=>'', 'style'=>'', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'tiposangre', 'id' => 'tiposangre', 'titulo'=>'Tipo Sangre:','contenido'=>$paciente->tiposangre, 'col'=>'col-2 col-md-9','clase'=>'', 'style'=>'', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
        )
    );

/*
$contenido.='<div class="col-12 col-md-12"><hr style="color: #0056b2;"></div>';
$contenido.='<div class="col-12 col-md-12"><b>Antecedentes Personales:</b>&nbsp; '.$paciente->antecedentesp.'</span><br></div>';
$contenido.='<div class="col-12 col-md-12"><b>Antecedentes Oculares:</b>&nbsp; '.$paciente->antecedenteso.'</span><br></div>';
$contenido.='<div class="col-12 col-md-12"><b>Antecedentes Familiares:</b>&nbsp; '.$paciente->antecedentesf.'</span><br></div>';
$contenido.='<div class="col-12 col-md-12"><b>Enfermedad Actual:</b>&nbsp; '.$paciente->enfermedada.'</span><br></div>';
$contenido.='<div class="col-12 col-md-12"><hr style="color: #0056b2;"></div>';
$contenido.='<div class="col-12 col-md-6"><b>Contacto Emer.:</b>&nbsp; '.$paciente->nombresemer.'</span><br></div>';
$contenido.='<div class="col-12 col-md-6"><b>Direccion Emer.:</b>&nbsp; '.$paciente->direccionemer.'</span><br></div>';
$contenido.='<div class="col-12 col-md-6"><b>Teléfono Emer.:</b>&nbsp; '.$paciente->telefonoemer.'</span><br></div>';
$contenido.='<div class="col-12 col-md-12"><hr style="color: #0056b2;"></div>';
$contenido.='<div class="col-12 col-md-6"><b>Detalle Historia C.:</b>&nbsp; '.''.'</span><br></div>';
$contenido.='</div>';
*/
if ($data->estatus=="ACTIVO"){ $stylestatus="badge-success"; }else{ $stylestatus="badge-secondary" ; }
$estatus='<span class="badge '.$stylestatus.'"><i class="fa fa-circle"></i>&nbsp;&nbsp;'.$data->estatus.'</span>';
$contenido2=$contenidoClass->getContenidoArrayr(
    array(
        array('tipo'=>'div','nombre'=>'nombre', 'id' => 'nombre', 'titulo'=>'Estatus:&nbsp;&nbsp;','contenido'=>$estatus, 'col'=>'col-12 col-md-9','clase'=>'', 'style'=>'', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
        array('tipo'=>'separador','clase'=>'', 'estilo'=>'', 'color'=>''),
        )
);

//$contenidoRoles=$objeto->getObjetosArray($dataSubF,true);

$contenidotab=$nav->getNavsarray(
    array(
        array('tipo'=>'config','nombre'=>'tabpermisos', 'id'=>'tabpermisos', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Nombre','leyenda'=>'Nombre del rol ', 'col'=>'col-12 col-md-6', 'adicional'=>''),
        array('tipo'=>'tab','nombre'=>'tab-consulta', 'id'=>'tab-consulta', 'titulo'=>"Consulta", 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Nombre','leyenda'=>'Nombre del rol ', 'col'=>'col-12 col-md-6', 'adicional'=>'', 'contenido'=>$contenidoRoles),
    )
);

 $tabla='';

 echo $div->getBloqueArray(
    array(
        array('tipo'=>'bloquediv','nombre'=>'dvcontent','id'=>'dvcontent','titulo'=>'Datos Paciente','clase'=>'col-md-12 col-xs-12 ','style'=>'','col'=>'','tipocolor'=>'','adicional'=>'','contenido'=>$contenido.$botonC),
        //array('tipo'=>'bloquediv','nombre'=>'dvcontent','id'=>'dvcontent','titulo'=>'Información','clase'=>'col-md-3 col-xs-12 ','style'=>'','col'=>'','tipocolor'=>'gris','adicional'=>'','contenido'=>$contenido2),
        array('tipo'=>'bloquediv','nombre'=>'dvcontent','id'=>'dvcontent','titulo'=>'Consultas','clase'=>'col-md-12 col-xs-12 ','style'=>'','col'=>'','tipocolor'=>'rojo','adicional'=>'','contenido'=>$contenidotab),
    )
);

//var_dump($objeto);
?>
