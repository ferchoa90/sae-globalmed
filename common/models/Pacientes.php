<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "pacientes".
 *
 * @property int $id
 * @property resource $nombres
 * @property resource $apellidos
 * @property string $cedula
 * @property resource|null $direccion
 * @property string|null $telefono
 * @property resource $correo
 * @property int|null $idhistorialc
 * @property int|null $idenfermedades
 * @property resource|null $nombresemer
 * @property string|null $telefonoemer
 * @property resource|null $direccionemer
 * @property string|null $fechanac
 * @property string|null $tiposangre
 * @property int $isDeleted
 * @property string $fechacreacion
 * @property string|null $fechaact
 * @property int $usuariocreacion
 * @property int|null $usuarioact
 * @property string $estatus
 *
 * @property User $usuariocreacion0
 */
class Pacientes extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'pacientes';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['nombres', 'apellidos', 'cedula', 'correo', 'usuariocreacion'], 'required'],
            [['nombres', 'apellidos', 'direccion', 'correo', 'nombresemer', 'direccionemer', 'estatus'], 'string'],
            [['idhistorialc', 'idenfermedades', 'isDeleted', 'usuariocreacion', 'usuarioact'], 'integer'],
            [['fechanac', 'fechacreacion', 'fechaact'], 'safe'],
            [['cedula'], 'string', 'max' => 10],
            [['telefono', 'telefonoemer'], 'string', 'max' => 40],
            [['tiposangre'], 'string', 'max' => 2],
            [['usuariocreacion'], 'exist', 'skipOnError' => true, 'targetClass' => User::className(), 'targetAttribute' => ['usuariocreacion' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'nombres' => 'Nombres',
            'apellidos' => 'Apellidos',
            'cedula' => 'Cedula',
            'direccion' => 'Direccion',
            'telefono' => 'Telefono',
            'correo' => 'Correo',
            'idhistorialc' => 'Idhistorialc',
            'idenfermedades' => 'Idenfermedades',
            'nombresemer' => 'Nombresemer',
            'telefonoemer' => 'Telefonoemer',
            'direccionemer' => 'Direccionemer',
            'fechanac' => 'Fechanac',
            'tiposangre' => 'Tiposangre',
            'isDeleted' => 'Is Deleted',
            'fechacreacion' => 'Fechacreacion',
            'fechaact' => 'Fechaact',
            'usuariocreacion' => 'Usuariocreacion',
            'usuarioact' => 'Usuarioact',
            'estatus' => 'Estatus',
        ];
    }

    /**
     * Gets query for [[Usuariocreacion0]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getUsuariocreacion0()
    {
        return $this->hasOne(User::className(), ['id' => 'usuariocreacion']);
    }

    public function getUsuarioactualizacion0()
    {
        $response=$this->hasOne(User::className(), ['id' => 'usuarioact']);
        if (!$this->usuarioact){ $response=(object) $array; $response->username="No registra";}
        return $response;
    }
}
