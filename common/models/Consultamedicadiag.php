<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "consultamedicadiag".
 *
 * @property int $id
 * @property int $idconsulta
 * @property string|null $orbita
 * @property string|null $globos
 * @property string|null $lagrim
 * @property string|null $escler
 * @property string|null $conjunt
 * @property string|null $limbo
 * @property string|null $parpados
 * @property string|null $camant
 * @property string|null $iris
 * @property string|null $cornea
 * @property string|null $presion
 * @property string|null $piocc
 * @property string|null $reflpup
 * @property string|null $cristal
 * @property string|null $midria
 * @property string|null $observacion
 * @property string|null $metodo
 * @property string|null $vitreo
 * @property string|null $papila
 * @property string|null $polpost
 * @property string|null $macula
 * @property string|null $ecuador
 * @property string|null $vasos
 * @property string|null $perif
 * @property string|null $nervioopt
 * @property resource|null $observacion2
 * @property string|null $visioncol
 * @property string|null $esteriopsis
 * @property string|null $ordenatencion
 * @property string|null $yaglaser
 * @property string|null $segantodp
 * @property string|null $segantodd
 * @property string|null $segantidp
 * @property string|null $segantidd
 * @property resource|null $compliant
 * @property string|null $segposodp
 * @property string|null $segaposodd
 * @property string|null $segposidp
 * @property string|null $segposidd
 * @property resource|null $complipost
 * @property string|null $laserrodt
 * @property string|null $laserrodti
 * @property string|null $laserrodn
 * @property string|null $laserrodp
 * @property string|null $laserroidt
 * @property string|null $laserroiti
 * @property string|null $laserroin
 * @property string|null $laserroip
 * @property resource|null $med1
 * @property resource|null $presc1
 * @property resource|null $med2
 * @property resource|null $presc2
 * @property resource|null $med3
 * @property resource|null $presc3
 * @property resource|null $med4
 * @property resource|null $presc4
 * @property resource|null $med5
 * @property resource|null $presc5
 * @property int|null $isDeleted
 * @property string $fechacreacion
 * @property string|null $fechaact
 * @property int $usuariocreacion
 * @property int|null $usuarioact
 * @property string $estatus
 *
 * @property Consultamedica $idconsulta0
 */
class Consultamedicadiag extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'consultamedicadiag';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['idconsulta', 'usuariocreacion'], 'required'],
            [['idconsulta', 'isDeleted', 'usuariocreacion', 'usuarioact'], 'integer'],
            [['observacion2', 'compliant', 'complipost', 'med1', 'presc1', 'med2', 'presc2', 'med3', 'presc3', 'med4', 'presc4', 'med5', 'presc5', 'estatus'], 'string'],
            [['fechacreacion', 'fechaact'], 'safe'],
            [['orbita', 'globos', 'lagrim', 'escler', 'conjunt', 'limbo', 'parpados', 'camant', 'iris', 'cornea', 'presion', 'piocc', 'reflpup', 'cristal', 'midria', 'observacion', 'metodo', 'vitreo', 'papila', 'polpost', 'perif', 'nervioopt', 'visioncol', 'esteriopsis', 'ordenatencion', 'yaglaser', 'segantodd', 'segantidp', 'segantidd', 'segposodp', 'segaposodd', 'segposidp', 'segposidd', 'laserrodt', 'laserrodti', 'laserrodn', 'laserrodp', 'laserroidt', 'laserroiti', 'laserroin', 'laserroip'], 'string', 'max' => 100],
            [['macula', 'ecuador', 'vasos', 'segantodp'], 'string', 'max' => 100],
            [['idconsulta'], 'exist', 'skipOnError' => true, 'targetClass' => Consultamedica::className(), 'targetAttribute' => ['idconsulta' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'idconsulta' => 'Idconsulta',
            'orbita' => 'Orbita',
            'globos' => 'Globos',
            'lagrim' => 'Lagrim',
            'escler' => 'Escler',
            'conjunt' => 'Conjunt',
            'limbo' => 'Limbo',
            'parpados' => 'Parpados',
            'camant' => 'Camant',
            'iris' => 'Iris',
            'cornea' => 'Cornea',
            'presion' => 'Presion',
            'piocc' => 'Piocc',
            'reflpup' => 'Reflpup',
            'cristal' => 'Cristal',
            'midria' => 'Midria',
            'observacion' => 'Observacion',
            'metodo' => 'Metodo',
            'vitreo' => 'Vitreo',
            'papila' => 'Papila',
            'polpost' => 'Polpost',
            'macula' => 'Macula',
            'ecuador' => 'Ecuador',
            'vasos' => 'Vasos',
            'perif' => 'Perif',
            'nervioopt' => 'Nervioopt',
            'observacion2' => 'Observacion2',
            'visioncol' => 'Visioncol',
            'esteriopsis' => 'Esteriopsis',
            'ordenatencion' => 'Ordenatencion',
            'yaglaser' => 'Yaglaser',
            'segantodp' => 'Segantodp',
            'segantodd' => 'Segantodd',
            'segantidp' => 'Segantidp',
            'segantidd' => 'Segantidd',
            'compliant' => 'Compliant',
            'segposodp' => 'Segposodp',
            'segaposodd' => 'Segaposodd',
            'segposidp' => 'Segposidp',
            'segposidd' => 'Segposidd',
            'complipost' => 'Complipost',
            'laserrodt' => 'Laserrodt',
            'laserrodti' => 'Laserrodti',
            'laserrodn' => 'Laserrodn',
            'laserrodp' => 'Laserrodp',
            'laserroidt' => 'Laserroidt',
            'laserroiti' => 'Laserroiti',
            'laserroin' => 'Laserroin',
            'laserroip' => 'Laserroip',
            'med1' => 'Med1',
            'presc1' => 'Presc1',
            'med2' => 'Med2',
            'presc2' => 'Presc2',
            'med3' => 'Med3',
            'presc3' => 'Presc3',
            'med4' => 'Med4',
            'presc4' => 'Presc4',
            'med5' => 'Med5',
            'presc5' => 'Presc5',
            'isDeleted' => 'Is Deleted',
            'fechacreacion' => 'Fechacreacion',
            'fechaact' => 'Fechaact',
            'usuariocreacion' => 'Usuariocreacion',
            'usuarioact' => 'Usuarioact',
            'estatus' => 'Estatus',
        ];
    }

    /**
     * Gets query for [[Idconsulta0]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getIdconsulta0()
    {
        return $this->hasOne(Consultamedica::className(), ['id' => 'idconsulta']);
    }
}
