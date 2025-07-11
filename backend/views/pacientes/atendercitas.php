<?php
use backend\components\Globaldata;
use backend\components\Objetos;
use backend\components\Bloques;
use backend\components\Botones;
use backend\components\Iconos;
use backend\components\Contenido;
use backend\components\Navs;
use common\models\Consultamedicadet;
use common\models\Consultamedicadiag;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\widgets\ActiveForm;
/* @var $this yii\web\View */

$this->title = "Cita Médica";
$this->params['breadcrumbs'][] = ['label' => 'Paciente', 'url' => ['historiaclinica']];
$this->params['breadcrumbs'][] = $this->title;
$urlpost='formatendercita';
?>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<?php

$nav= new Navs;
$objeto= new Objetos;
$div= new Bloques;
$globaldata= new Globaldata;
$edad= $globaldata->getEdad($paciente->fechanac);

 $botones= new Botones; $botonC=$botones->getBotongridArray(
    array(
        array('tipo'=>'separador','clase'=>'', 'estilo'=>'', 'color'=>''),
        array('tipo'=>'link','nombre'=>'guardar', 'id' => 'guardar', 'titulo'=>'&nbsp;Guardar', 'link'=>'', 'onclick'=>'' , 'clase'=>'', 'style'=>'', 'col'=>'', 'tipocolor'=>'verde', 'icono'=>'guardar','tamanio'=>'pequeño',  'adicional'=>''),
        array('tipo'=>'link','nombre'=>'regresar', 'id' => 'guardar', 'titulo'=>'&nbsp;Regresar', 'link'=>'', 'onclick'=>'history.back()' , 'clase'=>'', 'style'=>'', 'col'=>'', 'tipocolor'=>'azul', 'icono'=>'regresar','tamanio'=>'pequeño',  'adicional'=>'')

    ));


$contenidoClass= new contenido;
$contenido=$contenidoClass->getContenidoArrayr(
        array(
            //array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'ID:','contenido'=>$paciente->id,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'idhistoriac', 'id' => 'idhistoriac', 'titulo'=>'H. Clínica:','contenido'=>$paciente->id,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'separador','clase'=>'', 'estilo'=>'', 'color'=>''),
            array('tipo'=>'div','nombre'=>'nombres', 'id' => 'nombres', 'titulo'=>'Nombres:','contenido'=>$paciente->apellidos.' '.$paciente->nombres, 'col'=>'col-12 col-md-12','clase'=>'', 'style'=>'', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'direccion', 'id' => 'direccion', 'titulo'=>'Dirección:','contenido'=>$paciente->direccion, 'col'=>'col-12 col-md-12','clase'=>'', 'style'=>'', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'correo', 'id' => 'correo', 'titulo'=>'Correo:','contenido'=>$paciente->correo, 'col'=>'col-12 col-md-12','clase'=>'', 'style'=>'', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'telefono', 'id' => 'telefono', 'titulo'=>'Teléfono:','contenido'=>$paciente->telefono, 'col'=>'col-12 col-md-12','clase'=>'', 'style'=>'', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'edad', 'id' => 'edad', 'titulo'=>'Edad:','contenido'=>$edad, 'col'=>'col-12 col-md-12','clase'=>'', 'style'=>'', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'tiposangre', 'id' => 'tiposangre', 'titulo'=>'Tipo Sangre:','contenido'=>$paciente->tiposangre, 'col'=>'col-12 col-md-12','clase'=>'', 'style'=>'', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'separador','clase'=>'', 'estilo'=>'', 'color'=>''),
            array('tipo'=>'div','nombre'=>'alerta', 'id' => 'alerta', 'titulo'=>'Alerta:','contenido'=>$paciente->alerta, 'col'=>'col-12 col-md-12','clase'=>'', 'style'=>'', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),

        )
    );


//$contenidoRoles=$objeto->getObjetosArray($dataSubF,true);
$tabconsultas=array();
$configtab=array('tipo'=>'config','nombre'=>'tabpermisos', 'id'=>'tabpermisos', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Nombre','leyenda'=>'Nombre del rol ', 'col'=>'col-12 col-md-6', 'adicional'=>'');
array_push($tabconsultas, $configtab);
foreach ($consultastotal as $key => $value) {
    //$contenidoConsulta=$fichamedica->id;
    $fichamedica=Consultamedicadet::find()->where(["idconsulta"=>$value->id])->one();
    $tabfichav=array();
    $tabimagenes=array();
    $tabdiagnostico=array();
    $configtab2=array('tipo'=>'config','nombre'=>'tabfichav'.$fichamedica->id, 'id'=>'tabfichav'.$fichamedica->id, 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Nombre','leyenda'=>'Nombre del rol ', 'col'=>'col-12 col-md-6', 'adicional'=>'');
    $configtab3=array('tipo'=>'config','nombre'=>'tabimagenes'.$fichamedica->id, 'id'=>'tabimagenes'.$fichamedica->id, 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Nombre','leyenda'=>'Nombre del rol ', 'col'=>'col-12 col-md-6', 'adicional'=>'');
    $configtab4=array('tipo'=>'config','nombre'=>'tabdiagnostico'.$fichamedica->id, 'id'=>'tabdiagnostico'.$fichamedica->id, 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Nombre','leyenda'=>'Nombre del rol ', 'col'=>'col-12 col-md-6', 'adicional'=>'');
    array_push($tabfichav, $configtab2);
    array_push($tabimagenes, $configtab3);
    array_push($tabdiagnostico, $configtab4);

    $lentes= ($fichamedica->usolentes=='on')? 'SI' : 'NO' ;
    $contenidoConsulta=$contenidoClass->getContenidoArrayr(
        array(
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'Motivo de consulta:','contenido'=>$fichamedica->causaconsulta,'clase'=>'', 'style'=>'', 'col'=>'col-12 col-md-12', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'Usa Lentes:','contenido'=>$lentes,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'separador','clase'=>'', 'estilo'=>'', 'color'=>''),
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
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'DP:','contenido'=>$fichamedica->visionlcotr,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'separador','clase'=>'', 'estilo'=>'', 'color'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'PIO OD:','contenido'=>$fichamedica->pioscod,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'PIO OD2:','contenido'=>$fichamedica->piocod,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'PIO OI:','contenido'=>$fichamedica->pioscoi,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'PIO OI2:','contenido'=>$fichamedica->piocoi,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'separador','clase'=>'', 'estilo'=>'', 'color'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'BIOMICROSCOPÍA:','contenido'=>$fichamedica->biomicroscopia,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'ESTERIOPSIS:','contenido'=>$fichamedica->esteriopsis,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'VISIÓN DE COL.:','contenido'=>$fichamedica->visiondecolores,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'VISIÓN DE PROF.:','contenido'=>$fichamedica->visionprofundidad,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'REFLEJOS PUPILARES:','contenido'=>$fichamedica->reflejospup,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'CAMPO VISUAL:','contenido'=>$fichamedica->campovisual,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'FON. OJO OD:','contenido'=>$fichamedica->fondoojood,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'FON. OJO OI:','contenido'=>$fichamedica->fondoojooi,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'AGUJERO ESTEN.:','contenido'=>$fichamedica->agujeroest,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'EXÁMENES:','contenido'=>$fichamedica->examenes,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'IMP. DIAGNÓSTICA:','contenido'=>$fichamedica->impdiag1,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'CIE 10:','contenido'=>$fichamedica->cie1001,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'IMP. DIAGNÓSTICA:','contenido'=>$fichamedica->impdiag2,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'CIE 10:','contenido'=>$fichamedica->cie1002,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'IMP. DIAGNÓSTICA:','contenido'=>$fichamedica->impdiag3,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'CIE 10:','contenido'=>$fichamedica->cie1003,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
        )
    );
    $contenidoInfo=$contenidoClass->getContenidoArrayr(
        array(
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'CAMPIM:','contenido'=>$fichamedica->campim,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'OCT. ANGULAR:','contenido'=>$fichamedica->octangular,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'OCT. M.:','contenido'=>$fichamedica->octm,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'OCT. N.:','contenido'=>$fichamedica->octn,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'EXCAVACION NERVIO:','contenido'=>$fichamedica->excavacion,'clase'=>'', 'style'=>'', 'col'=>'col-12 col-md-12', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'BIOMET. OD:','contenido'=>$fichamedica->biood,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'BIOMET. ID:','contenido'=>$fichamedica->bioid,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'PAQUIM OD:','contenido'=>$fichamedica->paquimod,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'PAQUIM ID:','contenido'=>$fichamedica->paquimid,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'ORA:','contenido'=>$fichamedica->ora,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'TOPOGRAFÍA:','contenido'=>$fichamedica->topografia,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'ANGIOG:','contenido'=>$fichamedica->angiog,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'ECOGRA:','contenido'=>$fichamedica->ecogra,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'ENDOTE:','contenido'=>$fichamedica->endote,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'UBM:','contenido'=>$fichamedica->ubm,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'RETINOGRAFÍA:','contenido'=>$fichamedica->retinografia,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'separador','clase'=>'', 'estilo'=>'', 'color'=>''),
        )
    );

    $contenidoImagenes=$contenidoClass->getContenidoArrayr(
        array(
            //array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'ID:','contenido'=>$paciente->id,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'image','nombre'=>'img-1', 'id' => 'img-1', 'src'=>$fichamedica->img1,'clase'=>'pb-3 pr-3', 'style'=>'border: 1px dashed #c6c6c6;', 'col'=>'col-12 col-md-4',  'etiqueta'=>' IMAGEN 1' ,  'adicional'=>''),
            array('tipo'=>'image','nombre'=>'img-2', 'id' => 'img-2', 'src'=>$fichamedica->img2,'clase'=>'pb-3 pr-3', 'style'=>'border: 1px dashed #c6c6c6;', 'col'=>'col-12 col-md-4',  'etiqueta'=>' IMAGEN 2' ,  'adicional'=>''),
            array('tipo'=>'image','nombre'=>'img-3', 'id' => 'img-3', 'src'=>$fichamedica->img3,'clase'=>'pb-3 pr-3', 'style'=>'border: 1px dashed #c6c6c6;', 'col'=>'col-12 col-md-4',  'etiqueta'=>' IMAGEN 3' ,  'adicional'=>''),
            array('tipo'=>'image','nombre'=>'img-4', 'id' => 'img-4', 'src'=>$fichamedica->img4,'clase'=>'pb-3 pr-3', 'style'=>'border: 1px dashed #c6c6c6;', 'col'=>'col-12 col-md-4',  'etiqueta'=>' IMAGEN 4' ,  'adicional'=>''),
            array('tipo'=>'image','nombre'=>'img-5', 'id' => 'img-5', 'src'=>$fichamedica->img5,'clase'=>'pb-3 pr-3', 'style'=>'border: 1px dashed #c6c6c6;', 'col'=>'col-12 col-md-4',  'etiqueta'=>' IMAGEN 5' ,  'adicional'=>''),
        )
    );
    //$obj['subtipo'],$obj['nombre'], $obj['id'], $obj['src'], $obj['onchange'], $obj['clase'], $obj['estilo'],$obj['etiqueta'], $obj['col'], $obj['adicional']


    $diagnosticomedico=Consultamedicadiag::find()->where(["idconsulta"=>$value->id])->one();
    $contenidoDiagnostico=$contenidoClass->getContenidoArrayr(
        array(
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'PLAN:','contenido'=>$diagnosticomedico->plan,'clase'=>'', 'style'=>'', 'col'=>'col-12 col-md-12', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'MEDICAMENTO:','contenido'=>$diagnosticomedico->med1,'clase'=>'', 'style'=>'', 'col'=>'col-12 col-md-12', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'PRESCRIPCIÓN:','contenido'=>$diagnosticomedico->presc1,'clase'=>'', 'style'=>'', 'col'=>'col-12 col-md-12', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'separador','clase'=>'', 'estilo'=>'', 'color'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'MEDICAMENTO:','contenido'=>$diagnosticomedico->med2,'clase'=>'', 'style'=>'', 'col'=>'col-12 col-md-12', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'PRESCRIPCIÓN:','contenido'=>$diagnosticomedico->presc2,'clase'=>'', 'style'=>'', 'col'=>'col-12 col-md-12', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'separador','clase'=>'', 'estilo'=>'', 'color'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'MEDICAMENTO:','contenido'=>$diagnosticomedico->med3,'clase'=>'', 'style'=>'', 'col'=>'col-12 col-md-12', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'PRESCRIPCIÓN:','contenido'=>$diagnosticomedico->presc3,'clase'=>'', 'style'=>'', 'col'=>'col-12 col-md-12', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'separador','clase'=>'', 'estilo'=>'', 'color'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'MEDICAMENTO:','contenido'=>$diagnosticomedico->med4,'clase'=>'', 'style'=>'', 'col'=>'col-12 col-md-12', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'PRESCRIPCIÓN:','contenido'=>$diagnosticomedico->presc4,'clase'=>'', 'style'=>'', 'col'=>'col-12 col-md-12', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'separador','clase'=>'', 'estilo'=>'', 'color'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'MEDICAMENTO:','contenido'=>$diagnosticomedico->med5,'clase'=>'', 'style'=>'', 'col'=>'col-12 col-md-12', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'PRESCRIPCIÓN:','contenido'=>$diagnosticomedico->presc5,'clase'=>'', 'style'=>'', 'col'=>'col-12 col-md-12', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'separador','clase'=>'', 'estilo'=>'', 'color'=>''),
        )
    );


    $contenidotabH=$nav->getNavsarray(
        array(
            array('tipo'=>'config','nombre'=>'tabcontenido-'.$value->id, 'id'=>'tabcontenido'.$value->id, 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Nombre','leyenda'=>'Nombre del rol ', 'col'=>'col-12 col-md-6', 'adicional'=>''),
            array('tipo'=>'tab','nombre'=>'tabant-'.$value->id, 'id'=>'tabant-'.$value->id, 'titulo'=>'Ficha Visual', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Nombre','leyenda'=>'Nombre del rol ', 'col'=>'col-12 col-md-6', 'adicional'=>'', 'contenido'=>$contenidoConsulta),
            array('tipo'=>'tab','nombre'=>'tabinfo-'.$value->id, 'id'=>'tabinfo-'.$value->id, 'titulo'=>'Información', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Nombre','leyenda'=>'Nombre del rol ', 'col'=>'col-12 col-md-6', 'adicional'=>'', 'contenido'=>$contenidoInfo),
            array('tipo'=>'tab','nombre'=>'tabimagenes-'.$value->id, 'id'=>'tabimagenes-'.$value->id, 'titulo'=>'Imágenes', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Nombre','leyenda'=>'Nombre del rol ', 'col'=>'col-12 col-md-6', 'adicional'=>'', 'contenido'=>$contenidoImagenes),
            array('tipo'=>'tab','nombre'=>'tabdiagnostico-'.$value->id, 'id'=>'tabdiagnostico-'.$value->id, 'titulo'=>'Diagnóstico', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Nombre','leyenda'=>'Nombre del rol ', 'col'=>'col-12 col-md-6', 'adicional'=>'', 'contenido'=>$contenidoDiagnostico),
        )
    );
    array_push($tabconsultas,array('tipo'=>'tab','nombre'=>'tabconsulta-'.$value->id, 'id'=>'tabconsulta-'.$value->id, 'titulo'=>$value->fechacita, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Nombre','leyenda'=>'Nombre del rol ', 'col'=>'col-12 col-md-6', 'adicional'=>'', 'contenido'=>$contenidotabH));


}

$contenidotabH=$nav->getNavsarray($tabconsultas);

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

    array_push($tabconsultas,array('tipo'=>'tab','nombre'=>'tab-'.$value->id, 'id'=>'tab-'.$value->id, 'titulo'=>$value->fechacita, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Nombre','leyenda'=>'Nombre del rol ', 'col'=>'col-12 col-md-6', 'adicional'=>'', 'contenido'=>$contenidoConsulta));
}

$contenidotab=$nav->getNavsarray($tabconsultas);

 $tabla='';

 $contenidoant=$objeto->getObjetosArray(
    array(
        array('tipo'=>'input','subtipo'=>'textarea', 'nombre'=>'antecedentesp', 'id'=>'antecedentesp', 'valor'=>$paciente->antecedentesp, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Antecedentes Personales: ', 'col'=>'col-12 col-md-12', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'textarea', 'nombre'=>'antecedenteso', 'id'=>'antecedenteso', 'valor'=>$paciente->antecedenteso , 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Antecedentes Oculares: ', 'col'=>'col-12 col-md-12', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'textarea', 'nombre'=>'antecedentesf', 'id'=>'antecedentesf', 'valor'=>$paciente->antecedentesf , 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Antecedentes Familiares: ', 'col'=>'col-12 col-md-12', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'textarea', 'nombre'=>'enfermedada', 'id'=>'enfermedada', 'valor'=>$paciente->enfermedada , 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Enfermedad Actual: ', 'col'=>'col-12 col-md-12', 'adicional'=>''),
    ),true
);

$contenidoHC=$objeto->getObjetosArray(
    array(
        array('tipo'=>'input','subtipo'=>'oculto', 'nombre'=>'idpaciente', 'id'=>'idpaciente', 'valor'=>$paciente->id, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false, 'col'=>'col-3 col-md-3', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'oculto', 'nombre'=>'idcita', 'id'=>'idcita', 'valor'=>$idcita, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false, 'col'=>'col-3 col-md-3', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'oculto', 'nombre'=>'iddoctor', 'id'=>'iddoctor', 'valor'=>$idcita, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false, 'col'=>'col-3 col-md-3', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'oculto', 'nombre'=>'idoptometrista', 'id'=>'idoptometrista', 'valor'=>$idcita, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false, 'col'=>'col-3 col-md-3', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'textarea', 'nombre'=>'motivo', 'id'=>'motivo', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Motivo de la consulta: ', 'col'=>'col-12 col-md-9', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'onoff', 'nombre'=>'usolentes', 'id'=>'usolentes', 'valordefecto'=>$checked, 'textoon'=>'Sí', 'textooff'=>'No', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Uso de lentes: ', 'col'=>'col-3 col-md-3', 'adicional'=>''),
        array('tipo'=>'div','nombre'=>'vc', 'id' => 'vc', 'titulo'=>'Visión Cerca: ','contenido'=>'','clase'=>'', 'style'=>'background: rgba(129,224,145,.3); margin-bottom:5px;', 'col'=>'col-12 col-md-12', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'visioncercascod', 'id'=>'visioncercascod', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'C. S/C OD: ', 'col'=>'col-6 col-md-4', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'visioncercascoi', 'id'=>'visioncercascoi', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'C. S/C OI: ', 'col'=>'col-6 col-md-4', 'adicional'=>''),
        array('tipo'=>'box','col'=>'col-5 col-md-4', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'visioncercaccod', 'id'=>'visioncercaccod', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'CC. OD: ', 'col'=>'col-6 col-md-4', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'visioncercaccoi', 'id'=>'visioncercaccoi', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'CC. OI: ', 'col'=>'col-6 col-md-4', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'visioncercaotr', 'id'=>'visioncercaotr', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'CC OTROS: ', 'col'=>'col-6 col-md-4', 'adicional'=>''),

        array('tipo'=>'div','nombre'=>'vl', 'id' => 'vl', 'titulo'=>'Visión Lejos: ','contenido'=>'','clase'=>'', 'style'=>'background: rgba(129,224,145,.3); margin-bottom:5px;', 'col'=>'col-12 col-md-12', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'visionlejosscod', 'id'=>'visionlejosscod', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'L. S/C OD: ', 'col'=>'col-6 col-md-4', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'visionlejosscoi', 'id'=>'visionlejosscoi', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'L. S/C OI: ', 'col'=>'col-6 col-md-4', 'adicional'=>''),
        array('tipo'=>'box','col'=>'col-5 col-md-4', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'visionlejosccod', 'id'=>'visionlejosccod', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'LC. OD: ', 'col'=>'col-6 col-md-4', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'visionlejosccoi', 'id'=>'visionlejosccoi', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'LC. OI: ', 'col'=>'col-6 col-md-4', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'visionlejosotr', 'id'=>'visionlejosotr', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'DP: ', 'col'=>'col-6 col-md-4', 'adicional'=>''),

        array('tipo'=>'div','nombre'=>'pioin', 'id' => 'pioin', 'titulo'=>'PIO: ','contenido'=>'','clase'=>'', 'style'=>'background: rgba(129,224,145,.3); margin-bottom:5px;', 'col'=>'col-12 col-md-12', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'pioscod', 'id'=>'pioscod', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'OD: ', 'col'=>'col-6 col-md-6', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'piocod', 'id'=>'piocod', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'OD2: ', 'col'=>'col-6 col-md-6', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'pioscoi', 'id'=>'pioscoi', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'OI: ', 'col'=>'col-6 col-md-6', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'piocoi', 'id'=>'piocoi', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'OI2: ', 'col'=>'col-6 col-md-6', 'adicional'=>''),
      //  array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'piocotr', 'id'=>'piocotr', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'PIO C OTR: ', 'col'=>'col-6 col-md-3', 'adicional'=>''),

        array('tipo'=>'div','nombre'=>'vl', 'id' => 'vl', 'titulo'=>'','contenido'=>'','clase'=>'', 'style'=>'background: rgba(129,224,145,.3); margin-bottom:5px;', 'col'=>'col-12 col-md-12', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'microboscopia', 'id'=>'microboscopia', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Biomicroscopía: ', 'col'=>'col-12 col-md-6', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'esteriopsis', 'id'=>'esteriopsis', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Esteriopsis: ', 'col'=>'col-12 col-md-6', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'visioncolores', 'id'=>'visioncolores', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Visión de colores: ', 'col'=>'col-12 col-md-6', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'visionprof', 'id'=>'visionprof', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Visión de profundidad: ', 'col'=>'col-12 col-md-6', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'refloejospupi', 'id'=>'refloejospupi', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Reflejos pupilares: ', 'col'=>'col-12 col-md-6', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'fondoojood', 'id'=>'fondoojood', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Fon. OJO OD: ', 'col'=>'col-6 col-md-6', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'fondoojooi', 'id'=>'fondoojooi', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Fon. OJO OI: ', 'col'=>'col-6 col-md-6', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'campovisual', 'id'=>'campovisual', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Campo visual: ', 'col'=>'col-12 col-md-6', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'agujeroest', 'id'=>'agujeroest', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Agujero estenopeico: ', 'col'=>'col-12 col-md-6', 'adicional'=>''),
        array('tipo'=>'separador','clase'=>'', 'estilo'=>'', 'color'=>''),
        array('tipo'=>'input','subtipo'=>'textarea', 'nombre'=>'examenes', 'id'=>'examenes', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Exámenes: ', 'col'=>'col-12 col-md-12', 'adicional'=>''),
        array('tipo'=>'separador','clase'=>'', 'estilo'=>'', 'color'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'impresion1', 'id'=>'impresion1', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Impresión Diagnóstica: ', 'col'=>'col-12 col-md-8', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'cie1', 'id'=>'cie1', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'CIE 10: ', 'col'=>'col-12 col-md-4', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'impresion2', 'id'=>'impresion2', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Impresión Diagnóstica 2: ', 'col'=>'col-12 col-md-8', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'cie2', 'id'=>'cie2', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'CIE 10: ', 'col'=>'col-12 col-md-4', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'impresion3', 'id'=>'impresion3', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Impresión Diagnóstica 3: ', 'col'=>'col-12 col-md-8', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'cie3', 'id'=>'cie3', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'CIE 10: ', 'col'=>'col-12 col-md-4', 'adicional'=>''),

    ),true
);
$contenidoN1=$objeto->getObjetosArray(
    array(
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'camping', 'id'=>'camping', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Campim: ', 'col'=>'col-12 col-md-6', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'octangular', 'id'=>'octangular', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Oct. Angular: ', 'col'=>'col-12 col-md-6', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'octm', 'id'=>'octm', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Oct. M.: ', 'col'=>'col-12 col-md-6', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'octn', 'id'=>'octn', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Oct. N.: ', 'col'=>'col-12 col-md-6', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'excavacion', 'id'=>'excavacion', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Excavación Nervio: ', 'col'=>'col-12 col-md-12', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'biometod', 'id'=>'biometod', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Biomet. OD: ', 'col'=>'col-12 col-md-6', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'biometoi', 'id'=>'biometoi', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Biomet. OI: ', 'col'=>'col-6 col-md-6', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'paquimod', 'id'=>'paquimod', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Paquim. OD: ', 'col'=>'col-6 col-md-6', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'paquimoi', 'id'=>'paquimoi', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Paquim. OI: ', 'col'=>'col-6 col-md-6', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'ora', 'id'=>'ora', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'ORA: ', 'col'=>'col-6 col-md-6', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'topografia', 'id'=>'topografia', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Topografía: ', 'col'=>'col-12 col-md-6', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'angioog', 'id'=>'angioog', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Angiog: ', 'col'=>'col-12 col-md-6', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'ecogra', 'id'=>'ecogra', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Ecogra: ', 'col'=>'col-12 col-md-6', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'endote', 'id'=>'endote', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Endote: ', 'col'=>'col-12 col-md-6', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'ubm', 'id'=>'ubm', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'UBM: ', 'col'=>'col-12 col-md-6', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'retinografia', 'id'=>'retinografia', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Retinografía: ', 'col'=>'col-12 col-md-6', 'adicional'=>''),
           ),true
);

$contenidoN2=$objeto->getObjetosArray(
    array(
        array('tipo'=>'input','subtipo'=>'archivo', 'nombre'=>'img1', 'id'=>'img1', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Imagen 1: ', 'col'=>'col-12 col-md-12', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'archivo', 'nombre'=>'img2', 'id'=>'img2', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Imagen 2: ', 'col'=>'col-12 col-md-12', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'archivo', 'nombre'=>'img3', 'id'=>'img3', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Imagen 3: ', 'col'=>'col-12 col-md-12', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'archivo', 'nombre'=>'img4', 'id'=>'img4', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Imagen 4: ', 'col'=>'col-12 col-md-12', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'archivo', 'nombre'=>'img5', 'id'=>'img5', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Imagen 5: ', 'col'=>'col-12 col-md-12', 'adicional'=>''),
    ),true
);
$botonModal = '
<div class="container text-center">
    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#miModal">
        Ver
    </button>
</div>';
$contenidotab=$nav->getNavsarray(
    array(
        array('tipo'=>'config','nombre'=>'tabpermisos', 'id'=>'tabpermisos', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Nombre','leyenda'=>'', 'col'=>'col-12 col-md-6', 'adicional'=>''),
        array('tipo'=>'tab','nombre'=>'tabantecedentes', 'id'=>'tabantecedentes', 'titulo'=>'Antecedentes', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Nombre','leyenda'=>'Nombre del rol ', 'col'=>'col-12 col-md-6', 'adicional'=>'', 'contenido'=>$contenidoant),
        array('tipo'=>'tab','nombre'=>'tabficha', 'id'=>'tabficha', 'titulo'=>'Ficha Visual', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Nombre','leyenda'=>'', 'col'=>'col-12 col-md-6', 'adicional'=>'', 'contenido'=>$contenidoHC),
        array('tipo'=>'tab','nombre'=>'tabinfo', 'id'=>'tabinfo', 'titulo'=>'Información', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Nombre','leyenda'=>'', 'col'=>'col-12 col-md-6', 'adicional'=>'', 'contenido'=>$contenidoN1),
        array('tipo'=>'tab','nombre'=>'tabimagenes', 'id'=>'tabimagenes', 'titulo'=>'Imágenes', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Nombre','leyenda'=>'', 'col'=>'col-12 col-md-6', 'adicional'=>'', 'contenido'=>$contenidoN2),
    )
  );
$form = ActiveForm::begin(['id'=>'frmDatos']);
echo '<div class="row col-12">';
 echo $div->getBloqueNoRowArray(
    array(
        array('tipo'=>'bloquediv','nombre'=>'dvcontent','id'=>'dvcontent','titulo'=>'Ficha Médica','clase'=>'col-md-8 col-xs-8 ','style'=>'','col'=>'','tipocolor'=>'rojo','adicional'=>'','contenido'=>$contenidotab.$botonC),
        //array('tipo'=>'bloquediv','nombre'=>'dvcontent','id'=>'dvcontent','titulo'=>'Datos Paciente','clase'=>'col-md-4 col-xs-4 ','style'=>'','col'=>'','tipocolor'=>'','adicional'=>'','contenido'=>$contenido .),

        //array('tipo'=>'bloquediv','nombre'=>'dvcontent','id'=>'dvcontent','titulo'=>'Información','clase'=>'col-md-3 col-xs-12 ','style'=>'','col'=>'','tipocolor'=>'gris','adicional'=>'','contenido'=>$contenido2),
    )
);
echo '<div class="row col-lg-4 col-md-12 pr-0">';
echo $div->getBloqueNoRowArray(
    array(
        //array('tipo'=>'bloquediv','nombre'=>'dvcontent','id'=>'dvcontent','titulo'=>'Ficha Médica','clase'=>'col-md-8 col-xs-8 ','style'=>'','col'=>'','tipocolor'=>'rojo','adicional'=>'','contenido'=>$contenidotab.$botonC),
        array('tipo'=>'bloquediv','nombre'=>'dvcontent','id'=>'dvcontent','titulo'=>'Datos Paciente','clase'=>'col-md-12 col-xs-12 pr-0','style'=>'','col'=>'','tipocolor'=>'','adicional'=>'','contenido'=>$contenido),
        array('tipo'=>'bloquediv','nombre'=>'dvcontent','id'=>'dvcontent','titulo'=>'Historial Consultas','clase'=>'col-md-12 col-xs-12 pr-0','style'=>'','col'=>'','tipocolor'=>'verde','adicional'=>'','contenido'=>$botonModal),

        //array('tipo'=>'bloquediv','nombre'=>'dvcontent','id'=>'dvcontent','titulo'=>'Información','clase'=>'col-md-3 col-xs-12 ','style'=>'','col'=>'','tipocolor'=>'gris','adicional'=>'','contenido'=>$contenido2),
    )
);

echo '</div>';
echo '</div>';

ActiveForm::end();
//var_dump($objeto);
?>



<!-- Modal -->
<div class="modal fade" id="miModal" tabindex="-1" aria-labelledby="miModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="miModalLabel">Historial de Consultas</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar">x</button>
            </div>
            <div class="modal-body">
                <?= $contenidotabH  ?>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
            </div>
        </div>
    </div>
</div>

<script>


$(document).ready(function(){
$("#guardar").on('click', function() {
    if (validardatos()==true){
        //var form    = $('#frmDatos');
        var form = document.getElementById('frmDatos');
        var data = new FormData(form);
        var archivo=document.getElementById('img1').files;
        var archivo2=document.getElementById('img2').files;
        var archivo3=document.getElementById('img3').files;
        var archivo4=document.getElementById('img4').files;
        var archivo5=document.getElementById('img5').files;
        data.append('files',archivo);
        data.append('files',archivo2);
        data.append('files',archivo3);
        data.append('files',archivo4);
        data.append('files',archivo5);
        $.ajax({
            url: '<?= $urlpost ?>',
            async: 'false',
            cache: 'false',
            type: 'POST',
            enctype: 'multipart/form-data',
            //data: form.serialize(),
            dataType: 'text', //Get back from PHP
            processData: false, //Don't process the files
            contentType: false,
            cache: false,
            data: data,
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
    return true;
   //console.log("validardatos");
   /*if ($('#paciente').val()!=-1){
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
    }*/
}
</script>
