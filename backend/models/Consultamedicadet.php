<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "consultamedicadet".
 *
 * @property int $id
 * @property int $idconsulta
 * @property resource|null $causaconsulta
 * @property string|null $agudezavscod
 * @property string|null $agudezavscoi
 * @property string|null $agudezavcod
 * @property string|null $agudezavcoi
 * @property string|null $agudezavotr
 * @property string|null $visioncscod
 * @property string|null $visioncosci
 * @property string|null $visionccod
 * @property string|null $visionccid
 * @property string|null $visioncotr
 * @property string|null $visionlscod
 * @property string|null $visionlscoi
 * @property string|null $visionlcod
 * @property string|null $visionlcoi
 * @property string|null $visionlcotr
 * @property string|null $pioscod
 * @property string|null $pioscoi
 * @property string|null $piocod
 * @property string|null $piocoi
 * @property string|null $piootr
 * @property string|null $biomicroscopia
 * @property string|null $visiondecolores
 * @property string|null $visionprofundidad
 * @property string|null $reflejospup
 * @property string|null $campovisual
 * @property string|null $fondoojood
 * @property string|null $fondoojooi
 * @property string|null $agujeroest
 * @property resource|null $examenes
 * @property string|null $impdiag1
 * @property string|null $impdiag2
 * @property string|null $impdiag3
 * @property string|null $cie1001
 * @property string|null $cie1002
 * @property string|null $cie1003
 * @property string|null $usolentes
 * @property string|null $campim
 * @property string|null $octangular
 * @property string|null $octm
 * @property string|null $octn
 * @property string|null $biood
 * @property string|null $bioid
 * @property string|null $paquimod
 * @property string|null $paquimid
 * @property string|null $ora
 * @property string|null $topografia
 * @property string|null $angiog
 * @property string|null $ecogra
 * @property string|null $endote
 * @property string|null $ubm
 * @property string|null $retinografia
 * @property int|null $isDeleted
 * @property string $fechacreacion
 * @property string|null $fechaact
 * @property int $usuariocreacion
 * @property int|null $usuarioact
 * @property string $estatus
 *
 * @property Consultamedica $idconsulta0
 */
class Consultamedicadet extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'consultamedicadet';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['idconsulta', 'usuariocreacion'], 'required'],
            [['idconsulta', 'isDeleted', 'usuariocreacion', 'usuarioact'], 'integer'],
            [['causaconsulta', 'examenes', 'estatus'], 'string'],
            [['fechacreacion', 'fechaact'], 'safe'],
            [['agudezavscod', 'agudezavscoi', 'agudezavcod', 'agudezavcoi', 'agudezavotr', 'visioncscod', 'visioncosci', 'visionccod', 'visionccid', 'visioncotr', 'visionlscod', 'visionlscoi', 'visionlcod', 'visionlcoi', 'visionlcotr', 'pioscod', 'pioscoi', 'piocod', 'piocoi', 'piootr', 'visiondecolores', 'visionprofundidad', 'reflejospup', 'campovisual', 'fondoojood', 'fondoojooi', 'agujeroest', 'impdiag1', 'impdiag2', 'impdiag3', 'cie1001', 'cie1002', 'cie1003', 'usolentes', 'campim', 'octangular', 'octm', 'octn', 'biood', 'bioid', 'paquimod', 'paquimid', 'ora', 'topografia', 'angiog', 'ecogra', 'endote', 'ubm', 'retinografia'], 'string', 'max' => 30],
            [['biomicroscopia'], 'string', 'max' => 50],
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
            'causaconsulta' => 'Causaconsulta',
            'agudezavscod' => 'Agudezavscod',
            'agudezavscoi' => 'Agudezavscoi',
            'agudezavcod' => 'Agudezavcod',
            'agudezavcoi' => 'Agudezavcoi',
            'agudezavotr' => 'Agudezavotr',
            'visioncscod' => 'Visioncscod',
            'visioncosci' => 'Visioncosci',
            'visionccod' => 'Visionccod',
            'visionccid' => 'Visionccid',
            'visioncotr' => 'Visioncotr',
            'visionlscod' => 'Visionlscod',
            'visionlscoi' => 'Visionlscoi',
            'visionlcod' => 'Visionlcod',
            'visionlcoi' => 'Visionlcoi',
            'visionlcotr' => 'Visionlcotr',
            'pioscod' => 'Pioscod',
            'pioscoi' => 'Pioscoi',
            'piocod' => 'Piocod',
            'piocoi' => 'Piocoi',
            'piootr' => 'Piootr',
            'biomicroscopia' => 'Biomicroscopia',
            'visiondecolores' => 'Visiondecolores',
            'visionprofundidad' => 'Visionprofundidad',
            'reflejospup' => 'Reflejospup',
            'campovisual' => 'Campovisual',
            'fondoojood' => 'Fondoojood',
            'fondoojooi' => 'Fondoojooi',
            'agujeroest' => 'Agujeroest',
            'examenes' => 'Examenes',
            'impdiag1' => 'Impdiag1',
            'impdiag2' => 'Impdiag2',
            'impdiag3' => 'Impdiag3',
            'cie1001' => 'Cie1001',
            'cie1002' => 'Cie1002',
            'cie1003' => 'Cie1003',
            'usolentes' => 'Usolentes',
            'campim' => 'Campim',
            'octangular' => 'Octangular',
            'octm' => 'Octm',
            'octn' => 'Octn',
            'biood' => 'Biood',
            'bioid' => 'Bioid',
            'paquimod' => 'Paquimod',
            'paquimid' => 'Paquimid',
            'ora' => 'Ora',
            'topografia' => 'Topografia',
            'angiog' => 'Angiog',
            'ecogra' => 'Ecogra',
            'endote' => 'Endote',
            'ubm' => 'Ubm',
            'retinografia' => 'Retinografia',
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
