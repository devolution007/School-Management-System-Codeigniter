<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="theme-color" content="#424242" />
        <title><?php echo $this->setting_model->get_appname(); ?></title>
        <!--favican-->
        <link href="<?php echo base_url(); ?>uploads/school_content/admin_small_logo/<?php $this->setting_model->getAdminsmalllogo(); ?>" rel="shortcut icon" type="image/x-icon">
        <!-- CSS -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
        <link rel="stylesheet" href="<?php echo base_url(); ?>backend/usertemplate/assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="<?php echo base_url(); ?>backend/usertemplate/assets/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" href="<?php echo base_url(); ?>backend/usertemplate/assets/css/form-elements.css">
        <link rel="stylesheet" href="<?php echo base_url(); ?>backend/usertemplate/assets/css/style.css">
        <style type="text/css">

            body{background:linear-gradient(to right,#676767 0,#dadada 100%);}
        </style>
    </head>
    <body>
        <!-- Top content -->
        <div class="top-content">
            <div class="inner-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-4 col-sm-offset-4 form-box">
                            <div class="bgoffsetbg">     
                                <div class="loginbg">  
                                    <div class="form-top">
                                        <div class="form-top-left logowidth">
                                            <img src="<?php echo base_url(); ?>uploads/school_content/admin_logo/<?php $this->setting_model->getAdminlogo(); ?>" class="logowidth">
                                        </div>
                                    </div>


                                    <div class="form-bottom">
                                        <h3 class="font-white bolds"><?php echo $this->lang->line('reset_password'); ?></h3>

                                        <?php
                                        if (isset($error_message)) {
                                            echo "<div class='alert alert-danger'>" . $error_message . "</div>";
                                        }
                                        ?>
                                        <form action="<?php echo site_url('course/resetpassword/' . $role . '/' . $verification_code) ?>" method="post">
                                            <?php echo $this->customlib->getCSRF(); ?>
                                            <div class="form-group has-feedback">
                                                <label class="sr-only"><?php echo $this->lang->line('password'); ?></label>
                                                <input type="password" name="password" placeholder="<?php echo $this->lang->line('password'); ?>" class="form-password form-control" id="form-password">
                                                <span class="fa fa-lock form-control-feedback"></span>
                                                <span class="text-danger"><?php echo form_error('password'); ?></span>
                                            </div>
                                            <div class="form-group has-feedback">
                                                <label class="sr-only"><?php echo $this->lang->line('confirm_password'); ?></label>
                                                <input type="password" name="confirm_password" placeholder="<?php echo $this->lang->line('confirm_password'); ?>" class="form-control" id="form-confirm_password">
                                                <span class="fa fa-lock form-control-feedback"></span>
                                                <span class="text-danger"><?php echo form_error('confirm_password'); ?></span>
                                            </div>
                                            <button type="submit" class="btn"><?php echo $this->lang->line('submit'); ?></button>
                                        </form>
                                        <a href="<?php echo site_url('course') ?>" class="forgot"><i class="fa fa-key"></i> <?php echo $this->lang->line('user_login'); ?></a>
                                    </div>
                                </div>
                            </div>   
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Javascript -->
        <script src="<?php echo base_url(); ?>backend/usertemplate/assets/js/jquery-1.11.1.min.js"></script>
        <script src="<?php echo base_url(); ?>backend/usertemplate/assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="<?php echo base_url(); ?>backend/usertemplate/assets/js/jquery.backstretch.min.js"></script>
    </body>
</html>