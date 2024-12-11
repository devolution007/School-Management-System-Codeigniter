<?php $this->load->view('layout/course_css.php'); ?>
<?php
$currency_symbol = $this->customlib->getSchoolCurrencyFormat();
$result =   $this->customlib->getLoggedInUserData();

?>
<div class="content-wrapper">
  <section class="content">
      <div class="container">
            <div class="row">
              <div class="col-md-12">
                  <h2>Behaviour <small><?=  $lists[0]->firstname . " " . $lists[0]->lastname; ?></small></h2>
                  <table class="table table-bordered">
                      <thead>
                        <tr> 
                          <th>Date</th>
                          <th>Behaviour Remarks</th>
                        </tr>
                      </thead>
                      <tbody>
                        <?php foreach($lists as $list): ?>
                          <tr>
                              <td><?= $list->create_date ?></td>
                              <td><?= $list->remarks ?></td>
                          </tr>
                         <?php endforeach ?>
                      </tbody>
                    </table>
              </div>
            </div>
      </div>
  </section>
</div>
<!-- Modal -->
<div id="coursemodal" class="modal fade overflow-lg" role="dialog">
  <div class="modal-dialog video-dialogfull">
    <div class="video-contentfull">
        <div id="course_model_body"></div>
    </div>
  </div>
</div>

<div id="paymentprocessingmodal" class="modal fade"  role="dialog">
    <div class="modal-dialog ">
      <div class="modal-content">    
        <div class="modal-header modal-media-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4 class="box-title" id="title"><?php echo $this->lang->line('processing_payment'); ?></h4>
        </div>    
        <button type="button" class="close" data-dismiss="modal" >&times;</button>
          <div class="scroll-area">
            <div class="modal-body paddbtop">
              <div class="row">              
                <table class="table ">               
                  <tr>
                    <td><?php echo $this->lang->line('amount');?></td>
                    <td><span id="p_paid_amount"></span></td>
                  </tr>
                  <tr>
                    <td><?php echo $this->lang->line('payment_method');?></td>
                    <td><span id="p_payment_mode"></span></td>
                  </tr>
                  <tr>
                    <td><?php echo $this->lang->line('payment_type');?></td>
                    <td><span id="p_payment_type"></span></td>
                  </tr>
                  <tr>
                    <td><?php echo $this->lang->line('transaction_id');?></td>
                    <td><span id="p_transaction_id"></span></td>
                  </tr>
                  <tr>
                    <td><?php echo $this->lang->line('note');?></td>
                    <td><span id="p_note"></span></td>
                  </tr>
                  <tr>
                    <td><?php echo $this->lang->line('date');?></td>
                    <td><span id="p_date"></span></td>
                  </tr>
                </table>
              </div><!--./row-->
          </div><!--./modal-body-->
      </div>
    </div>
  </div>
</div><!--#/coursedetailmodal-->

<div id="coursedetailmodal" class="modal fade" role="dialog">
  <div class="modal-dialog modalwrapwidth">
    <div class="modal-content">
      <button type="button" class="close" data-dismiss="modal" onclick="stopvideo()">&times;</button>
        <div class="scroll-area-full-mobile">
          <div class="modal-body paddbtop">
              <div class="row">
                <div id="coursedetail1_id">
                </div>
              </div><!--./row-->
          </div><!--./modal-body-->
      </div>
    </div>
  </div>
</div><!--#/coursedetailmodal-->

<div class="modal fade" id="addRatingModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog ">
    <div class="modal-content modal-media-content">
      <div class="modal-header modal-media-header p0">
        <button type="button" class="close button" data-dismiss="modal">&times;</button>
        <div class="box-header ptbnull noborder">
          <h4 class="box-title titlefix"><?php echo $this->lang->line('add_rating'); ?></h4>
        </div>
      </div>
      <div class="modal-body pb0">
        <form id="addratingform" method="post" enctype="multipart/form-data">
          <div class="overflowhidden">
            <div class="form-group">
              <label><?php echo $this->lang->line('rating'); ?> <small class="req"> *</small></label>
              <input name="course_id" id="course_id" value=""  type="hidden" />
              <span onclick="rate('1')" id='rate1' class="fa fa-star"></span>
              <span onclick="rate('2')" id='rate2' class="fa fa-star"></span>
              <span onclick="rate('3')" id='rate3' class="fa fa-star"></span>
              <span onclick="rate('4')" id='rate4' class="fa fa-star"></span>
              <span onclick="rate('5')" id='rate5' class="fa fa-star"></span>
              <input type="hidden" autocomplete="off" class="form-control" id="rate" name="rate">
              <span class="text-danger"><?php echo form_error('rating'); ?></span>
            </div>
            <div class="form-group">
              <label><?php echo $this->lang->line('review'); ?> <small class="req"> *</small></label>
              <textarea id="review" name="review" cols="74" rows="5" class="form-control"></textarea>
            </div>
            <div class="modal-footer pr0">
              <button type="submit" class="btn btn-info pull-right"><?php echo $this->lang->line('save'); ?></button>
           </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>

<script type="text/javascript">
  $(function(){   // when student or guest directly starts lesson from front  page   
      if (sessionStorage.length != 0) {
          $("#coursemodal").modal('show');
          var coureseID =  sessionStorage.getItem("lesson_id");

          startlesson(coureseID);         
           
         }
  });
</script>
<script>

function openCourse(evt, courseName) {
  var i, tabcontent, tablinks;
  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablinks");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" active", "");
  }
  document.getElementById(courseName).style.display = "block";
  evt.currentTarget.className += " active";
}

(function ($) {
  "use strict";

  $(document).ready(function(){
    $('#course_detail_tab').show();
  })

  $('.lesson_ID').click(function(){
     var coureseID = $(this).attr('lesson-data');
     startlesson(coureseID);	
  });

  $('.coursedetail').click(function(){
    var courseID = $(this).attr('data-id');
	  $('#coursedetail1_id').html('');
    $.ajax({
     url  : "<?php echo base_url(); ?>user/studentcourse/coursedetail",
     type : 'post',
     data : {courseID:courseID},
     beforeSend: function () {
      $('#coursedetail1_id').html('Loading...  <i class="fa fa-spinner fa-spin"></i>');
     },
     success : function(response){
       $('#coursedetail1_id').html(response);
     }
    });
  })  

})(jQuery);
</script>

<script>
( function ( $ ) {
  'use strict';
    $(document).ready(function () {
      initDatatable('course-list','user/studentcourse/getcourselist',[],[],100,
                    [{ "bSortable": false, "aTargets": [ -1,] ,'sClass': 'dt-body-right'}, { "bSortable": false, "aTargets": [ -2,] ,'sClass': 'dt-body-right'},{ "bSortable": false, "aTargets": [ -3,] ,'sClass': 'dt-body-right'}, { "bSortable": false, "aTargets": [ -4,] ,'sClass': 'dt-body-right'} ]);       
    });
} ( jQuery ) )
</script>

<script>
( function ( $ ) {
  'use strict';
  $('a[data-toggle="tab"]').on('shown.bs.tab', function(e){
    $($.fn.dataTable.tables(true)).DataTable()
      .columns.adjust();
  });
} ( jQuery ) )
</script>

<script>
  function loadpaymentcoursedetail(paymentid){
  $('#paymentprocessing').html('');
  $.ajax({
    url  : "<?php echo base_url(); ?>user/studentcourse/get_processingpayment",
    type : 'post',
    data : {id:paymentid}, 
    dataType:'json',
    beforeSend: function () {
     $('#paymentprocessing').html('Loading...  <center><i class="fa fa-spinner fa-spin"></i></center>');
    },
    success : function(response){
      $("#paymentprocessingmodal").modal();
      $('#p_actual_price').html(response.actual_price);
      $('#p_paid_amount').html(response.paid_amount);
      $('#p_payment_mode').html(response.payment_mode);
      $('#p_payment_type').html(response.payment_type);
      $('#p_transaction_id').html(response.transaction_id);
      $('#p_note').html(response.note);
      $('#p_date').html(response.date);
      $('#coursedetailmodal').modal('hide');
    }
  });
}

function loadcoursedetail(courseID){
	$('#coursedetail1_id').html('');
  $.ajax({
    url  : "<?php echo base_url(); ?>user/studentcourse/coursedetail",
    type : 'post',
    data : {courseID:courseID},
    beforeSend: function () {
     $('#coursedetail1_id').html('Loading...  <center><i class="fa fa-spinner fa-spin"></i></center>');
    },
    success : function(response){
      $("#coursedetailmodal").modal();
      $('#coursedetail1_id').html(response);
    }
  });
}

function afterprint(courseID){   
  startlesson(courseID);
}
</script>
<script>
	function stopvideo(){
		$('#coursedetail1_id').html('');
		$('#coursedetailmodal').modal('hide');
	}

( function ( $ ) {
  'use strict';
  
  $(document).on('click', '.print_btn', function () {
    var courseid = $(this).attr('data-id');
    $.ajax({
        url: '<?php echo site_url("user/studentcourse/printinvoice") ?>',
        type: 'post',
        data: {courseid:courseid},
        success: function (response) {
            popup(response);
        }
    });
  });

  $(document).on('click','.ratethis', function(){
    $('#course_id').val($(this).attr('data-course-id'));
    $.ajax({
        url: '<?php echo site_url("user/studentcourse/checkratingstatus") ?>',
        type: 'post',
        data: {courseid:$(this).attr('data-course-id')},
        dataType: 'json',
        success: function (response) {
          $('#review').val(response.review);
          var i = 1;
          for (i = 1; i <= 5; i++) {
            if(response.rating >= i){
              $('span#rate'+i).css("color", "orange");
            }else{
              $('span#rate'+i).css("color", "");
            }
          }
          $('#rate').val(response.rating);
        }
    });
  });

} ( jQuery ) )
</script>
<script>
function popup(data)
{
    var base_url = '<?php echo base_url() ?>';
    var frame1 = $('<iframe />');
    frame1[0].name = "frame1";
    frame1.css({"position": "absolute", "top": "-1000000px"});
    $("body").append(frame1);
    var frameDoc = frame1[0].contentWindow ? frame1[0].contentWindow : frame1[0].contentDocument.document ? frame1[0].contentDocument.document : frame1[0].contentDocument;
    frameDoc.document.open();
    //Create a new HTML document.
    frameDoc.document.write('<html>');
    frameDoc.document.write('<head>');
    frameDoc.document.write('<title></title>');
    frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/bootstrap/css/bootstrap.min.css">');
    frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/dist/css/font-awesome.min.css">');
    frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/dist/css/ionicons.min.css">');
    frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/dist/css/AdminLTE.min.css">');
    frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/dist/css/skins/_all-skins.min.css">');
    frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/plugins/iCheck/flat/blue.css">');
    frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/plugins/morris/morris.css">');
    frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/plugins/jvectormap/jquery-jvectormap-1.2.2.css">');
    frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/plugins/datepicker/datepicker3.css">');
    frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/plugins/daterangepicker/daterangepicker-bs3.css">');
    frameDoc.document.write('</head>');
    frameDoc.document.write('<body>');
    frameDoc.document.write(data);
    frameDoc.document.write('</body>');
    frameDoc.document.write('</html>');
    frameDoc.document.close();
    setTimeout(function () {
        window.frames["frame1"].focus();
        window.frames["frame1"].print();
        frame1.remove();
    }, 500);
    return true;
}

</script>

<script type="text/javascript">

// $('#rate1').hover(
        // function () {
            // $("#rate1").attr("style", "color:#f1b624f0;");
        // }
// );
// $('#rate2').hover(
        // function () {
            // $("#rate2").attr("style", "color:#f1b624f0;");
        // }
// );
// $('#rate3').hover(
        // function () {
            // $("#rate3").attr("style", "color:#f1b624f0;");
        // }
// );
// $('#rate4').hover(
        // function () {
            // $("#rate4").attr("style", "color:#f1b624f0;");
        // }
// );
// $('#rate5').hover(
        // function () {
            // $("#rate5").attr("style", "color:#f1b624f0;");
        // }
// );

function rate(val) {

    $('#rate').val(val);

    for (i = 1; i <= 5; i++) {
        $("#rate" + i).attr("style", "color:none;");
    }

    for (i = 1; i <= val; i++) {
        $("#rate" + i).attr("style", "color:#f1b624f0;");
    }

}

$("#addratingform").on('submit', (function (e) {
    e.preventDefault();
    $.ajax({
        url: '<?php echo base_url() ?>user/studentcourse/rating',
        type: "POST",
        data: new FormData(this),
        dataType: 'json',
        contentType: false,
        cache: false,
        processData: false,
        success: function (data) {
            if (data.status == "fail") {
                var message = "";
                $.each(data.error, function (index, value) {
                    message += value;
                });
                errorMsg(message);
            } else {
                if(data.message == "<?php echo $this->lang->line('something_went_wrong'); ?>"){
                  errorMsg(data.message);
                }else{
                  successMsg(data.message);
                  window.location.reload(true);
                }  
            }
        },
        error: function () {

        }
    });
}));

function startlesson(coureseID){
  $('#course_model_body').html('');   
  $.ajax({
     url  : "<?php echo base_url(); ?>user/studentcourse/startlesson",
     type : 'post',
     data : {coureseID:coureseID},
     success : function(response){
        $('#course_model_body').html(response);
        sessionStorage.clear(); 
     }
  });
}
</script>

<script>
 $(document).on("click",".lesson_ID_detail",function() {
    var coureseID = $(this).attr('lesson-data');
    $('#course_model_body').html('');
    $.ajax({
      url  : "<?php echo base_url(); ?>user/studentcourse/startlesson",
      type : 'post',
      data : {coureseID:coureseID},
      success : function(response){
        $('#course_model_body').html(response);
          sessionStorage.clear();

          $('#coursedetailmodal').modal('hide');
       }
     });
  });
</script>Course List
