<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "doctores".
 *
 * @property int $id
 * @property resource $nombres
 * @property resource $apellidos
 * @property string $cedula
 * @property resource|null $direccion
 * @property string|null $telefono
 * @property resource $correo
 * @property string|null $fechanac
 * @property string|null $tiposangre
 * @property int $idprofesion
 * @property int $isDeleted
 * @property string $fechacreacion
 * @property string|null $fechaact
 * @property int $usuariocreacion
 * @property int|null $usuarioact
 * @property int $idususistem
 * @property string $estatus
 *
 * @property Citasmedicas[] $citasmedicas
 * @property Profesion $idprofesion0
 * @property User $usuariocreacion0
 */
class Doctores extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'doctores';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['nombres', 'apellidos', 'cedula', 'correo', 'usuariocreacion'], 'required'],
            [['nombres', 'apellidos', 'direccion', 'correo', 'estatus'], 'string'],
            [['fechanac', 'fechacreacion', 'fechaact'], 'safe'],
            [['idprofesion', 'isDeleted', 'usuariocreacion', 'usuarioact', 'idususistem'], 'integer'],
            [['cedula'], 'string', 'max' => 10],
            [['telefono'], 'string', 'max' => 40],
            [['tiposangre'], 'string', 'max' => 2],
            [['usuariocreacion'], 'exist', 'skipOnError' => true, 'targetClass' => User::className(), 'targetAttribute' => ['usuariocreacion' => 'id']],
            [['idprofesion'], 'exist', 'skipOnError' => true, 'targetClass' => Profesion::className(), 'targetAttribute' => ['idprofesion' => 'id']],
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
            'fechanac' => 'Fechanac',
            'tiposangre' => 'Tiposangre',
            'idprofesion' => 'Idprofesion',
            'isDeleted' => 'Is Deleted',
            'fechacreacion' => 'Fechacreacion',
            'fechaact' => 'Fechaact',
            'usuariocreacion' => 'Usuariocreacion',
            'usuarioact' => 'Usuarioact',
            'idususistem' => 'Idususistem',
            'estatus' => 'Estatus',
        ];
    }

    /**
     * Gets query for [[Citasmedicas]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCitasmedicas()
    {
        return $this->hasMany(Citasmedicas::className(), ['iddoctor' => 'id']);
    }

    /**
     * Gets query for [[Idprofesion0]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getIdprofesion0()
    {
        return $this->hasOne(Profesion::className(), ['id' => 'idprofesion']);
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
