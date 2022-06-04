<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "citasmedicas".
 *
 * @property int $id
 * @property int $idusuario
 * @property resource $observacion
 * @property string $fechacita
 * @property string $horacita
 * @property int|null $isDeleted
 * @property string $fechacreacion
 * @property string $fechaact
 * @property int $iddoctor
 * @property int $usuariocreacion
 * @property int|null $usuarioact
 * @property string $estatuscita
 * @property string $via
 * @property string $estatus
 *
 * @property Doctores $iddoctor0
 * @property Pacientes $idusuario0
 * @property User $usuariocreacion0
 */
class Citasmedicas extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'citasmedicas';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['idusuario' , 'fechacita', 'horacita',   'usuariocreacion'], 'required'],
            [['idusuario', 'isDeleted', 'iddoctor', 'usuariocreacion', 'usuarioact'], 'integer'],
            [['observacion', 'estatuscita', 'via', 'estatus'], 'string'],
            [['fechacita', 'horacita', 'fechacreacion' ], 'safe'],
            [['idusuario'], 'exist', 'skipOnError' => true, 'targetClass' => Pacientes::className(), 'targetAttribute' => ['idusuario' => 'id']],
            [['usuariocreacion'], 'exist', 'skipOnError' => true, 'targetClass' => User::className(), 'targetAttribute' => ['usuariocreacion' => 'id']],
            [['iddoctor'], 'exist', 'skipOnError' => true, 'targetClass' => User::className(), 'targetAttribute' => ['iddoctor' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'idusuario' => 'Idusuario',
            'observacion' => 'Observacion',
            'fechacita' => 'Fechacita',
            'horacita' => 'Horacita',
            'isDeleted' => 'Is Deleted',
            'fechacreacion' => 'Fechacreacion',
            'fechaact' => 'Fechaact',
            'iddoctor' => 'Iddoctor',
            'usuariocreacion' => 'Usuariocreacion',
            'usuarioact' => 'Usuarioact',
            'estatuscita' => 'Estatuscita',
            'via' => 'Via',
            'estatus' => 'Estatus',
        ];
    }

    /**
     * Gets query for [[Iddoctor0]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getIddoctor0()
    {
        return $this->hasOne(User::className(), ['id' => 'iddoctor']);
    }

    /**
     * Gets query for [[Idusuario0]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getIdusuario0()
    {
        return $this->hasOne(Pacientes::className(), ['id' => 'idusuario']);
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
