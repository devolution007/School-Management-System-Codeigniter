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
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <?php if($this->session->flashdata('success_message')): ?>
                        <div class="alert alert-success">
                            <?= $this->session->flashdata('success_message') ?>
                        </div>
                        <?php endif?>
                        <?php if(!empty($this->session->flashdata('delete_message'))): ?>
                        <div class="alert alert-danger">
                            <?= $this->session->flashdata('delete_message') ?>
                        </div>
                        <?php endif?>


                        <h3 class="box-title"><i class="fa fa-search"></i> Student Behaviours </h3>
                    </div>
                    <div class="box-body">
                        <div class="row">
                            <div class="download_label">Students</div>

                            <?php if ($this->session->flashdata('msg')) {?> <div class="alert alert-success">
                                <?php echo $this->session->flashdata('msg'); $this->session->unset_userdata('msg'); ?>
                            </div> <?php }?>
                            <div class="row">

                            </div>
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover all-list table-col-nth"
                                    cellspacing="0" data-export-title="Students">
                                    <thead>
                                        <tr>
                                            <th>Sno</th>
                                            <th>Student Name</th>
                                            <th>Questions</th>
                                            <th>Action</th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php if(!empty($data)){
                                            foreach($data as $key=>$value){

                                            ?>
                                        <tr>
                                            <td><?=$value->id?></td>
                                            <td><?=$value->firstname.' '.$value->lastname?></td>
                                            <td><?php echo $value->remarks; if(!empty($value->comments)){echo  "<br><b>Answer:</b>".' '.$value->comments;}?>
                                            </td>
                                            <td>
                                                <button type="button" class="btn btn-primary"
                                                    onclick="set_model_val('<?=$value->remarks_id?>')"
                                                    data-toggle="modal" data-target="#commentModal">
                                                    Add Answer
                                                </button>
                                            </td>
                                        </tr>
                                        <?php } }?>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.row -->
    </section>
    <!-- /.content -->
    <div class="clearfix"></div>
</div>

<!-- Button to trigger the modal -->


<!-- Modal -->
<div class="modal fade" id="commentModal" tabindex="-1" role="dialog" aria-labelledby="commentModalLabel"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="commentModalLabel">Add Answer</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <!-- Form to submit the comment -->
                <form id="commentForm">
                    <input type="hidden" id="remarks_id" name="remarks_id">
                    <div class="form-group">
                        <label for="comment">Answer:</label>
                        <textarea class="form-control" id="comment" name="comment" rows="3" required></textarea>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="submitComment">Submit</button>
            </div>
        </div>
    </div>
</div>

<script>
function set_model_val(id) {
    $('#remarks_id').val(id)
}
$(document).ready(function() {
    // Event listener for the submit button in the modal
    $('#submitComment').click(function() {
        // Get the comment from the textarea
        var comment = $('#comment').val();
        // Get the student ID from the hidden input field
        var remarks_id = $('#remarks_id').val();

        // AJAX request to submit the comment
        $.ajax({
            url: '<?=base_url('user/user/add_comment_on_remarks')?>', // Replace with your backend endpoint
            method: 'POST',
            data: {
                comment: comment,
                remarks_id: remarks_id
            },
            success: function(res) {

                debugger
                if (res.status == 0) {
                    var message = "";
                    $.each(res.error, function(index, value) {
                        message += value;
                    });
                    errorMsg(message);
                } else {
                    successMsg('Comments Added Successfully');
                    $('#commentModal').modal('hide');
                    window.location.reload();
                }
            },
            error: function(xhr, status, error) {
                // Handle error
                console.error('Error submitting comment:', error);
            }
        });
    });
});
</script>