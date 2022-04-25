<?php
namespace backend\components;
use Yii;
use common\models\Configuracion;
use common\models\Cuentas;
use yii\base\Component;
use yii\base\InvalidConfigException;
use common\models\Roles;
use common\models\Rolespermisos;
use backend\components\Log_errores;
use common\models\Consultamedica;
use common\models\Consultamedicadet;
use common\models\Citasmedicas;
use backend\models\User;



/**
 * Created by VSCODE.
 * User: Mario Aguilar
 * Date: 13/03/21
 * Time: 14:55
 */

class Medico_consulta extends Component
{
    const MODULO='CONSULTA';

    public function getConsultamedica($tipo,$array=true,$orderby,$limit,$all=true)
    {
        if ($all){
            $asiento= Consultamedica::find()->where(["isDeleted"=>0])->all();
        }else{
            $asiento= Consultamedica::find()->where(["isDeleted"=>0])->one();
        }
    }

    public function getPaciente($id,$condicion=NULL,$itemsret=NULL)
    {
        $result=array();
        if ($id){
            $result = Consultamedica::find()->where(["isDeleted" => 0,"estatus" => "ACTIVO"])->orderBy(["apellidos" => SORT_ASC])->one();
            if ($result)
            {
                //$result=$result["nombres"].' '.$result["apellidos"].')';
                return $result;
            }else{
                $result="NINGUNO";
            }
        }else{
            $result= false;
        }
        return $result;
    }

    public function getHistoriaclinica($idpaciente,$condicion=NULL,$itemsret=NULL)
    {
        $result=array();
        if ($idpaciente){
            $result = Consultamedica::find()->where(["idpaciente"=>$idpaciente,"isDeleted" => 0,"estatus" => "ACTIVO"])->orderBy(["fechacreacion" => SORT_DESC])->all();
            if ($result)
            {
                return $result;
            }else{
                $result="NINGUNO";
            }
        }else{
            $result= false;
        }
        return $result;
    }


    public function getSelect()
    {
        $clientes = Consultamedica::find()->where(["isDeleted" => 0])->orderBy(["apellidos" => SORT_ASC])->all();
        //var_dump($clientes);
        $clientesArray=array();
        $cont=0;
        foreach ($clientes as $key => $value) {
            if ($cont==0){ $clientesArray[$cont]["value"]="Seleccione un paciente"; $clientesArray[$cont]["id"]=-1; $cont++; }
            $clientesArray[$cont]["value"]=$value->apellidos.' '.$value->nombres;
            $clientesArray[$cont]["id"]=$value->id;
            $cont++;
        }
        return $clientesArray;

    }

    public function Nuevo($data)
    {
        //$date = date("Y-m-d H:i:s");
        $idusuario=0;
        $idmodulo=0;
        $model= new Consultamedica;
        $result=false;
        $citamedica=Citasmedicas::find()->where(["id" => $data['idcita']])->one();
        //var_dump($citamedica);
        if ($data && $citamedica):
            $model->idpaciente=$data['idpaciente'];
            $model->idcitamedica=$data['idcita'];
            $model->fechacita=$citamedica->fechacita;
            $model->fechainatencion=date("Y-m-d h:i:s");
            $model->observacion="-";
            $model->horacita=$citamedica->horacita;
            $model->iddoctor=$data['iddoctor'];
            $model->idoptometrista=$data['idoptometrista'];
            $model->usuariocreacion=Yii::$app->user->identity->id;
            $model->estatus="ACTIVO";
            $model->isDeleted=0;
            if ($model->save()) {
                $modeldetalle= new Consultamedicadet;
                $modeldetalle->idconsulta=$model->id;
                $modeldetalle->causaconsulta="-";
                $modeldetalle->usolentes=$data['usolentes'];

                $modeldetalle->agudezavscod=$data['agudezavscod'];
                $modeldetalle->agudezavscoi=$data['agudezavscoi'];
                $modeldetalle->agudezavcod=$data['agudezavcod'];
                $modeldetalle->agudezavcoi=$data['agudezavcoi'];
                $modeldetalle->agudezavotr=$data['agudezavscotr'];

                $modeldetalle->visioncscod=$data['visioncercascod'];
                $modeldetalle->visioncosci=$data['visioncercascoi'];
                $modeldetalle->visionccod=$data['visioncercaccod'];
                $modeldetalle->visionccid=$data['visioncercaccoi'];
                $modeldetalle->visioncotr=$data['visioncercaotr'];

                $modeldetalle->visionlscod=$data['visionlejosscod'];
                $modeldetalle->visionlscoi=$data['visionlejosscoi'];
                $modeldetalle->visionlcod=$data['visionlejosccod'];
                $modeldetalle->visionlcoi=$data['visionlejosccoi'];
                $modeldetalle->visionlcotr=$data['visionlejosotr'];

                $modeldetalle->pioscod=$data['pioscod'];
                $modeldetalle->pioscoi=$data['pioscoi'];
                $modeldetalle->piocod=$data['piocod'];
                $modeldetalle->piocoi=$data['piocoi'];
                $modeldetalle->piootr=$data['piocotr'];

                $modeldetalle->biomicroscopia=$data['microboscopia'];
                $modeldetalle->visiondecolores=$data['visioncolores'];
                $modeldetalle->visionprofundidad=$data['visionprof'];
                $modeldetalle->reflejospup=$data['refloejospupi'];
                $modeldetalle->campovisual=$data['campovisual'];
                $modeldetalle->fondoojood=$data['fondoojood'];
                $modeldetalle->fondoojooi=$data['fondoojooi'];
                $modeldetalle->agujeroest=$data['agujeroest'];

                $modeldetalle->examenes=$data['examenes'];

                $modeldetalle->impdiag1=$data['impresion1'];
                $modeldetalle->impdiag2=$data['impresion2'];
                $modeldetalle->impdiag3=$data['impresion3'];
                $modeldetalle->cie1001=$data['cie1'];
                $modeldetalle->cie1002=$data['cie2'];
                $modeldetalle->cie1003=$data['cie3'];

                $modeldetalle->campim=$data['camping'];
                $modeldetalle->octangular=$data['octangular'];
                $modeldetalle->octm=$data['octm'];
                $modeldetalle->octn=$data['octn'];
                $modeldetalle->biood=$data['biometod'];
                $modeldetalle->bioid=$data['biometoi'];
                $modeldetalle->paquimod=$data['paquimod'];
                $modeldetalle->paquimid=$data['paquimoi'];
                $modeldetalle->ora=$data['ora'];
                $modeldetalle->topografia=$data['topografia'];
                $modeldetalle->angiog=$data['angioog'];
                $modeldetalle->ecogra=$data['ecogra'];
                $modeldetalle->endote=$data['endote'];
                $modeldetalle->ubm=$data['ubm'];
                $modeldetalle->retinografia=$data['retinografia'];

                $modeldetalle->usuariocreacion=Yii::$app->user->identity->id;
                $modeldetalle->estatus="ACTIVO";
                $modeldetalle->isDeleted=0;


                if ($modeldetalle->save()) {
                    $error=false;
                    return array("response" => true, "id" => $model->id, "mensaje"=> "Registro agregado","tipo"=>"success", "success"=>true);
                }else{
                    $this->callback(1,$idusuario,$modeldetalle->errors);
                    return array("response" => true, "id" => 0, "mensaje"=> "Error al agregar el registro","tipo"=>"error", "success"=>false);

                }
                //$this->callback(1,$idusuario,$model->errors);
            } else {
                $this->callback(1,$idusuario,$model->errors);
                return array("response" => true, "id" => 0, "mensaje"=> "Error al agregar el registro","tipo"=>"error", "success"=>false);
            }
        else:
            $log= new Log_errores;
            $observacion="ID: 0";
            $error="NO POST";
            $log->Nuevo(self::MODULO." :: Medico_consultamedica ",$error,$observacion,0,Yii::$app->user->identity->id);
            return array("response" => true, "id" => 0, "mensaje"=> "Error al agregar el registro","tipo"=>"error", "success"=>false);
        endif;

        return array("response" => true, "id" => 0, "mensaje"=> "Error al agregar el registro","tipo"=>"error", "success"=>false);
    }

    public function Editar($data)
    {
        $id=0;
        $result=false;
        if ($data):
            $model= Consultamedica::find()->where(["id"=>$data['id']])->one();
            $model->nombres=$data['nombres'];
            $model->apellidos=$data['apellidos'];
            $model->cedula=$data['cedula'];
            $model->alerta=$data['alerta'];
            $model->idgenero=$data['genero'];
            $model->idciudad=$data['ciudad'];
            $model->idprofesion=$data['profesion'];
            $model->direccion=$data['direccion'];
            $model->correo=$data['correo'];
            $model->fechanac=$data['fechanac'];
            $model->tiposangre=$data['tiposangre'];
            $model->antecedentesp=$data['antecedentesp'];
            $model->antecedenteso=$data['antecedenteso'];
            $model->antecedentesf=$data['antecedentesf'];
            $model->enfermedada=$data['enfermedada'];
            $model->antecedentesf=$data['antecedentesf'];
            $model->telefonoemer=$data['telefonoemer'];
            $model->direccionemer=$data['direccionemer'];
            $model->usuarioact=Yii::$app->user->identity->id;
            $model->fechaact= date("Y-m-d H:i:s");
            if ($model->save()) {
                $error=false;
                return array("response" => true, "id" => $model->id, "mensaje"=> "Registro actualizado","tipo"=>"success", "success"=>true);
            } else {
                $this->callback(1,$id,$model->errors);
                return array("response" => true, "id" => 0, "mensaje"=> "Error al actualizar el registro","tipo"=>"error", "success"=>false);
            }
        else:
            $log= new Log_errores;
            $observacion="ID: 0";
            $error="NO POST";
            $log->Nuevo(self::MODULO." :: Medico_consultamedica -> editar",$error,$observacion,0,Yii::$app->user->identity->id);
            return array("response" => true, "id" => 0, "mensaje"=> "Error al actualizar el registro","tipo"=>"error", "success"=>false);
        endif;

        return array("response" => true, "id" => 0, "mensaje"=> "Error al actualizar el registro","tipo"=>"error", "success"=>false);
    }

    public function Eliminar($id)
    {
        //$date = date("Y-m-d H:i:s");
        $result=false;
        if ($id):
            //$data = $usuario;
            $data= Consultamedica::find()->where(["id"=>$id])->one();
            $data->isDeleted=1;
            if ($data->save()) {
                $error=false;
                return array("response" => true, "id" => $data->id, "mensaje"=> "Registro eliminado","tipo"=>"success", "success"=>true);
            } else {
                $this->callback(1,$id,$data->errors);
                return array("response" => true, "id" => 0, "mensaje"=> "Error al eliminar el registro","tipo"=>"error", "success"=>false);
            }
        else:
            $log= new Log_errores;
            $observacion="ID: 0";
            $error="NO ID";
            $log->Nuevo(self::MODULO." :: Medico_consultamedica -> eliminar",$error,$observacion,0,Yii::$app->user->identity->id);
            return array("response" => true, "id" => 0, "mensaje"=> "Error al eliminar el registro","tipo"=>"error", "success"=>false);
        endif;

        return array("response" => true, "id" => 0, "mensaje"=> "Error al eliminar el registro","tipo"=>"error", "success"=>false);
    }

    public function Nuevaficha($data)
    {
        //$date = date("Y-m-d H:i:s");
        $idusuario=0;
        $idmodulo=0;
        $model= new Consultamedica;
        $result=false;
        if ($data):
            $model->nombres=$data['nombres'];
            $model->apellidos=$data['apellidos'];
            $model->cedula=$data['cedula'];
            $model->idgenero=$data['genero'];
            $model->idciudad=$data['ciudad'];
            $model->direccion=$data['direccion'];
            $model->correo=$data['correo'];
            $model->alerta=$data['alerta'];
            $model->fechanac=$data['fechanac'];
            $model->idprofesion=$data['profesion'];
            $model->tiposangre=$data['tiposangre'];
            $model->antecedentesp=$data['antecedentesp'];
            $model->antecedenteso=$data['antecedenteso'];
            $model->antecedentesf=$data['antecedentesf'];
            $model->enfermedada=$data['enfermedada'];
            $model->antecedentesf=$data['antecedentesf'];
            $model->telefonoemer=$data['telefonoemer'];
            $model->direccionemer=$data['direccionemer'];
            $model->usuariocreacion=Yii::$app->user->identity->id;
            $model->estatus="ACTIVO";
            $model->isDeleted=0;
            if ($model->save()) {
                $idusuario=$model->id;
                $error=false;
                //$this->callback(1,$idusuario,$model->errors);
                return array("response" => true, "id" => $model->id, "mensaje"=> "Registro agregado","tipo"=>"success", "success"=>true);
            } else {
                $this->callback(1,$idusuario,$model->errors);
                return array("response" => true, "id" => 0, "mensaje"=> "Error al agregar el registro","tipo"=>"error", "success"=>false);
            }
        else:
            $log= new Log_errores;
            $observacion="ID: 0";
            $error="NO POST";
            $log->Nuevo(self::MODULO." :: Medico_consultamedica ",$error,$observacion,0,Yii::$app->user->identity->id);
            return array("response" => true, "id" => 0, "mensaje"=> "Error al agregar el registro","tipo"=>"error", "success"=>false);
        endif;

        return array("response" => true, "id" => 0, "mensaje"=> "Error al agregar el registro","tipo"=>"error", "success"=>false);
    }

    public function callback($tipo,$id,$error)
    {
        switch ($tipo) {
            case 1:


                $log= new Log_errores;
                $observacion="ID: ".$id;
                $log->Nuevo("USUARIO ",$error,$observacion,0,Yii::$app->user->identity->id);
                //return true;
                break;

            default:
                # code...
                break;
        }
    }



}