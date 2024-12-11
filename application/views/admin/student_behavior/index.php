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

                    <div style="display:flex; justify-content:space-between;">
						<h3 class="box-title"><i class="fa fa-search"></i> Student Behaviours </h3>
                        <a class="btn btn-primary btn-sm " href="<?= base_url("admin/student_behavior/create") ?>"><i class="fa fa-plus"></i> ADD QUESTIONS</a>
					</div>
                    </div>
                        <br>       
                    <div class="box-body">
                        <div class="row">
                            <div class="download_label">Students</div>
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered table-hover all-list table-col-nth" cellspacing="0" data-export-title="Students">
                                           <thead>
                                                <tr>
                                                    <th>Sno</th>
                                                    <th>Student Name</th>
                                                    <th>Questions</th>
                                                    <th><?php echo $this->lang->line('created_at'); ?></th>
                                                    <th class="text-right noExport"><?php echo $this->lang->line('action'); ?></th>
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
     initDatatable('all-list', 'admin/Student_behavior/get_student_behaviour', [],[], 100);
   
});
</script> 

<script>
( function ( $ ) {
    'use strict';
    debugger
    debugger
//     $(document).ready(function () {
//        $('#form1').on('submit', function (e) {
//         e.preventDefault();
//         var search= 'search_filter';
//         var formData = new FormData(this);
//         formData.append('search', 'search_filter');
//             initDatatable('all-list','admin/Student_behavior/get_result_list',response.params,[],100);
//         });
//    });
} ( jQuery ) );
</script>   