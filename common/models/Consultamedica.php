<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "consultamedica".
 *
 * @property int $id
 * @property int $idcitamedica
 * @property int $idpaciente
 * @property resource $observacion
 * @property string $fechacita
 * @property string $horacita
 * @property int|null $isDeleted
 * @property string $fechacreacion
 * @property string|null $fechaact
 * @property int $iddoctor
 * @property string|null $fechainatencion
 * @property string|null $fechafinatencion
 * @property int $usuariocreacion
 * @property int|null $usuarioact
 * @property string $estatus
 *
 * @property Citasmedicas $idcitamedica0
 * @property Pacientes $idpaciente0
 * @property User $usuariocreacion0
 */
class Consultamedica extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'consultamedica';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['idcitamedica', 'idpaciente', 'observacion', 'fechacita', 'horacita', 'usuariocreacion'], 'required'],
            [['idcitamedica', 'idpaciente', 'isDeleted', 'iddoctor', 'usuariocreacion', 'usuarioact'], 'integer'],
            [['observacion', 'estatus'], 'string'],
            [['fechacita', 'horacita', 'fechacreacion', 'fechaact', 'fechainatencion', 'fechafinatencion'], 'safe'],
            [['idpaciente'], 'exist', 'skipOnError' => true, 'targetClass' => Pacientes::className(), 'targetAttribute' => ['idpaciente' => 'id']],
            [['idcitamedica'], 'exist', 'skipOnError' => true, 'targetClass' => Citasmedicas::className(), 'targetAttribute' => ['idcitamedica' => 'id']],
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
            'idcitamedica' => 'Idcitamedica',
            'idpaciente' => 'Idpaciente',
            'observacion' => 'Observacion',
            'fechacita' => 'Fechacita',
            'horacita' => 'Horacita',
            'isDeleted' => 'Is Deleted',
            'fechacreacion' => 'Fechacreacion',
            'fechaact' => 'Fechaact',
            'iddoctor' => 'Iddoctor',
            'fechainatencion' => 'Fechainatencion',
            'fechafinatencion' => 'Fechafinatencion',
            'usuariocreacion' => 'Usuariocreacion',
            'usuarioact' => 'Usuarioact',
            'estatus' => 'Estatus',
        ];
    }

    /**
     * Gets query for [[Idcitamedica0]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getIdcitamedica0()
    {
        return $this->hasOne(Citasmedicas::className(), ['id' => 'idcitamedica']);
    }

    public function getConsultamedica0()
    {
        return Consultamedicadet::find()->where(["idconsulta"=>$this->id])->one();
        //return $this->hasOne(Consultamedicadet::className(), ['idconsulta' => 'id']);
    }

    /**
     * Gets query for [[Idpaciente0]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getIdpaciente0()
    {
        return $this->hasOne(Pacientes::className(), ['id' => 'idpaciente']);
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
}
