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
            array('tipo'=>'div','nombre'=>'telefono', 'id' => 'telefono', 'titulo'=>'Teléfono:','contenido'=>$paciente->telefono, 'col'=>'col-12 col-md-12','clase'=>'', 'style'=>'', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
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


$contenidoant=$objeto->getObjetosArray(
    array(
        array('tipo'=>'input','subtipo'=>'textarea', 'nombre'=>'antecedentesp', 'id'=>'antecedentesp', 'valor'=>$paciente->antecedentesp, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Antecedentes Personales: ', 'col'=>'col-12 col-md-12', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'textarea', 'nombre'=>'antecedenteso', 'id'=>'antecedenteso', 'valor'=>$paciente->antecedenteso , 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Antecedentes Oculares: ', 'col'=>'col-12 col-md-12', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'textarea', 'nombre'=>'antecedentesf', 'id'=>'antecedentesf', 'valor'=>$paciente->antecedentesf , 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Antecedentes Familiares: ', 'col'=>'col-12 col-md-12', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'textarea', 'nombre'=>'enfermedada', 'id'=>'enfermedada', 'valor'=>$paciente->enfermedada , 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Enfermedad Actual: ', 'col'=>'col-12 col-md-12', 'adicional'=>''),
    ),true
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
        array('tipo'=>'input','subtipo'=>'textarea', 'nombre'=>'motivo', 'id'=>'motivo', 'valor'=>$consultamedicadet->causaconsulta, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Motivo de la consulta: ', 'col'=>'col-12 col-md-9', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'onoff', 'nombre'=>'usolentes', 'id'=>'usolentes', 'valordefecto'=>$checked, 'textoon'=>'Sí', 'textooff'=>'No', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Uso de lentes: ', 'col'=>'col-3 col-md-3', 'adicional'=>''),
        array('tipo'=>'div','nombre'=>'vc', 'id' => 'vc', 'titulo'=>'Visión Cerca: ','contenido'=>'','clase'=>'', 'style'=>'background: rgba(129,224,145,.3); margin-bottom:5px;', 'col'=>'col-12 col-md-12', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'visioncercascod', 'id'=>'visioncercascod', 'valor'=>$consultamedicadet->visioncscod, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'C. S/C OD: ', 'col'=>'col-6 col-md-4', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'visioncercascoi', 'id'=>'visioncercascoi', 'valor'=>$consultamedicadet->visioncosci, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'C. S/C OI: ', 'col'=>'col-6 col-md-4', 'adicional'=>''),
        array('tipo'=>'box','col'=>'col-5 col-md-4', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'visioncercaccod', 'id'=>'visioncercaccod', 'valor'=>$consultamedicadet->visionccod, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'CC. OD: ', 'col'=>'col-6 col-md-4', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'visioncercaccoi', 'id'=>'visioncercaccoi', 'valor'=>$consultamedicadet->visionccid, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'CC. OI: ', 'col'=>'col-6 col-md-4', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'visioncercaotr', 'id'=>'visioncercaotr', 'valor'=>$consultamedicadet->visioncotr, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'CC OTROS: ', 'col'=>'col-6 col-md-4', 'adicional'=>''),

        array('tipo'=>'div','nombre'=>'vl', 'id' => 'vl', 'titulo'=>'Visión Lejos: ','contenido'=>'','clase'=>'', 'style'=>'background: rgba(129,224,145,.3); margin-bottom:5px;', 'col'=>'col-12 col-md-12', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'visionlejosscod', 'id'=>'visionlejosscod', 'valor'=>$consultamedicadet->visionlscod, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'L. S/C OD: ', 'col'=>'col-6 col-md-4', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'visionlejosscoi', 'id'=>'visionlejosscoi', 'valor'=>$consultamedicadet->visionlscoi, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'L. S/C OI: ', 'col'=>'col-6 col-md-4', 'adicional'=>''),
        array('tipo'=>'box','col'=>'col-5 col-md-4', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'visionlejosccod', 'id'=>'visionlejosccod', 'valor'=>$consultamedicadet->visionlcod, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'LC. OD: ', 'col'=>'col-6 col-md-4', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'visionlejosccoi', 'id'=>'visionlejosccoi', 'valor'=>$consultamedicadet->visionlcoi, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'LC. OI: ', 'col'=>'col-6 col-md-4', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'visionlejosotr', 'id'=>'visionlejosotr', 'valor'=>$consultamedicadet->visionlcotr, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'DP: ', 'col'=>'col-6 col-md-4', 'adicional'=>''),

        array('tipo'=>'div','nombre'=>'pioin', 'id' => 'pioin', 'titulo'=>'PIO: ','contenido'=>'','clase'=>'', 'style'=>'background: rgba(129,224,145,.3); margin-bottom:5px;', 'col'=>'col-12 col-md-12', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'pioscod', 'id'=>'pioscod', 'valor'=>$consultamedicadet->pioscod, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'OD: ', 'col'=>'col-6 col-md-5', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'pioscoi', 'id'=>'pioscoi', 'valor'=>$consultamedicadet->pioscoi, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'OI: ', 'col'=>'col-6 col-md-5', 'adicional'=>''),
      //  array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'piocod', 'id'=>'piocod', 'valor'=>$consultamedicadet->piocod, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'PIO C. OD: ', 'col'=>'col-6 col-md-3', 'adicional'=>''),
      //  array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'piocoi', 'id'=>'piocoi', 'valor'=>$consultamedicadet->piocoi, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'PIO C. OI: ', 'col'=>'col-6 col-md-3', 'adicional'=>''),
      //  array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'piocotr', 'id'=>'piocotr', 'valor'=>$consultamedicadet->piootr, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'PIO C OTR: ', 'col'=>'col-6 col-md-3', 'adicional'=>''),

        array('tipo'=>'div','nombre'=>'vl', 'id' => 'vl', 'titulo'=>'','contenido'=>'','clase'=>'', 'style'=>'background: rgba(129,224,145,.3); margin-bottom:5px;', 'col'=>'col-12 col-md-12', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
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
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'cie1', 'id'=>'cie1', 'valor'=>$consultamedicadet->cie1001, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'CIE 10: ', 'col'=>'col-12 col-md-4', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'impresion2', 'id'=>'impresion2', 'valor'=>$consultamedicadet->impdiag2, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Impresión Diagnóstica 2: ', 'col'=>'col-12 col-md-8', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'cie2', 'id'=>'cie2', 'valor'=>$consultamedicadet->cie1002, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'CIE 10: ', 'col'=>'col-12 col-md-4', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'impresion3', 'id'=>'impresion3', 'valor'=>$consultamedicadet->impdiag3, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Impresión Diagnóstica 3: ', 'col'=>'col-12 col-md-8', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'cie3', 'id'=>'cie3', 'valor'=>$consultamedicadet->cie1003, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'CIE 10: ', 'col'=>'col-12 col-md-4', 'adicional'=>''),

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
        array('tipo'=>'input','subtipo'=>'textarea', 'nombre'=>'plan', 'id'=>'plan', 'valor'=>$consultamedicadiag->plan, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Plan: ', 'col'=>'col-12 col-md-12', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'medicamento1', 'id'=>'medicamento1', 'valor'=>@$consultamedicadiag->med1, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Medicamento: ', 'col'=>'col-6 col-md-4', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'mprescripciono1', 'id'=>'prescripcion1', 'valor'=>@$consultamedicadiag->presc1, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Prescripción: ', 'col'=>'col-6 col-md-8', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'medicamento2', 'id'=>'medicamento2', 'valor'=>@$consultamedicadiag->med2, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Medicamento: ', 'col'=>'col-6 col-md-4', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'mprescripciono2', 'id'=>'prescripcion2', 'valor'=>@$consultamedicadiag->presc2, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Prescripción: ', 'col'=>'col-6 col-md-8', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'medicamento3', 'id'=>'medicamento3', 'valor'=>@$consultamedicadiag->med3, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Medicamento: ', 'col'=>'col-6 col-md-4', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'mprescripciono3', 'id'=>'prescripcion3', 'valor'=>@$consultamedicadiag->presc3, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Prescripción: ', 'col'=>'col-6 col-md-8', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'medicamento4', 'id'=>'medicamento4', 'valor'=>@$consultamedicadiag->med4, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Medicamento: ', 'col'=>'col-6 col-md-4', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'mprescripciono4', 'id'=>'prescripcion4', 'valor'=>@$consultamedicadiag->presc4, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Prescripción: ', 'col'=>'col-6 col-md-8', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'medicamento5', 'id'=>'medicamento5', 'valor'=>@$consultamedicadiag->med5, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Medicamento: ', 'col'=>'col-6 col-md-4', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'mprescripciono5', 'id'=>'prescripcion5', 'valor'=>@$consultamedicadiag->presc5, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Prescripción: ', 'col'=>'col-6 col-md-8', 'adicional'=>''),
    ),true
);
$usolentes= ($consultamedicadet->id=="on")? 'SI' : 'NO' ;




$img1= ($consultamedicadet->img1) ? '<img name="" id="" class="col-12 col-md-12" src="/backend/web/images/fichamedica/'.$consultamedicadet->img1.'"/>': '' ;
$img2= ($consultamedicadet->img2) ? '<img name="" id="" class="col-12 col-md-12" src="/backend/web/images/fichamedica/'.$consultamedicadet->img2.'"/>': '' ;
$img3= ($consultamedicadet->img3) ? '<img name="" id="" class="col-12 col-md-12" src="/backend/web/images/fichamedica/'.$consultamedicadet->img3.'"/>': '' ;
$img4= ($consultamedicadet->img4) ? '<img name="" id="" class="col-12 col-md-12" src="/backend/web/images/fichamedica/'.$consultamedicadet->img4.'"/>': '' ;
$img5= ($consultamedicadet->img5) ? '<img name="" id="" class="col-12 col-md-12" src="/backend/web/images/fichamedica/'.$consultamedicadet->img5.'"/>': '' ;

$contenidoN3=$objeto->getObjetosArray(
    array(
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'camping', 'id'=>'camping', 'valor'=>$consultamedicadet->campim, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Campim: ', 'col'=>'col-12 col-md-6', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'octangular', 'id'=>'octangular', 'valor'=>$consultamedicadet->octangular, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Oct. Angular: ', 'col'=>'col-12 col-md-6', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'octm', 'id'=>'octm', 'valor'=>$consultamedicadet->octm, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Oct. M.: ', 'col'=>'col-12 col-md-6', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'octn', 'id'=>'octn', 'valor'=>$consultamedicadet->octn, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Oct. N.: ', 'col'=>'col-12 col-md-6', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'biometod', 'id'=>'biometod', 'valor'=>$consultamedicadet->biood, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Biomet. OD: ', 'col'=>'col-12 col-md-6', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'biometoi', 'id'=>'biometoi', 'valor'=>$consultamedicadet->bioid, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Biomet. OI: ', 'col'=>'col-6 col-md-6', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'paquimod', 'id'=>'paquimod', 'valor'=>$consultamedicadet->paquimod, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Paquim. OD: ', 'col'=>'col-6 col-md-6', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'paquimoi', 'id'=>'paquimoi', 'valor'=>$consultamedicadet->paquimid, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Paquim. OI: ', 'col'=>'col-6 col-md-6', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'ora', 'id'=>'ora', 'valor'=>$consultamedicadet->ora, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'ORA: ', 'col'=>'col-6 col-md-6', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'topografia', 'id'=>'topografia', 'valor'=>$consultamedicadet->topografia, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Topografía: ', 'col'=>'col-12 col-md-6', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'angioog', 'id'=>'angioog', 'valor'=>$consultamedicadet->angiog, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Angiog: ', 'col'=>'col-12 col-md-6', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'ecogra', 'id'=>'ecogra', 'valor'=>$consultamedicadet->ecogra, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Ecogra: ', 'col'=>'col-12 col-md-6', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'endote', 'id'=>'endote', 'valor'=>$consultamedicadet->endote, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Endote: ', 'col'=>'col-12 col-md-6', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'ubm', 'id'=>'ubm', 'valor'=>$consultamedicadet->ubm, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'UBM: ', 'col'=>'col-12 col-md-6', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'retinografia', 'id'=>'retinografia', 'valor'=>$consultamedicadet->retinografia, 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Retinografía: ', 'col'=>'col-12 col-md-6', 'adicional'=>''),
           ),true
);

$contenidoN4=$contenidoClass->getContenidoArrayr(
    array(
        //array('tipo'=>'div','nombre'=>'id', 'id' => 'id', 'titulo'=>'ID:','contenido'=>$paciente->id,'clase'=>'', 'style'=>'', 'col'=>'col-6 col-md-6', 'tipocolor'=>'azul', 'icono'=>'regresar','adicional'=>''),
        array('tipo'=>'image','nombre'=>'img-1', 'id' => 'img-1', 'src'=>$consultamedicadet->img1,'clase'=>'pb-3 pr-3', 'style'=>'border: 1px dashed #c6c6c6;', 'col'=>'col-12 col-md-4',  'etiqueta'=>' IMAGEN 1' ,  'adicional'=>''),
        array('tipo'=>'image','nombre'=>'img-2', 'id' => 'img-2', 'src'=>$consultamedicadet->img2,'clase'=>'pb-3 pr-3', 'style'=>'border: 1px dashed #c6c6c6;', 'col'=>'col-12 col-md-4',  'etiqueta'=>' IMAGEN 2' ,  'adicional'=>''),
        array('tipo'=>'image','nombre'=>'img-3', 'id' => 'img-3', 'src'=>$consultamedicadet->img3,'clase'=>'pb-3 pr-3', 'style'=>'border: 1px dashed #c6c6c6;', 'col'=>'col-12 col-md-4',  'etiqueta'=>' IMAGEN 3' ,  'adicional'=>''),
        array('tipo'=>'image','nombre'=>'img-4', 'id' => 'img-4', 'src'=>$consultamedicadet->img4,'clase'=>'pb-3 pr-3', 'style'=>'border: 1px dashed #c6c6c6;', 'col'=>'col-12 col-md-4',  'etiqueta'=>' IMAGEN 4' ,  'adicional'=>''),
        array('tipo'=>'image','nombre'=>'img-5', 'id' => 'img-5', 'src'=>$consultamedicadet->img5,'clase'=>'pb-3 pr-3', 'style'=>'border: 1px dashed #c6c6c6;', 'col'=>'col-12 col-md-4',  'etiqueta'=>' IMAGEN 5' ,  'adicional'=>''),
    )
);

$contenidotab=$nav->getNavsarray(
    array(
        array('tipo'=>'config','nombre'=>'tabpermisos', 'id'=>'tabpermisos', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Nombre','leyenda'=>'Nombre del rol ', 'col'=>'col-12 col-md-6', 'adicional'=>''),
        array('tipo'=>'tab','nombre'=>'tabant', 'id'=>'tabant', 'titulo'=>'Antecedentes', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Nombre','leyenda'=>'Nombre del rol ', 'col'=>'col-12 col-md-6', 'adicional'=>'', 'contenido'=>$contenidoant),
        array('tipo'=>'tab','nombre'=>'tabficha', 'id'=>'tabficha', 'titulo'=>'Ficha Visual', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Nombre','leyenda'=>'', 'col'=>'col-12 col-md-6', 'adicional'=>'', 'contenido'=>$contenidoinfo.$contenidoinfo2),
        array('tipo'=>'tab','nombre'=>'tabinfo', 'id'=>'tabinfo', 'titulo'=>'Información', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Nombre','leyenda'=>'', 'col'=>'col-12 col-md-6', 'adicional'=>'', 'contenido'=>$contenidoN3),
        array('tipo'=>'tab','nombre'=>'tabimagenes', 'id'=>'tabimagenes', 'titulo'=>'Imágenes', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Nombre','leyenda'=>'Nombre del rol ', 'col'=>'col-12 col-md-6', 'adicional'=>'', 'contenido'=>$contenidoN4),
        array('tipo'=>'tab','nombre'=>'tabfactura', 'id'=>'tabfactura', 'titulo'=>'Receta', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Nombre','leyenda'=>'Nombre del rol ', 'col'=>'col-12 col-md-6', 'adicional'=>'', 'contenido'=>$contenidoN1),
    )
  );
$form = ActiveForm::begin(['id'=>'frmDatos']);
 echo $div->getBloqueArray(
    array(
        array('tipo'=>'bloquediv','nombre'=>'dvcontent','id'=>'dvcontent','titulo'=>'Ficha Médica','clase'=>'col-md-8 col-xs-8 ','style'=>'','col'=>'','tipocolor'=>'rojo','adicional'=>'','contenido'=>$contenidotab.$botonC),
        array('tipo'=>'bloquediv','nombre'=>'dvcontent','id'=>'dvcontent','titulo'=>'Datos Paciente','clase'=>'col-md-4 col-xs-4 ','style'=>'','col'=>'','tipocolor'=>'','adicional'=>'','contenido'=>$contenido),
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