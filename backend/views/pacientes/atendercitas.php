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
$urlpost='formatendercita';


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
        array('tipo'=>'separador','clase'=>'', 'estilo'=>'', 'color'=>''),
     //   array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'agudezavscoi', 'id'=>'agudezavscoi', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'AG Visual S/C OI: ', 'col'=>'col-6 col-md-3', 'adicional'=>''),
     //   array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'agudezavcod', 'id'=>'agudezavcod', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'AG Visual C. OD: ', 'col'=>'col-6 col-md-3', 'adicional'=>''),
     //   array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'agudezavcoi', 'id'=>'agudezavcoi', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'AG Visual C. OI: ', 'col'=>'col-6 col-md-3', 'adicional'=>''),
     //   array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'agudezavscotr', 'id'=>'agudezavscotr', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'AG Visual C. OTR: ', 'col'=>'col-6 col-md-3', 'adicional'=>''),
    //    array('tipo'=>'separador','clase'=>'', 'estilo'=>'', 'color'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'visioncercascod', 'id'=>'visioncercascod', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Visión C. S/C OD: ', 'col'=>'col-6 col-md-3', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'visioncercascoi', 'id'=>'visioncercascoi', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Visión C. S/C OI: ', 'col'=>'col-6 col-md-3', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'visioncercaccod', 'id'=>'visioncercaccod', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Visión CC. OD: ', 'col'=>'col-6 col-md-3', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'visioncercaccoi', 'id'=>'visioncercaccoi', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Visión CC. OI: ', 'col'=>'col-6 col-md-3', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'visioncercaotr', 'id'=>'visioncercaotr', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Visión CC OTR: ', 'col'=>'col-6 col-md-3', 'adicional'=>''),
        array('tipo'=>'separador','clase'=>'', 'estilo'=>'', 'color'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'visionlejosscod', 'id'=>'visionlejosscod', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Visión L. S/C OD: ', 'col'=>'col-6 col-md-3', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'visionlejosscoi', 'id'=>'visionlejosscoi', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Visión L. S/C OI: ', 'col'=>'col-6 col-md-3', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'visionlejosccod', 'id'=>'visionlejosccod', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Visión LC. OD: ', 'col'=>'col-6 col-md-3', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'visionlejosccoi', 'id'=>'visionlejosccoi', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Visión LC. OI: ', 'col'=>'col-6 col-md-3', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'visionlejosotr', 'id'=>'visionlejosotr', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Visión LC. OTR: ', 'col'=>'col-6 col-md-3', 'adicional'=>''),
        array('tipo'=>'separador','clase'=>'', 'estilo'=>'', 'color'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'pioscod', 'id'=>'pioscod', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'PIO OD: ', 'col'=>'col-6 col-md-3', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'pioscoi', 'id'=>'pioscoi', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'PIO OI: ', 'col'=>'col-6 col-md-3', 'adicional'=>''),
      //  array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'piocod', 'id'=>'piocod', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'PIO C. OD: ', 'col'=>'col-6 col-md-3', 'adicional'=>''),
      //  array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'piocoi', 'id'=>'piocoi', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'PIO C. OI: ', 'col'=>'col-6 col-md-3', 'adicional'=>''),
       // array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'piocotr', 'id'=>'piocotr', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'PIO C OTR: ', 'col'=>'col-6 col-md-3', 'adicional'=>''),
        array('tipo'=>'separador','clase'=>'', 'estilo'=>'', 'color'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'microboscopia', 'id'=>'microboscopia', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Biomicroscopía: ', 'col'=>'col-12 col-md-6', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'visioncolores', 'id'=>'visioncolores', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Visión de colores: ', 'col'=>'col-12 col-md-6', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'visionprof', 'id'=>'visionprof', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Visión de profundidad: ', 'col'=>'col-12 col-md-6', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'refloejospupi', 'id'=>'refloejospupi', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Reflejos pupilares: ', 'col'=>'col-12 col-md-6', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'campovisual', 'id'=>'campovisual', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Campo visual: ', 'col'=>'col-12 col-md-6', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'fondoojood', 'id'=>'fondoojood', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Fon. OJO OD: ', 'col'=>'col-6 col-md-6', 'adicional'=>''),
        array('tipo'=>'input','subtipo'=>'cajatexto', 'nombre'=>'fondoojooi', 'id'=>'fondoojooi', 'valor'=>'', 'onchange'=>'', 'clase'=>'', 'style'=>'', 'icono'=>'lapiz','boxbody'=>false,'etiqueta'=>'Fon. OJO OI: ', 'col'=>'col-6 col-md-6', 'adicional'=>''),
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