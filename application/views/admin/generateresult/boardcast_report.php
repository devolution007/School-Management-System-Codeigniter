
  <style>
    body{
      margin-left:auto;
      margin-right: auto;
      padding-left: 20px;
      padding-right: 20px;
    }
    .custom-table{
      /* border: 3px lightgray solid; */
    }
    table{
      font-size: 13px;
      text-align: center;
    }
    th{
      border: 1px solid !important;
      text-transform: uppercase;
    }
    .big{
      padding: 30px;
    }
    .rotate {
        background: transparent !important;
        font-size: 11px;
        /* height: 80px; */
        transform: rotate(-90deg) !important;
        /* position: relative; */
        /* left: 10px; */
        text-align: center;
        vertical-align: center;
        padding: 15px !important;
    }
    .position{
      position: relative;
      left: 40px;
    }
  </style>
<?php $this->load->view('layout/course_css.php'); ?>
<?php
$currency_symbol = $this->customlib->getSchoolCurrencyFormat();
?>

<div class="content-wrapper">
  <div class="custom-table container-fluid mt-3 table-responsive">
      <div class="table-responsive">
      <table class="table table-striped table-bordered table-hover all-list table-col-nth" id="datatable" cellspacing="0" data-export-title="Students">
      <thead>  
      <tr>
          <th class="big" rowspan="2"> <br><br> NO</th>
          <th class="big" rowspan="2"> <br><br> Admission No</th>
          <th class="big" rowspan="2"> <br><br> First Name</th>
          <th class="big" rowspan="2"> <br> <br> Surname, <span class="lower-header">Other name</span>
          </th>
          <!-- <th class="big" rowspan="2"> <br><br> Class Populaton</th> -->
          <th class="big" rowspan="2"> <br><br> School Opened</th>
          <th class="big" rowspan="2"> <br><br>Attendance</th>
          <th class="big" rowspan="2"> <br><br> Age</th>
          <th class="big" rowspan="2"> <br><br>Height</th>
          <th class="big" rowspan="2"> <br><br>Weight</th>
          <th class="big" rowspan="2"> <br><br>Gender</th>
          <?php foreach($subjects as $subject): ?>
            <th colspan="4"><?= $subject["name"] ?></th>
          <?php endforeach; ?>
          <th class="big" rowspan="2"><br><br>Total Score</th>
          <th class="big" rowspan="2"><br><br>Terminal Average Score</th>
          <!-- <th class="big" rowspan="2"><br><br>Terminal Position</th> -->
        </tr>
        <tr>
        <?php $i=1; foreach($subjects as  $subject): ?>
          <th class="rotate">1st Term</th>
          <th class="rotate">2nd Term</th>
          <th class="rotate">3rd Term</th>
          <th class="rotate">Total Score</th>
        <?php endforeach; ?>
        </tr>
        <thead>
        <tbody>
        <?php $i=1; foreach($students as  $student): ?>
          <tr>
            <td><?= $i++; ?></td>
            <td><?= $student["admission_no"] ?></td>
            <td><?= $student["firstname"] ?></td>
            <td><?= $student["lastname"] ?></td>
            <!-- <td> 400 at of 600 </td> -->
            <td></td>
            <td></td>
            <td><?php  
            $dob = new DateTime($student["dob"]);
            $now = new DateTime();
            $diff = $now->diff($dob);
            echo $diff->y;
            ?></td>
            <td><?= $student["height"] ?></td>
            <td><?= $student["weight"] ?></td>
            <td><?= $student["gender"] ?></td>
            <?php 
               $totalscore = 0; 
               foreach($subjects as  $subject): 
               $sub_name = str_replace(" ","_",$subject["name"]);
               $totalscore += $student["Test_1_".$sub_name.""]+ $student["Test_2_".$sub_name.""] + $student["Test_3_".$sub_name.""]; 
            ?>
            <td><?= $student["Test_1_".$sub_name.""] ?></td>
            <td><?= $student["Test_2_".$sub_name.""] ?></td>
            <td><?= $student["Test_3_".$sub_name.""] ?></td>
            <td><?= $student["Test_1_".$sub_name.""]+ $student["Test_2_".$sub_name.""] + $student["Test_3_".$sub_name.""] ?></td>
           <?php endforeach; ?>
            <td><?= $totalscore ?></td>
            <td><?= round($totalscore/(count($subjects)*300)*100); ?>%</td>   
            <!-- <td>aaaa</td>            -->
          </tr>
          <?php endforeach; ?>
          </tbody>
        </table>
    </div>
  </div>
  </div>
<script>
$(document).ready(function() {
    $("#datatable").DataTable({
      dom: 'Bfrtip', // 'B' for Buttons
      buttons: [
            {
                extend:    'copy',
                text:      '<i class="fa fa-files-o"></i>',
                titleAttr: 'Copy',
                 className: "btn-copy",
                title: $('#datatable').data("exportTitle"),
                  exportOptions: {
                    columns: ["thead th:not(.noExport)"]
                  }
            },
            {
                extend:    'excel',
                text:      '<i class="fa fa-file-excel-o"></i>',
                titleAttr: 'Excel',
                     className: "btn-excel",
                title: $('#datatable').data("exportTitle"),
                  exportOptions: {
                    columns: ["thead th:not(.noExport)"]
                  }
            },
            {
                extend:    'csv',
                text:      '<i class="fa fa-file-text-o"></i>',
                titleAttr: 'CSV',
                className: "btn-csv",
                title: $('#datatable').data("exportTitle"),
                  exportOptions: {
                    columns: ["thead th:not(.noExport)"]
                  }
            },
            {
                extend:    'pdf',
                text:      '<i class="fa fa-file-pdf-o"></i>',
                titleAttr: 'PDF',
                className: "btn-pdf",
                title: $('#datatable').data("exportTitle"),
                  exportOptions: {
                    columns: ["thead th:not(.noExport)"]
                  },

            },
            {
                extend:    'print',
                text:      '<i class="fa fa-print"></i>',
                titleAttr: 'Print',
                className: "btn-print",
                title: $('#datatable').data("exportTitle"),
                customize: function ( win ) {

                    $(win.document.body).find('th').addClass('display').css('text-align', 'center');
                    $(win.document.body).find('table').addClass('display').css('font-size', '14px');
                     $(win.document.body).find('td').addClass('display').css('text-align', 'left');
                    $(win.document.body).find('h1').css('text-align', 'center');
                },
                exportOptions: {
                    columns: ["thead th:not(.noExport)"]
                    
                  }

            }
        ]
    });
});
</script>