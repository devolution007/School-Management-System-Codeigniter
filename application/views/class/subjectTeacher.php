<?php $currency_symbol = $this->customlib->getSchoolCurrencyFormat(); ?>
<style>
.select2-container--default .select2-selection--multiple .select2-selection__choice {
    color: black;
    /* Change this to the desired text color */
}
</style>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">

    <section class="content-header">
        <h1>
            <i class="fa fa-mortar-board"></i> <?php //echo $this->lang->line('academics'); ?>
        </h1>
    </section>

    <!-- Main content -->
    <section class="content">
        <div class="row">
            <?php
            if ($this->rbac->hasPrivilege('assign_subject_teacher', 'can_add')) {
                ?>
            <div class="col-md-4">
                <!-- Horizontal Form -->
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title"><?php echo $this->lang->line('assign_subject_teacher'); ?></h3>
                    </div><!-- /.box-header -->
                    <form id="form1" action="<?php echo base_url() ?>admin/teacher/assign_subject_teacher" method="post"
                        accept-charset="utf-8">
                        <div class="box-body">
                            <?php 
                                    if ($this->session->flashdata('msg')) { 
                                        echo $this->session->flashdata('msg');
                                        $this->session->unset_userdata('msg');
                                    }
                                ?>

                            <?php
                                if (isset($error_message)) {
                                    echo "<div class='alert alert-danger'>" . $error_message . "</div>";
                                }
                                ?>
                            <?php echo $this->customlib->getCSRF(); ?>


                            <div class="form-group">
                                
                                <label
                                    for="exampleInputEmail1"><?php echo $this->lang->line('teacher'); ?></label><small
                                    class="req"> *</small>
                                <select class="form-control select2" name="teacher" id="teacher">
                                    <option value=''><?php echo $this->lang->line('select') ?></option>

                                    <?php
                                    foreach ($teacherlist as $tvalue) {
                                        ?>

                                    <option value="<?php echo $tvalue["id"] ?>"
                                        <?php echo set_select('teacher', $tvalue["id"], set_value('teacher')); ?>>
                                        <?php echo $tvalue['name'] . " " . $tvalue['surname'] . " (" . $tvalue['employee_id'] . ")"; ?>
                                    </option>
                                    <?php
                                        }
                                        ?>
                                </select>

                                <span class="text-danger"><?php echo form_error('teachers'); ?></span>
                            </div>
                            <div class="form-group">
                                <label
                                    for="exampleInputEmail1"><?php echo $this->lang->line('subject'); ?></label><small
                                    class="req"> *</small>
                                <select class="form-control select2" multiple name="subject[]" id="subject_id">
                                    <option value=''><?php echo $this->lang->line('select') ?></option>
                                    <?php
                                        foreach ($subjectlist as $subject_key => $subject_value) {
                                            ?>

                                    <option value="<?php echo $subject_value["id"] ?>"
                                        <?php echo set_select('subject', $subject_value["id"], set_value('subject')); ?>>
                                        <?php echo $subject_value["name"] ?></option>
                                    <?php
                                        }
                                        ?>
                                </select>

                                <span class="text-danger"><?php echo form_error('subject'); ?></span>
                            </div>




                            <div class="form-group pull-right">
                                <div class="checkbox">
                                    <label for="student_exam_info">
                                        <input type="checkbox" name="student_exam_info" id="student_exam_info" value="1"  <?php echo set_checkbox('student_exam_info', $tvalue['student_exam_info']); ?>> Student Exam Info
                                    </label>
                                </div>

                            </div>

                        </div><!-- /.box-body -->

                        <div class="box-footer">
                            <button type="submit"
                                class="btn btn-info pull-right"><?php echo $this->lang->line('save'); ?></button>
                        </div>
                    </form>
                </div>

            </div>
            <!--/.col (right) -->
            <!-- left column -->
            <?php } ?>
            <div class="col-md-<?php
            if ($this->rbac->hasPrivilege('assign_subject_teacher', 'can_add')) {
                echo "8";
            } else {
                echo "12";
            }
            ?>">
                <!-- general form elements -->
                <div class="box box-primary">
                    <div class="box-header ptbnull">
                        <h3 class="box-title titlefix"><?php echo $this->lang->line('subject_teacher_list'); ?></h3>
                        <div class="box-tools pull-right">
                        </div><!-- /.box-tools -->
                    </div><!-- /.box-header -->
                    <div class="box-body">
                        <div class="table-responsive mailbox-messages overflow-visible">
                            <div class="download_label"><?php echo $this->lang->line('subject_teacher_list'); ?></div>
                            <table class="table table-striped table-bordered table-hover example">
                                <thead>
                                    <tr>

                                        <th><?php echo $this->lang->line('subject'); ?>
                                        </th>

                                        <th><?php echo $this->lang->line('subject_teacher'); ?>
                                        </th>

                                        <th class="text-right noExport"><?php echo $this->lang->line('action'); ?></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                    $i = 0;

                                    foreach ($assignteacherlist as $teacher) {
                                       
                                        ?>
                                    <tr>
                                        <td class="mailbox-name">
                                            <?php echo $teacher["subjects"]; ?>

                                        </td>

                                        <td>
                                       <?=$teacher['teacher_name']?>
                                        </td>
                                        <td class="mailbox-date pull-right">
                                        
                                            <?php
                                                
                                                if ($this->rbac->hasPrivilege('assign_subject_teacher', 'can_delete')) {
                                                    ?>
                                            <a href="<?php echo base_url(); ?>admin/teacher/subjectteacherdelete/<?php echo $teacher["id"]; ?>"
                                                class="btn btn-default btn-xs" data-toggle="tooltip"
                                                title="<?php echo $this->lang->line('delete'); ?>"
                                                onclick="return confirm('<?php echo $this->lang->line('delete_confirm') ?>');">
                                                <i class="fa fa-remove"></i>
                                            </a>
                                            <?php } ?>
                                        </td>
                                    </tr>
                                    <?php
                                        $i++;
                                    }
                                    ?>

                                </tbody>
                            </table><!-- /.table -->



                        </div><!-- /.mail-box-messages -->
                    </div><!-- /.box-body -->
                </div>
            </div>
            <!--/.col (left) -->
            <!-- right column -->

        </div>
        <div class="row">
            <!-- left column -->

            <!-- right column -->
            <div class="col-md-12">

            </div>
            <!--/.col (right) -->
        </div> <!-- /.row -->
    </section><!-- /.content -->
</div><!-- /.content-wrapper -->

<script type="text/javascript">
$(document).ready(function() {
    // Initialize Select2 on the select element with id 'mySelect'
    $('#subject_id').select2();
    $('#teacher').select2();
});

function getSectionBySubject(class_id, section_id) {
    if (class_id != "") {
        $('#section_id').html("");
        var base_url = '<?php echo base_url() ?>';
        var div_data = '<option value=""><?php echo $this->lang->line('select'); ?></option>';
        $.ajax({
            type: "GET",
            url: base_url + "sections/getByClass",
            data: {
                'class_id': class_id
            },
            dataType: "json",
            success: function(data) {
                $.each(data, function(i, obj) {
                    var sel = "";
                    if (section_id == obj.section_id) {
                        sel = "selected";
                    }
                    div_data += "<option value=" + obj.section_id + " " + sel + ">" + obj.section +
                        "</option>";
                });

                $('#section_id').append(div_data);
            }
        });
    }
}
$(document).ready(function() {
    $(document).on('change', '#class_id', function(e) {
        $('#section_id').html("");
        var class_id = $(this).val();
        var base_url = '<?php echo base_url() ?>';
        var div_data = '<option value=""><?php echo $this->lang->line('select'); ?></option>';
        $.ajax({
            type: "GET",
            url: base_url + "sections/getByClass",
            data: {
                'class_id': class_id
            },
            dataType: "json",
            success: function(data) {
                $.each(data, function(i, obj) {
                    div_data += "<option value=" + obj.section_id + ">" + obj
                        .section + "</option>";
                });

                $('#section_id').append(div_data);
            }
        });
    });
    var subject_id = $('#subject_id').val();


    getSectionBySubject(subject_id);
    $(document).on('change', '#feecategory_id', function(e) {
        $('#feetype_id').html("");
        var feecategory_id = $(this).val();
        var base_url = '<?php echo base_url() ?>';
        var div_data = '<option value=""><?php echo $this->lang->line('select'); ?></option>';
        $.ajax({
            type: "GET",
            url: base_url + "feemaster/getByFeecategory",
            data: {
                'feecategory_id': feecategory_id
            },
            dataType: "json",
            success: function(data) {
                $.each(data, function(i, obj) {
                    div_data += "<option value=" + obj.id + ">" + obj.type +
                        "</option>";
                });

                $('#feetype_id').append(div_data);
            }
        });
    });
});
</script>