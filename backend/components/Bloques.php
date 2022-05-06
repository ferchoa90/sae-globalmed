<?php
namespace backend\components;
use Yii;
use backend\models\Configuracion;
use yii\base\Component;
use yii\base\InvalidConfigException;


/**
 * Created by VSCODE.
 * User: Mario Aguilar
 * Date: 06/09/21
 * Time: 22:22
 */

class Bloques extends Component
{

    public function getBloqueArray($objetos)
    {
        echo '<div class="row col-12">';
        foreach($objetos as $obj):
            //var_dump($objetos);

            switch ($obj['tipo']) {
                case 'bloquediv':
                    echo $this->getBloqueDiv($obj['nombre'],$obj['id'],$obj['titulo'],$obj['clase'],$obj['style'],$obj['col'],$obj['tipocolor'],$obj['adicional'],$obj['contenido']);
                    break;

                case 'separador':
                    //echo $this->getSeparador($obj['clase'],$obj['estilo'], $obj['color']);
                    break;
                default:

                    break;
            }

        endforeach;
        echo '</div>';
    }

    public function getBloque($tipo, $nombre='', $id='', $titulo='', $clase='', $style='', $col='',$tipocolor='', $adicional,$contenido='')
    {
        //$date = date("Y-m-d H:i:s");
        switch ($tipo) {
            case 'bloquediv':
                return $this->getBloqueDiv($nombre, $id, $titulo, $clase, $style, $col,$tipocolor, $adicional,$contenido);
                break;

            default:
                return "Debe indicar un tipo de bloque";
                break;
        }
        return $date;
    }

    private static function getBloqueDiv($nombre='', $id='', $titulo='', $clase='', $style='', $col='',$tipocolor='', $adicional,$contenido='')
    {
        $classdefault='col-md-12 col-xs-12 ';
        $tipocolordefault='card card-primary';
        $gradientdefault='bg-gradient-primary';

        switch ($tipocolor) {
            case 'azul':
                $tipocolor='card card-primary';
                $gradient='bg-gradient-primary';
                break;

            case 'verde':
                $tipocolor='card card-success';
                $gradient='bg-gradient-success';

                break;

            case 'rojo':
                $tipocolor='card card-danger';
                $gradient='bg-gradient-danger';
                break;

            case 'verdesuave':
                $tipocolor='card card-info';
                $gradient='bg-gradient-info';

                break;

            case 'amarillo':
                $tipocolor='card card-warning';
                $gradient='bg-gradient-warning';
                break;

            case 'plomo' || 'gris':
                $tipocolor='card card-secondary';
                $gradient='bg-gradient-secondary';
                break;

            default:
                $tipocolor=$tipocolordefault;
                $gradient=$gradientdefault;
                break;
        }

        switch ($clase) {
            case !'':
                $clase=$clase;
                break;

            default:
                $clase=$classdefault;
                break;
        }

        $div='
        <div class="'.$clase.' '.$col.'">
            <div id="'.$id.'" nombre="'.$nombre.'" style="box-shadow: 3px 2px 2px #ccc;">
                <div class="'.$tipocolor.'">
                    <div class="card-header '.$gradient.'">
                        <h3 class="card-title">'.$titulo.'</h3>
                    </div>

                    <div class="card-body">'.$contenido.'</div>
                </div>
            </div>
        </div>
        ';
        $resultado=$div;
        return $resultado;
    }

    public function getSeparador($clase='',$estilo='', $color='')
    {
        switch ($color) {
            case !'':
                return '<hr style="color: '.$color.'" />';
                break;

            default:
                return '<hr style="color: #0056b2;" />';
                break;
        }
    }
}