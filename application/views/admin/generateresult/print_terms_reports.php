<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<?=base_url('backend/bootstrap-5.2.0/dist/css/bootstrap.min.css')?>">
    <title>1ST TEAM RESULT</title>
    <style>
    body {
        margin-left: auto;
        margin-right: auto;
        padding-left: 20px;
        padding-right: 20px;
    }


    .custom-table {
        border: 3px lightgray solid;
    }

    table {
        font-size: 13px;
        text-align: center;
    }

    th {
        text-transform: uppercase;
    }

    .big {
        padding: 30px;
    }

    .rotate {
        width: ;
        font-size: 10px;
        height: 100px;
        transform: rotate(-90deg);
        position: relative;
        left: 35px;
    }

    .position {
        position: relative;
        left: 40px;
    }

    .top-header {
        border-top-left-radius: 20px;
        border-top-right-radius: 20px;

        text-align: center;
    }

    .passport_photo {
        height: 200px;
        width: 200px;
    }

    .text-color {
        color: green;
        font-weight: bold;
    }

    @media print {
    body * {
        visibility: hidden;
    }

    #printableArea,
    #printableArea * {
        visibility: visible;
    }

    /* Show table borders */
    table {
        border-collapse: collapse;
        border: 2px lightgray solid;
    }

    th, td {
        border: 2px lightgray solid;
    }
}
.table-bordered>:not(caption)>* {
        border: 2px solid black;
    }
    .table-bordered>:not(caption)>*>* {
        border: 2px solid black;
    }
    .table>:not(caption)>*>* {
        border: 2px solid black;
    }
    </style>
</head>

<body>
    <?php

// assessments_detail
// assessments_marks
$data = $this->setting_model->get_assisments();
if (!empty($data->assessments_detail)) {
    $assessments_detail = json_decode($data->assessments_detail);
   
}
if (!empty($data->num_of_assessments)) {
    $num_of_assessments = json_decode($data->num_of_assessments);
}
if (!empty($data->assessments_marks)) {
    $assessments_marks = json_decode($data->assessments_marks);
}



if ($result->Type == 1) {
    $totalsubject = 0;
    $totalnumbers = 0;
    $sum_assessment_0 = 0;
    $sum_assessment_1 = 0;
    $sum_assessment_2 = 0;
    $sum_assessment_3 = 0;
    $sum_exams = 0;
    $subject_failed = 0;
    $subject_passed = 0;
    $exams_array = array();

    foreach ($result->result_details as $k => $va) :
        $sum_assessment_0 = $sum_assessment_0 + $va->assessment_0 ?? 0;
        $sum_assessment_1 = $sum_assessment_1 + $va->assessment_1 ?? 0;
        $sum_assessment_2 = $sum_assessment_2 +  $va->assessment_2 ?? 0;
        $sum_assessment_3 = $sum_assessment_3 + $va->assessment_3 ?? 0;
        $sum_exams = $sum_exams +  $va->exams ?? 0;
        $totalsubject++;
       
        $exams_array["subject"][str_replace(" ", "_", $va->subject)] =
            (isset($va->assessment_0) ? $va->assessment_0 : 0) + (isset($va->assessment_1) ? $va->assessment_1 : 0) +
            (isset($va->assessment_2) ? $va->assessment_2 : 0) + (isset($va->assessment_3) ? $va->assessment_3 : 0) +
            (isset($va->exams) ? $va->exams : 0);
    endforeach;
    $total_achive_score =  $sum_assessment_0 + $sum_assessment_1 + $sum_assessment_2 + $sum_assessment_3 + $sum_exams;
    $total_subject_marks=0;
?>
    <center><button type="button" class="btn btn-success btn-sm mt-10" style="margin-top: 20px;"
            onclick="window.print()">Print Result</button>
    </center>
    <div id="printableArea">
        <div class="custom-table container-fluid mt-3 table-responsive">
            <div class="row top-header">
                <!-- <h2><?= $settings->name ?></h2> -->
            </div>
            <div class="row" style="margin-top:20px; align-items: center;">
                <div class="col-md-2">
                    <div class="text-center">
                        <img src="<?php echo base_url('uploads/school_content/logo/app_logo/' . $settings->app_logo); ?>"
                            class="rounded img-thumbnail" style="width:200px; padding: 0.7rem;" alt="...">
                    </div>
                </div>
                <div
                    class="col-md-7 text-center lh-1 d-flex flex-column flex-wrap align-items-center">
                    <h2 style="font-family: 'circular';"><?= $settings->name ?></h2>
                    <span><strong>Address: </strong><?= $settings->address; ?></span></br>
                    <span><strong>Email: </strong><?= $settings->email ?> <strong>Tel: </strong><?= $settings->phone ?></span>
                </div>
                <div class="col-md-3  d-flex flex-column flex-wrap align-items-center justify-content-center">
                    <?php if (!empty($student["image"])) { ?>
                    <img src="<?= base_url() . $student["image"]; ?>" class="rounded img-thumbnail  passport_photo"
                        alt="...">
                    <?php } else {  ?>
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStJuS_lZiCLJEu7y5Qov_SZtY_rjep0dAM7t4xrOobTA&s"
                        class="rounded img-thumbnail  passport_photo" alt="...">
                    <?php } ?>
                </div>
            </div>
            <br>
            <div class="row" style="background-color:lightblue; margin:10px 0px">
                <div class="col-md-6">
                    <b>Name:</b> <span class="text-color"> <?= $student["firstname"]; ?> <?= $student["lastname"]; ?>
                    </span>
                </div>
                <div class="col-md-6">
                    <b>Session:</b> <span class="text-color"> <?= $result->session; ?> Academic </span>
                </div>
                <div class="col-md-6">
                    <b>Admission Year: </b> <span class="text-color">
                        <?= date('Y', strtotime($student["admission_date"])); ?> </span>
                </div>
                <div class="col-md-6">
                    <b>Exam:</b> <span class="text-color"><?= $result->terms ?></span>
                </div>
                <div class="col-md-6">
                    <b>Admission No: </b> <span class="text-color"><?= $student["admission_no"] ?> </span>
                </div>
                <div class="col-md-6">
                    <b>Class: </b> <span class="text-color"><?= $student["class"]; ?></span>
                </div>
                <div class="col-md-6">
                    <b>Class Teacher: </b> <span class="text-color"> <?= $result->class_teacher_name ?></span>
                </div>

            </div>

            <div class="row">
                <div class="col-9 table-responsive">
                    <table class="table table-bordered" style="border: 2px solid; border-color:black;" border="2">


                        <tr>
                            <th class="big" colspan="1" rowspan="3"> <br><br>SN</th>
                            <th class="big" colspan="1" rowspan="3"> <br><br> subject title</th>
                            <th colspan="5"><?= $result->terms ?> report
                            </th>
                        </tr>
                        <tr>

                            <?php
                            if (!empty($assessments_detail)) {
                                foreach ($assessments_detail as $key => $value) {
                                    echo '<th class="rotate">'.$value.'</th>';
                                }
                            }
                            ?>
                            <th class="rotate">Total Score</th>
                            <th class="rotate position" rowspan="1">LETTER GRADE</th>
                            <th class="rotate" rowspan="1">Session remark</th>

                        </tr>

                        <tr>

                            <?php
                             $total_achive_score=0;
                            if (!empty($assessments_marks)) {
                                foreach ($assessments_marks as $key => $value) {
                                    $total_achive_score=$total_achive_score+$value;
                                    echo '<td>'.$value.'</td>';
                                }
                            } ?>

                            <td><?= $total_achive_score  ?></td>

                        </tr>
                        </tr>
                        <tr>
                            <td colspan="14"><b></b></td>
                        </tr>

                        <?php $i = 1;
                      $total_1st_term=0;
                      $total_2st_term=0;
                      $total_3st_term=0;
                      $total_ava1=0;
                      $total_ava2=0;
                      $total_ava3=0;
                      $total_ava=0;
                      $total_subject_marks=0;
                        foreach ($result->result_details as $k => $v) :

                        ?>
                        <tr>
                            <td colspan="1"><?= $i ?></td>
                            <td colspan="1"><?= $v->subject ?></td>
                            <?php 
                            if($sum_assessment_0 > 0){
                            echo "<td>".(!empty($v->assessment_0)?$v->assessment_0:' ')."</td>";
                            }
                            ?>
                            <?php 
                            if($sum_assessment_1 > 0){
                                echo "<td>".(!empty($v->assessment_1)?$v->assessment_1:' ')."</td>";
                            }
                            ?>
                            <?php 
                            if($sum_assessment_2 > 0){
                                echo "<td>".(!empty($v->assessment_2)?$v->assessment_2:' ')."</td>";
                            }
                            ?>
                            <?php 
                            if($sum_assessment_3 > 0){
                                echo "<td>".(!empty($v->assessment_3)?$v->assessment_3:' ')."</td>";
                            }
                            ?>
                            <?php 
                            if($sum_exams > 0){
                                echo "<td>".(!empty($v->exams)?$v->exams:' ')."</td>";
                            }

                            $total_marks=$v->assessment_0 + $v->assessment_1 + $v->assessment_2 + $v->assessment_3 + $v->exams;
                            if(!empty($total_marks)){
                                $totalnumbers += 100;
                            }
                            $total_subject_marks=$total_subject_marks + $total_marks;
                            ?>
                            <td><?= (!empty($total_marks)?$total_marks:' ')  ?>
                            </td>


                            <td colspan="1">
                                <?php
                                    $total_achived = ($total_marks) / 100 * 100;
                                     $grade= determineGrade($total_achived,$result->terms,$result->class_id);
                                     echo (!empty($total_marks)?$grade:' ');
                                    ?>
                            </td>
                            <td colspan="1">
                                <?php
                                    $total_achived = ($total_marks) / 100 * 100;
                                    if ($grade == 'D') {
                                        $subject_passed=$subject_passed+1;                
                                         echo "Pass";
                                     } else if ($grade == 'C') {
                                        $subject_passed=$subject_passed+1;
                                         echo "Good";
                                     } else if ($grade == 'B') {
                                        $subject_passed=$subject_passed+1;
                                         echo "Very Good";
                                     } else if ($grade == 'A') {
                                        $subject_passed=$subject_passed+1;
                                         echo "Excellent";
                                     } else {
                                        $subject_failed=$subject_failed+1;
                                       echo (!empty($total_marks)?'Fail':' ');
                                       
                                     }
                                    ?>
                            </td>
                        </tr>
                        <?php    $i = $i + 1; endforeach ?>

                    </table>
                </div>
                <div class="col-3">
                    <table class="table table-bordered" style="border: 2px solid; border-color:black;" border="2">
                        <thead>
                            <tr>
                                <th colspan="2" class="big">Affective and Psycomotor Report</th>
                            </tr>
                            <tr>
                                <th>work habits</th>
                                <th>Rating</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td> following instructions</td>
                                <td><?= $result->following_instructions   ?></td>
                            </tr>
                            <tr>
                                <td> Working Independently</td>
                                <td><?= $result->working_independently   ?></td>
                            </tr>
                            <tr>
                                <td> Disturbing Others</td>
                                <td><?= $result->disturbing_others   ?></td>
                            </tr>
                            <tr>
                                <td> Does Next Work In Class</td>
                                <td><?= $result->does_next_work_in_class   ?></td>
                            </tr>
                            <tr>
                                <td> Take Care Of Materials</td>
                                <td><?= $result->take_care_of_materials   ?></td>
                            </tr>
                            <tr>
                                <td> Completion Of Work</td>
                                <td><?= $result->completion_of_work   ?></td>
                            </tr>
                            <tr>
                                <td>Finished Work On Time</td>
                                <td><?= $result->finished_work_on_time ?></td>
                            </tr>
                        </tbody>
                    </table>
                    <table class="table table-bordered" style="border: 2px solid;border-color:black;" border="2">
                        <thead>
                            <tr>
                                <th>Behaviour</th>
                                <th>Rating</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Puncatuality</td>
                                <td><?= $result->puncatuality ?></td>
                            </tr>
                            <tr>
                                <td> Persional Cleanliness</td>
                                <td><?= $result->persional_cleanliness ?></td>

                            </tr>
                            <tr>
                                <td>Assignments</td>
                                <td><?= $result->assignments ?></td>
                            </tr>
                            <tr>
                                <td> Regularity</td>
                                <td><?= $result->regularity ?></td>
                            </tr>
                            <tr>
                                <td> Ganeral Conduct</td>
                                <td><?= $result->ganeral_conduct ?></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="col-12">
                                       <center><b>
                            <p style="text-transform: uppercase;">Summary of <?= $student["firstname"]; ?>
                                <?= $student["lastname"]; ?></p>
                        </b></center>
                    <table class="table table-bordered table-sm" style="border: 2px solid; border-color:black;" border="2">
                        <thead>
                            <tr>
                                <th><?= $result->terms ?> Total Score</th>
                                <th><?= $result->terms ?> Average</th>
                                <!-- <th><?= $result->terms ?> Total Position</th> -->
                                <th><?= $result->terms ?> Total Subjects Passed</th>
                                <th><?= $result->terms ?> Subjects Failed</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><?=$total_subject_marks?> out of <?=$totalnumbers?></td>
                                <td><?= number_format($total_subject_marks / $totalnumbers * 100, 2) ?>&percnt;</td>
                                <!-- <td>3th out of 28</td> -->
                                <td><?=$subject_passed?> Subject(s)</td>
                                <td><?=$subject_failed?> Subject(s)</td>
                            </tr>
                        </tbody>
                    </table>

                    <center><b>
                            <p>Key To Grading</p>
                        </b></center>
                    <table class="table table-borderless table-sm" style="border: 2px solid; border-color:black;" border="2">
                        <tbody>
                            <tr>
                                <td>[1] <?= minScore('F', $result->terms) ?>%-<?= maxScore('F', $result->terms) ?>% = F
                                    = Fail
                                </td>
                                <td>[2] <?= minScore('D', $result->terms) ?>%-<?= maxScore('D', $result->terms) ?>% = D
                                    = Pass
                                </td>
                                <td>[3] <?= minScore('C', $result->terms) ?>%-<?= maxScore('C', $result->terms) ?>% = C
                                    = Good
                                </td>
                                <td>[4] <?= minScore('B', $result->terms) ?>%-<?= maxScore('B', $result->terms) ?>% = B
                                    = Very
                                    Good</td>
                                <td>[5] <?= minScore('A', $result->terms) ?>%-<?= maxScore('A', $result->terms) ?>% = A
                                    =
                                    Excellent</td>
                            </tr>
                        </tbody>
                    </table>
                    <table class="table table-bordered table-sm" style="border: 2px solid; border-color:black;" border="2">
                        <thead>
                            <tr>
                                <th>CLASS TEACHER'S REMARK</th>
                                <th>HEAD TEACHER'S REMARK</th>
                                <th>CLASS TEACHER NAME</th>
                                <th>RESUMPTION DATE </th>


                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><i><?= $result->class_teacher_remarks ?></i></td>
                                <td><i><?= $result->head_teacher_remarks ?></i></td>
                                <td><i>
                                        <?php $sessions_data=$this->db->where('session',$result->session)->get('sessions')->row();
                                    if(!empty($sessions_data)){
                                        $teacher_data=$this->db->where('session_id',$sessions_data->id)->where('class_id',$result->class_id)->get('class_teacher')->row();
                                     
                                        if(!empty($teacher_data->staff_id)){
                                            $staff_data=$this->db->where('id',$teacher_data->staff_id)->get('staff')->row();
                                        }
                                       
                                    }
                                    if(!empty($staff_data)){
                                        echo  $staff_data->name.' '.$staff_data->surname;
                                    }
                                 
                                ?>
                                    </i></td>

                                <td>
                                    <span class="text-primary"><?= $result->created_at ?></span>
                                </td>

                            </tr>
                        </tbody>
                    </table>

                </div>
            </div>
        </div>
        <?php } ?>
        <?php
    if ($settings->result_setting == 'upload_result' || $settings->result_setting == 'both' && !empty($result->file_url)) {
        // Specify the path to your PDF file
        $pdfPath = base_url($result->file_url);
    ?>
        <div class="table-responsive" style="overflow:hidden;">
            <!-- <div class="row top-header">
                <h2><?= $settings->name ?></h2>
            </div> -->
            <div class="row" style="margin-top:20px; align-items: center;">
                <div class="col-md-2">
                    <div class="text-center">
                        <img src="<?php echo base_url('uploads/school_content/logo/app_logo/' . $settings->app_logo); ?>"
                            class="rounded img-thumbnail" style="width:200px; padding: 0.7rem;" alt="...">
                    </div>
                </div>
                <div
                    class="col-md-7 text-center lh-1 d-flex flex-column flex-wrap align-items-center">
                    <h2 style="font-family: 'circular';"><?= $settings->name ?></h2>
                    <span><strong>Address: </strong><?= $settings->address; ?></span></br>
                    <span><strong>Email: </strong><?= $settings->email ?> <strong>Tel: </strong><?= $settings->phone ?></span>
                </div>
                <div class="col-md-3  d-flex flex-column flex-wrap align-items-center justify-content-center">
                    <?php if (!empty($student["image"])) { ?>
                    <img src="<?= base_url() . $student["image"]; ?>" class="rounded img-thumbnail  passport_photo"
                        alt="...">
                    <?php } else {  ?>
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStJuS_lZiCLJEu7y5Qov_SZtY_rjep0dAM7t4xrOobTA&s"
                        class="rounded img-thumbnail  passport_photo" alt="...">
                    <?php } ?>
                </div>
            </div>
            <br>

            <center class="fortargetimg">
                <!-- <iframe src="<?php echo $pdfPath; ?>" width="100%" height="1000px"></iframe> -->
                 <embed src="<?php echo $pdfPath; ?>" width="100%" height="100%">

            </center>
        </div>
    </div>
    <?php } ?>
    </div>
    <script src="<?=base_url('backend/bootstrap-5.2.0/dist/js/bootstrap.min.js')?>"></script>
</body>

</html>