<?php
use common\models\Consultamedicadet;
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
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'ID:','contenido'=>$paciente->id,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'idhistoriac', 'id' => 'idhistoriac', 'titulo'=>'H. Clínica:','contenido'=>$paciente->idhistorialc,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'separador','clase'=>'', 'estilo'=>'', 'color'=>''),
            array('tipo'=>'div','nombre'=>'nombres', 'id' => 'nombres', 'titulo'=>'Nombres:','contenido'=>$paciente->apellidos.' '.$paciente->nombres, 'col'=>'col-12 col-md-12','clase'=>'', 'style'=>'', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'tiposangre', 'id' => 'tiposangre', 'titulo'=>'Dirección:','contenido'=>$paciente->direccion, 'col'=>'col-12 col-md-12','clase'=>'', 'style'=>'', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'tiposangre', 'id' => 'tiposangre', 'titulo'=>'Correo:','contenido'=>$paciente->correo, 'col'=>'col-12 col-md-12','clase'=>'', 'style'=>'', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'tiposangre', 'id' => 'tiposangre', 'titulo'=>'Tipo Sangre:','contenido'=>$paciente->tiposangre, 'col'=>'col-9 col-md-3','clase'=>'', 'style'=>'', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
        )
    );
//var_dump($consultas);


if ($data->estatus=="ACTIVO"){ $stylestatus="badge-success"; }else{ $stylestatus="badge-secondary" ; }
$estatus='<span class="badge '.$stylestatus.'"><i class="fa fa-circle"></i>&nbsp;&nbsp;'.$data->estatus.'</span>';
$contenido2=$contenidoClass->getContenidoArrayr(
    array(
        array('tipo'=>'div','nombre'=>'nombre', 'id' => 'nombre', 'titulo'=>'Estatus:&nbsp;&nbsp;','contenido'=>$estatus, 'col'=>'col-12 col-md-9','clase'=>'', 'style'=>'', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
        array('tipo'=>'separador','clase'=>'', 'estilo'=>'', 'color'=>''),
        )
);

//$contenidoRoles=$objeto->getObjetosArray($dataSubF,true);
$tabconsultas=array();
$configtab=array('tipo'=>'config','nombre'=>'tabpermisos', 'id'=>'tabpermisos', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Nombre','leyenda'=>'Nombre del rol ', 'col'=>'col-12 col-md-6', 'adicional'=>'');
array_push($tabconsultas, $configtab);
foreach ($consultas as $key => $value) {
    //$contenidoConsulta=$fichamedica->id;
    $fichamedica=Consultamedicadet::find()->where(["idconsulta"=>$value->id])->one();

    $contenidoConsulta=$contenidoClass->getContenidoArrayr(
        array(
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'Visión Cerca SC. OD:','contenido'=>$fichamedica->visioncscod,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'Visión Cerca SC. OI:','contenido'=>$fichamedica->visioncosci,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'Visión Cerca CO. OD:','contenido'=>$fichamedica->visionccod,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'Visión Cerca CO. OI:','contenido'=>$fichamedica->visionccid,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'Visión Cerca OTR:','contenido'=>$fichamedica->visioncotr,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'separador','clase'=>'', 'estilo'=>'', 'color'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'Visión Lejos SC. OD:','contenido'=>$fichamedica->visionlscod,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'Visión Lejos SC. OI:','contenido'=>$fichamedica->visionlscoi,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'Visión Lejos CO. OD:','contenido'=>$fichamedica->visionlcod,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'Visión Lejos CO. OI:','contenido'=>$fichamedica->visionlcoi,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'Visión Lejos OTR:','contenido'=>$fichamedica->visionlcotr,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'separador','clase'=>'', 'estilo'=>'', 'color'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'PIO OD:','contenido'=>$fichamedica->pioscod,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'PIO OI:','contenido'=>$fichamedica->pioscoi,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'separador','clase'=>'', 'estilo'=>'', 'color'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'PIO OD:','contenido'=>$fichamedica->biomicroscopia,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'PIO OI:','contenido'=>$fichamedica->visiondecolores,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'PIO OI:','contenido'=>$fichamedica->visionprofundidad,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'PIO OI:','contenido'=>$fichamedica->reflejospup,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'PIO OI:','contenido'=>$fichamedica->campovisual,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'PIO OI:','contenido'=>$fichamedica->fondoojood,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'PIO OI:','contenido'=>$fichamedica->fondoojooi,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'PIO OI:','contenido'=>$fichamedica->agujeroest,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'PIO OI:','contenido'=>$fichamedica->examenes,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'PIO OI:','contenido'=>$fichamedica->impdiag1,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'PIO OI:','contenido'=>$fichamedica->impdiag2,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'PIO OI:','contenido'=>$fichamedica->impdiag3,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'PIO OI:','contenido'=>$fichamedica->cie1001,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'PIO OI:','contenido'=>$fichamedica->cie1002,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'PIO OI:','contenido'=>$fichamedica->cie1003,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'PIO OI:','contenido'=>$fichamedica->usolentes,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'separador','clase'=>'', 'estilo'=>'', 'color'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'PIO OI:','contenido'=>$fichamedica->campim,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'PIO OI:','contenido'=>$fichamedica->octangular,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'PIO OI:','contenido'=>$fichamedica->octm,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'PIO OI:','contenido'=>$fichamedica->octn,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'PIO OI:','contenido'=>$fichamedica->biood,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'PIO OI:','contenido'=>$fichamedica->bioid,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'PIO OI:','contenido'=>$fichamedica->paquimod,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'PIO OI:','contenido'=>$fichamedica->paquimid,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'PIO OI:','contenido'=>$fichamedica->ora,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'PIO OI:','contenido'=>$fichamedica->topografia,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'PIO OI:','contenido'=>$fichamedica->angiog,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'PIO OI:','contenido'=>$fichamedica->ecogra,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'PIO OI:','contenido'=>$fichamedica->endote,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'PIO OI:','contenido'=>$fichamedica->ubm,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'PIO OI:','contenido'=>$fichamedica->retinografia,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'separador','clase'=>'', 'estilo'=>'', 'color'=>''),



            )
    );

    array_push($tabconsultas,array('tipo'=>'tab','nombre'=>'tab-'.$value->id, 'id'=>'tab-'.$value->id, 'titulo'=>$value->fechacita, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Nombre','leyenda'=>'Nombre del rol ', 'col'=>'col-12 col-md-6', 'adicional'=>'', 'contenido'=>$contenidoConsulta));
}

$contenidotab=$nav->getNavsarray($tabconsultas);

 $tabla='';

 echo $div->getBloqueArray(
    array(
        array('tipo'=>'bloquediv','nombre'=>'dvcontent','id'=>'dvcontent','titulo'=>'Datos Paciente','clase'=>'col-md-5 col-xs-12 ','style'=>'','col'=>'','tipocolor'=>'','adicional'=>'','contenido'=>$contenido.$botonC),
        //array('tipo'=>'bloquediv','nombre'=>'dvcontent','id'=>'dvcontent','titulo'=>'Información','clase'=>'col-md-3 col-xs-12 ','style'=>'','col'=>'','tipocolor'=>'gris','adicional'=>'','contenido'=>$contenido2),
        array('tipo'=>'bloquediv','nombre'=>'dvcontent','id'=>'dvcontent','titulo'=>'Consultas','clase'=>'col-md-7 col-xs-12 ','style'=>'','col'=>'','tipocolor'=>'rojo','adicional'=>'','contenido'=>$contenidotab),
    )
);

//var_dump($objeto);
?>
