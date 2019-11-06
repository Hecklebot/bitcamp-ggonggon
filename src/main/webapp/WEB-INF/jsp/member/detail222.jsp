<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>My Page</title>
<link rel="stylesheet" href="/css/member/style_detail.css">
<link rel="stylesheet" href="/node_modules/jquery-ui-dist/jquery-ui.css">
<link rel="stylesheet"
	href="/node_modules/bootstrap/dist/css/bootstrap.min.css">

<style>
* {
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
}

body {
  padding: 20px 15%;
}

form > div {
  clear: both;
  overflow: hidden;
  padding: 1px;
  margin: 0 0 10px 0;
}

.desc {
  width: 25%;
  float: left;
  padding-right: 10px;
}
form > div > div{
  width: 75%;
  float: right;
}
form > div > label {
  font-size: 100%;
}


/*

@media (max-width: 600px) {
  form > div {
    margin: 0 0 15px 0; 
  }
  form > div > label{
    width: 100%;
    float: none;
    margin: 0 0 5px 0;
  }
  form > div > div{
    width: 100%;
    float: none;
  }

}
*/
@media (min-width: 1200px) {
  label {
    text-align: right;
  }
}


    
.tagA {
  color: #ffffff;
  background: #b0c364;
  font-size: 1.2em;
  padding: 0.3em 0.5em;
  margin-right: 0.1em;
}

.tagA:hover {
  background-color: #b0c364;
  color: white;
}

.photoChange {
  margin: 10px;
}

.change_btn {
  width: 115px;
  height: 40px;
  display: inline;
/*   margin: 50px auto !important; */
  align-items: center;
  justify-content: space-around;
  border: 2px solid #b0c364;
  background-color: white;
  cursor: pointer;
  color: #b0c364;
  
}

.change_btn:hover {
  background-color: #b0c364;
  color: white;
}
</style>
</head>
<jsp:include page="../member/mypage_sidebar.jsp" />
<body onload="formLoad();">

	<%-- <jsp:include page="../header.jsp"/> --%>
	<div class="content-wrapper">
		<div class="container">
      <h1>My Information</h1>
      <form action='update' method='post' name="form"
        enctype='multipart/form-data' onsubmit="return checkAll();">
        <div class="row">
          <div class="col-5">
            <div id='content'>
              <div>
                <input type="hidden" id="photo2" value="${member.photo}" /> <img
                  id="imgThumb" class="imgThumb">
              </div>
              <div style="display: none;">
                <input type='file' id="file" name='file' />
              </div>
              <label class="photoChange" id="label" for="file">사진 변경</label>
            </div>
          </div>
          <div class="col-7">
            
                        <input type='hidden' id='memberNo' name='memberNo' value='${member.memberNo}' readonly> 

          
        <div>
            <label class="desc" id="email" for="email">이메일</label>
            <div>
              <input id="email" name="email" type="email" class="field text fn" value='${member.email}' readonly>
            </div>
          </div>
          
          
          <div>
            <label class="desc" id="password" for="password">비밀번호</label>
            <div>
              <input id="password" name="pwUpdate" type="button" class="field text fn change_btn" style="display: inline;" value="비밀번호 변경" data-toggle="modal" data-target="#exampleModal" >
            </div>
          </div>
          
         <div>
            <label class="desc" id="nickname" for="nickname">닉네임</label>
            <div>
              <input id="nickname" name="nickname" type="text" class="field text fn" value='${member.nickname}' maxlength="12"  onblur="nickname_check();">
            </div>
          </div>
        <div id="nickname_chk" class="vali_check"></div>
        
            <div>
            <label class="desc" id="tel" for="tel">핸드폰 번호</label>
            <div>
              <input id="tel" name="tel" type="tel" class="field text fn" value='${member.tel}' maxlength="11" onblur="tel_check();">
            </div>
          </div>
         <div id="tel_chk" class="vali_check"></div>
    
    
    
    
    
    
            <div>
            <label class="desc" id="postNo" for="postNo">우편번호</label>
            <div>
              <input id="postNo" name="postNo" type="text" class="field text fn" value='${member.postNo}'>
              <input type="button" name="post_search" class="change_btn" value="우편번호 찾기" onclick="myPostcode();" style="display: inline;"  />
            </div>
          </div>
               
    
    
        
            <div>
            <label class="desc" id="baseAddress" for="baseAddress">기본주소</label>
            <div>
              <input id="baseAddress" name="baseAddress" type="text" class="field text fn" value='${member.baseAddress}'>
            </div>
          </div>
    
        <div>
            <label class="desc" id="detailAddress" for="detailAddress">상세주소</label>
            <div>
              <input id="detailAddress" name="detailAddress" type="text" class="field text fn" value='${member.detailAddress}'>
            </div>
          </div>
    <input type="hidden" id="nickname1" value="${member.nickname}" />

            
            <!-- 원래 닉네임값  -->
            <button class="change_btn">변경</button>
        
     
                        
          </div>
          <div class="container">
            <div class="row">
              <div class="col-12">
                <a href="delete?no=${member.memberNo}" class="tagA"
                  onclick="return confirm('정말 탈퇴하시겠습니까?');">회원탈퇴</a>
              </div>
            </div>
          </div>
        </div>
      </form>
    </div>

		<hr>
		<jsp:include page="../pet2/detail.jsp" />

		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">비밀번호 변경</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						현재 비밀번호 <input type="password" id="nowPassword" name="nowPassword" onblur="nowpw_check();" maxlength="15" />
						<div id="password1_chk" class="vali_check"></div>
						새 비밀번호 <input type="password" id="newPassword" name="newPassword" onblur="newpw_check();" maxlength="15" />
						<div id="password2_chk" class="vali_check"></div>
						새 비밀번호 확인<input type="password" id="newPassword2" name="newPassword2" onblur="newpw2_check();" maxlength="15" />
						<div id="password3_chk" class="vali_check"></div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
						<button type="button" class="btn btn-primary" onclick="changePw();">변경</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script
		src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="/node_modules/jquery/dist/jquery.min.js"></script>
	<script src="/node_modules/jquery-ui-dist/jquery-ui.min.js"></script>
	<script src="/node_modules/popper.js/dist/umd/popper.min.js"></script>
	<script src="/node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
	<script>
		function changePw() {
			var cnt = 0;

			if (nowpw_check()) {
				cnt++;
			}
			if (newpw_check()) {
				cnt++;
			}
			if (newpw2_check()) {
				cnt++;
			}

			// 업데이트 해줄 ajax memberNo, 변경할 패스워드
			if (cnt == 3) {
				var xhr = new XMLHttpRequest();
				xhr.onreadystatechange = function() {
					if (xhr.readyState == 4) {
						if (xhr.status == 200) {
							if (xhr.responseText == "1") { // 1이면 변경완료, 0이면 변경 못함
								alert("변경완료 되었습니다.");
								$('#exampleModal').modal("hide");
								document.getElementById("nowPassword").value = "";
								document.getElementById("newPassword").value = "";
								document.getElementById("newPassword2").value = "";
							}
						} else {
							alert("시스템 오류 발생!");
						}
					}
				};
				xhr.open("POST", "uptPw", false);
				xhr.setRequestHeader('Content-type',
						'application/x-www-form-urlencoded');
				xhr.send("password="
						+ document.getElementById("newPassword").value
						+ "&memberNo="
						+ document.getElementById("memberNo").value);
			}

		}

		function nowpw_check() {
			var pCheckFlag = false;
			if (document.getElementById("nowPassword").value == "") {
				document.getElementById("password1_chk").innerHTML = "비밀번호를 입력하세요.";
				$("#password1_chk").css('color', 'red');
			}

			// 비밀번호 정규식 검사 
			if (document.getElementById("nowPassword").value != "") {
				var passwordRegExp = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,15}$/;
				if (!passwordRegExp
						.test(document.getElementById("nowPassword").value)) {
					document.getElementById("password1_chk").innerHTML = "8~15자 영문 대 소문자, 숫자, 특수문자를 사용하세요.";
					$("#password1_chk").css('color', 'red');
				} else {
					var xhr = new XMLHttpRequest();
					xhr.onreadystatechange = function() {
						if (xhr.readyState == 4) {
							if (xhr.status == 200) {
								if (xhr.responseText == "0") { // 1이면 동일, 0이면 패스워드 틀림
									document.getElementById("password1_chk").innerHTML = "패스워드를 다시 확인해주세요.";
									$("#password1_chk").css('color', 'red');
								} else {
									document.getElementById("password1_chk").innerHTML = "";
									pCheckFlag = true;
								}
							} else {
								alert("시스템 오류 발생!");
							}
						}
					};
					xhr.open("POST", "chkPw", false);
					xhr.setRequestHeader('Content-type',
							'application/x-www-form-urlencoded');
					xhr.send("password="
							+ document.getElementById("nowPassword").value
							+ "&memberNo="
							+ document.getElementById("memberNo").value);
				}
			}
			return pCheckFlag;
		}
		function newpw_check() {
			var pCheckFlag = false;
			if (document.getElementById("newPassword").value == "") {
				document.getElementById("password2_chk").innerHTML = "새 비밀번호를 입력하세요.";
				$("#password2_chk").css('color', 'red');
			}

			// 비밀번호 정규식 검사 
			if (document.getElementById("newPassword").value != "") {
				var passwordRegExp = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,15}$/;
				if (!passwordRegExp
						.test(document.getElementById("newPassword").value)) {
					document.getElementById("password2_chk").innerHTML = "8~15자 영문 대 소문자, 숫자, 특수문자를 사용하세요.";
					$("#password2_chk").css('color', 'red');
				} else {
					document.getElementById("password2_chk").innerHTML = "안전한 비밀번호입니다.";
					$("#password2_chk").css('color', 'green');
					pCheckFlag = true;
				}
			}
			return pCheckFlag;
		}

		function newpw2_check() {
			var p2CheckFlag = false;
			if (document.getElementById("newPassword2").value == "") {
				document.getElementById("password3_chk").innerHTML = "비밀번호 확인을 입력하세요.";
				$("#password3_chk").css('color', 'red');
			}

			// 비밀번호 & 비밀번호 확인이 같은 값인지 검사 
			if (document.getElementById("newPassword2").value != "") {
				if (document.getElementById("newPassword").value != document
						.getElementById("newPassword2").value) {
					document.getElementById("password3_chk").innerHTML = "두 비밀번호가 다릅니다.";
					$("#password3_chk").css('color', 'red');
				} else {
					document.getElementById("password3_chk").innerHTML = "";
					p2CheckFlag = true;
				}
			}
			return p2CheckFlag;
		}

		function formLoad() {
			// hidden값을 이용해서 자바스크립트를 이용한 경우
			if (document.getElementById("photo2").value == null
					|| document.getElementById("photo2").value == "") {
				document.getElementById("imgThumb").src = "/upload/member/info_photo.jpg";
			} else {
				document.getElementById("imgThumb").src = "/upload/member/"
						+ document.getElementById("photo2").value;
			}
		}

		function checkAll() {
			var checkCnt = 0;
			if (nickname_check()) {
				checkCnt++;
			}
			if (tel_check()) {
				checkCnt++;
			}
			return checkCnt == 2 ? true : false;
		}

		function nickname_check() {
			var nCheckFlag = false;
			if (form.nickname.value == "") {
				document.getElementById("nickname_chk").innerHTML = "닉네임을 입력하세요.";
				$("#nickname_chk").css('color', 'red');
			}
			// 닉네임 정규식 검사 
			var nRegPass = false;
			if (form.nickname.value != "") {
				var nicknameRegExp = /^[a-zA-z0-9가-힣]{2,12}$/;
				if (!nicknameRegExp.test(form.nickname.value)) {
					document.getElementById("nickname_chk").innerHTML = "닉네임 형식이 올바르지 않습니다!";
					$("#nickname_chk").css('color', 'red');
				} else {
					nRegPass = true;
				}
			}

			// 닉네임 중복체크
			if (nRegPass) {
				// 원래 닉네임과 동일하게 쓴다면 ajax 돌 필요도 없다.
				if (form.nickname.value == form.nickname1.value) {
					document.getElementById("nickname_chk").innerHTML = "가입 가능한 닉네임입니다. ";
					$("#nickname_chk").css('color', 'green');
					nCheckFlag = true;
				} else {
					var xhr = new XMLHttpRequest();
					xhr.onreadystatechange = function() {
						if (xhr.readyState == 4) {
							if (xhr.status == 200) {
								// 0이면 가입 가능, 아니면 중복!
								if (xhr.responseText == "1") {
									document.getElementById("nickname_chk").innerHTML = "중복된 닉네임입니다.";
									$("#nickname_chk").css('color', 'red');
								} else {
									document.getElementById("nickname_chk").innerHTML = "가입 가능한 닉네임입니다. ";
									$("#nickname_chk").css('color', 'green');
									nCheckFlag = true;
								}
							} else {
								alert("시스템 오류 발생!");
							}
						}
					}
					// false는 동기식(Ajax 순서대로 진행하도록 동기식으로)
					xhr.open("GET", "dupN?nickname=" + form.nickname.value,
							false);
					xhr.send();
				}
			}

			return nCheckFlag;
		}

		function tel_check() {
			var tCheckFlag = false;
			if (form.tel.value == "") {
				document.getElementById("tel_chk").innerHTML = "핸드폰 번호를 입력하세요.";
				$("#tel_chk").css('color', 'red');
			}
			// 핸드폰 번호 정규식 검사 
			if (form.tel.value != "") {
				var telRegExp = /^[0-9]{3}[0-9]{3,4}[0-9]{4}$/;
				if (!telRegExp.test(form.tel.value)) {
					document.getElementById("tel_chk").innerHTML = "핸드폰 번호의 형식이 올바르지 않습니다.";
					$("#tel_chk").css('color', 'red');
				} else {
					document.getElementById("tel_chk").innerHTML = "";
					tCheckFlag = true;
				}
			}
			return tCheckFlag;
		}

		//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
		function myPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {

							// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var roadAddr = data.roadAddress; // 도로명 주소 변수
							var extraRoadAddr = ''; // 참고 항목 변수

							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraRoadAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraRoadAddr += (extraRoadAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraRoadAddr !== '') {
								extraRoadAddr = ' (' + extraRoadAddr + ')';
							}
							console.log(data);
							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById("postNo").value = data.postcode;
							document.getElementById("baseAddress").value = data.jibunAddress;
							document.getElementById("detailAddress").value = "";

						}
					}).open();
		}

		// 사진 미리보기 
		document.getElementById("file").onchange = function() {
			var reader = new FileReader();
			reader.onload = function(e) {
				document.getElementById("imgThumb").src = e.target.result;
			};
			reader.readAsDataURL(this.files[0]);
		};
	</script>
</body>
<jsp:include page="../footer.jsp" />
</html>