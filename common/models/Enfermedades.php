<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "enfermedades".
 *
 * @property int $id
 * @property string|null $codigo
 * @property string $nombre
 * @property resource $descripcion
 * @property string|null $simbolo
 * @property string $sexo
 * @property int|null $edadmin
 * @property int|null $edadmax
 * @property resource|null $noafecciones
 * @property int $isDeleted
 * @property string $fechacreacion
 * @property int $usuariocreacion
 * @property int|null $usuarioact
 * @property string|null $fechaact
 * @property string $estatus
 *
 * @property User $usuariocreacion0
 */
class Enfermedades extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'enfermedades';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['nombre', 'descripcion', 'usuariocreacion'], 'required'],
            [['descripcion', 'sexo', 'noafecciones', 'estatus'], 'string'],
            [['edadmin', 'edadmax', 'isDeleted', 'usuariocreacion', 'usuarioact'], 'integer'],
            [['fechacreacion', 'fechaact'], 'safe'],
            [['codigo', 'simbolo'], 'string', 'max' => 20],
            [['nombre'], 'string', 'max' => 300],
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
            'codigo' => 'Codigo',
            'nombre' => 'Nombre',
            'descripcion' => 'Descripcion',
            'simbolo' => 'Simbolo',
            'sexo' => 'Sexo',
            'edadmin' => 'Edadmin',
            'edadmax' => 'Edadmax',
            'noafecciones' => 'Noafecciones',
            'isDeleted' => 'Is Deleted',
            'fechacreacion' => 'Fechacreacion',
            'usuariocreacion' => 'Usuariocreacion',
            'usuarioact' => 'Usuarioact',
            'fechaact' => 'Fechaact',
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
