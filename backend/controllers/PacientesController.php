<?php
namespace backend\controllers;

use Yii;
use yii\web\Controller;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use backend\components\Botones;
use backend\components\Medico_pacientes;
use common\models\LoginForm;
use common\models\Cierreanio;
use common\models\Pacientes;
use common\models\Cierreaniodetalle;
use common\models\Citasmedicas;
use common\models\Doctores;
use common\models\Entregas;


/**
 * Site controller
 */
class PacientesController extends Controller
{
    /**
     * {@inheritdoc}
     */
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

    public function actionPacientesreg()
    {
        //\Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
        if (Yii::$app->user->isGuest) {
            return $this->redirect(URL::base() . "/site/login");
        }
        $page = "historiaclinica";
        $view=$page;
        $model = Pacientes::find()->where(['isDeleted' => '0'])->orderBy(["fechacreacion" => SORT_DESC])->all();
        $arrayResp = array();
        $count = 0;
        foreach ($model as $key => $data) {
            foreach ($data as $id => $text) {
                $botones= new Botones;
                $arrayResp[$key]['num'] = $count+1;
                //$arrayResp[$key]['imagen'] = '<img style="width:30px;" src="/frontend/web/images/articulos/'.$data->imagen.'"/>';
                //$arrayResp[$key]['proveedor'] = $data->proveedor->nombre;
                $arrayResp[$key]['usuariocreacion'] = $data->usuariocreacion0->username;
              //  $arrayResp[$key]['cliente'] = $data->cliente->nombres;
                if ($id == "id") {
                    $botonC=$botones->getBotongridArray(
                        array(
                          array('tipo'=>'link','nombre'=>'ver', 'id' => 'editar', 'titulo'=>'', 'link'=>'ver'.$view.'?id='.$text, 'onclick'=>'' , 'clase'=>'', 'style'=>'', 'col'=>'', 'tipocolor'=>'azul', 'icono'=>'ver','tamanio'=>'superp',  'adicional'=>''),
                          //array('tipo'=>'link','nombre'=>'editar', 'id' => 'editar', 'titulo'=>'', 'link'=>'editar'.$view.'?id='.$text, 'onclick'=>'', 'clase'=>'', 'style'=>'', 'col'=>'', 'tipocolor'=>'verdesuave', 'icono'=>'editar','tamanio'=>'superp', 'adicional'=>''),
                          //array('tipo'=>'link','nombre'=>'eliminar', 'id' => 'editar', 'titulo'=>'', 'link'=>'','onclick'=>'deleteReg('.$text. ')', 'clase'=>'', 'style'=>'', 'col'=>'', 'tipocolor'=>'rojo', 'icono'=>'eliminar','tamanio'=>'superp', 'adicional'=>''),
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
                    if (($id == "cedula") || ($id == "nombres") ) { $arrayResp[$key][$id] = $text; }
                    if (  ($id == "apellidos") || ($id == "direccion") ) { $arrayResp[$key][$id] = $text; }
                    if (($id == "correo") || ($id == "telefono") || ($id == "tiposangre") ) { $arrayResp[$key][$id] = $text; }
                    if (($id == "telefono") || ($id == "usuariocreacion")  || ($id == "codigo")) { $arrayResp[$key][$id] = $text; }
                    if (($id == "fechacreacion") ) { $arrayResp[$key][$id] = $text; }
                }
            }
            $count++;
        }
        return json_encode($arrayResp);
    }

    public function actionCitasmedicasreg()
    {
        //\Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
        if (Yii::$app->user->isGuest) {
            return $this->redirect(URL::base() . "/site/login");
        }
        $page = "citas";
        $view=$page;
        $doctor = Doctores::find()->where(['isDeleted' => '0','idususistem' => Yii::$app->user->identity->id ])->one();
        $model = Citasmedicas::find()->where(['isDeleted' => '0','iddoctor' => $doctor->id ])->orderBy(["fechacreacion" => SORT_DESC])->all();
        $arrayResp = array();
        $count = 0;
        foreach ($model as $key => $data) {
            $editar=array(); $borrar=array();

                if ( ($data["estatuscita"]=="AGENDADA"  || $data["estatuscita"]=="CANCELADO" || $data["estatuscita"]=="EN ATENCIÓN") ) {
                    $editar=array('tipo'=>'link','nombre'=>'atender', 'id' => 'atender', 'titulo'=>'', 'link'=>'atender'.$view.'?id='.$data["id"], 'onclick'=>'', 'clase'=>'', 'style'=>'', 'col'=>'', 'tipocolor'=>'verdesuave', 'icono'=>'citamedica','tamanio'=>'superp', 'adicional'=>'');
                }
                if ( $data["estatus"]=="ACTIVO" ) {
                    //$borrar=array('tipo'=>'link','nombre'=>'eliminar', 'id' => 'editar', 'titulo'=>'', 'link'=>'','onclick'=>'deleteReg('.$data["id"]. ')', 'clase'=>'', 'style'=>'', 'col'=>'', 'tipocolor'=>'rojo', 'icono'=>'eliminar','tamanio'=>'superp', 'adicional'=>'');
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

    public function actionHistoriaclinica()
    {
        return $this->render('historiaclinica');
    }

    public function actionAtendercitas($id)
    {
        $data= new Medico_pacientes;
        $pacientes= $data->getPaciente($id);
        $consultas= $data->getHistoriaclinica($id);
        //var_dump($pacientes);
        return $this->render('atendercitas', [
            //'data' => Doctores::find()->where(['id' => $id, "isDeleted" => 0])->one(),
            'paciente' => $pacientes,
            'consultas' => $consultas,
        ]);
    }

    public function actionVerhistoriaclinica($id)
    {
        $data= new Medico_pacientes;
        $pacientes= $data->getPaciente($id);
        $consultas= $data->getHistoriaclinica($id);
        return $this->render('verhistoriaclinica', [
            //'data' => Doctores::find()->where(['id' => $id, "isDeleted" => 0])->one(),
            'paciente' => $pacientes,
            'consultas' => $consultas,
        ]);

    }

    public function actionAgenda()
    {
        return $this->render('agenda');
    }

    public function actionVercitas($id)
    {
        $cita= Citasmedicas::find()->where(['id' => $id, "isDeleted" => 0])->one();

        return $this->render('vercita', [
            'cita' =>$cita,
           // 'entregasdetalle' => Diariodetalle::find()->where(['diario' => $entregas->diario, "isDeleted" => 0])->all(),
        ]);

    }


}
