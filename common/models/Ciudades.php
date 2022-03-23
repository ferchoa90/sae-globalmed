<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "ciudades".
 *
 * @property int $id
 * @property resource $nombre
 * @property string|null $sufijo
 * @property int $idpais
 * @property int $idprovincia
 * @property string $fechacreacion
 * @property int $usuariocreacion
 * @property string|null $fechaact
 * @property int|null $usuarioact
 * @property int $isDeleted
 * @property string $estatus
 *
 * @property Pais $idpais0
 * @property Provincias $idprovincia0
 * @property User $usuariocreacion0
 */
class Ciudades extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'ciudades';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['nombre', 'usuariocreacion'], 'required'],
            [['nombre', 'estatus'], 'string'],
            [['idpais', 'idprovincia', 'usuariocreacion', 'usuarioact', 'isDeleted'], 'integer'],
            [['fechacreacion', 'fechaact'], 'safe'],
            [['sufijo'], 'string', 'max' => 10],
            [['idpais'], 'exist', 'skipOnError' => true, 'targetClass' => Pais::className(), 'targetAttribute' => ['idpais' => 'id']],
            [['usuariocreacion'], 'exist', 'skipOnError' => true, 'targetClass' => User::className(), 'targetAttribute' => ['usuariocreacion' => 'id']],
            [['idprovincia'], 'exist', 'skipOnError' => true, 'targetClass' => Provincias::className(), 'targetAttribute' => ['idprovincia' => 'id']],
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
            'idpais' => 'Idpais',
            'idprovincia' => 'Idprovincia',
            'fechacreacion' => 'Fechacreacion',
            'usuariocreacion' => 'Usuariocreacion',
            'fechaact' => 'Fechaact',
            'usuarioact' => 'Usuarioact',
            'isDeleted' => 'Is Deleted',
            'estatus' => 'Estatus',
        ];
    }

    /**
     * Gets query for [[Idpais0]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getIdpais0()
    {
        return $this->hasOne(Pais::className(), ['id' => 'idpais']);
    }

    /**
     * Gets query for [[Idprovincia0]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getIdprovincia0()
    {
        return $this->hasOne(Provincias::className(), ['id' => 'idprovincia']);
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
