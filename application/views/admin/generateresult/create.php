<?php $this->load->view('layout/course_css.php'); ?>
<?php
$currency_symbol = $this->customlib->getSchoolCurrencyFormat();
?>

<div class="content-wrapper">
    <!-- Main content -->
    <section class="content">
        <div class="row">
            <!-- left column -->
            <div class="col-md-12">
                <?php  if(!empty($settings->result_setting) && $settings->result_setting == 'both'):?>
                <div class="form-check form-check-inline">
                    <input class="form-check-input type-radio" type="radio" name="Type" id="Type1" value="1">
                    <label class="form-check-label" for="Type1">Direct Result</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input type-radio" type="radio" id="Type2" name="Type" value="2">
                    <label class="form-check-label" for="Type2">Upload Result</label>
                </div>
                <?php endif ?>
                <?php  if(!empty($settings->result_setting) && $settings->result_setting == 'direct_result'):?>
                <div class="form-check form-check-inline">
                    <input class="form-check-input type-radio" id="Type" type="radio" name="Type" value="1">
                    <label class="form-check-label" for="Type">Direct Result</label>
                </div>
                <?php endif ?>
                <?php  if(!empty($settings->result_setting) && $settings->result_setting == 'upload_result'):?>
                <div class="form-check form-check-inline">
                    <input class="form-check-input type-radio" id="Type" type="radio" name="Type" value="2">
                    <label class="form-check-label" for="Type">Upload Result</label>
                </div>
                <?php endif ?>
            </div>
            <form method="POST" id="result_form" action="<?=base_url('admin/Result/SaveResult')?>" class="hide">
                <div class="col-md-12 heading">
                    <h2 class="text-center">GENERATE RESULT FOR: <?php echo $student["firstname"] ?? "";?>
                        <?php echo $student["lastname"] ?? "";?> </h2>
                </div>
                <div class="col-md-3">
                    <div class="mb-3">
                        <input type="hidden" name="s_id" id="" value="<?= $student["id"] ?>" class="form-control"
                            placeholder="">
                        <label for="" class="form-label">Terms</label>

                        <?php $terms = array_column($terms,"terms"); ?>

                        <select type="text" name="terms" class="form-control">
                            <option value="">Select Terms</option>
                            <?php foreach (['1st Term', '2nd Term', '3rd Term'] as $term): ?>
                            <?php if (!in_array($term, $terms)): ?>
                            <option><?= $term ?></option>
                            <?php endif; ?>
                            <?php endforeach; ?>
                        </select>

                    </div>
                    <div class="mb-3 mt-3">
                        <label for="" class="form-label">Permotional statment</label>
                        <input type="text" name="permotional_statment" id="" class="form-control" placeholder="">
                    </div>
                </div>
                <div class="col-md-9">
                    <?php $ad = json_decode($settings->assessments_detail); ?>
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Subject</th>
                                <?php foreach($ad as $k => $v): ?>
                                <th>
                                    <?=$v ?>
                                </th>
                                <?php endforeach; ?>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach($subject_result as $k => $v):?>
                            <tr>
                                <td><input type="text" name="subject[]" class="form-control" value="<?= $v["name"] ?>"
                                        readonly />
                                </td>
                                <?php 
                              foreach($ad as $k => $v): 
                              if(array_key_last($ad) == $k){
                            ?>
                                <td><input type="number" class="form-control" name="exams[]" /></td>
                                <?php } else{ ?>
                                <td><input type="number" class="form-control" name="assessment_<?=$k?>[]" /></td>
                                <?php } endforeach; ?>
                            </tr>
                            <?php endforeach; ?>
                        </tbody>

                    </table>
                </div>
                <div class="col-md-12 ">
                    <div class="row">
                        <div class="col-md-12 heading">
                            <h2 class="text-center">AFFECTIVE AND PSYCHOMOTOR REPORT</h2>
                        </div>
                        <div class="col-md-4">
                            <div class="mb-3">
                                <label for="" class="form-label">Following Instruncations*</label>
                                <input type="text" name="following_instructions" id="following_instructions"
                                    class="form-control" placeholder="">
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="mb-3">
                                <label for="" class="form-label">Working Independently</label>
                                <input type="text" name="working_independently" id="working_independently"
                                    class="form-control" placeholder="" aria-describedby="helpId">
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="mb-3">
                                <label for="" class="form-label">Disturbing Others*</label>
                                <input type="text" name="disturbing_others" id="" class="form-control" placeholder=""
                                    aria-describedby="helpId">
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="mb-3">
                                <label for="" class="form-label">Does Next Work In Class*</label>
                                <input type="text" name="does_next_work_in_class" id="" class="form-control"
                                    placeholder="" aria-describedby="helpId">

                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="mb-3">
                                <label for="" class="form-label">Take Care Of Materials*</label>
                                <input type="text" name="take_care_of_materials" id="" class="form-control"
                                    placeholder="" aria-describedby="helpId">

                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="mb-3">
                                <label for="" class="form-label">Completion Of Work*</label>
                                <input type="text" name="completion_of_work" id="completion_of_work"
                                    class="form-control" placeholder="" aria-describedby="helpId">

                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="mb-3">
                                <label for="" class="form-label">Finished Work On Time*</label>
                                <input type="text" name="finished_work_on_time" id="finished_work_on_time"
                                    class="form-control" placeholder="" aria-describedby="helpId">

                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="row">
                        <div class="col-md-12 heading">
                            <h2 class="text-center">Behavior</h2>
                        </div>
                        <div class="col-md-4">
                            <div class="mb-3">
                                <label for="" class="form-label">Puncatuality*</label>
                                <input type="text" name="puncatuality" id="puncatuality" class="form-control"
                                    placeholder="" aria-describedby="helpId">
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="mb-3">
                                <label for="" class="form-label">Persional Cleanliness</label>
                                <input type="text" name="persional_cleanliness" id="persional_cleanliness"
                                    class="form-control" placeholder="" aria-describedby="helpId">
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="mb-3">
                                <label for="" class="form-label">Assignments*</label>
                                <input type="text" name="assignments" id="assignments" class="form-control"
                                    placeholder="" aria-describedby="helpId">
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="mb-3">
                                <label for="" class="form-label">Regularity*</label>
                                <input type="text" name="regularity" id="regularity" class="form-control" placeholder=""
                                    aria-describedby="helpId">

                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="mb-3">
                                <label for="" class="form-label">Ganeral Conduct*</label>
                                <input type="text" name="ganeral_conduct" id="ganeral_conduct" class="form-control"
                                    placeholder="" aria-describedby="helpId">

                            </div>
                        </div>

                    </div>
                </div>
                <div class="col-md-12">
                    <div class="row">
                        <div class="col-md-12 heading">
                            <h2 class="text-center">Summary of Berince's Report</h2>
                        </div>
                        <div class="row">

                            <div class="col-md-4">
                                <div class="mb-3">
                                    <label for="" class="form-label">Class Teacher Remarks*</label>
                                    <input type="text" name="class_teacher_remarks" id="class_teacher_remarks"
                                        class="form-control" placeholder="" aria-describedby="helpId">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="mb-3">
                                    <label for="" class="form-label">Class teacher Name</label>
                                    <input type="text" name="class_teacher_name" id="class_teacher_name"
                                        class="form-control" placeholder="" aria-describedby="helpId">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="mb-3">
                                    <label for="" class="form-label">Head Teacher Remarks*</label>
                                    <input type="text" name="head_teacher_remarks" id="head_teacher_remarks"
                                        class="form-control" placeholder="" aria-describedby="helpId">

                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="mb-3">
                                    <label for="" class="form-label">School Resumes*</label>
                                    <input type="text" name="school_resumes" id="school_resumes" class="form-control"
                                        placeholder="" aria-describedby="helpId">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="mb-3">
                                    <input type="submit" value="Genrate" id="submit_result" class="pull-right btn btn-primary" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>

            <form method="POST" id="result_upload" action="<?=base_url('admin/Result/upload')?>" class="hide"
                enctype="multipart/form-data">
                <div class="col-md-12 heading">
                    <h2 class="text-center">GENERATE RESULT FOR: <?php echo $student["firstname"] ?? "";?>
                        <?php echo $student["lastname"] ?? "";?> </h2>
                </div>

                <div class="row p-5">
                    <div class="col-md-3">
                        <div class="mb-3">
                            <input type="hidden" name="s_id" id="" value="<?= $student["id"] ?>" class="form-control"
                                placeholder="">
                            <label for="" class="form-label">Terms</label>

                            <?php $terms = array_column($terms,"terms"); ?>
                            <select type="text" name="terms" class="form-control">
                                <option value="">Select Terms</option>
                                <?php
              if(!array_search('1st Term', $terms)){
                echo "<option>1st Term</option>";
              } 
             ?>
                                <?php
              if(!array_search('2nd Term', $terms)){
               echo "<option>2nd Term</option>";
              } 
             ?>
                                <?php
              if(!array_search('3rd Term', $terms)){
               echo "<option>3rd Term</option>";
              } 
             ?>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <label for="exampleInputFile">Result File</label>
                            <div><input class="filestyle form-control" type='file' name='file' id="file" size='20' />
                            </div>
                            <span class="text-danger"><?php echo form_error('file'); ?></span>
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="" style="margin-top:20px">
                            <input type="submit" id="submit_result" class="pull-left btn btn-primary" />
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <!-- /.row -->
    </section>
    <!-- /.content -->
    <div class="clearfix"></div>
</div>


<script>
var base_url = "<?=base_url()?>";
$(".type-radio").on("change", function() {
    if ($(this).val() == 1) {
        $("#result_form").removeClass("hide")
        $("#result_upload").addClass("hide")
    } else {
        $("#result_form").addClass("hide")
        $("#result_upload").removeClass("hide")
    }
})
$("#result_form , #result_upload").on("submit", function(e) {
    e.preventDefault();
    var $this = $(this).find("button[type=submit]:focus");
    var form = $(this);
    var url = form[0].action;
    debugger;
    $.ajax({
        url: url,
        type: "POST",
        data: new FormData(this),
        dataType: 'json',
        contentType: false,
        cache: false,
        processData: false,
        beforeSend: function() {
            $this.button('loading');
        },
        success: function(res) {
            debugger
            if (res.status == "fail") {
                var message = "";
                $.each(res.error, function(index, value) {
                    message += value;
                });
                errorMsg(message);
            } else {
                successMsg(res.message);
                window.location.href = base_url + "/admin/Result/print_terms/" + res.insert_id
            }
        },
        error: function(xhr) { // if error occured
            alert("<?php echo $this->lang->line('error_occurred_please_try_again'); ?>");
            $this.button('reset');
        },
        complete: function() {
            $this.button('reset');
        }
    });
})

function popup(data) {
    var base_url = '<?php echo base_url() ?>';
    var frame1 = $('<iframe />');
    frame1[0].name = "frame1";
    frame1.css({
        "position": "absolute",
        "top": "-1000000px"
    });
    $("body").append(frame1);
    var frameDoc = frame1[0].contentWindow ? frame1[0].contentWindow : frame1[0].contentDocument.document ? frame1[0]
        .contentDocument.document : frame1[0].contentDocument;
    frameDoc.document.open();
    //Create a new HTML document.
    frameDoc.document.write('<html>');
    frameDoc.document.write('<head>');
    frameDoc.document.write('<title></title>');
    frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/bootstrap/css/bootstrap.min.css">');
    frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/dist/css/font-awesome.min.css">');
    frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/dist/css/ionicons.min.css">');
    frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/dist/css/AdminLTE.min.css">');
    frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/dist/css/skins/_all-skins.min.css">');
    frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/plugins/iCheck/flat/blue.css">');
    frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/plugins/morris/morris.css">');
    frameDoc.document.write('<link rel="stylesheet" href="' + base_url +
        'backend/plugins/jvectormap/jquery-jvectormap-1.2.2.css">');
    frameDoc.document.write('<link rel="stylesheet" href="' + base_url +
    'backend/plugins/datepicker/datepicker3.css">');
    frameDoc.document.write('<link rel="stylesheet" href="' + base_url +
        'backend/plugins/daterangepicker/daterangepicker-bs3.css">');
    frameDoc.document.write('</head>');
    frameDoc.document.write('<body>');
    frameDoc.document.write(data);
    frameDoc.document.write('</body>');

    frameDoc.document.write('</html>');
    frameDoc.document.close();
    setTimeout(function() {
        window.frames["frame1"].focus();
        window.frames["frame1"].print();
        frame1.remove();
    }, 500);
    return true;
}
</script>