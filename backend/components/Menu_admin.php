<?php
namespace backend\components;
use Yii;
use yii\helpers\Url;
use backend\models\Configuracion;
use common\models\Cuentas;
use yii\base\Component;
use yii\base\InvalidConfigException;
use common\models\Menuadmin;
use common\models\Roles;
use common\models\Rolespermisodef;
use common\models\Rolespermisos;
use common\models\Rolesusuario;
use backend\components\Log_errores;



/**
 * Created by VSCODE.
 * User: Mario Aguilar
 * Date: 27/12/21
 * Time: 11:47
 */

class Menu_admin extends Component
{

    public function getMenu($tipo,$array=true,$orderby,$limit,$all=true)
    {
        if ($all){
            $asiento= Cuentas::find()->where(["isDeleted"=>0])->all();
        }else{
            $asiento= Cuentas::find()->where(["isDeleted"=>0])->one();
        }
    }

    public function getMenuadmin($rol=0,$context='')
    {
        if ($all){

        }else{

        }
        //$menu=['label' => 'Login', 'url' => ['site/login'], 'visible' => Yii::$app->user->isGuest];
        $menuModel= Menuadmin::find()->where(["tipo"=>"WEB","idparent"=>"0","estatus"=>"ACTIVO","isDeleted"=>0])->orderBy(["orden"=>SORT_ASC])->all();
        $rolusuario=Rolesusuario::find()->where(["idusuario"=>Yii::$app->user->identity->id,"estatus"=>"ACTIVO","isDeleted"=>0])->one();
        if ($rolusuario){
            $rol=$rolusuario["idrol"];
            $nombrerol= $rolusuario->idrol0->nombre;
            $permisos=Rolespermisos::find()->where(["idrol"=>$rol,"estatus"=>"ACTIVO","isDeleted"=>0])->all();
            $permisosdef=Rolespermisodef::find()->where(["estatus"=>"ACTIVO","isDeleted"=>0])->all();
            $permitidomenu=false;
            foreach ($menuModel as $key => $data) {
                //$permisosdef=Rolespermisodef::find()->where(["idmenu"=>$data->id,"estatus"=>"ACTIVO","isDeleted"=>0])->one();
                //echo $data->id;
                //var_dump($permisosdef);
                $permitidomenu=false;
                
                $arrayPermisos= array();
                $submodulos= array();
                foreach ($permisos as $key => $valueper) {
                    foreach ($valueper->idmodulo0 as $key => $valueperdet) {
                        //$submodulos[]=$valueperdet;
                        //var_dump($valueper);
                         
                        echo ($valueperdet["idmenu"].' => '.$valueper->id.'| ');
                        if ($valueperdet["idmenu"]==$valueper->id){$permitidomenu=true;}
                    }
                    if ($valueper->idsubmodulo){
                        foreach ($valueper->idsubmodulo0 as $key => $valuepersubdet) {
                            $submodulos[]=$valuepersubdet["nombreint"];
                            //var_dump($valueper);
                            //echo $valueperdet["nombreint"];
                        }
                    }
                    
                   
                }
                foreach ($permisosdef as $key => $valuedef) {
                    if ($valuedef["idmenu"]==$data->id){$permitidomenu=true;}
                }
                //var_dump($submodulos);
                
                if ($permitidomenu){
                    $subMenuModel= Menuadmin::find()->where(["tipo"=>"WEB","idparent"=>$data->id,"estatus"=>"ACTIVO","isDeleted"=>0])->orderBy(["orden"=>SORT_ASC])->all();
                    if ($subMenuModel)
                    {
                        $subMenu= array();
                        foreach ($subMenuModel as $key => $data2) {
                            //if ($data2->nombre=="Mensajes"){ $template='<a href="{url}">{icon} {label}<span class="pull-right-container"><small class="label pull-right bg-yellow">123</small></span></a>'; }
                            if ($data2->nombre=="Mensajes"){
                                $template='<a href="{url}">{icon} {label}<span class="pull-right-container"><small class="label pull-right bg-green">0</small></span></a>';
                                $subMenu[]=array('label' => $data2->nombre,'options'=> ['data-class'=>'submenu1'], 'icon' => $data2->icono, 'url' => [$data2->link],'active' => '/'.$context == $data2->link,'template'=>$template);
                            }else{
                                $permitidosubmenu=false;
                                //echo '||'.$permisonom=$data2->rolpermiso.'||';
                                //var_dump ($submodulos);
                                foreach ($submodulos as $valsubmodulo) {
                                    //var_dump($valueper);
                                    //if ($valueperdet["nombreint"]==$valueper->id){}
                                    //echo $valueperdet["nombreint"];
                                    //echo $data2->rolpermiso;
                                    //echo ' || '.$permisonom. ' => '.$valsubmodulo.'|' ;
                                    if ($data2->rolpermiso==$valsubmodulo){$permitidosubmenu=true; }
                                }
                                if ($permitidosubmenu){
                                    $subMenu[]=array('label' => $data2->nombre,'options'=> ['data-class'=>'submenu2'], 'icon' => $data2->icono, 'url' => [$data2->link],'active' => '/'.$context == $data2->link);
                                }
                            }
                        }
                        $menu[]= array('label' => $data->nombre, 'icon' => $data->icono,'options'=> ['data-class'=>'menu1'], 'items' => $subMenu);
                    }else{
                    $menu[]= array('label' => $data->nombre, 'icon' => $data->icono,'options'=> ['data-class'=>'menu2'], 'url' => [$data->link]);
                    }
                }

            }
        }
        return $menu;
    }

    public function getPermiso($id,$condicion=NULL,$itemsret=NULL)
    {
        $result=array();
        if ($id){
            $result= Cuentas::find()->where(["codigoant"=>$id])->one();
            if ($result)
            {
                $result=$result["codigoant"].' ('.$result["nombre"].')';
            }else{
                $result="NINGUNO";
            }
        }else{
            $result= false;
        }
        return $result;
    }

    public function Nuevo($roles)
    {
        //$date = date("Y-m-d H:i:s");
        $idmenu=0;
        $modelMenu= new Menuadmin;
        $result=false;
        if ($roles):
            $modelMenu->nombre=$roles["nombre"];
            $modelMenu->icono=$roles["icono"];
            $modelMenu->link=$roles["link"];
            $modelMenu->orden=$roles["orden"];
            $modelMenu->idparent=$roles["superior"];
            $modelMenu->usuarioc=Yii::$app->user->identity->id;
            $modelMenu->usuariom=Yii::$app->user->identity->id;
            //$modelMenu->fechacreacion=$roles->idfactura;
            $modelMenu->isDeleted=0;
            $modelMenu->estatus="ACTIVO";
            //var_dump($roles);
            $error=false;
            if ($modelMenu->save()):
                $error=false;
                return array("response" => true, "id" => $modelMenu->id, "mensaje"=> "Registro agregado","tipo"=>"success", "success"=>true);
            else:
                $this->callback(1,$idmenu,$modelMenu->errors,"Menu_admin -> Nuevo");
                //var_dump($modelRol->errors);
                return array("response" => true, "id" => 0, "mensaje"=> "Error al agregar el registro","tipo"=>"error", "success"=>false);
            endif;
        else:
            $this->callback(1,0,"NO POST","Menu_admin -> Nuevo");
            return array("response" => true, "id" => 0, "mensaje"=> "Error al agregar el registro","tipo"=>"error", "success"=>false);
        endif;
        return array("response" => true, "id" => 0, "mensaje"=> "Error al agregar el registro","tipo"=>"error", "success"=>false);
    }

    public function Actualizar($id,$roles)
    {
        //$date = date("Y-m-d H:i:s");
        $idmenu=0;
        $modelMenu= Menuadmin::find()->where(["id"=>$id])->one();
        $result=false;
        if ($roles):
            if ($modelMenu):
                $modelMenu->nombre=$roles["nombre"];
                $modelMenu->icono=$roles["icono"];
                $modelMenu->link=$roles["link"];
                $modelMenu->orden=$roles["orden"];
                $modelMenu->idparent=$roles["superior"];
                $modelMenu->usuariom=Yii::$app->user->identity->id;
                //$modelMenu->fechacreacion=$roles->idfactura;
                //var_dump($roles);
                $error=false;
                if ($modelMenu->save()):
                    $error=false;
                    return array("response" => true, "id" => $modelMenu->id, "mensaje"=> "Registro actualizado","tipo"=>"success", "success"=>true);
                else:
                    $this->callback(1,$idmenu,$modelMenu->errors,"Menu_admin -> Actualizar");
                    //var_dump($modelRol->errors);
                    return array("response" => true, "id" => 0, "mensaje"=> "Error al actualizar el registro","tipo"=>"error", "success"=>false);
                endif;
            else:

            endif;
        else:
            $this->callback(1,0,"NO POST","Menu_admin -> Actualizar");
            return array("response" => true, "id" => 0, "mensaje"=> "Error al actualizar el registro","tipo"=>"error", "success"=>false);
        endif;
        return array("response" => true, "id" => 0, "mensaje"=> "Error al agregar el registro","tipo"=>"error", "success"=>false);
    }

    public function callback($tipo,$id,$error,$funcion)
    {
        switch ($tipo) {
            case 1:
                $log= new Log_errores;
                $observacion="ID: ".$id;
                $log->Nuevo("MENU ADMIN",$error,$observacion,0,Yii::$app->user->identity->id);

                return true;
                break;

            default:
                # code...
                break;
        }
    }



}