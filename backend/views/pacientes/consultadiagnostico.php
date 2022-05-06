<?php
use backend\components\Globaldata;
use backend\components\Objetos;
use backend\components\Bloques;
use backend\components\Botones;
use backend\components\Iconos;
use backend\components\Contenido;
use backend\components\Navs;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\widgets\ActiveForm;
/* @var $this yii\web\View */

$this->title = "Cita Médica";
$this->params['breadcrumbs'][] = ['label' => 'Paciente', 'url' => ['historiaclinica']];
$this->params['breadcrumbs'][] = $this->title;
$urlpost='formdiagnosticoconsulta';


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
            array('tipo'=>'div','nombre'=>'edad', 'id' => 'edad', 'titulo'=>'Edad:','contenido'=>$edad, 'col'=>'col-12 col-md-12','clase'=>'', 'style'=>'', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
            array('tipo'=>'div','nombre'=>'tiposangre', 'id' => 'tiposangre', 'titulo'=>'Tipo Sangre:','contenido'=>$paciente->tiposangre, 'col'=>'col-12 col-md-12','clase'=>'', 'style'=>'', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
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

    array_push($tabconsultas,array('tipo'=>'tab','nombre'=>'tab-'.$value->id, 'id'=>'tab-'.$value->id, 'titulo'=>$value->fechacita, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Nombre','leyenda'=>'Nombre del rol ', 'col'=>'col-12 col-md-6', 'adicional'=>'', 'contenido'=>$contenidoConsulta));
}

$contenidotab=$nav->getNavsarray($tabconsultas);

 $tabla='';


$contenidoHC=$objeto->getObjetosArray(
    array(

        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'orbita', 'id'=>'orbita', 'valor'=>'','etiqueta'=>'Órbita: ', 'col'=>'col-12 col-md-4', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false, 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'globos', 'id'=>'globos', 'valor'=>'','etiqueta'=>'Globos: ', 'col'=>'col-12 col-md-4', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false, 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'lagrimales', 'id'=>'lagrimales', 'valor'=>'','etiqueta'=>'Lagrim: ', 'col'=>'col-12 col-md-4', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false, 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'escler', 'id'=>'escler', 'valor'=>'','etiqueta'=>'Escler: ', 'col'=>'col-12 col-md-4', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false, 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'conjunt', 'id'=>'conjunt', 'valor'=>'','etiqueta'=>'Conjunt: ', 'col'=>'col-12 col-md-4', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false, 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'limbo', 'id'=>'limbo', 'valor'=>'','etiqueta'=>'Limbo: ', 'col'=>'col-12 col-md-4', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false, 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'parpados', 'id'=>'parpados', 'valor'=>'','etiqueta'=>'Párpados: ', 'col'=>'col-12 col-md-4', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false, 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'camant', 'id'=>'camant', 'valor'=>'','etiqueta'=>'Cam. Ant.: ', 'col'=>'col-12 col-md-4', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false, 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'iris', 'id'=>'iris', 'valor'=>'','etiqueta'=>'Iris: ', 'col'=>'col-12 col-md-4', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false, 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'cornea', 'id'=>'cornea', 'valor'=>'','etiqueta'=>'Córnea: ', 'col'=>'col-12 col-md-4', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false, 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'presion', 'id'=>'presion', 'valor'=>'','etiqueta'=>'Presión: ', 'col'=>'col-12 col-md-4', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false, 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'piocc', 'id'=>'piocc', 'valor'=>'','etiqueta'=>'Pío CC: ', 'col'=>'col-12 col-md-4', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false, 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'reflejop', 'id'=>'reflejop', 'valor'=>'','etiqueta'=>'Refl. Pup.: ', 'col'=>'col-12 col-md-4', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false, 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'cristal', 'id'=>'cristal', 'valor'=>'','etiqueta'=>'Cristal: ', 'col'=>'col-12 col-md-4', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false, 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'midria', 'id'=>'midria', 'valor'=>'','etiqueta'=>'Midria: ', 'col'=>'col-12 col-md-4', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false, 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'obs1', 'id'=>'obs1', 'valor'=>'','etiqueta'=>'Observación: ', 'col'=>'col-12 col-md-12', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false, 'adicional'=>''),
        array('tipo'=>'separador','clase'=>'', 'estilo'=>'', 'color'=>''),

        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'metodo', 'id'=>'metodo', 'valor'=>'','etiqueta'=>'Método: ', 'col'=>'col-12 col-md-4', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false, 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'vitreo', 'id'=>'vitreo', 'valor'=>'','etiqueta'=>'Vitreo: ', 'col'=>'col-12 col-md-4', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false, 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'papila', 'id'=>'papila', 'valor'=>'','etiqueta'=>'Papila: ', 'col'=>'col-12 col-md-4', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false, 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'polpos', 'id'=>'polpos', 'valor'=>'','etiqueta'=>'Pol Post.: ', 'col'=>'col-12 col-md-4', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false, 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'macula', 'id'=>'macula', 'valor'=>'','etiqueta'=>'Macula: ', 'col'=>'col-12 col-md-4', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false, 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'ecuador', 'id'=>'ecuador', 'valor'=>'','etiqueta'=>'Ecuador: ', 'col'=>'col-12 col-md-4', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false, 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'vasos', 'id'=>'vasos', 'valor'=>'','etiqueta'=>'Vasos: ', 'col'=>'col-12 col-md-4', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false, 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'perif', 'id'=>'perif', 'valor'=>'','etiqueta'=>'Perif.: ', 'col'=>'col-12 col-md-4', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false, 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'nervioopt', 'id'=>'nervioopt', 'valor'=>'','etiqueta'=>'Nervio Opt.: ', 'col'=>'col-12 col-md-4', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false, 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'obs2', 'id'=>'obs2', 'valor'=>'','etiqueta'=>'Observación: ', 'col'=>'col-12 col-md-12', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false, 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'visioncol', 'id'=>'visioncol', 'valor'=>'','etiqueta'=>'Visión Colores: ', 'col'=>'col-12 col-md-4', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false, 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'esteriopsis', 'id'=>'esteriopsis', 'valor'=>'','etiqueta'=>'Esteriopsis: ', 'col'=>'col-12 col-md-4', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false, 'adicional'=>''),



    ),true
);

$contenidoDetalle=$objeto->getObjetosArray(
    array(
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'ordenatencion', 'id'=>'ordenatencion', 'valor'=>'','etiqueta'=>'Órden Atención: ', 'col'=>'col-12 col-md-4', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false, 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'yaglaser', 'id'=>'yaglaser', 'valor'=>'','etiqueta'=>'Yag Laser: ', 'col'=>'col-12 col-md-12', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false, 'adicional'=>''),
        array('tipo'=>'separador','clase'=>'', 'estilo'=>'', 'color'=>''),
    ),true
);
$contenidoDetalle.=$contenidoClass->getContenidoArrayr(
    array(
        array('tipo'=>'div','nombre'=>'item26', 'id' => 'item26', 'titulo'=>'SEGMENTO ANTERIOR','contenido'=>'','clase'=>'item26', 'style'=>'color:cadetblue;', 'col'=>'col-12 col-md-12', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),

    )
);
$contenidoDetalle.=$objeto->getObjetosArray(
    array(
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'odpotencia1', 'id'=>'odpotencia1', 'valor'=>'','etiqueta'=>'OD Potencia: ', 'col'=>'col-6 col-md-6', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false, 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'oddisparos1', 'id'=>'oddisparos1', 'valor'=>'','etiqueta'=>'OD Disparos: ', 'col'=>'col-6 col-md-6', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false, 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'oipotencia1', 'id'=>'oipotencia1', 'valor'=>'','etiqueta'=>'ID Potencia: ', 'col'=>'col-6 col-md-6', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false, 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'oidisparos1', 'id'=>'oidisparos1', 'valor'=>'','etiqueta'=>'ID Disparos: ', 'col'=>'col-6 col-md-6', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false, 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'complicaciones1', 'id'=>'complicaciones1', 'valor'=>'','etiqueta'=>'Complicaciones: ', 'col'=>'col-12 col-md-12', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false, 'adicional'=>''),
        array('tipo'=>'separador','clase'=>'', 'estilo'=>'', 'color'=>''),
    ),true
);
$contenidoDetalle.=$contenidoClass->getContenidoArrayr(
    array(
        array('tipo'=>'div','nombre'=>'item27', 'id' => 'item27', 'titulo'=>'SEGMENTO POSTERIOR','contenido'=>'','clase'=>'item27', 'style'=>'color:cadetblue;', 'col'=>'col-12 col-md-12', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),

    )
);
$contenidoDetalle.=$objeto->getObjetosArray(
    array(
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'odpotencia2', 'id'=>'odpotencia2', 'valor'=>'','etiqueta'=>'OD Potencia: ', 'col'=>'col-6 col-md-6', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false, 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'oddisparos2', 'id'=>'oddisparos2', 'valor'=>'','etiqueta'=>'OD Disparos: ', 'col'=>'col-6 col-md-6', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false, 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'oipotencia2', 'id'=>'oipotencia2', 'valor'=>'','etiqueta'=>'ID Potencia: ', 'col'=>'col-6 col-md-6', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false, 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'oidisparos2', 'id'=>'oidisparos2', 'valor'=>'','etiqueta'=>'ID Disparos: ', 'col'=>'col-6 col-md-6', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false, 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'complicaciones2', 'id'=>'complicaciones2', 'valor'=>'','etiqueta'=>'Complicaciones: ', 'col'=>'col-12 col-md-12', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false, 'adicional'=>''),
        array('tipo'=>'separador','clase'=>'', 'estilo'=>'', 'color'=>''),
    ),true
);

$contenidoDetalle.=$contenidoClass->getContenidoArrayr(
    array(
        array('tipo'=>'div','nombre'=>'item26', 'id' => 'item26', 'titulo'=>'LASER RETINAL','contenido'=>'','clase'=>'', 'style'=>'color:cadetblue;', 'col'=>'col-12 col-md-12', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),

    )
);
$contenidoDetalle.=$objeto->getObjetosArray(
    array(

        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'odtamano1', 'id'=>'odtamano1', 'valor'=>'','etiqueta'=>'OD Tamaño: ', 'col'=>'col-6 col-md-3', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false, 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'odtiempo1', 'id'=>'odtiempo1', 'valor'=>'','etiqueta'=>'OD Tiempo: ', 'col'=>'col-6 col-md-3', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false, 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'odnumero1', 'id'=>'odnumero1', 'valor'=>'','etiqueta'=>'OD Número: ', 'col'=>'col-6 col-md-3', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false, 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'odpoder1', 'id'=>'odpoder1', 'valor'=>'','etiqueta'=>'OD Poder: ', 'col'=>'col-6 col-md-3', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false, 'adicional'=>''),



        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'oitamano1', 'id'=>'oitamano1', 'valor'=>'','etiqueta'=>'OI Tamaño: ', 'col'=>'col-6 col-md-3', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false, 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'oitiempo1', 'id'=>'oitiempo1', 'valor'=>'','etiqueta'=>'OI Tiempo: ', 'col'=>'col-6 col-md-3', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false, 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'oinumero1', 'id'=>'oinumero1', 'valor'=>'','etiqueta'=>'OI Número: ', 'col'=>'col-6 col-md-3', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false, 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'oipoder1', 'id'=>'oipoder1', 'valor'=>'','etiqueta'=>'OI Poder: ', 'col'=>'col-6 col-md-3', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false, 'adicional'=>''),






    ),true
);


$contenidoN1=$objeto->getObjetosArray(
    array(
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'medicamento1', 'id'=>'medicamento1', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Medicamento: ', 'col'=>'col-6 col-md-4', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'mprescripciono1', 'id'=>'prescripcion1', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Prescripción: ', 'col'=>'col-6 col-md-8', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'medicamento2', 'id'=>'medicamento2', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Medicamento: ', 'col'=>'col-6 col-md-4', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'mprescripciono2', 'id'=>'prescripcion2', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Prescripción: ', 'col'=>'col-6 col-md-8', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'medicamento3', 'id'=>'medicamento3', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Medicamento: ', 'col'=>'col-6 col-md-4', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'mprescripciono3', 'id'=>'prescripcion3', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Prescripción: ', 'col'=>'col-6 col-md-8', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'medicamento4', 'id'=>'medicamento4', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Medicamento: ', 'col'=>'col-6 col-md-4', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'mprescripciono4', 'id'=>'prescripcion4', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Prescripción: ', 'col'=>'col-6 col-md-8', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'medicamento5', 'id'=>'medicamento5', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Medicamento: ', 'col'=>'col-6 col-md-4', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'mprescripciono5', 'id'=>'prescripcion5', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Prescripción: ', 'col'=>'col-6 col-md-8', 'adicional'=>''),
    ),true
);
$usolentes= ($consultamedicadet->id=="on")? 'SI' : 'NO' ;
$contenidoinfo=$contenidoClass->getContenidoArrayr(
    array(

        //array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'ID:','contenido'=>$paciente->id,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
        array('tipo'=>'div','nombre'=>'item1', 'id' => 'item1', 'titulo'=>'Uso de lentes:','contenido'=>$usolentes,'clase'=>'', 'style'=>'', 'col'=>'col-3 col-md-3', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
        array('tipo'=>'separador','clase'=>'', 'estilo'=>'', 'color'=>''),
        array('tipo'=>'div','nombre'=>'item0', 'id' => 'item0', 'titulo'=>'AGUDEZA VISUAL','contenido'=>'','clase'=>'', 'style'=>'', 'col'=>'col-12 col-md-12', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
        array('tipo'=>'div','nombre'=>'item2', 'id' => 'item2', 'titulo'=>'SIN C. OD:','contenido'=>$consultamedicadet->agudezavscod,'clase'=>'', 'style'=>'', 'col'=>'col-3 col-md-3', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
        array('tipo'=>'div','nombre'=>'item3', 'id' => 'item3', 'titulo'=>'SIN C. OI:','contenido'=>$consultamedicadet->agudezavscoi,'clase'=>'', 'style'=>'', 'col'=>'col-3 col-md-3', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
        array('tipo'=>'div','nombre'=>'item4', 'id' => 'item4', 'titulo'=>'CORREGIR OD:','contenido'=>$consultamedicadet->agudezavcod,'clase'=>'', 'style'=>'', 'col'=>'col-3 col-md-3', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
        array('tipo'=>'div','nombre'=>'item5', 'id' => 'item5', 'titulo'=>'CORREGIR OI:','contenido'=>$consultamedicadet->agudezavcoi,'clase'=>'', 'style'=>'', 'col'=>'col-3 col-md-3', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
        array('tipo'=>'div','nombre'=>'item6', 'id' => 'item6', 'titulo'=>'CORREGIR OTR:','contenido'=>$consultamedicadet->agudezavotr,'clase'=>'', 'style'=>'', 'col'=>'col-3 col-md-3', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
        array('tipo'=>'separador','clase'=>'', 'estilo'=>'', 'color'=>''),
        array('tipo'=>'div','nombre'=>'item7', 'id' => 'item7', 'titulo'=>'VISIÓN DE CERCA','contenido'=>'','clase'=>'', 'style'=>'', 'col'=>'col-12 col-md-12', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
        array('tipo'=>'div','nombre'=>'item8', 'id' => 'item8', 'titulo'=>'SIN C. OD:','contenido'=>$consultamedicadet->visioncscod,'clase'=>'', 'style'=>'', 'col'=>'col-3 col-md-3', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
        array('tipo'=>'div','nombre'=>'item9', 'id' => 'item9', 'titulo'=>'SIN C. OI:','contenido'=>$consultamedicadet->visioncosci,'clase'=>'', 'style'=>'', 'col'=>'col-3 col-md-3', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
        array('tipo'=>'div','nombre'=>'item10', 'id' => 'item10', 'titulo'=>'CORREGIR OD:','contenido'=>$consultamedicadet->visionccod,'clase'=>'', 'style'=>'', 'col'=>'col-3 col-md-3', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
        array('tipo'=>'div','nombre'=>'item11', 'id' => 'item11', 'titulo'=>'CORREGIR OI:','contenido'=>$consultamedicadet->visionccid,'clase'=>'', 'style'=>'', 'col'=>'col-3 col-md-3', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
        array('tipo'=>'div','nombre'=>'item12', 'id' => 'item12', 'titulo'=>'CORREGIR OTR:','contenido'=>$consultamedicadet->visioncotr,'clase'=>'', 'style'=>'', 'col'=>'col-3 col-md-3', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
        array('tipo'=>'separador','clase'=>'', 'estilo'=>'', 'color'=>''),
        array('tipo'=>'div','nombre'=>'item13', 'id' => 'item13', 'titulo'=>'VISIÓN DE LEJOS','contenido'=>'','clase'=>'', 'style'=>'', 'col'=>'col-12 col-md-12', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
        array('tipo'=>'div','nombre'=>'item14', 'id' => 'item14', 'titulo'=>'SIN C. OD:','contenido'=>$consultamedicadet->visionlscod,'clase'=>'', 'style'=>'', 'col'=>'col-3 col-md-3', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
        array('tipo'=>'div','nombre'=>'item15', 'id' => 'item15', 'titulo'=>'SIN C. OI:','contenido'=>$consultamedicadet->visionlscoi,'clase'=>'', 'style'=>'', 'col'=>'col-3 col-md-3', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
        array('tipo'=>'div','nombre'=>'item16', 'id' => 'item16', 'titulo'=>'CORREGIR OD:','contenido'=>$consultamedicadet->visionlcod,'clase'=>'', 'style'=>'', 'col'=>'col-3 col-md-3', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
        array('tipo'=>'div','nombre'=>'item17', 'id' => 'item17', 'titulo'=>'CORREGIR OI:','contenido'=>$consultamedicadet->visionlcoi,'clase'=>'', 'style'=>'', 'col'=>'col-3 col-md-3', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
        array('tipo'=>'div','nombre'=>'item18', 'id' => 'item18', 'titulo'=>'CORREGIR OTR:','contenido'=>$consultamedicadet->visionlcotr,'clase'=>'', 'style'=>'', 'col'=>'col-3 col-md-3', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
        array('tipo'=>'separador','clase'=>'', 'estilo'=>'', 'color'=>''),
        array('tipo'=>'div','nombre'=>'item27', 'id' => 'item27', 'titulo'=>'PIO','contenido'=>'','clase'=>'', 'style'=>'', 'col'=>'col-12 col-md-12', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
        array('tipo'=>'div','nombre'=>'item28', 'id' => 'item28', 'titulo'=>'SIN C. OD:','contenido'=>$consultamedicadet->pioscod,'clase'=>'', 'style'=>'', 'col'=>'col-3 col-md-3', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
        array('tipo'=>'div','nombre'=>'item29', 'id' => 'item29', 'titulo'=>'SIN C. OI:','contenido'=>$consultamedicadet->pioscoi,'clase'=>'', 'style'=>'', 'col'=>'col-3 col-md-3', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
        array('tipo'=>'div','nombre'=>'item30', 'id' => 'item30', 'titulo'=>'CORREGIR OD:','contenido'=>$consultamedicadet->piocod,'clase'=>'', 'style'=>'', 'col'=>'col-3 col-md-3', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
        array('tipo'=>'div','nombre'=>'item31', 'id' => 'item31', 'titulo'=>'CORREGIR OI:','contenido'=>$consultamedicadet->piocoi,'clase'=>'', 'style'=>'', 'col'=>'col-3 col-md-3', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
        array('tipo'=>'div','nombre'=>'item32', 'id' => 'item32', 'titulo'=>'CORREGIR OTR:','contenido'=>$consultamedicadet->piootr,'clase'=>'', 'style'=>'', 'col'=>'col-3 col-md-3', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),

        array('tipo'=>'separador','clase'=>'', 'estilo'=>'', 'color'=>''),
        array('tipo'=>'div','nombre'=>'item19', 'id' => 'item19', 'titulo'=>'BIOMICROSCOPIA:','contenido'=>$consultamedicadet->biomicroscopia,'clase'=>'', 'style'=>'', 'col'=>'col-12 col-md-12', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
        array('tipo'=>'div','nombre'=>'item20', 'id' => 'item20', 'titulo'=>'VISIÓN DE COLORES:','contenido'=>$consultamedicadet->visiondecolores,'clase'=>'', 'style'=>'', 'col'=>'col-12 col-md-12', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
        array('tipo'=>'div','nombre'=>'item21', 'id' => 'item21', 'titulo'=>'VISIÓN DE PROFUNDIDA:','contenido'=>$consultamedicadet->visionprofundidad,'clase'=>'', 'style'=>'', 'col'=>'col-12 col-md-12', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
        array('tipo'=>'div','nombre'=>'item22', 'id' => 'item22', 'titulo'=>'REFLEJOS PUPILARES:','contenido'=>$consultamedicadet->reflejospup,'clase'=>'', 'style'=>'', 'col'=>'col-12 col-md-12', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
        array('tipo'=>'div','nombre'=>'item23', 'id' => 'item23', 'titulo'=>'CAMPOVISUAL:','contenido'=>$consultamedicadet->campovisual,'clase'=>'', 'style'=>'', 'col'=>'col-12 col-md-12', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
        array('tipo'=>'div','nombre'=>'item24', 'id' => 'item24', 'titulo'=>'FONDO DE OJO OD:','contenido'=>$consultamedicadet->fondoojood,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
        array('tipo'=>'div','nombre'=>'item25', 'id' => 'item25', 'titulo'=>'FONDO DE OJO OI:','contenido'=>$consultamedicadet->fondoojooi,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
        array('tipo'=>'div','nombre'=>'item26', 'id' => 'item26', 'titulo'=>'AGUJERO ESTENOPEICO','contenido'=>$consultamedicadet->agujeroest,'clase'=>'', 'style'=>'', 'col'=>'col-12 col-md-12', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),

        array('tipo'=>'separador','clase'=>'', 'estilo'=>'', 'color'=>''),
        array('tipo'=>'div','nombre'=>'item19', 'id' => 'item19', 'titulo'=>'EXÁMENES:','contenido'=>$consultamedicadet->examenes,'clase'=>'', 'style'=>'', 'col'=>'col-12 col-md-12', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
        array('tipo'=>'div','nombre'=>'item20', 'id' => 'item20', 'titulo'=>'DIAGNÓSTICO:','contenido'=>$consultamedicadet->impdiag1,'clase'=>'', 'style'=>'', 'col'=>'col-12 col-md-12', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
        array('tipo'=>'div','nombre'=>'item26', 'id' => 'item26', 'titulo'=>'CIE100','contenido'=>$consultamedicadet->cie1001,'clase'=>'', 'style'=>'', 'col'=>'col-12 col-md-12', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
        array('tipo'=>'div','nombre'=>'item20', 'id' => 'item20', 'titulo'=>'DIAGNÓSTICO:','contenido'=>$consultamedicadet->impdiag2,'clase'=>'', 'style'=>'', 'col'=>'col-12 col-md-12', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
        array('tipo'=>'div','nombre'=>'item26', 'id' => 'item26', 'titulo'=>'CIE100','contenido'=>$consultamedicadet->cie1002,'clase'=>'', 'style'=>'', 'col'=>'col-12 col-md-12', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
        array('tipo'=>'div','nombre'=>'item20', 'id' => 'item20', 'titulo'=>'DIAGNÓSTICO:','contenido'=>$consultamedicadet->impdiag3,'clase'=>'', 'style'=>'', 'col'=>'col-12 col-md-12', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
        array('tipo'=>'div','nombre'=>'item26', 'id' => 'item26', 'titulo'=>'CIE100','contenido'=>$consultamedicadet->cie1003,'clase'=>'', 'style'=>'', 'col'=>'col-12 col-md-12', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),

    )
);


$contenidoinfo=$objeto->getObjetosArray(
    array(
        array('tipo'=>'input','subtipo'=>'oculto', 'nombre'=>'idpaciente', 'id'=>'idpaciente', 'valor'=>$paciente->id, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false, 'col'=>'col-3 col-md-3', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'oculto', 'nombre'=>'idcita', 'id'=>'idcita', 'valor'=>$idcita, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false, 'col'=>'col-3 col-md-3', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'oculto', 'nombre'=>'iddoctor', 'id'=>'iddoctor', 'valor'=>$idcita, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false, 'col'=>'col-3 col-md-3', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'oculto', 'nombre'=>'idoptometrista', 'id'=>'idoptometrista', 'valor'=>$idcita, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false, 'col'=>'col-3 col-md-3', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'oculto', 'nombre'=>'idconsultam', 'id'=>'idconsultam', 'valor'=>$consultamedicadet->id, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false, 'col'=>'col-3 col-md-3', 'adicional'=>''),
      //  array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'agudezavscod', 'id'=>'agudezavscod', 'valor'=>$consultamedicadet->agudezavscod, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'AG Visual S/C OD: ', 'col'=>'col-6 col-md-3', 'adicional'=>''),
      //  array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'agudezavscoi', 'id'=>'agudezavscoi', 'valor'=>$consultamedicadet->agudezavscoi, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'AG Visual S/C OI: ', 'col'=>'col-6 col-md-3', 'adicional'=>''),
      //  array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'agudezavcod', 'id'=>'agudezavcod', 'valor'=>$consultamedicadet->agudezavcod, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'AG Visual C. OD: ', 'col'=>'col-6 col-md-3', 'adicional'=>''),
      //  array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'agudezavcoi', 'id'=>'agudezavcoi', 'valor'=>$consultamedicadet->agudezavcoi, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'AG Visual C. OI: ', 'col'=>'col-6 col-md-3', 'adicional'=>''),
      //  array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'agudezavscotr', 'id'=>'agudezavscotr', 'valor'=>$consultamedicadet->agudezavotr, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'AG Visual C. OTR: ', 'col'=>'col-6 col-md-3', 'adicional'=>''),
      //  array('tipo'=>'separador','clase'=>'', 'estilo'=>'', 'color'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'visioncercascod', 'id'=>'visioncercascod', 'valor'=>$consultamedicadet->visioncscod, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Visión C. S/C OD: ', 'col'=>'col-6 col-md-3', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'visioncercascoi', 'id'=>'visioncercascoi', 'valor'=>$consultamedicadet->visioncosci, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Visión C. S/C OI: ', 'col'=>'col-6 col-md-3', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'visioncercaccod', 'id'=>'visioncercaccod', 'valor'=>$consultamedicadet->visionccod, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Visión CC. OD: ', 'col'=>'col-6 col-md-3', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'visioncercaccoi', 'id'=>'visioncercaccoi', 'valor'=>$consultamedicadet->visionccid, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Visión CC. OI: ', 'col'=>'col-6 col-md-3', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'visioncercaotr', 'id'=>'visioncercaotr', 'valor'=>$consultamedicadet->visioncotr, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Visión CC OTR: ', 'col'=>'col-6 col-md-3', 'adicional'=>''),
        array('tipo'=>'separador','clase'=>'', 'estilo'=>'', 'color'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'visionlejosscod', 'id'=>'visionlejosscod', 'valor'=>$consultamedicadet->visionlscod, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Visión L. S/C OD: ', 'col'=>'col-6 col-md-3', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'visionlejosscoi', 'id'=>'visionlejosscoi', 'valor'=>$consultamedicadet->visionlscoi, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Visión L. S/C OI: ', 'col'=>'col-6 col-md-3', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'visionlejosccod', 'id'=>'visionlejosccod', 'valor'=>$consultamedicadet->visionlcod, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Visión LC. OD: ', 'col'=>'col-6 col-md-3', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'visionlejosccoi', 'id'=>'visionlejosccoi', 'valor'=>$consultamedicadet->visionlcoi, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Visión LC. OI: ', 'col'=>'col-6 col-md-3', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'visionlejosotr', 'id'=>'visionlejosotr', 'valor'=>$consultamedicadet->visionlcotr, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Visión LC. OTR: ', 'col'=>'col-6 col-md-3', 'adicional'=>''),
        array('tipo'=>'separador','clase'=>'', 'estilo'=>'', 'color'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'pioscod', 'id'=>'pioscod', 'valor'=>$consultamedicadet->pioscod, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'PIO OD: ', 'col'=>'col-6 col-md-3', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'pioscoi', 'id'=>'pioscoi', 'valor'=>$consultamedicadet->pioscoi, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'PIO OI: ', 'col'=>'col-6 col-md-3', 'adicional'=>''),
      //  array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'piocod', 'id'=>'piocod', 'valor'=>$consultamedicadet->piocod, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'PIO C. OD: ', 'col'=>'col-6 col-md-3', 'adicional'=>''),
      //  array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'piocoi', 'id'=>'piocoi', 'valor'=>$consultamedicadet->piocoi, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'PIO C. OI: ', 'col'=>'col-6 col-md-3', 'adicional'=>''),
      //  array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'piocotr', 'id'=>'piocotr', 'valor'=>$consultamedicadet->piootr, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'PIO C OTR: ', 'col'=>'col-6 col-md-3', 'adicional'=>''),
        array('tipo'=>'separador','clase'=>'', 'estilo'=>'', 'color'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'microboscopia', 'id'=>'microboscopia', 'valor'=>$consultamedicadet->biomicroscopia, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Biomicroscopía: ', 'col'=>'col-12 col-md-6', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'visioncolores', 'id'=>'visioncolores', 'valor'=>$consultamedicadet->visiondecolores, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Visión de colores: ', 'col'=>'col-12 col-md-6', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'visionprof', 'id'=>'visionprof', 'valor'=>$consultamedicadet->visionprofundidad, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Visión de profundidad: ', 'col'=>'col-12 col-md-6', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'refloejospupi', 'id'=>'refloejospupi', 'valor'=>$consultamedicadet->reflejospup, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Reflejos pupilares: ', 'col'=>'col-12 col-md-6', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'campovisual', 'id'=>'campovisual', 'valor'=>$consultamedicadet->campovisual, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Campo visual: ', 'col'=>'col-12 col-md-6', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'fondoojood', 'id'=>'fondoojood', 'valor'=>$consultamedicadet->fondoojood, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Fon. OJO OD: ', 'col'=>'col-6 col-md-6', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'fondoojooi', 'id'=>'fondoojooi', 'valor'=>$consultamedicadet->fondoojooi, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Fon. OJO OI: ', 'col'=>'col-6 col-md-6', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'agujeroest', 'id'=>'agujeroest', 'valor'=>$consultamedicadet->agujeroest, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Agujero estenopeico: ', 'col'=>'col-12 col-md-6', 'adicional'=>''),
        array('tipo'=>'separador','clase'=>'', 'estilo'=>'', 'color'=>''),
        array('tipo'=>'input','subtipo'=>'textarea', 'nombre'=>'examenes', 'id'=>'examenes', 'valor'=>$consultamedicadet->examenes, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Exámenes: ', 'col'=>'col-12 col-md-12', 'adicional'=>''),
        array('tipo'=>'separador','clase'=>'', 'estilo'=>'', 'color'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'impresion1', 'id'=>'impresion1', 'valor'=>$consultamedicadet->impdiag1, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Impresión Diagnóstica: ', 'col'=>'col-12 col-md-8', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'cie1', 'id'=>'cie1', 'valor'=>$consultamedicadet->cie1001, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'CIE 100 - 1: ', 'col'=>'col-12 col-md-4', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'impresion2', 'id'=>'impresion2', 'valor'=>$consultamedicadet->impdiag2, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Impresión Diagnóstica 2: ', 'col'=>'col-12 col-md-8', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'cie2', 'id'=>'cie2', 'valor'=>$consultamedicadet->cie1002, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'CIE 100 - 2: ', 'col'=>'col-12 col-md-4', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'impresion3', 'id'=>'impresion3', 'valor'=>$consultamedicadet->impdiag3, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Impresión Diagnóstica 3: ', 'col'=>'col-12 col-md-8', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'cie3', 'id'=>'cie3', 'valor'=>$consultamedicadet->cie1003, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'CIE 100 - 3: ', 'col'=>'col-12 col-md-4', 'adicional'=>''),

    ),true
);



$img1= ($consultamedicadet->img1) ? '<img name="" id="" class="col-12 col-md-12" src="/backend/web/images/fichamedica/'.$consultamedicadet->img1.'"/>': '' ;
$img2= ($consultamedicadet->img2) ? '<img name="" id="" class="col-12 col-md-12" src="/backend/web/images/fichamedica/'.$consultamedicadet->img2.'"/>': '' ;
$img3= ($consultamedicadet->img3) ? '<img name="" id="" class="col-12 col-md-12" src="/backend/web/images/fichamedica/'.$consultamedicadet->img3.'"/>': '' ;
$img4= ($consultamedicadet->img4) ? '<img name="" id="" class="col-12 col-md-12" src="/backend/web/images/fichamedica/'.$consultamedicadet->img4.'"/>': '' ;
$img5= ($consultamedicadet->img5) ? '<img name="" id="" class="col-12 col-md-12" src="/backend/web/images/fichamedica/'.$consultamedicadet->img5.'"/>': '' ;
$contenidoN3=$contenidoClass->getContenidoArrayr(
    array(
        //array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'ID:','contenido'=>$paciente->id,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
        array('tipo'=>'div','nombre'=>'img-1', 'id' => 'img-1', 'titulo'=>'Imagen1:','contenido'=>$img1,'clase'=>'', 'style'=>'', 'col'=>'col-12 col-md-12', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
        array('tipo'=>'separador','clase'=>'', 'estilo'=>'', 'color'=>''),
        array('tipo'=>'div','nombre'=>'img-2', 'id' => 'img-2', 'titulo'=>'Imagen2:','contenido'=>$img2,'clase'=>'', 'style'=>'', 'col'=>'col-12 col-md-12', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
        array('tipo'=>'separador','clase'=>'', 'estilo'=>'', 'color'=>''),
        array('tipo'=>'div','nombre'=>'img-3', 'id' => 'img-3', 'titulo'=>'Imagen3:','contenido'=>$img3,'clase'=>'', 'style'=>'', 'col'=>'col-12 col-md-12', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
        array('tipo'=>'separador','clase'=>'', 'estilo'=>'', 'color'=>''),
        array('tipo'=>'div','nombre'=>'img-4', 'id' => 'img-4', 'titulo'=>'Imagen4:','contenido'=>$img4,'clase'=>'', 'style'=>'', 'col'=>'col-12 col-md-12', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
        array('tipo'=>'separador','clase'=>'', 'estilo'=>'', 'color'=>''),
        array('tipo'=>'div','nombre'=>'img-5', 'id' => 'img-5', 'titulo'=>'Imagen5:','contenido'=>$img5,'clase'=>'', 'style'=>'', 'col'=>'col-12 col-md-12', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
    )
);

$contenidotab=$nav->getNavsarray(
    array(
        array('tipo'=>'config','nombre'=>'tabpermisos', 'id'=>'tabpermisos', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Nombre','leyenda'=>'Nombre del rol ', 'col'=>'col-12 col-md-6', 'adicional'=>''),
        array('tipo'=>'tab','nombre'=>'tabinfo', 'id'=>'tabinfo', 'titulo'=>'Información', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Nombre','leyenda'=>'Nombre del rol ', 'col'=>'col-12 col-md-6', 'adicional'=>'', 'contenido'=>$contenidoinfo),
        //array('tipo'=>'tab','nombre'=>'tabdiario', 'id'=>'tabdiario', 'titulo'=>'Diagnóstico', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Nombre','leyenda'=>'Nombre del rol ', 'col'=>'col-12 col-md-6', 'adicional'=>'', 'contenido'=>$contenidoHC),
        //array('tipo'=>'tab','nombre'=>'tabdetalle', 'id'=>'tabdetalle', 'titulo'=>'Detalle', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Nombre','leyenda'=>'Nombre del rol ', 'col'=>'col-12 col-md-6', 'adicional'=>'', 'contenido'=>$contenidoDetalle),
        array('tipo'=>'tab','nombre'=>'tabimagenes', 'id'=>'tabimagenes', 'titulo'=>'Imágenes', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Nombre','leyenda'=>'Nombre del rol ', 'col'=>'col-12 col-md-6', 'adicional'=>'', 'contenido'=>$contenidoN3),
       // array('tipo'=>'tab','nombre'=>'tabfactura', 'id'=>'tabfactura', 'titulo'=>'Receta', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Nombre','leyenda'=>'Nombre del rol ', 'col'=>'col-12 col-md-6', 'adicional'=>'', 'contenido'=>$contenidoN1),
    )
  );
$form = ActiveForm::begin(['id'=>'frmDatos']);
 echo $div->getBloqueArray(
    array(
        array('tipo'=>'bloquediv','nombre'=>'dvcontent','id'=>'dvcontent','titulo'=>'Ficha Médica','clase'=>'col-md-6 col-xs-6 ','style'=>'','col'=>'','tipocolor'=>'rojo','adicional'=>'','contenido'=>$contenidotab.$botonC),
        array('tipo'=>'bloquediv','nombre'=>'dvcontent','id'=>'dvcontent','titulo'=>'Datos Paciente','clase'=>'col-md-6 col-xs-6 ','style'=>'','col'=>'','tipocolor'=>'','adicional'=>'','contenido'=>$contenido),
        //array('tipo'=>'bloquediv','nombre'=>'dvcontent','id'=>'dvcontent','titulo'=>'Información','clase'=>'col-md-3 col-xs-12 ','style'=>'','col'=>'','tipocolor'=>'gris','adicional'=>'','contenido'=>$contenido2),
    )
);
ActiveForm::end();
//var_dump($objeto);
?>
<script>


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