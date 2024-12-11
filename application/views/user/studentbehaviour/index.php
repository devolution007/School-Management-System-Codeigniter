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
                                            <th>Behaviour Remarks</th>

                                        </tr>
                                    </thead>
                                    <tbody>
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


<script>

$(document).ready(function() {
   
    //  emptyDatatable('all-list','data');
    initDatatable('all-list', 'user/user/get_student_behaviour/', [], [], 100);

});
</script>