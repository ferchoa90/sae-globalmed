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
use common\models\Pacientes;
use backend\models\User;



/**
 * Created by VSCODE.
 * User: Mario Aguilar
 * Date: 13/03/21
 * Time: 14:55
 */

class Medico_pacientes extends Component
{

    public function getPacientes($tipo,$array=true,$orderby,$limit,$all=true)
    {
        if ($all){
            $asiento= Pacientes::find()->where(["isDeleted"=>0])->all();
        }else{
            $asiento= Pacientes::find()->where(["isDeleted"=>0])->one();
        }
    }

    public function getPaciente($id,$condicion=NULL,$itemsret=NULL)
    {
        $result=array();
        if ($id){
            $result= Pacientes::find()->where(["id"=>$id])->one();
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

    public function Nuevo($usuario)
    {
        //$date = date("Y-m-d H:i:s");
        $idusuario=0;
        $idmodulo=0;
        $modelPaciente= new Pacientes;
        $result=false;
        if ($usuario):
            $data = $usuario;
            $modelPaciente->password_hash=Yii::$app->getSecurity()->generatePasswordHash($data['clave']);
            $modelPaciente->nombres=$data['nombres'];
            $modelPaciente->apellidos=$data['apellidos'];
            $modelPaciente->username=$data['nombreusuario'];
            $modelPaciente->auth_key='qBsm2pBnvWqODXkw8497oMu6BCKknip-';
            $modelPaciente->email=$data['correo'];
            $modelPaciente->idsucursal=1;
            $modelPaciente->idrol=$data['rol'];
            $modelPaciente->cedula=$data['cedula'];
            //$modelPaciente->estatus="Activo";
            $modelPaciente->fotoperfil="user2-160x160.png";
            $modelPaciente->status=10;
            $modelPaciente->isDeleted=0;
            $modelPaciente->creado_por=Yii::$app->user->identity->id;
            $modelPaciente->created_at=Yii::$app->user->identity->id;
            $modelPaciente->updated_at=Yii::$app->user->identity->id;

            if ($modelPaciente->save()) {
                $idusuario=$modelPaciente->id;
                $error=false; 
                //$this->callback(1,$idusuario,$modelPaciente->errors);
                return array("response" => true, "id" => $modelPaciente->id, "mensaje"=> "Registro agregado","tipo"=>"success", "success"=>true); 
            } else {
                $this->callback(1,$idusuario,$modelPaciente->errors);
                return array("response" => true, "id" => 0, "mensaje"=> "Error al agregar el registro","tipo"=>"error", "success"=>false);
            }    
        else:
            $log= new Log_errores;
            $observacion="ID: 0";
            $error="NO POST";
            $log->Nuevo("USUARIOS :: Usuarios_sistema ",$error,$observacion,0,Yii::$app->user->identity->id);
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