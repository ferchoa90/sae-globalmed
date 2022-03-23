<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "sexo".
 *
 * @property int $id
 * @property resource $nombre
 * @property string|null $sufijo
 * @property string $fechacreacion
 * @property int|null $usuariocreacion
 * @property string|null $fechaact
 * @property int|null $usuarioact
 * @property string $estatus
 *
 * @property User $usuariocreacion0
 */
class Sexo extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'sexo';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['nombre'], 'required'],
            [['nombre', 'estatus'], 'string'],
            [['fechacreacion', 'fechaact'], 'safe'],
            [['usuariocreacion', 'usuarioact'], 'integer'],
            [['sufijo'], 'string', 'max' => 5],
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
            'nombre' => 'Nombre',
            'sufijo' => 'Sufijo',
            'fechacreacion' => 'Fechacreacion',
            'usuariocreacion' => 'Usuariocreacion',
            'fechaact' => 'Fechaact',
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
}
