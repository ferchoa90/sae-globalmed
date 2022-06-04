<?php
use backend\components\Objetos;
use backend\components\Botones;
use backend\components\Bloques;
use backend\components\Grid;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\web\View;
use backend\assets\AppAsset;
/* @var $this yii\web\View */

$this->title = "Agenda";
$this->params['breadcrumbs'][] = $this->title;

$grid= new Grid;
$botones= new Botones;

$columnas= array(
    array('columna'=>'#', 'datareg' => 'num', 'clase'=>'', 'estilo'=>'', 'ancho'=>''),
    array('columna'=>'Paciente', 'datareg' => 'paciente', 'clase'=>'', 'estilo'=>'', 'ancho'=>''),
    array('columna'=>'Observación', 'datareg' => 'observacion', 'clase'=>'', 'estilo'=>'', 'ancho'=>''),
    array('columna'=>'Tipo Cita', 'datareg' => 'tipocita', 'clase'=>'', 'estilo'=>'', 'ancho'=>''),
    array('columna'=>'Fecha', 'datareg' => 'fechacita', 'clase'=>'', 'estilo'=>'', 'ancho'=>''),
    array('columna'=>'Hora', 'datareg' => 'horacita', 'clase'=>'', 'estilo'=>'', 'ancho'=>''),
    array('columna'=>'Doctor', 'datareg' => 'doctor', 'clase'=>'', 'estilo'=>'', 'ancho'=>''),
    array('columna'=>'Fecha Creación', 'datareg' => 'fechacreacion', 'clase'=>'', 'estilo'=>'', 'ancho'=>'')  ,
    array('columna'=>'Usuario c.', 'datareg' => 'usuariocreacion', 'clase'=>'', 'estilo'=>'', 'ancho'=>''),
    array('columna'=>'Estatus Cita', 'datareg' => 'estatuscita', 'clase'=>'', 'estilo'=>'', 'ancho'=>''),
    array('columna'=>'Estatus', 'datareg' => 'estatus', 'clase'=>'', 'estilo'=>'', 'ancho'=>'')  ,
    array('columna'=>'Acciones', 'datareg' => 'acciones', 'clase'=>'', 'estilo'=>'', 'ancho'=>'')  ,
);

echo $grid->getGrid(
        array(
            array('tipo'=>'datagrid','nombre'=>'table','id'=>'table','columnas'=>$columnas,'clase'=>'','style'=>'','col'=>'','adicional'=>'','url'=>'citasmedicasreg')
        )
);

?>
