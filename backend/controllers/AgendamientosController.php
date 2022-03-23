<?php

namespace backend\controllers;
use backend\components\Globaldata;
use Yii;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use yii\helpers\Url;
use yii\db\Query;
use common\models\Inventario;
use common\models\Factura;
use common\models\Cuentasporcobrar;
use common\models\Cuentasporpagar;
use common\models\Cuentasporpagardet;
use common\models\Cuentasporcobrardet;
use common\models\Banco;
use common\models\Diario;
use common\models\Citasmedicas;
use common\models\Pacientes;
use common\models\Doctores;
use common\models\Profesion;
use common\models\Pedidos;
use common\models\Horariocomidas;
use common\models\Departamentos;
use common\models\Clientes;
use backend\components\Contabilidad_clientes;
use backend\components\Contabilidad_proveedores;
use backend\components\Medico_citas;
use backend\models\User;
use kartik\export\ExportMenu;
use yii\data\ActiveDataProvider;
use yii\db\ActiveRecord;
use yii\data\ArrayDataProvider;
use backend\components\Botones;

class AgendamientosController extends Controller

{

    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'only' => ['create', 'update', 'view', 'delete', 'index'],
                'rules' => [
                    [
                        'actions' => ['create', 'update', 'view', 'delete', 'index'],
                        'allow' => true,
                        'roles' => ['@'],
                        'matchCallback' => function ($rule, $action) {
                            return User::isUserAdmin(Yii::$app->user->identity->username);
                        }
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['post'],
                ],
            ],
        ];
    }

    /**

     * Renders the index view for the module

     * @return string

     */
    public function actionIndex()
    {
        return $this->render('index',[

        ]);
    }

    public function actionCitas()
    {
        if (Yii::$app->user->isGuest) {
            return $this->redirect(URL::base() . "/site/login");
        }
        return $this->render('citas',[
            //'clientes'=>$clientes,
        ]);
    }

    public function actionConsultasmed()
    {
        if (Yii::$app->user->isGuest) {
            return $this->redirect(URL::base() . "/site/login");
        }
        return $this->render('consultasmed',[
            //'clientes'=>$clientes,
        ]);
    }


    public function actionReimpresion()
    {
        return $this->render('reimpresion');
    }

    public function actionNuevacita()
    {
        $paciente=Pacientes::find()->where(["isDeleted" => 0,"estatus" => "ACTIVO"])->orderBy(["apellidos" => SORT_ASC])->all();
        $pacienteArray=array();
        $cont=0;
        foreach ($paciente as $key => $value) {
            if ($cont==0){ $pacienteArray[$cont]["value"]="Seleccione un paciente"; $pacienteArray[$cont]["id"]=-1; $cont++; }
            $pacienteArray[$cont]["value"]=$value->apellidos.' '.$value->nombres;
            $pacienteArray[$cont]["id"]=$value->id;
            $cont++;
        }

        $doctores=Doctores::find()->where(["isDeleted" => 0,"estatus" => "ACTIVO"])->orderBy(["apellidos" => SORT_ASC])->all();
        $doctoresArray=array();
        $cont=0;
        foreach ($doctores as $key => $value) {
            if ($cont==0){ $doctoresArray[$cont]["value"]="Seleccione un doctor"; $doctoresArray[$cont]["id"]=-1; $cont++; }
            $doctoresArray[$cont]["value"]=$value->apellidos.' '.$value->nombres;
            $doctoresArray[$cont]["id"]=$value->id;
            $cont++;
        }

        //var_dump($clientesArray);
        return $this->render('nuevacita', [
            'pacientes' => $pacienteArray,
            'doctores' => $doctoresArray,
        ]);
    }

    public function actionCitasmedicasreg()
    {
        //\Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
        if (Yii::$app->user->isGuest) {
            return $this->redirect(URL::base() . "/site/login");
        }
        $page = "citas";
        $view=$page;
        $model = Citasmedicas::find()->where(['isDeleted' => '0'])->orderBy(["fechacreacion" => SORT_DESC])->all();
        $arrayResp = array();
        $count = 0;
        foreach ($model as $key => $data) {
            $editar=array(); $borrar=array();

                if ( ($data["estatuscita"]=="AGENDADA"  || $data["estatuscita"]=="CANCELADO") ) {
                    $editar=array('tipo'=>'link','nombre'=>'editar', 'id' => 'editar', 'titulo'=>'', 'link'=>'editar'.$view.'?id='.$data["id"], 'onclick'=>'', 'clase'=>'', 'style'=>'', 'col'=>'', 'tipocolor'=>'verdesuave', 'icono'=>'editar','tamanio'=>'superp', 'adicional'=>'');
                }
                if ( $data["estatus"]=="ACTIVO" ) {
                    $borrar=array('tipo'=>'link','nombre'=>'eliminar', 'id' => 'editar', 'titulo'=>'', 'link'=>'','onclick'=>'deleteReg('.$data["id"]. ')', 'clase'=>'', 'style'=>'', 'col'=>'', 'tipocolor'=>'rojo', 'icono'=>'eliminar','tamanio'=>'superp', 'adicional'=>'');
                }

            foreach ($data as $id => $text) {
                $botones= new Botones;
                $arrayResp[$key]['num'] = $count+1;
                //$arrayResp[$key]['imagen'] = '<img style="width:30px;" src="/frontend/web/images/articulos/'.$data->imagen.'"/>';
                $arrayResp[$key]['paciente'] = $data->idusuario0->apellidos.' '.$data->idusuario0->nombres;
                $arrayResp[$key]['doctor'] = $data->iddoctor0->apellidos.' '.$data->iddoctor0->nombres;

                $arrayResp[$key]['usuariocreacion'] = $data->usuariocreacion0->username;
                if ($id == "id") {
                    $botonC=$botones->getBotongridArray(
                        array(
                          array('tipo'=>'link','nombre'=>'ver', 'id' => 'editar', 'titulo'=>'', 'link'=>'ver'.$view.'?id='.$text, 'onclick'=>'' , 'clase'=>'', 'style'=>'', 'col'=>'', 'tipocolor'=>'azul', 'icono'=>'ver','tamanio'=>'superp',  'adicional'=>''),
                          $editar,
                          $borrar,
                        )
                      );
                    $arrayResp[$key]['acciones'] = '<div style="display:flex;">'.$botonC.'</div>' ;
                    //$arrayResp[$key]['button'] = '-';
                }
                if ($id == "estatus" && $text == 'ACTIVO') {
                    $arrayResp[$key][$id] = '<small class="badge badge-success"><i class="fa fa-circle"></i>&nbsp; ' . $text . '</small>';
                } elseif ($id == "estatus" && $text == 'INACTIVO') {
                    $arrayResp[$key][$id] = '<small class="badge badge-secondary"><i class="fa fa-circle-thin"></i>&nbsp; ' . $text . '</small>';
                } else {

                    if (($id == "nombres")  || ($id == "observacion") ) { $arrayResp[$key][$id] = $text; }
                    if (($id == "fechacita") || ($id == "usuariocreacion") ) { $arrayResp[$key][$id] = $text; }
                    if (($id == "horacita") ) { $arrayResp[$key][$id] = $text; }
                    if (($id == "fechacreacion") ) { $arrayResp[$key][$id] = $text; }

                    if ($id == "estatuscita") {
                        switch ($text) {
                            case 'AGENDADA':
                                $style='badge-primary';
                                break;

                            case 'REAGENDADA':
                                    $style='badge-warning';
                                    break;

                                case 'CONFIRMADA':
                                    $style='badge-success';
                                    break;

                            case 'REENVIADO':
                                $style='badge-primary';
                                break;

                            case 'CANCELADA':
                                $style='badge-danger';
                                break;

                            case 'ATENDIDA':
                                $style='badge-secondary';
                                break;

                            case 'EN ATENCIÓN':
                                $style='badge-info';
                                break;

                            default:
                                # code...
                                break;
                        }
                        $arrayResp[$key][$id] = '<small class="badge '.$style.'" style="color:white"><i class="fa fa-circle"></i>&nbsp; ' . $text . '</small>';
                    }
                }
            }
            $count++;
        }
        return json_encode($arrayResp);
    }

    public function actionConsultasmedicasreg()
    {
        //\Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
        if (Yii::$app->user->isGuest) {
            return $this->redirect(URL::base() . "/site/login");
        }
        $page = "consultamedica";
        $view=$page;
        $usuario=Yii::$app->user->identity->id;
        $model = Citasmedicas::find()->where(['isDeleted' => '0','iddoctor' => $usuario])->orderBy(["fechacreacion" => SORT_DESC])->all();
        $arrayResp = array();
        $count = 0;
        foreach ($model as $key => $data) {
            $editar=array(); $borrar=array();

                if ( ($data["estatuscita"]=="AGENDADA"  || $data["estatuscita"]=="CANCELADO") ) {
                    $editar=array('tipo'=>'link','nombre'=>'editar', 'id' => 'editar', 'titulo'=>'', 'link'=>'editar'.$view.'?id='.$data["id"], 'onclick'=>'', 'clase'=>'', 'style'=>'', 'col'=>'', 'tipocolor'=>'verdesuave', 'icono'=>'editar','tamanio'=>'superp', 'adicional'=>'');
                }
                if ( $data["estatus"]=="ACTIVO" ) {
                    $borrar=array('tipo'=>'link','nombre'=>'eliminar', 'id' => 'editar', 'titulo'=>'', 'link'=>'','onclick'=>'deleteReg('.$data["id"]. ')', 'clase'=>'', 'style'=>'', 'col'=>'', 'tipocolor'=>'rojo', 'icono'=>'eliminar','tamanio'=>'superp', 'adicional'=>'');
                }

            foreach ($data as $id => $text) {
                $botones= new Botones;
                $arrayResp[$key]['num'] = $count+1;
                //$arrayResp[$key]['imagen'] = '<img style="width:30px;" src="/frontend/web/images/articulos/'.$data->imagen.'"/>';
                $arrayResp[$key]['paciente'] = $data->idusuario0->apellidos.' '.$data->idusuario0->nombres;
                $arrayResp[$key]['doctor'] = $data->iddoctor0->apellidos.' '.$data->iddoctor0->nombres;

                $arrayResp[$key]['usuariocreacion'] = $data->usuariocreacion0->username;
                if ($id == "id") {
                    $botonC=$botones->getBotongridArray(
                        array(
                          array('tipo'=>'link','nombre'=>'ver', 'id' => 'editar', 'titulo'=>'', 'link'=>'ver'.$view.'?id='.$text, 'onclick'=>'' , 'clase'=>'', 'style'=>'', 'col'=>'', 'tipocolor'=>'azul', 'icono'=>'ver','tamanio'=>'superp',  'adicional'=>''),
                          $editar,
                          $borrar,
                        )
                      );
                    $arrayResp[$key]['acciones'] = '<div style="display:flex;">'.$botonC.'</div>' ;
                    //$arrayResp[$key]['button'] = '-';
                }
                if ($id == "estatus" && $text == 'ACTIVO') {
                    $arrayResp[$key][$id] = '<small class="badge badge-success"><i class="fa fa-circle"></i>&nbsp; ' . $text . '</small>';
                } elseif ($id == "estatus" && $text == 'INACTIVO') {
                    $arrayResp[$key][$id] = '<small class="badge badge-secondary"><i class="fa fa-circle-thin"></i>&nbsp; ' . $text . '</small>';
                } else {

                    if (($id == "nombres")  || ($id == "observacion") ) { $arrayResp[$key][$id] = $text; }
                    if (($id == "fechacita") || ($id == "usuariocreacion") ) { $arrayResp[$key][$id] = $text; }
                    if (($id == "horacita") ) { $arrayResp[$key][$id] = $text; }
                    if (($id == "fechacreacion") ) { $arrayResp[$key][$id] = $text; }

                    if ($id == "estatuscita") {
                        switch ($text) {
                            case 'AGENDADA':
                                $style='badge-primary';
                                break;

                            case 'REAGENDADA':
                                    $style='badge-warning';
                                    break;

                                case 'CONFIRMADA':
                                    $style='badge-success';
                                    break;

                            case 'REENVIADO':
                                $style='badge-primary';
                                break;

                            case 'CANCELADA':
                                $style='badge-danger';
                                break;

                            case 'ATENDIDA':
                                $style='badge-secondary';
                                break;

                            case 'EN ATENCIÓN':
                                $style='badge-info';
                                break;

                            default:
                                # code...
                                break;
                        }
                        $arrayResp[$key][$id] = '<small class="badge '.$style.'" style="color:white"><i class="fa fa-circle"></i>&nbsp; ' . $text . '</small>';
                    }
                }
            }
            $count++;
        }
        return json_encode($arrayResp);
    }

    public function actionVercitas($id)
    {
        $cita= Citasmedicas::find()->where(['id' => $id, "isDeleted" => 0])->one();

        return $this->render('vercita', [
            'cita' =>$cita,
           // 'entregasdetalle' => Diariodetalle::find()->where(['diario' => $entregas->diario, "isDeleted" => 0])->all(),
        ]);

    }

    public function actionFormnuevacita()
    {
        if (Yii::$app->user->isGuest) {
            return $this->redirect(URL::base() . "/site/login");
        }
        extract($_POST);
        $data= new Medico_citas;
        $data= $data->Nuevo($_POST);
        $response=$data;
        return json_encode($response);

    }

    public function actionGestionarpedido()
    {
        extract($_POST);
        $arrayResp=array();
        if ($estado && $cita){
            switch ($estado) {
                case 'AGENDADA':

                    break;

                case 'ATENDIDA':

                    break;

                case 'CANCELADA':

                    break;

                case 'CONFIRMADA':

                    break;

                case 'EN ATENCIÓN':

                    break;

                case 'REAGENDADA':

                    break;

                case 'PREPARACIÓN':

                    break;

                default:
                    # code...
                    break;
            }
            $modelCita=Citasmedicas::find()->where(['id' => $cita, "isDeleted" => 0])->one();
            $modelCita->estatuscita=$estado;
            if  ($modelCita->save()){
                    $arrayResp=array("success"=>true);
                    //$arrayResp=array("success"=>false);
            }else{
                $arrayResp=array("success"=>false, "error" => $modelCita->errors);
            }
            /*if ($modelCita && ($estado=="DEVUELTO" || $estado=="ANULADO")){
                $mensajePedido= New Pedidosmensajes;
                $mensajePedido->idpedido=$pedido;
                $mensajePedido->usuariocreacion=Yii::$app->user->identity->id;
                $mensajePedido->idusuarioorg=Yii::$app->user->identity->id;
                $mensajePedido->idusuariodes=55;
                $mensajePedido->mensaje=$mensaje;
                $mensajePedido->isDeleted=0;
                $mensajePedido->estatus="ACTIVO";
                if  ($mensajePedido->save()){
                    if ($modelCita->save()){
                        $arrayResp=array("success"=>true);
                    }else{
                        $arrayResp=array("success"=>false);
                    }
                }else{
                    $arrayResp=array("success"=>false, "error" => $mensajePedido->errors);
                }

            }else{
                if ($modelPedido->save()){
                    $arrayResp=array("success"=>true);
                }else{
                    $arrayResp=array("success"=>false);
                }
            }*/

        }
        return json_encode($arrayResp);
    }


}
