<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<?= base_url() ?>backend/bootstrap-5.2.0/dist/css/bootstrap.min.css">
    <title>3RD TEAM RESULT</title>
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

    .text-color {
        color: green;
        font-weight: bold;
    }

    .passport_photo {
        height: 200px;
        width: 200px;
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
            border: 1px lightgray solid;
        }

        th,
        td {
            border: 1px lightgray solid;
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
    <center><button type="button" class="btn btn-success btn-sm mt-10" style="margin-top: 20px;"
            onclick="window.print()">Print Result</button>
    </center>
    <div id="printableArea">
        <?php
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
        ?>
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
                    class="col-md-7 text-center lh-1 d-flex flex-column flex-wrap align-items-cente">
                    <h2 style="font-family: 'circular';"><?= $settings->name ?></h2>
                    <span><strong>Address: </strong><?= $settings->address; ?></span></br>
                    <span>Email: <?= $settings->email ?> <strong>Tel: </strong><?= $settings->phone ?></span>
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
                    <table class="table table-bordered" style="border-color:black;" border="2">
                        <tr>
                            <th class="big" colspan="2" rowspan="3"> <br><br> SN </th>
                            <th class="big" colspan="2" rowspan="3"> <br><br> subject title</th>
                            <th colspan="5">3rd term report
                            </th>
                            <th colspan="5">cumulative results</th>
                            <th class="big" colspan="2" rowspan="3"><br><br>Session remark</th>
                        </tr>
                        <tr>

                            <?php
                            if (!empty($assessments_detail)) {
                                foreach ($assessments_detail as $key => $value) {
                                    echo '<th class="rotate">' . $value . '</th>';
                                }
                            }

                            ?>
                            <th class="rotate">Total Score</th>
                            <th class="rotate" rowspan="2">subject Position</th>
                            <th class="rotate">1st Term Total</th>
                            <th class="rotate">2nd Term Total</th>
                            <th class="rotate">3rd Term Total</th>
                            <th class="rotate position" rowspan="2">Average</th>
                            <th class="rotate position" rowspan="2">LETTER GRADE</th>
                        </tr>

                        <tr>

                            <?php
                            $total_achive_score = 0;
                            if (!empty($assessments_marks)) {
                                foreach ($assessments_marks as $key => $value) {
                                    $total_achive_score = $total_achive_score + $value;
                                    echo '<td>' . $value . '</td>';
                                }
                            } ?>

                            <td><?= $total_achive_score  ?></td>
                            <th>100</th>
                            <th>100</th>
                            <th>100</th>
                        </tr>
                        <tr>
                            <td colspan="14">
                                <h3>COGNITIVE REPORT</h3>
                            </td>
                        </tr>
                        <?php
                        $total_1st_term = 0;
                        $total_2st_term = 0;
                        $total_3st_term = 0;
                        $total_ava1 = 0;
                        $total_ava2 = 0;
                        $total_ava3 = 0;
                        $total_ava = 0;
                        $pass = 0;
                        $fail = 0;
                        $total_subject_marks = 0;
                        $passedMaths = false; // Example condition
                        $passedEnglish = false; // Example condition
                        $i = 1;
                        $grade_1=0;
                        $grade_2=0;
                        $grade_3=0;
                        $total_subjects = count($result->result_details);
                        foreach ($result->result_details as $k => $v) :
                   
                        ?>

                        <tr>
                            <td colspan="2"> <?= $i ?></td>
                            <td colspan="2"><?= $v->subject ?></td>
                            <?php
                                if ($sum_assessment_0 > 0) {
                                    echo "<td>" . (!empty($v->assessment_0) ? $v->assessment_0 : ' ') . "</td>";
                                }
                                ?>
                            <?php
                                if ($sum_assessment_1 > 0) {
                                    echo "<td>" . (!empty($v->assessment_1) ? $v->assessment_1 : ' ') . "</td>";
                                }
                                ?>
                            <?php
                                if ($sum_assessment_2 > 0) {
                                    echo "<td>" . (!empty($v->assessment_2) ? $v->assessment_2 : ' ') . "</td>";
                                }
                                ?>
                            <?php
                                if ($sum_assessment_3 > 0) {
                                    echo "<td>" . (!empty($v->assessment_3) ? $v->assessment_3 : ' ') . "</td>";
                                }
                                ?>
                            <?php
                                if ($sum_exams > 0) {
                                    echo "<td>" . (!empty($v->exams) ? $v->exams : ' ') . "</td>";
                                }

                                $total_marks = $v->assessment_0 + $v->assessment_1 + $v->assessment_2 + $v->assessment_3 + $v->exams;
                                $total_subject_marks = $total_subject_marks + $total_marks;
                                ?>
                            <td><?= (!empty($total_marks) ? $total_marks : ' ')  ?>
                            </td>
                            <td><?= (!empty($total_marks) ? addOrdinalSuffix($v->position) : '') ?></td>
                            <td> <?php echo (!empty($v->first_term_total) ? $v->first_term_total : '');
                                        $total_1nd_term = $total_1nd_term + $v->first_term_total;
                                        $grade_1 = determineGrade($v->first_term_total, '1st Term', $result->class_id);
                                       
                                        
                                        if (!empty($grade_1) && $grade_1 != 'F') {
                                            $pass = $pass + 1;
                                          
                                        } else if(!empty($grade_1) && $grade_1 == 'F') {
                                          
                                            $fail = $fail + 1;
                                        }else{
                                          
                                        }
                                        ?>
                            </td>
                            <td> <?= (!empty($v->second_term_total) ? $v->second_term_total : '');
                                        $total_2nd_term = $total_2nd_term + $v->second_term_total;
                                        $grade_2 = determineGrade($v->second_term_total, '2nd Term', $result->class_id);
                                       
                                        if (!empty($grade_2) && $grade_2 != 'F') {
                                            $pass = $pass + 1;
                                        } elseif(!empty($grade_2) && $grade_2 == 'F') {
                                             $fail = $fail + 1;
                                           
                                        } ?>
                            </td>
                            <td> <?= (!empty($v->final_term_total) ? $v->final_term_total : '');
                                        $total_3nd_term = $total_3nd_term + $v->final_term_total;
                                        $grade_3 = determineGrade($v->final_term_total, '3rd Term', $result->class_id);
                                    
                                        if (!empty($grade_3) && $grade_3 != 'F') {
                                            $pass = $pass + 1;
                                        } elseif(!empty($grade_3) && $grade_3 == 'F') {
                                            $fail = $fail + 1;
                                        }
                                        ?>
                            </td>
                            <td><?php $total_achived = round(($v->first_term_total + $v->second_term_total + $v->final_term_total) / 300 * 100);
                             if(!empty($total_achived)){
                                $totalnumbers += 100;
                            }
                                    echo (!empty($total_achived) ? $total_achived.' %' : '')
                                    ?>
                            </td>
                            <td colspan="1">

                                <?php

                                    $grade = determineGrade($total_achived, $result->terms, $result->class_id);

                                    echo (!empty($total_achived) ? $grade : '');
                                    ?>
                            </td>
                            <td colspan="2">
                                <?php

                                    if ($grade == 'D') {
                                        $subject_passed = $subject_passed + 1;
                                        if ($v->subject == "ENGLISH") {
                                            $passedEnglish = true;
                                        }
                                        if ($v->subject == "MATHEMATICS") {
                                            $passedMaths = true;
                                        }

                                        echo "Pass";
                                    } else if ($grade == 'C') {
                                        if ($v->subject == "ENGLISH") {
                                            $passedEnglish = true;
                                        }
                                        if ($v->subject == "MATHEMATICS") {
                                            $passedMaths = true;
                                        }
                                        $subject_passed = $subject_passed + 1;
                                        echo "Good";
                                    } else if ($grade == 'B') {
                                        if ($v->subject == "ENGLISH") {
                                            $passedEnglish = true;
                                        }
                                        if ($v->subject == "MATHEMATICS") {
                                            $passedMaths = true;
                                        }
                                        $subject_passed = $subject_passed + 1;
                                        echo "Very Good";
                                    } else if ($grade == 'A') {
                                        if ($v->subject == "ENGLISH") {
                                            $passedEnglish = true;
                                        }
                                        if ($v->subject == "MATHEMATICS") {
                                            $passedMaths = true;
                                        }
                                        $subject_passed = $subject_passed + 1;
                                        echo "Excellent";
                                    } else {
                                        $subject_failed = $subject_failed + 1;
                                        echo (!empty($total_achived) ? 'Fail' : '');
                                    }
                                    ?>
                            </td>
                        </tr>

                        <?php $i = $i + 1;
                            $all_terms_subjects_acive_marks = ($total_1nd_term + $total_2nd_term + $total_3nd_term);
                            $total_ava1 = $total_1nd_term / $i;
                            $total_ava2 = $total_2nd_term / $i;
                            $total_ava3 = $total_3nd_term / $i;
                            $total_ava = $total_ava1 + $total_ava2 + $total_ava3;

                        endforeach; 
                        
                        ?>
                        <tr>




                    </table>
                </div>
                <div class="col-3">
                    <table class="table table-bordered" style="border-color:black;" border="2">
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
                                <td><?= $result->following_instructions     ?></td>
                            </tr>
                            <tr>
                                <td> Working Independently</td>
                                <td><?= $result->working_independently     ?></td>
                            </tr>
                            <tr>
                                <td> Disturbing Others</td>
                                <td><?= $result->disturbing_others     ?></td>
                            </tr>
                            <tr>
                                <td> Does Next Work In Class</td>
                                <td><?= $result->does_next_work_in_class     ?></td>
                            </tr>
                            <tr>
                                <td> Take Care Of Materials</td>
                                <td><?= $result->take_care_of_materials     ?></td>
                            </tr>
                            <tr>
                                <td> Completion Of Work</td>
                                <td><?= $result->completion_of_work     ?></td>
                            </tr>
                            <tr>
                                <td> Finished Work On Time</td>
                                <td><?= $result->finished_work_on_time ?></td>
                            </tr>
                        </tbody>
                    </table>
                    <table class="table table-bordered" style="border-color:black;" border="2">
                        <thead>
                            <tr>
                                <th>Behaviour</th>
                                <th>Rating</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td> Puncatuality</td>
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
                                <td>Regularity</td>
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
                    <table class="table table-bordered table-sm" style="border-color:black;"  border="2">
                        <thead>
                            <tr>
                                <th>3RD Term Total Score</th>
                                <th>3RD Term Average</th>
                                <!-- <th>3RD Term Total Position</th> -->
                                <th>3RD Term Total Subjects Passed</th>
                                <th>3RD Term Subjects Failed</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><?= $all_terms_subjects_acive_marks ?> out of
                                    <?= $total_score = $totalnumbers * 3 ?></td>
                                <td><?= number_format($all_terms_subjects_acive_marks / $total_score * 100, 2) ?>&percnt;
                                </td>
                                <!-- <td>3th out of 28</td> -->
                                <td><?=$pass?> Subject(s)</td>
                                <td><?=$fail?> Subject(s)</td>
                            </tr>
                        </tbody>
                    </table>

                    <center><b>
                            <p style="text-transform: uppercase;">cumulative report summary</p>
                        </b></center>
                    <table class="table table-bordered table-sm" style="border-color:black;"  border="2">
                        <thead>
                            <tr>
                                <th>Total Score</th>
                                <th>Class Average</th>
                                <th>Subjects Passed</th>
                                <th>Subjects Failed</th>


                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><?= $total_subject_marks  ?> out of <?= $totalnumbers ?></td>
                                <td><?= round(($total_subject_marks / $totalnumbers) * 100, 2) ?> &percnt;</td>
                                <td><?= $subject_passed; ?> Subject(s)</td>
                                <td><?= $subject_failed; ?> Subject(s)</td>

                            </tr>
                        </tbody>
                    </table>
                    <center><b>
                            <p>KEY TO GRADING</p>
                        </b></center>
                    <table class="table table-borderless table-sm" style="border-color:black;" border="2">
                        <tbody>
                            <tr>
                                <td>0 - 44.9%: Advised to Repeat</td>
                                <td>45 - 49.9%: Promoted on Trial (must pass Maths or English, or else to repeat)</td>
                                <td>50 - 100%: Promoted to the Next Class</td>
                            </tr>
                        </tbody>
                    </table>
                    <table class="table table-bordered table-sm" style="border-color:black;"  border="2">
                        <thead>
                            <tr>
                                <th>CLASS TEACHER'S REMARK</th>
                                <th>HEAD TEACHER'S REMARK</th>
                                <th>PROMOTIONAL STATEMENT</th>
                                <th>RESUMPTION DATE </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><i><?= $result->class_teacher_remarks ?></i></td>
                                <td><i><?= $result->head_teacher_remarks ?></i></td>
                                <td><i><?= $result->permotional_statment ?></i></td>
                                <td>
                                    <span class="text-primary"><?= $result->created_at ?></span>

                            </tr>
                        </tbody>
                    </table>

                </div>
            </div>
        </div>
    </div>
    <script src="<?= base_url() ?>backend/bootstrap-5.2.0/dist/js/bootstrap.min.js"></script>
</body>
<?php
function addOrdinalSuffix($number)
{
    if ($number % 10 == 1 && $number % 100 != 11) {
        return $number . "<sup>st</sup>";
    } elseif ($number % 10 == 2 && $number % 100 != 12) {
        return $number . "<sup>nd</sup>";
    } elseif ($number % 10 == 3 && $number % 100 != 13) {
        return $number . "<sup>rd</sup>";
    } else {
        return $number . "<sup>th</sup>";
    }
}
?>

</html>