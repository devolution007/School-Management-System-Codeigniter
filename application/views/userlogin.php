<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="theme-color" content="#424242" />
    <title>Login : <?php echo $name; ?></title>
    <link href="<?php echo base_url(); ?>uploads/school_content/admin_small_logo/<?php $this->setting_model->getAdminsmalllogo(); ?>" rel="shortcut icon" type="image/x-icon">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
    <link rel="stylesheet" href="<?php echo base_url(); ?>backend/usertemplate/assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="<?php echo base_url(); ?>backend/usertemplate/assets/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="<?php echo base_url(); ?>backend/usertemplate/assets/css/form-elements.css">
    <link rel="stylesheet" href="<?php echo base_url(); ?>backend/usertemplate/assets/css/style.css">
    <link rel="stylesheet" href="<?php echo base_url(); ?>backend/usertemplate/assets/css/jquery.mCustomScrollbar.min.css">
</head>
<style>
    .hide {
        display: none;
    }
</style>

<body>
    <!-- Top content -->
    <div class="top-content">

        <div class="inner-bg">

            <div class="container-fluid">
                <div class="row">
                    <?php
                    $offset       = "";
                    $bgoffsetbg   = "bgoffsetbg";
                    $bgoffsetbgno = "";
                    if (empty($notice)) {
                        // $empty_notice = 1;
                        // $offset       = "col-md-offset-4";
                        // $bgoffsetbg   = "";
                        // $bgoffsetbgno = "bgoffsetbgno";
                    }

                    ?>
                    <div class="<?php echo $bgoffsetbg; ?>">
                        <div class="col-lg-4 col-md-4 col-sm-12 nopadding <?php echo $bgoffsetbgno; ?> <?php echo $offset; ?>">
                            <div class="loginbg">
                                <div class="form-top">
                                    <div class="form-top-left logowidth pull-right">
                                        <img src="<?php echo base_url(); ?>uploads/school_content/admin_logo/<?php echo $this->setting_model->getAdminlogo(); ?>" />
                                    </div>
                                </div>
                                <div class="form-bottom">
                                    <h3 class="font-white"><?php echo $this->lang->line('user_login'); ?></h3>
                                    <?php
                                    if (isset($error_message)) {
                                        echo "<div class='alert alert-danger'>" . $error_message . "</div>";
                                    }
                                    ?>
                                    <?php
                                    if ($this->session->flashdata('message')) {
                                        echo "<div class='alert alert-success'>" . $this->session->flashdata('message') . "</div>";
                                    };
                                    ?>
                                    <?php if ($settings->scratch_pin_login == "enabled") : ?>
                                        <form id="activate_pin" class="hide" method="post">
                                            <?php echo $this->customlib->getCSRF(); ?>
                                            <div class="form-group has-feedback">
                                                <label class="sr-only" for="form-scratch_pin">Student id</label>
                                                <input type="text" name="student_id" value="<?php echo set_value("student_id"); ?>" placeholder=" Student Admission No To Activate" class="form-username form-control student_id" id="student_id">
                                                <span class="fa fa fa-sort-numeric-desc form-control-feedback"></span>
                                                <span class="text-danger"><?php echo form_error('student_id'); ?></span>
                                            </div>
                                            <button type="button" id="activate_btn" class="btn">Activate</button>
                                        </form>
                                        <form action="<?php echo site_url('site/userlogin') ?>" id="scratch_card_form" method="post">
                                            <?php echo $this->customlib->getCSRF(); ?>
                                            <div class="form-group has-feedback">
                                                <label class="sr-only" for="form-scratch_pin">Scratch Pin</label>
                                                <input type="text" name="serial_no" value="<?php echo set_value("serial_no"); ?>" placeholder=" Serial No" class="form-username form-control scratch_pin" id="serial_no">
                                                <span class="fa fa fa-sort-numeric-desc form-control-feedback"></span>
                                                <span class="text-danger"><?php echo form_error('serial_no'); ?></span>
                                            </div>
                                            <div class="form-group has-feedback">
                                                <input type="password" name="code" value="<?php echo set_value("code"); ?>" placeholder="Pin" class="form-password form-control" id="code">
                                                <span class="fa fa-lock form-control-feedback"></span>
                                                <span class="text-danger"><?php echo form_error('code'); ?></span>
                                            </div>
                                            <div class="form-group has-feedback hide">
                                                <label class="sr-only" for="form-username">
                                                    <?php echo $this->lang->line('username'); ?></label>
                                                <input type="text" name="username" value="<?php echo set_value("username"); ?>" placeholder="<?php echo $this->lang->line('username'); ?>" class="form-username form-control" id="email">
                                                <span class="fa fa-envelope form-control-feedback"></span>
                                                <span class="text-danger"><?php echo form_error('username'); ?></span>
                                            </div>
                                            <div class="form-group has-feedback hide ">
                                                <input type="password" name="password" value="<?php echo set_value("password"); ?>" placeholder="<?php echo $this->lang->line('password'); ?>" class="form-password form-control" id="password">
                                                <span class="fa fa-lock form-control-feedback"></span>
                                                <span class="text-danger"><?php echo form_error('password'); ?></span>
                                            </div>
                                            <?php if ($is_captcha) { ?>
                                                <div class="form-group has-feedback row">
                                                    <div class='col-lg-7 col-md-12 col-sm-6'>
                                                        <span id="captcha_image"><?php echo $captcha_image; ?></span>
                                                        <span class="fa fa-refresh catpcha" title='<?php echo $this->lang->line("refresh_captcha") ?>' onclick="refreshCaptcha()"></span>
                                                    </div>
                                                    <div class='col-lg-5 col-md-12 col-sm-6'>
                                                        <input type="text" name="captcha" placeholder="<?php echo $this->lang->line('captcha'); ?>" autocomplete="off" class=" form-control" id="captcha">
                                                        <span class="text-danger"><?php echo form_error('captcha'); ?></span>
                                                    </div>
                                                </div>
                                            <?php } ?>
                                            <button type="button" id="scratch_card_button" class="btn"> <?php echo $this->lang->line('sign_in'); ?></button>
                                            <!-- <button type="submit" id="submit" class="btn"> <?php echo $this->lang->line('sign_in'); ?></button> -->
                                        </form>
                                    <?php endif; ?>

                                    <?php if ($settings->scratch_pin_login == "disabled") : ?>
                                        <form action="<?php echo site_url('site/userlogin') ?>" method="post">
                                            <?php echo $this->customlib->getCSRF(); ?>
                                            <div class="form-group has-feedback">
                                                <label class="sr-only" for="form-username">
                                                    <?php echo $this->lang->line('username'); ?></label>
                                                <input type="text" name="username" value="<?php echo set_value("username"); ?>" placeholder="<?php echo $this->lang->line('username'); ?>" class="form-username form-control" id="email">
                                                <span class="fa fa-envelope form-control-feedback"></span>
                                                <span class="text-danger"><?php echo form_error('username'); ?></span>
                                            </div>
                                            <div class="form-group has-feedback">
                                                <input type="password" name="password" value="<?php echo set_value("password"); ?>" placeholder="<?php echo $this->lang->line('password'); ?>" class="form-password form-control" id="password">
                                                <span class="fa fa-lock form-control-feedback"></span>
                                                <span class="text-danger"><?php echo form_error('password'); ?></span>
                                            </div>
                                            <?php if ($is_captcha) { ?>
                                                <div class="form-group has-feedback row">
                                                    <div class='col-lg-7 col-md-12 col-sm-6'>
                                                        <span id="captcha_image"><?php echo $captcha_image; ?></span>
                                                        <span class="fa fa-refresh catpcha" title='<?php echo $this->lang->line("refresh_captcha") ?>' onclick="refreshCaptcha()"></span>
                                                    </div>
                                                    <div class='col-lg-5 col-md-12 col-sm-6'>
                                                        <input type="text" name="captcha" placeholder="<?php echo $this->lang->line('captcha'); ?>" autocomplete="off" class=" form-control" id="captcha">
                                                        <span class="text-danger"><?php echo form_error('captcha'); ?></span>
                                                    </div>
                                                </div>
                                            <?php } ?>
                                            <button type="submit" id="submit" class="btn"> <?php echo $this->lang->line('sign_in'); ?></button>
                                        </form>
                                    <?php endif; ?>
                                    <p><a href="<?php echo site_url('site/ufpassword') ?>" class="forgot"> <i class="fa fa-key"></i> <?php echo $this->lang->line('forgot_password'); ?></a></p>
                                    <div class="text-center">
                                        <p><a href="https://edrictech.com.ng" target="_blank">Powered By EdricTech</a></p>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-8 col-md-8 col-sm-12 nopadding-2">
                            <div class="d-flex align-items-center text-wrap flex-column justify-content-center bg-position-sm-left bg-position-lg-center" style="background: url('<?php echo base_url(); ?>uploads/school_content/login_image/<?php echo $school['user_login_page_background']; ?>') no-repeat; background-size:cover">
                                <div class="<?php if ($notice) { ?> bg-shadow-remove <?php } ?>">
                                    <?php
                                    if ($notice) {
                                    ?>


                                        <h3 class="h3"><?php echo $this->lang->line('whats_new_in'); ?> <?php echo $school['name']; ?></h3>
                                        <div class="loginright mCustomScrollbar">
                                            <div class="messages">

                                                <?php
                                                foreach ($notice as $notice_key => $notice_value) {
                                                ?>
                                                    <h4><?php echo $notice_value['title']; ?></h4>

                                                    <?php
                                                    $string = ($notice_value['description']);
                                                    $string = strip_tags($string);
                                                    if (strlen($string) > 100) {

                                                        // truncate string
                                                        $stringCut = substr($string, 0, 100);
                                                        $endPoint  = strrpos($stringCut, ' ');

                                                        //if the string doesn't contain any space then it will cut without word basis.
                                                        $string = $endPoint ? substr($stringCut, 0, $endPoint) : substr($stringCut, 0);
                                                        $string .= '... <a class=more href="' . site_url('read/' . $notice_value['slug']) . '" target="_blank">' . $this->lang->line('read_more') . '</a>';
                                                    }
                                                    echo '<p>' . $string . '</p>';
                                                    ?>
                                                    <div class="logdivider"></div>
                                                <?php
                                                }
                                                ?>

                                            </div>
                                        </div>
                                    <?php
                                    }
                                    ?>


                                </div><!--./col-lg-6-->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="<?php echo base_url(); ?>backend/usertemplate/assets/js/jquery-1.11.1.min.js"></script>
    <link href="<?php echo base_url(); ?>backend/toast-alert/toastr.css" rel="stylesheet" />
    <script src="<?php echo base_url(); ?>backend/toast-alert/toastr.js"></script>

    <script src="<?php echo base_url(); ?>backend/usertemplate/assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="<?php echo base_url(); ?>backend/usertemplate/assets/js/jquery.backstretch.min.js"></script>
    <script src="<?php echo base_url(); ?>backend/usertemplate/assets/js/jquery.mCustomScrollbar.min.js"></script>
    <script src="<?php echo base_url(); ?>backend/usertemplate/assets/js/jquery.mousewheel.min.js"></script>
</body>

</html>
<script type="text/javascript">
    $(document).ready(function() {




        $("#scratch_pin").on("input", function(e) {
            $.post("<?php echo base_url('site/varify_pin'); ?>", {
                scratch_pin: $(this).val()
            }, function(resp) {
                resp = JSON.parse(resp)
                debugger
                if (resp) {
                    $("#email_field").removeClass("hide");
                    if (resp.u_id > 0) {
                        $("#email").val(resp.email);
                        $("#email").attr("readonly", true);
                        successMsg(resp.message);
                    }
                } else {
                    $("#email").val(" ");
                    $("#email").attr("readonly", false);
                    successMsg(resp.message);
                }

            })
        })

        $('.login-form input[type="text"], .login-form input[type="password"], .login-form textarea').on('focus', function() {
            $(this).removeClass('input-error');
        });

        $('.login-form').on('submit', function(e) {
            $(this).find('input[type="text"], input[type="password"], textarea').each(function() {
                if ($(this).val() == "") {
                    e.preventDefault();
                    $(this).addClass('input-error');
                } else {
                    $(this).removeClass('input-error');
                }
            });
        });

        $('#scratch_card_button').on('click', function(e) {
            $.ajax({
                type: "POST",
                url: "<?php echo base_url('site/verify_scratch_pins'); ?>",
                data: $("#scratch_card_form").serialize(),
                dataType: "json",
                success: function(resp) {
                    debugger
                    if (resp.status == true) {
                        if (resp.active == false) {
                            $("#scratch_card_form").addClass("hide");
                            $("#activate_pin").removeClass("hide");
                            successMsg(resp.message);
                        } else {
                            $("#email").val(resp.credeintials.email);
                            $("#password").val(resp.credeintials.password);
                            $('#scratch_card_form').submit();
                        }
                    } else {
                        errorMsg(resp.message);

                    }
                }
            });
        });

        $('#activate_btn').on('click', function(e) {
            var formData1 = $('#activate_pin').serialize();
            var formData2 = $('#scratch_card_form').serialize();
            var mergedData = formData1 + '&' + formData2;
            $.ajax({
                type: "POST",
                url: "<?php echo base_url('site/activate_pin'); ?>",
                data: mergedData,
                dataType: "json",
                success: function(resp) {
                    if (resp.status == true) {
                        $("#email").val(resp.credeintials.email);
                        $("#password").val(resp.credeintials.password);
                        $('#scratch_card_form').submit();
                    } else {
                        errorMsg(resp.message);
                    }
                }
            });
        });

    });


    function successMsg(msg) {
        toastr.success(msg);
    }

    function errorMsg(msg) {
        toastr.error(msg);
    }

    function infoMsg(msg) {
        toastr.info(msg);
    }

    function warningMsg(msg) {
        toastr.warning(msg);
    }
</script>
<script type="text/javascript">
    function refreshCaptcha() {
        $.ajax({
            type: "POST",
            url: "<?php echo base_url('site/refreshCaptcha'); ?>",
            data: {},
            success: function(captcha) {
                $("#captcha_image").html(captcha);
            }
        });
    }
</script>
<script>
    function copy(email, password) {
        document.getElementById("email").value = email;
        document.getElementById("password").value = password;
    }
</script>