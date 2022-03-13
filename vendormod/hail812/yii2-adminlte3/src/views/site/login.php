<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\bootstrap\ActiveForm;

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $model \common\models\LoginForm */

$this->title = 'Sign In';

$fieldOptions1 = [
    'options' => ['class' => 'form-group has-feedback'],
    'inputTemplate' => "{input}<span class='glyphicon glyphicon-envelope form-control-feedback'></span>"
];

$fieldOptions2 = [
    'options' => ['class' => 'form-group has-feedback'],
    'inputTemplate' => "{input}<span class='glyphicon glyphicon-lock form-control-feedback'></span>"
];
?>

<body class="bg-gradient-primary">

  <div class="container col-6">

    <!-- Outer Row -->
    <div class="row justify-content-center ">

      <div class="col-xl-10 col-lg-10 col-md-9">

        <div class="card o-hidden border-0 shadow-lg my-5">
          <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div class="row">
              
              <div class="col-lg-12 d-flex justify-content-center">
                <div class="p-4 row">
                  <img src="/frontend/web/images/loginnewsae.png" />
                  <div class=" col-5 p-3">
                    <div class="d-flex align-items-center bg-light mb-3" style="height:100%; background-color: white !important;">
                      <img src="/frontend/web/images/keylogin.fw.png" />
                    </div>
                  </div>
                  <div class=" col-7 p-4">
                    <!-- <div class="text-center">
                      <h1 class="h4 text-gray-900 mb-4">Bienvenido</h1>
                    </div> -->
                    <br>
                    <?php $form = ActiveForm::begin(['id' => 'login-form']); ?>
                    <?= $form->field($model, 'username')->textInput(['autofocus' => true]) ?>
                    
                    <?= $form->field($model, 'password')->passwordInput() ?>
                    
                    <?= $form->field($model, 'rememberMe')->checkbox() ?>
                    
                    <div class="form-group">
                      <?= Html::submitButton('Iniciar sesión', ['class' => 'btn btn-primary btn-user btn-block', 'name' => 'login-button']) ?>
                    </div>
                </div>
                   <!--  <hr>
                    <a href="index.html" class="btn btn-google btn-user btn-block">
                      <i class="fab fa-google fa-fw"></i> Login with Google
                    </a>
                    <a href="index.html" class="btn btn-facebook btn-user btn-block">
                      <i class="fab fa-facebook-f fa-fw"></i> Login with Facebook
                    </a>
                    <?php ActiveForm::end(); ?>
                  <hr> -->
                  <div class="text-center col-12" >
                    <div class="text-center" style="color:#999;margin:1em 0; text-align:center; ">
                      Recuperar contraseña <?= Html::a('aquí', ['site/request-password-reset']) ?>.
                    </div>
                  </div>
                <div style="color:#999;margin:1em 0; display:none;">
                    If you forgot your password you can <?= Html::a('reset it', ['site/request-password-reset']) ?>.
                </div>
                  <!-- <div class="text-center">
                    <a class="small" href="register.html">Crear Cuenta</a>
                  </div> -->

                </div>
              </div>
            </div>
          </div>
        </div>

      </div>

    </div>

  </div>

  
 