<div class="content-wrapper">
    <section class="content">
        <div class="row">

            <?php $this->load->view('setting/_settingmenu'); ?>

            <!-- left column -->
            <div class="col-md-10">
                <!-- general form elements -->

                <div class="box box-primary">
                    <div class="box-header ptbnull">
                        <h3 class="box-title titlefix"><i class="fa fa-gear"></i>
                            <?php echo  $this->lang->line('student_guardian_panel'); ?>
                        </h3>
                        <div class="box-tools pull-right">
                        </div><!-- /.box-tools -->
                    </div><!-- /.box-header -->
                    <div class="">
                        <form role="form" id="student_guardian_form" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="sch_id" value="<?php echo $result->id; ?>">
                            <div class="box-body">
                                <div class="row">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="col-md-12">
                                                <div class="form-group row">
                                                    <label class="col-sm-4">
                                                        <?php echo $this->lang->line('user_login_option'); ?>
                                                    </label>
                                                    <div class="col-sm-8">
                                                        <label class="checkbox-inline">
                                                            <input id="student_panel_login" type="checkbox"
                                                                name="student_panel_login" <?php
                                                                if($result->student_panel_login=='1'){ echo 'checked' ;
                                                            } ?> >
                                                            <?php echo $this->lang->line('student_login'); ?>
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input id="parent_panel_login" type="checkbox"
                                                                name="parent_panel_login" <?php
                                                                if($result->parent_panel_login=='1'){ echo 'checked' ; }
                                                            ?>>
                                                            <?php echo $this->lang->line('parent_login'); ?>
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="col-md-12">
                                                <div class="form-group row">
                                                    <label class="col-sm-4">
                                                        <?php echo $this->lang->line('additional_username_option_for_student_login'); ?>
                                                    </label>
                                                    <div class="col-sm-8">
                                                        <?php $student_login    = json_decode($result->student_login); ?>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="student_login[]"
                                                                value="admission_no" <?php if (!empty($student_login) &&
                                                                in_array("admission_no", $student_login)){
                                                                echo "checked" ; } ?> >
                                                            <?php echo $this->lang->line('admission_no'); ?>
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="student_login[]"
                                                                value="mobile_number" <?php if (!empty($student_login)
                                                                && in_array("mobile_number", $student_login)){
                                                                echo "checked" ; } ?> >
                                                            <?php echo $this->lang->line('mobile_number'); ?>
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="student_login[]" value="email"
                                                                <?php if (!empty($student_login) && in_array("email",
                                                                $student_login)){ echo "checked" ; } ?> >
                                                            <?php echo $this->lang->line('email'); ?>
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="form-group row">
                                                    <label class="col-sm-4">
                                                        <?php echo $this->lang->line('additional_username_option_for_parent_login'); ?>
                                                    </label>
                                                    <div class="col-sm-8">
                                                        <?php $parent_login    = json_decode($result->parent_login); ?>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="parent_login[]"
                                                                value="mobile_number" <?php if (!empty($parent_login) &&
                                                                in_array("mobile_number", $parent_login)){
                                                                echo "checked" ; } ?> >
                                                            <?php echo $this->lang->line('mobile_number'); ?>
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input type="checkbox" name="parent_login[]" value="email"
                                                                <?php if (!empty($parent_login) && in_array("email",
                                                                $parent_login)){ echo "checked" ; } ?> >
                                                            <?php echo $this->lang->line('email'); ?>
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="col-md-12">
                                                        <div class="form-group row">
                                                            <label class="col-sm-4">
                                                                <?php echo $this->lang->line('allow_student_to_add_timeline'); ?>
                                                            </label>
                                                            <div class="col-sm-8">
                                                                <label class="radio-inline">
                                                                    <input type="radio" name="student_timeline"
                                                                        value="disabled" <?php
                                                                        if($result->student_timeline=='disabled'){ echo
                                                                    'checked' ; } ?> >
                                                                    <?php echo $this->lang->line('disabled'); ?>
                                                                </label>
                                                                <label class="radio-inline">
                                                                    <input type="radio" name="student_timeline"
                                                                        value="enabled" <?php
                                                                        if($result->student_timeline=='enabled'){ echo
                                                                    'checked' ; } ?>>
                                                                    <?php echo $this->lang->line('enabled'); ?>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label class="col-sm-4">
                                                                Allow Scratch Card Pin  Login
                                                            </label>
                                                            <div class="col-sm-8">
                                                                <label class="radio-inline">
                                                                    <input type="radio" name="scratch_pin_login"
                                                                        value="disabled" <?php
                                                                        if($result->scratch_pin_login == 'disabled'){ echo
                                                                    'checked' ; } ?> >
                                                                    <?php echo $this->lang->line('disabled'); ?>
                                                                </label>
                                                                <label class="radio-inline">
                                                                    <input type="radio" name="scratch_pin_login"
                                                                        value="enabled" <?php
                                                                        if($result->scratch_pin_login == 'enabled'){ echo
                                                                    'checked' ; } ?>>
                                                                    <?php echo $this->lang->line('enabled'); ?>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label class="col-sm-4">
                                                                Resutl Setting
                                                            </label>
                                                            <div class="col-sm-8">
                                                                <label class="radio-inline">
                                                                    <input type="radio" name="result_setting"
                                                                        value="direct_result" <?php
                                                                        if($result->result_setting == 'direct_result'){ echo
                                                                    'checked' ; } ?> >
                                                                    <?php echo $this->lang->line('direct_result'); ?>
                                                                </label>
                                                                <label class="radio-inline">
                                                                    <input type="radio" name="result_setting"
                                                                        value="upload_result" <?php
                                                                        if($result->result_setting == 'upload_result'){ echo
                                                                    'checked' ; } ?>>
                                                                    <?php echo $this->lang->line('upload_result'); ?>
                                                                </label>
                                                                <label class="radio-inline">
                                                                    <input type="radio" name="result_setting"
                                                                        value="both" <?php
                                                                        if($result->result_setting == 'both'){ echo
                                                                    'checked' ; } ?>>
                                                                    <?php echo $this->lang->line('both'); ?>
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div><!--./row-->
                            </div><!-- /.box-body -->
                            <div class="box-footer">
                                <?php
                                if ($this->rbac->hasPrivilege('general_setting', 'can_edit')) {
                                    ?>
                                <button type="button"
                                    class="btn btn-primary submit_schsetting pull-right edit_student_guardian"
                                    data-loading-text="<i class='fa fa-circle-o-notch fa-spin'></i> <?php echo $this->lang->line('processing'); ?>">
                                    <?php echo $this->lang->line('save'); ?>
                                </button>
                                <?php
                                }
                                ?>
                            </div>
                        </form>
                    </div><!-- /.box-body -->
                </div>
            </div><!--/.col (left) -->


            <!-- left column -->
            <div class="col-md-10">
                <!-- general form elements -->

                <div class="box box-primary">
                    <div class="box-header ptbnull">
                        <h3 class="box-title titlefix"><i class="fa fa-gear"></i>
                            Scratch Card Pins
                        </h3>
                        <button type="button" class="btn btn-primary pull-right" data-toggle="modal"
                            data-target="#exampleModalLong">
                            Add
                        </button>
                    </div>
                    <table class="table table-responsive mt-5">
                        <thead>
                            <tr>
                                <th>Created On</th>
                                <th>Description</th>
                                <th>Quantity</th>
                                <th>Login Limit</th>
                                <th>Unlimited</th>
                                <th>Action</th>
                                
                            </tr>
                        </thead>
                        <tbody>
                            <?php   foreach($scretch_cards as $k => $v): ?>
                            <tr>
                                <td>
                                    <?= $v->created_on ?>
                                </td>
                                <td>
                                    <?= $v->description ?>
                                </td>
                                <td>
                                    <?= $v->card_quantity ?>
                                </td>
                                <td>
                                    <?= $v->login_limit ?>
                                </td>
                                <td>
                                    <?php if($v->unlimited){ echo "YES"; } else { echo "NO"; } ?>
                                </td>
                                <td>
                                    <!-- <button class="btn btn-primary" type="button" data-toggle="modal"
                                    data-target="#exampleModalLong_<?= $v->id; ?>">Edit</button>0.0.0-->
                                    <button class="btn btn-sm btn-primary" onclick="window.open('<?php echo site_url("schsettings/viewpins/").$v->id; ?>','_blank')">Print All</button>
                                    <button class="btn btn-sm  btn-danger" onclick="window.location.href = '<?php echo site_url("schsettings/ScretchCardDlt/").$v->id; ?>'">Delete All</button>
                                </td>
                            <tr>
                            <div class="modal fade" id="exampleModalLong_<?= $v->id; ?>" tabindex="-1" role="dialog"
                                    aria-labelledby="exampleModalLongTitle" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLongTitle">Add Scratch Card Pin
                                                </h5>
                                                <button type="button" class="close" data-dismiss="modal"
                                                    aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                                <div class="modal-body">
                                                    <form id="scratch_forms" action="<?= site_url("schsettings/ScretchCardSave") ?>" method="post">
                                                        <input name="id" type="hidden" value="<?= $v->id ?>"  />
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <div class="form-check">
                                                                    <input class="form-check-input"
                                                                        id="unlimited_checkbox" type="checkbox"
                                                                        name="unlimited" value="true"  
                                                                        <?php if($v->unlimited){ echo "checked"; } ?>
                                                                        >
                                                                    <label class="form-check-label" for="">
                                                                        Unlimited Portal Access while valid
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-12">
                                                                <label>Portal Login Limit</label>
                                                                <input type="number" value="<?= $v->login_limit  ?>"
                                                                    name="login_limit" id=""
                                                                    class="form-control" />
                                                            </div>
                                                            <div class="col-md-12">
                                                                <label>Number Of Cards to Create</label>
                                                                <input type="number" name="card_quantity"
                                                                    value="<?= $v->card_quantity  ?>"
                                                                    class="form-control" required />
                                                            </div>
                                                            <div class="col-md-12">
                                                                <label>Description</label>
                                                                <textarea  name="description" class="form-control"
                                                                    class="description"><?= $v->description  ?></textarea>
                                                            </div>
                                                            <div class="col-md-12 mt-5">
                                                                </br>
                                                                <input type="submit"
                                                                    class="pull-right btn btn-md btn-primary" />
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                         <?php endforeach; ?>
                        </tbody>
                    </table>
                </div><!-- /.box-header -->
                <div class="">

                </div><!-- /.box-body -->
            </div>


            <!-- Modal -->
            <div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog"
                aria-labelledby="exampleModalLongTitle" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLongTitle">Add Scratch Card Pin</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form id="scratch_forms" action="<?= site_url("schsettings/ScretchCardSave") ?>"
                                method="post">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-check">
                                            <input class="form-check-input" id="unlimited_checkbox" type="checkbox"
                                                name="unlimited" value="true">
                                            <label class="form-check-label" for="">
                                                Unlimited Portal Access while valid
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <label>Portal Login Limit</label>
                                        <select name="login_limit" id="login_limit" class="form-control" >
                                           <option value="1"> 1 (Single Portal login while valid)</option>
                                           <option value="3"> 3 (Up to 3  Portal login while valid)</option>
                                           <option value="5"> 5 (Up to 5  Portal Portal login while valid)</option>
                                           <option value="7"> 7 (Up to 7  Portal Portal login while valid)</option>
                                           <option value="10"> 10 (Up to 10  Portal Portal login while valid)</option>
                                           <option value="20"> 20 (Up to 20  Portal Portal login while valid)</option>
                                           <option value="30"> 30 (Up to 30  Portal Portal login while valid)</option>
                                        </select>
                                    </div>
                                    <div class="col-md-12">
                                        <label>Number Of Cards to Create</label>
                                        <input type="number" name="card_quantity" value="1" class="form-control"
                                            required />
                                    </div>
                                    <div class="col-md-12">
                                        <label>Description</label>
                                        <textarea class="form-control" name="description" class="description"></textarea>
                                    </div>
                                    <div class="col-md-12 mt-5">
                                        </br>
                                        <input type="submit" class="pull-right btn btn-md btn-primary" />
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>


        </div><!--/.col (left) -->

        <!-- right column -->
</div>
</section><!-- /.content -->
</div><!-- /.content-wrapper -->

<!-- new END -->

</div><!-- /.content-wrapper -->

<script type="text/javascript">
    var base_url = '<?php echo base_url(); ?>';

    // $("#unlimited_checkbox").on("change", function (e) {
    //     var status = $(this).prop("checked");
    //     if (status == true) {
    //         $("#login_limit").val(0);
    //         $("#login_limit").prop("readonly", true);
    //     }
    //     else {
    //         $("#login_limit").val(1);
    //         $("#login_limit").prop("readonly", true);
    //     }
    // })
    // $("#unlimited_checkbox").trigger("change");



    $("#scratch_form").on("submit", function (e) {
        e.preventDefault();

    });

    $(".edit_student_guardian").on('click', function (e) {
        var $this = $(this);
        $this.button('loading');
        $.ajax({
            url: '<?php echo site_url("schsettings/studentguardian") ?>',
            type: 'POST',
            data: $('#student_guardian_form').serialize(),
            dataType: 'json',

            success: function (data) {
                if (data.status == "fail") {
                    var message = "";
                    $.each(data.error, function (index, value) {
                        message += value;
                    });
                    errorMsg(message);
                } else {
                    successMsg(data.message);
                }

                $this.button('reset');
            }
        });
    });
</script>