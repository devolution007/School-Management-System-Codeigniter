<div class="content-wrapper">  
    <section class="content">
        <div class="row">
        
            <?php $this->load->view('setting/_settingmenu'); ?>
            
            <!-- left column -->
            <div class="col-md-10">
                <!-- general form elements -->
                <div class="box box-primary">
                    <div class="box-header ptbnull">
                        <h3 class="box-title titlefix"><i class="fa fa-gear"></i>Exams And Results Settings</h3>
                        <div class="box-tools pull-right">
                        </div><!-- /.box-tools -->
                    </div><!-- /.box-header -->
                    <div class="">
                    <form role="form" id="exams_setting_form" action="<?php echo site_url('schsettings/exam_settings_Save'); ?>" class="" method="post" enctype="multipart/form-data">
                            <div class="box-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                             <label class="col-sm-4">Number of Continuous Assessments: <small class="req"> *</small> </label>
                                             <div class="col-sm-8">
                                                <select class="form-control" name="num_of_assessments" id="num_of_assessments">
                                                   <option value="">Select Assesment</option>
                                                   <option <?= ($result->num_of_assessments == 5) ? "selected":"" ?> value="5">Five Assessments</option>   
                                                   <option <?= ($result->num_of_assessments == 4) ? "selected":"" ?> value="4">Four Assessments</option>
                                                   <option <?= ($result->num_of_assessments == 3) ? "selected":"" ?> value="3">Three Assessments</option>
                                                   <option <?= ($result->num_of_assessments == 2) ? "selected":"" ?> value="2">Two Assessments</option>
                                                   <option <?= ($result->num_of_assessments == 1) ? "selected":"" ?> value="1" >One Assessments</option>
                                                </select>
                                                <!-- <span class="text-danger"><?php echo form_error('num_of_assessments'); ?></span> <input type="hidden" name="sch_id" value="<?php echo $result->id; ?>"> -->
                                            </div>
                                        </div>
                                        <input type="hidden" name="sch_id" value="<?php echo $result->id; ?>">
                                        <div id="assessments">
                                            <?php 
                                            
                                            $ad = json_decode($result->assessments_detail); 
                                            $am = json_decode($result->assessments_marks); 
                                              foreach($ad as $k => $v ):
                                            ?>
                                                <div class="form-group row" >
                                                    <label class="col-sm-4">Assessments title <small class="req"> *</small> </label> 
                                                    <div class="col-sm-8"> 
                                                        <input type="text" class="form-control" name="assessments[]" value="<?= $v ?>" />
                                                    </div>
                                                    <label class="col-sm-4">Assessments Marks <small class="req"> *</small> </label> 
                                                    <div class="col-sm-8"> 
                                                        <input type="number" class="form-control" name="marks[]" value="<?= $am[$k] ?>" />
                                                    </div>
                                                </div>
                                            <?php 
                                                endforeach;
                                            ?>
                                        </div>
                                    </div>
                                </div><!--./row-->
                            </div><!-- /.box-body -->
                            <div class="box-footer">
                                <?php
                                if ($this->rbac->hasPrivilege('general_setting', 'can_edit')) {
                                    ?>
                                    <button type="submit" class="btn btn-primary submit_schsetting pull-right edit_setting" data-loading-text="<i class='fa fa-circle-o-notch fa-spin'></i> <?php echo $this->lang->line('processing'); ?>"> <?php echo $this->lang->line('save'); ?></button>
                                    <?php
                                }
                                ?>
                            </div>
                        </form>
                    </div><!-- /.box-body -->
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
    $(function(){
        $("#num_of_assessments").on("change",function(){
           var assessments  = $(this).val();
           var html = "";
           $("#assessments").html(html);
           var num = 1;
           for(var i = 0; i < assessments; i++)
           { 
            html += '<div class="form-group row" > ';
            
            html += '<label class="col-sm-4">Assessments '+ num +' title <small class="req"> *</small> </label> ';
            html += '<div class="col-sm-8"> ';
            html += '<input type="text" class="form-control" name="assessments[]" /> ';
            html += '</div> ';
            html += '<label class="col-sm-4">Marks '+ num +'<small class="req"> *</small> </label> ';
            html += '<div class="col-sm-8"> ';
            html += '<input type="number" class="form-control" name="Marks[]" /> ';
            html += '</div> ';

            html += '</div> ';
            num++;
           }
           $("#assessments").append(html);
       
        })



        $(".edit_setting").on('click', function (e) {
            e.preventDefault();
            var $this = $(this);
            $this.button('loading');
            $.ajax({
                url: '<?php echo site_url("schsettings/exam_settings_Save") ?>',
                type: 'POST',
                data: $('#exams_setting_form').serialize(),
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

    })
</script>