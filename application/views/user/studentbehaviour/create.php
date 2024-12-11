<div class="content-wrapper">
	<!-- Main content -->
	<section class="content">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title"><i class="fa fa-search"></i>Create Behaviour</h3>
            </div>
            <div class="box-body">
                <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <form method="post" action="<?php echo base_url('user/studentbehaviour/store'); ?>">
                            <div class="form-group">
                                    <label><?php echo $this->lang->line('class'); ?></label><small class="req"> *</small>
                                <select id="class_id" name="class_id" class="form-control" >
                                    <option value=""><?php echo $this->lang->line('select'); ?></option> 
                                    <?php foreach ($classlist as $class) { ?>
                                    <option value="<?php echo $class['id'] ?>" <?php if (set_value('class_id') == $class['id']) echo "selected=selected" ?>><?php echo $class['class'] ?></option>
                                    <?php } ?>
                                </select>
                                    <span class="text-danger" id="error_class_id"></span>
                            </div>
                            <div class="form-group">
                                <label><?php echo $this->lang->line('student'); ?></label><small class="req"> *</small>
                                <select id="student_id" name="student_id" class="form-control" >
                                </select>
                                <span class="text-danger" id="error_class_id"></span>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">
                                         Date                                        </label>
                                <input name="date" placeholder="" type="text" class="form-control date" value="11/08/2023" readonly="readonly" autocomplete="off">
                                <span class="text-danger"></span>
                            </div>
                            <div class="form-group">
                                <label for="email">Behaviour Remarks</label>
                                <textarea  class="form-control" id="remarks" name="remarks"></textarea>
                            </div>
                            
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
       </div>
    </section>
</div>


<script>
$(function(){
    $("#class_id").on("change",function(e){
        debugger
        var class_section_id = $(this).val();
        studentlist(class_section_id)
    })
})

function studentlist(class_section_id){
    $.ajax({
        url: '<?php echo base_url(); ?>user/studentbehaviour/studentlist',
        type: 'post',
        data: {class_section_id:class_section_id},
        dataType : 'json',
        success: function(data){
            $('#student_id').empty();
            $('#student_id').append('<option value=""><?php echo $this->lang->line('select'); ?></option>');
            $.each(data, function (i, obj)
            {
                var select = "";
                if (student_id == obj.id) {
                    select = "selected";
                }
                
                if(obj.lastname != null){
                    var lastname = obj.lastname; 
                } else {
                    var lastname = '';
                }
            $('#student_id').append("<option value=" + obj.id +" "+ select + ">" + obj.firstname +" "+ lastname + " ("+ obj.admission_no + ")</option>");
            });
        }
    });
}

</script>