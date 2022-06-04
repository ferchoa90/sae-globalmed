<?php
use backend\components\Globaldata;

use common\models\Consultamedicadet;
use common\models\Consultamedicadiag;
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
$globaldata= new Globaldata;

$edad= $globaldata->getEdad($paciente->fechanac);

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
            array('tipo'=>'div','nombre'=>'tiposangre', 'id' => 'tiposangre', 'titulo'=>'Tipo Sangre:','contenido'=>$paciente->tiposangre, 'col'=>'col-9 col-md-6','clase'=>'', 'style'=>'', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'tiposangre', 'id' => 'tiposangre', 'titulo'=>'Edad:','contenido'=>$edad, 'col'=>'col-9 col-md-6','clase'=>'', 'style'=>'', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
        )
    );

    $contenidoAT=$contenidoClass->getContenidoArrayr(
        array(
            array('tipo'=>'div','nombre'=>'antecedentesp', 'id' => 'antecedentesp', 'titulo'=>'Antecedentes Personales:','contenido'=>$paciente->antecedentesp, 'col'=>'col-12 col-md-12','clase'=>'', 'style'=>'', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'antecedenteso', 'id' => 'antecedenteso', 'titulo'=>'Antecedentes Oculares:','contenido'=>$paciente->antecedenteso, 'col'=>'col-12 col-md-12','clase'=>'', 'style'=>'', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'antecedentesf', 'id' => 'antecedentesf', 'titulo'=>'Antecedentes Familiares:','contenido'=>$paciente->antecedentesf, 'col'=>'col-12 col-md-12','clase'=>'', 'style'=>'', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'enfermedadact', 'id' => 'enfermedadact', 'titulo'=>'Enfermdedad Actual:','contenido'=>$paciente->enfermedada, 'col'=>'col-12 col-md-12','clase'=>'', 'style'=>'', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
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
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'PIO OI:','contenido'=>$fichamedica->pioscoi,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'separador','clase'=>'', 'estilo'=>'', 'color'=>''),
            array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'BIOMICROSCOPÍA:','contenido'=>$fichamedica->biomicroscopia,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
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


    $contenidotab=$nav->getNavsarray(
        array(
            array('tipo'=>'config','nombre'=>'tabcontenido-'.$value->id, 'id'=>'tabcontenido'.$value->id, 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Nombre','leyenda'=>'Nombre del rol ', 'col'=>'col-12 col-md-6', 'adicional'=>''),
            array('tipo'=>'tab','nombre'=>'tabant-'.$value->id, 'id'=>'tabant-'.$value->id, 'titulo'=>'Ficha Visual', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Nombre','leyenda'=>'Nombre del rol ', 'col'=>'col-12 col-md-6', 'adicional'=>'', 'contenido'=>$contenidoConsulta),
            array('tipo'=>'tab','nombre'=>'tabinfo-'.$value->id, 'id'=>'tabinfo-'.$value->id, 'titulo'=>'Información', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Nombre','leyenda'=>'Nombre del rol ', 'col'=>'col-12 col-md-6', 'adicional'=>'', 'contenido'=>$contenidoInfo),
            array('tipo'=>'tab','nombre'=>'tabimagenes-'.$value->id, 'id'=>'tabimagenes-'.$value->id, 'titulo'=>'Imágenes', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Nombre','leyenda'=>'Nombre del rol ', 'col'=>'col-12 col-md-6', 'adicional'=>'', 'contenido'=>$contenidoImagenes),
            array('tipo'=>'tab','nombre'=>'tabdiagnostico-'.$value->id, 'id'=>'tabdiagnostico-'.$value->id, 'titulo'=>'Diagnóstico', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Nombre','leyenda'=>'Nombre del rol ', 'col'=>'col-12 col-md-6', 'adicional'=>'', 'contenido'=>$contenidoDiagnostico),
        )
      );
    array_push($tabconsultas,array('tipo'=>'tab','nombre'=>'tabconsulta-'.$value->id, 'id'=>'tabconsulta-'.$value->id, 'titulo'=>$value->fechacita, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Nombre','leyenda'=>'Nombre del rol ', 'col'=>'col-12 col-md-6', 'adicional'=>'', 'contenido'=>$contenidotab));


}

$contenidotab=$nav->getNavsarray($tabconsultas);

 $tabla='';

 echo $div->getBloqueArray(
    array(
        array('tipo'=>'bloquediv','nombre'=>'dvcontent','id'=>'dvcontent','titulo'=>'Datos Paciente','clase'=>'col-md-6 col-xs-12 ','style'=>'','col'=>'','tipocolor'=>'','adicional'=>'','contenido'=>$contenido.$botonC),
        array('tipo'=>'bloquediv','nombre'=>'dvcontent','id'=>'dvcontent','titulo'=>'Antecedentes Familiares','clase'=>'col-md-6 col-xs-12 ','style'=>'','col'=>'','tipocolor'=>'plomo','adicional'=>'','contenido'=>$contenidoAT),
        //array('tipo'=>'bloquediv','nombre'=>'dvcontent','id'=>'dvcontent','titulo'=>'Información','clase'=>'col-md-3 col-xs-12 ','style'=>'','col'=>'','tipocolor'=>'gris','adicional'=>'','contenido'=>$contenido2),
        array('tipo'=>'bloquediv','nombre'=>'dvcontent','id'=>'dvcontent','titulo'=>'Consultas','clase'=>'col-md-12 col-xs-12 ','style'=>'','col'=>'','tipocolor'=>'rojo','adicional'=>'','contenido'=>$contenidotab.$botonC),
    )
);

//var_dump($objeto);
?>

<!-- The Modal -->
<div id="myModal" class="modal">
  <img class="modal-content" id="img01">
</div>

<script>
    // Get the modal
var modal = document.getElementById('myModal');

// Get the image and insert it inside the modal - use its "alt" text as a caption
var img = document.getElementById('img-1');
var img2 = document.getElementById('img-2');
var img3 = document.getElementById('img-3');
var img4 = document.getElementById('img-4');
var img5 = document.getElementById('img-5');
var modalImg = document.getElementById("img01");
var captionText = document.getElementById("caption");

if (img){
    img.onclick = function(){
    modal.style.display = "block";
    modalImg.src = this.src;
    modalImg.alt = this.alt;
    captionText.innerHTML = this.alt;
    }
}

if (img2){
    img2.onclick = function(){
    modal.style.display = "block";
    modalImg.src = this.src;
    modalImg.alt = this.alt;
    captionText.innerHTML = this.alt;
    }
}

if (img3){
    img3.onclick = function(){
    modal.style.display = "block";
    modalImg.src = this.src;
    modalImg.alt = this.alt;
    captionText.innerHTML = this.alt;
    }
}

if (img4){
    img4.onclick = function(){
    modal.style.display = "block";
    modalImg.src = this.src;
    modalImg.alt = this.alt;
    captionText.innerHTML = this.alt;
    }
}

if (img5){
    img5.onclick = function(){
    modal.style.display = "block";
    modalImg.src = this.src;
    modalImg.alt = this.alt;
    captionText.innerHTML = this.alt;
    }
}




// When the user clicks on <span> (x), close the modal
modal.onclick = function() {
    img01.className += " out";
    setTimeout(function() {
       modal.style.display = "none";
       img01.className = "modal-content";
     }, 400);

 }
</script>