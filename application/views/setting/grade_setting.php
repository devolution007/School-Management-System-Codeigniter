<style>
.select2-container--default .select2-selection--multiple .select2-selection__choice {
    color: black;
    /* Change this to the desired text color */
}
</style>
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
                            Grade Setting
                        </h3>
                        <button type="button" class="btn btn-primary pull-right" data-toggle="modal"
                            data-target="#exampleModalLong">
                            Add
                        </button>
                    </div>
                    <table id="grade_table" class="table table-responsive mt-5">
                        <thead>
                            <tr>
                                <th>Class</th>
                                <th>Term</th>
                                <th>Grade</th>
                                <th>Min Score</th>
                                <th>Max Score</th>
                                <th>Action</th>

                            </tr>
                        </thead>
                        <tbody>
                            <?php   foreach($grade_settings as $k => $v):
                                $class_data = $this->db->where('id',$v->class_id)->get('classes')->row();
                                ?>
                            <tr>
                                <td>
                                    <?= $class_data->class??''?>
                                </td>
                                <td>
                                <?= $v->term ?>
                                </td>
                                <td>
                                    <?= $v->grade ?>
                                </td>
                                <td>
                                    <?= $v->min_score ?>
                                </td>
                                <td>
                                    <?= $v->max_score ?>
                                </td>

                                <td>
                                    <button class="btn btn-primary" type="button" data-toggle="modal"
                                        data-target="#exampleModalLong_<?= $v->id; ?>">Edit</button>
                                    <button class="btn btn-sm  btn-danger"
                                        onclick="return delete_grade('<?=$v->id?>')">Delete</button>
                                </td>
                            </tr>
                            <div class="modal fade" id="exampleModalLong_<?= $v->id; ?>" tabindex="-1" role="dialog"
                                aria-labelledby="exampleModalLongTitle" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLongTitle">Add Scratch Card Pin
                                            </h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                            <div class="modal-body">
                                                <form id="update_grade_forms"
                                                    action="<?php echo site_url("schsettings/GradeSettingUpdate") ?>"
                                                    method="post">
                                                    <div class="row">

                                                        <div class="col-md-12">
                                                            <label>Class</label>
                                                            <select name="class_id" id="class_id" class="form-control">
                                                                <?php if(!empty($classes)){
                                                                    foreach($classes as $key => $value){
                                                                ?>
                                                                <option value="<?=$value->id?>"
                                                                    <?= ($value->id == $v->class_id) ? 'selected' : '' ?>>
                                                                    <?=$value->class?></option>
                                                                <?php } }?>

                                                            </select>

                                                        </div>

                                                        <div class="col-md-12">
                                                            <label>Term</label>
                                                            <select name="term" id="term" class="form-control">
                                                                <option value="1st Term"
                                                                    <?= ($v->term == '1st Term') ? 'selected' : '' ?>>
                                                                    1st Term</option>
                                                                <option value="2nd Term"
                                                                    <?= ($v->term == '2nd Term') ? 'selected' : '' ?>>
                                                                    2nd Term</option>
                                                                <option value="3rd Term"
                                                                    <?= ($v->term == '3rd Term') ? 'selected' : '' ?>>
                                                                    3rd Term</option>
                                                            </select>

                                                        </div>
                                                        <div class="col-md-12">
                                                            <label>Grade</label>
                                                            <input type="text" name="grade" value="<?=$v->grade?>"
                                                                class="form-control" required />
                                                        </div>
                                                        <input type="hidden" name="id" value="<?=$v->id?>">
                                                        <div class="col-md-12">
                                                            <label>Min Score</label>
                                                            <input type="number" name="min_score"
                                                                value="<?=$v->min_score?>" class="form-control"
                                                                required />
                                                        </div>
                                                        <div class="col-md-12">
                                                            <label>Max Score</label>
                                                            <input type="number" name="max_score"
                                                                value="<?=$v->max_score?>" class="form-control"
                                                                required />
                                                        </div>
                                                        <div class="col-md-12 mt-5">
                                                            </br>
                                                            <button type="submit"
                                                                class="pull-right btn btn-md btn-primary"> Save
                                                            </button>
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
                            <h5 class="modal-title" id="exampleModalLongTitle">Add Grade</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form id="grade_forms" action="" method="post">
                                <div class="row">
                                    <div class="col-md-12">
                                        <!-- <label>Class</label> -->
                                        <!-- <select name="class_id[]" id="class" multiple class="form-control select2">
                                        <option value=""> Select Classes</option>
                                            <?php if(!empty($classes)){
                                             foreach($classes as $key => $value){
                                                                ?>
                                            <option value="<?=$value->id?>"
                                               ><?=$value->class?>
                                            </option>
   


                                            <?php } }?>

                                        </select> -->


                                        <div class="form-group">
    <label>Select Classes</label><br>
    <?php if(!empty($classes)){
        foreach($classes as $key => $value){
    ?>
        <div class="form-check">
            <input type="checkbox" name="class_id[]" value="<?=$value->id?>" id="class_<?=$value->id?>" class="form-check-input">
            <label class="form-check-label" for="class_<?=$value->id?>">
                <?=$value->class?>
            </label>
        </div>
    <?php } } ?>
</div>





                                    </div>
                                    <div class="col-md-12">
                                        <label>Term</label>
                                        <select name="term" id="term" class="form-control">
                                            <option value="1st Term"> 1st Term</option>
                                            <option value="2nd Term"> 2nd Term</option>
                                            <option value="3rd Term"> 3rd Term</option>

                                        </select>
                                    </div>
                                    <div class="col-md-12">
                                        <label>Grade</label>
                                        <input type="text" name="grade" value="" class="form-control" required />
                                    </div>
                                    <div class="col-md-12">
                                        <label>Min Score</label>
                                        <input type="number" name="min_score" value="" class="form-control" required />
                                    </div>
                                    <div class="col-md-12">
                                        <label>Max Score</label>
                                        <input type="number" name="max_score" value="" class="form-control" required />
                                    </div>
                                    <div class="col-md-12 mt-5">
                                        </br>
                                        <button type="button" class="pull-right btn btn-md btn-primary savebtn"> Save
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>


        </div>
        <!--/.col (left) -->

        <!-- right column -->
</div>
</section><!-- /.content -->
</div><!-- /.content-wrapper -->

<!-- new END -->

</div><!-- /.content-wrapper -->

<script type="text/javascript">

$(document).ready(function() {
    // Initialize Select2 on the select element with id 'mySelect'
   
    $('.select2').select2();
});
var base_url = '<?php echo base_url(); ?>';

function delete_grade(id) {
    if (!confirm('Are you sure you want to delete?')) {
        return false;
    }

    $.ajax({
        url: '<?php echo site_url("schsettings/delete_grade/") ?>' + id,
        type: 'GET',
        data: [],
        dataType: 'json',

        success: function(data) {
            if (data.status == "fail") {
                var message = "";
                $.each(data.error, function(index, value) {
                    message += value;
                });
                errorMsg(message);
            } else {
                successMsg(data.message);
                window.location.reload();
            }

            $this.button('reset');
        }
    });
}

$(".savebtn").on('click', function(e) {
    var $this = $(this);
    $this.button('loading');
    $.ajax({
        url: '<?php echo site_url("schsettings/GradeSettingSave") ?>',
        type: 'POST',
        data: $('#grade_forms').serialize(),
        dataType: 'json',

        success: function(data) {
            if (data.status == "fail") {
                var message = "";
                $.each(data.error, function(index, value) {
                    message += value;
                });
                errorMsg(message);
            } else {
                successMsg(data.message);
                window.location.reload();
            }

            $this.button('reset');
        }
    });
});

$(".updatebtn").on('click', function(e) {
    var $this = $(this);
    $this.button('loading');
    $.ajax({
        url: '<?php echo site_url("schsettings/GradeSettingUpdate") ?>',
        type: 'POST',
        data: $('#update_grade_forms').serialize(),
        dataType: 'json',

        success: function(data) {
            if (data.status == "fail") {
                var message = "";
                $.each(data.error, function(index, value) {
                    message += value;
                });
                errorMsg(message);
            } else {
                successMsg(data.message);
                //window.location.reload();
            }

            $this.button('reset');
        }
    });
});
</script>