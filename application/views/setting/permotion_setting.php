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
                            Promotion Setting
                        </h3>
                        <button type="button" class="btn btn-primary pull-right" data-toggle="modal"
                            data-target="#exampleModalLong">
                            Add
                        </button>
                    </div>
                    <table class="table table-responsive mt-5">
                        <thead>
                            <tr>
                                <th>Min Percentage</th>
                                <th>Max Percentage</th>
                                <th>Message</th>                                
                                <th>Action</th>

                            </tr>
                        </thead>
                        <tbody>
                            <?php   foreach($permotion_settings as $k => $v): ?>
                            <tr>
                                <td>
                                    <?= $v->min_score ?>%
                                </td>
                                <td>
                                    <?= $v->max_score ?>%
                                </td>
                                <td>
                                    <?=$v->message ?>
                                </td>

                                <td>
                                    <button class="btn btn-primary" type="button" data-toggle="modal" data-target="#exampleModalLong_<?= $v->id; ?>">Edit</button>
                                    <button class="btn btn-sm  btn-danger delbtn"
                                        onclick="return delete_permotion('<?=$v->id?>')">Delete</button>
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
                                                <form id="update_permotion_forms" action="<?php echo site_url("schsettings/permotion_setting_update") ?>" method="post">
                                                    <div class="row">
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
                                                        <div class="col-md-12">
                                                            <label>Message</label>
                                                            <input type="text" name="message"
                                                                value="<?=$v->message?>" class="form-control"
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
                            <h5 class="modal-title" id="exampleModalLongTitle">Add Promotion Setting</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form id="permotion_forms" action="" method="post">
                                <div class="row">

                                    <div class="col-md-12">
                                        <label>Min Score</label>
                                        <input type="number" name="min_score" value="" class="form-control" required />
                                    </div>
                                    <div class="col-md-12">
                                        <label>Max Score</label>
                                        <input type="number" name="max_score" value="" class="form-control" required />
                                    </div>
                                    <div class="col-md-12">
                                        <label>Message</label>
                                        <input type="text" name="message" value="" class="form-control" required />
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
var base_url = '<?php echo base_url(); ?>';

function delete_permotion(id) {
    if (!confirm('Are you sure you want to delete?')) {
        return false;
    }

    $.ajax({
        url: '<?php echo site_url("schsettings/delete_permotion/") ?>' + id,  // Ensure a trailing / for URL
        type: 'GET',
        dataType: 'json',

        success: function(data) {
            if (data.status === "fail") {
                var message = data.error ? data.error.join(" ") : "An error occurred.";
                errorMsg(message);
            } else {
                successMsg(data.message);
                window.location.reload();
            }
        },
        error: function(xhr, status, error) {
            console.error("Delete request failed:", xhr.responseText || error);
            errorMsg("An error occurred while deleting the promotion setting.");
        }
    });
}


// Save Button
$(".savebtn").on('click', function(e) {
    e.preventDefault();
    var $this = $(this);
    $this.prop('disabled', true); // disable button while processing
    $.ajax({
        url: '<?php echo site_url("schsettings/permotion_setting_save") ?>',
        type: 'POST',
        data: $('#permotion_forms').serialize(),
        dataType: 'json',
        success: function(data) {
            if (data.status === "fail") {
                var message = data.error ? data.error.join(" ") : "Save failed.";
                errorMsg(message);
            } else {
                successMsg(data.message);
                window.location.reload();
            }
            $this.prop('disabled', false); // re-enable button
        },
        error: function(xhr, status, error) {
            console.error("Save request failed:", xhr.responseText || error);
            errorMsg("An error occurred while saving the promotion setting.");
            $this.prop('disabled', false);
        }
    });
});

// Update Button
$(".updatebtn").on('click', function(e) {
    e.preventDefault();
    var $this = $(this);
    $this.prop('disabled', true); // disable button while processing
    $.ajax({
        url: '<?php echo site_url("schsettings/permotionUpdate") ?>',
        type: 'POST',
        data: $('#update_permotion_forms').serialize(),
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
        },
        error: function(xhr, status, error) {
            console.error("Update request failed:", xhr.responseText || error);
            errorMsg("An error occurred while updating the promotion setting.");
            $this.prop('disabled', false);
        }
    });
});
</script>
