<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">댓글 수정</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <input type='hidden' class="modal-commentNo" name='commentNo' value='${recipeComment.commentNo}' >
      <textarea class="modal-comment-text" name='content' rows='3' cols='50'></textarea>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary modal-closeBtn" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-danger modal-delBtn">Delete</button>
        <button type="button" class="btn btn-primary modal-saveBtn">Save</button>
      </div>
    </div>
  </div>
</div>
<!-- Modal -->


<div class="container">
            <div class="row justify-content-center">
                <div class="col-12 col-lg-8 col-xl-9">
                    <div class="comment_area mb-100 my-commentList">
                        <h4 class="mb-50">Comments</h4>
                        <ol class="commentList">
                        <!-- commentList 가 들어가는 자리 -->
                        </ol>
                    </div>
                    
                    <div class="post-a-comment-area mb-30">
                        <h4 class="mb-50">Leave a reply</h4>
                        <!-- Reply Form -->
                        <div class="contact-form-area">
                            <form id='commentForm' name='commentForm'>
                                <div class="row">
                                    <div class="col-12 col-lg-12">
                                        <input type="hidden" class="form-control" name="no" value="${recipe.recipeNo}">
                                        <input type="text" class="form-control" value="${viewer.nickname}" readonly>
                                    </div>
                                    <div class="col-12">
                                        <textarea name="content" class="form-control" id="message" cols="30" rows="10" placeholder="Message"></textarea>
                                    </div>
                                    <div class="col-12">
                                        <button id="addCommentBtn" type="button" class="btn bueno-btn mt-30">Submit Comment</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
<script id="t1" type="commentHtml">
<li class='single_comment_area'>
<div class='comment-content d-flex my-comment'>
    <div class='comment-author'>
    <img src='/img/core-img/choplogo.png' alt='author'>
    </div>
  <div class='comment-meta'>
    <div class='d-flex'>
      <a class='post-author'>{{member.nickname}}</a>
      <a class='post-date'>{{recipeComment.createdDate}}</a>
      <a href='#' class='reply my-btn'>수정</a>
    </div>
    <input type='hidden' class='comment-no' name='commentNo' value={{recipeComment.commentNo}}>
    <p class='comment-content'>{{recipeComment.content}}</p>
  </div>
</div>
<hr>
</li>
</script>

<script>
"use strict";
var dbody = $('.commentList');
var templateSrc = $('#t1').html();
var template = Handlebars.compile(templateSrc);

function addComment(data) {
  dbody.append(template(data));
};
</script>

<script>
"use strict";
$('#addCommentBtn').on('click', function() { // 댓글 입력 함수
  var comment = $('#commentForm').serialize(); // recipeNo=32&content=ddd
  $.post("/app/json/recipecomment/add", comment, function(data) {
    if(data.state == 'success') {
      console.log(data.result); // member.memberNo, member.nickname
      // recipeComment.content, recipeComment.createdDate
      addComment(data.result);
    }
  });
});
</script>

<script>
$('#exampleModal').on('hide.bs.modal', function(e) {
  console.log("모달닫음");
});
</script>

<script>
"use strict";
$('#exampleModal').modal({ // modal 속성 설정
  backdrop: 'static',
  keyboard: false,
  show: false
});
</script>

<script>
"use strict";
var dbody2 = $('.commentList');
var templateSrc2 = $('#t1').html();
var template2 = Handlebars.compile(templateSrc2);

getCommentList();
function getCommentList() { // 댓글 목록 불러오는 함수
  $.get("/app/json/recipecomment/list?no=" + ${recipe.recipeNo}, function(data) {
    console.log(data.result); 
    
    for (var b of data.result) {
      var html = template2(b); // 원래 html
      var after = html.replace("class='reply my-btn'", "class='reply my btn' style='display:none;'");
      var viewerNo = b.viewer.memberNo; // 댓글보는사람
      var writerNo = b.member.memberNo; // 작성자
      
      if (viewerNo != writerNo) { // memberNo이 다르면
        $(after).appendTo(dbody2); 
      } else {
        $(template2(b)).appendTo(dbody2);
      }
    }
  });
};

  $(document).on('click', '.my-btn', function(e) {
    window.commentContent = $(e.target.parentNode.parentNode.parentNode).find('.comment-content').text();
    window.commentNo = $(e.target.parentNode.parentNode.parentNode).find('.comment-no').val();
    $('.modal-comment-text').val(window.commentContent); // modal 창에 값을 셋팅
    $('.modal-commentNo').val(window.commentNo);
    $('#exampleModal').modal('show');
    return false;
  });
  
  $('.modal-saveBtn').on('click', function() { // 모달창에서 save 클릭 이벤트
    var content = $('.modal-comment-text').val();
    var commentNo = $('.modal-commentNo').val();
    $.ajax({
      url: '/app/json/recipecomment/update',
      type: 'POST',
      data: {commentNo: commentNo, content: content},
      success: function(result){
        $('.commentList').empty();
        getCommentList();
        $('#exampleModal').modal('hide'); 
      }
    });
  });
  
  $('.modal-delBtn').on('click', function() { // 모달창에서 delete 클릭 이벤트
    var commentNo = $('.modal-commentNo').val();
    $.get('/app/json/recipecomment/delete?no='+ commentNo, function(data) {
      if (data.state == 'success') {
        console.log("성공");
        $('.commentList').empty();
        getCommentList();
        $('#exampleModal').modal('hide'); 
      };
    });
  }); 
</script>
