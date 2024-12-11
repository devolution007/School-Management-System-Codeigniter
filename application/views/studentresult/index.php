<div class="content-wrapper" style="min-height: 946px;">
    <section class="content-header">
        <h1>
            <i class="glyphicon glyphicon-th"></i> <?php echo $this->lang->line('report'); ?> <small>
                <?php echo $this->lang->line('filter_by_class'); ?></small>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title"><i class="fa fa-search"></i>
                            <?php echo $this->lang->line('select_criteria'); ?></h3>
                    </div>
                    <form action="<?php echo site_url('user/user/search') ?>" method="get">
                        <div class="box-body">
                            <?php echo $this->customlib->getCSRF(); ?>
                            <div class="row">
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Sessions</label>
                                        <select name="session" id="session" class="form-control">
                                            <?php foreach($sessions as $session): ?>
                                            <option value="<?= htmlspecialchars($session['id']) ?>"
                                                <?= (!empty($_GET['session']) && $_GET['session'] == $session['id']) ? 'selected' : '' ?>>
                                                <?= htmlspecialchars($session["session"]) ?>
                                            </option>
                                            <?php endforeach; ?>

                                        </select>

                                        <span class="text-danger"><?php echo form_error('session'); ?></span>
                                    </div>
                                </div>

                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Class</label>
                                        <select name="class_id" id="class_id" class="form-control">
                                            <?php if(!empty($_GET['class_id'])){?>
                                            <?php foreach($class as $value): ?>
                                            <option value="<?=$value['id']?>"
                                                <?=(!empty($_GET['class_id']) && $_GET['class_id'] == $value['id']) ? 'selected' : ''?>>
                                                <?=htmlspecialchars($value["class"])?></option>

                                            <?php endforeach;} ?>
                                        </select>

                                        <span class="text-danger"><?php echo form_error('class_id'); ?></span>
                                    </div>
                                </div>
                                <div class="col-md-2 mt-10" style="margin-top: 20px;">
                                    <div class="form-group">

                                        <button type="submit" class="btn btn-primary" autocomplete="off"><i
                                                class="fa fa-search"></i>
                                            Search</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>S.No</th>
                                        <th>Terms</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach($results as $k => $result): ;?>
                                    <tr>
                                        <td><?= $k+=1 ?></td>
                                        <td><?= $result->terms ?></td>
                                        <td><a href="<?= base_url("user/user/detail/".$result->id.""); ?>">See
                                                Result</a></td>
                                    </tr>
                                    <?php endforeach; ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
    </section>

</div>
<script>
$(document).ready(function() {

    var student_id = '<?php echo $this->session->userdata('student')['student_id'] ;?>';
    $(document).on('change', '#session', function(e) {
        $('#class_id').html("");
        var session_id = $(this).val();
        var base_url = '<?php echo base_url() ?>';
        var div_data = '<option value=""><?php echo $this->lang->line('select'); ?></option>';
        $.ajax({
            type: "GET",
            url: base_url + "user/user/getByClass",
            data: {
                'session_id': session_id,
                'student_id': student_id,
            },
            dataType: "json",
            success: function(data) {
                $.each(data.data, function(i, obj) {
                    div_data += "<option value=" + obj.id + ">" + obj.class +
                        "</option>";
                });
                $('#class_id').append(div_data);
            }
        });
    });
});
</script>
</script>