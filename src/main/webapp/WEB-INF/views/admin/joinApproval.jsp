<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>Jobhub 계정 생성 요청</title>
<link rel="shortcut icon" href="/common/icon/jobhub_favicon.ico"
	type="image/x-icon">
<link rel="stylesheet" type="text/css" href="css/user_v1_1.css"
	media="all">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
    $(document).ready(function() {

        $(window).capslockstate();

        $(window).bind("capsOn", function(event) {

            if ($("#userPassword:focus").length > 0) {
                $("#pCapsLockStat1").show();
                $("#pCapsLockStat1").html('&lt;Caps Lock&gt;이 켜져있습니다.');
            }

            if ($("#userPasswordCfm:focus").length > 0) {
                $("#pCapsLockStat2").show();
                $("#pCapsLockStat2").html('&lt;Caps Lock&gt;이 켜져있습니다.');
            }
        });
        
        $(window).bind("capsOff capsUnknown", function(event) {

            $("#pCapsLockStat1").hide();
            $("#pCapsLockStat1").html('');

            $("#pCapsLockStat2").hide();
            $("#pCapsLockStat2").html('');
        });
        
        $("#userPassword").bind("focusout", function(event) {
            $("#pCapsLockStat1").hide();
            $("#pCapsLockStat1").html('');
        });
        $("#userPassword").bind("focusin", function(event) {

            if ($(window).capslockstate("state") === true) 
            {
                $("#pCapsLockStat1").show();
                $("#pCapsLockStat1").html('&lt;Caps Lock&gt;이 켜져있습니다.');
                
            }
        });

        $("#userPasswordCfm").bind("focusout", function(event) {
            $("#pCapsLockStat2").hide();
            $("#pCapsLockStat2").html('');
        });
        $("#userPasswordCfm").bind("focusin", function(event) {
            if ($(window).capslockstate("state") === true) 
            {
                $("#pCapsLockStat2").show();
                $("#pCapsLockStat2").html('&lt;Caps Lock&gt;이 켜져있습니다.');
                
            }
        });

        $("#userId").bind("focusout", function(event) {
            $("#pUserIdNotice").hide();
        });

        $("#userId").bind("focusin", function(event) {
            $("#pUserIdNotice").show();
        });

        /*
        * Additional event notifying there has been a change, but not the state
        */
        $(window).bind("capsChanged", function(event) {
    //        $("#changetext").html("changed").show().fadeOut();
        });    


        $("#userPassword").keyup(function(e) {
            
            if( /Android/i.test(navigator.userAgent)) {
                var kc = e.which; //get keycode
                // event.shiftKey does not seem to be normalized by jQuery(?) for IE8-
                var shiftKey = ( e.shiftKey ) ? e.shiftKey : ( (kc == 16) ? true : false ); // shift is pressed
                if( !kc || kc == 229 ) {
                    var ss = this.selectionStart - 1;
                    var ssv = ss || 0;
                    var char = this.value.substr(ssv,1);
                    kc = char.charCodeAt(0);
                }

                if (((kc >= 65 && kc <= 90)&& !shiftKey)||((kc >= 97 && kc <= 122)&& shiftKey)) {
                    $("#pCapsLockStat1").show();
                    $("#pCapsLockStat1").html('&lt;Caps Lock&gt;이 켜져있습니다.');
                }
                else
                {
                    $("#pCapsLockStat1").hide();
                    $("#pCapsLockStat1").html('');
                }
            }
        });


        $("#userPasswordCfm").keyup(function(e) {
            
            if( /Android/i.test(navigator.userAgent)) {
                var kc = e.which; //get keycode
                // event.shiftKey does not seem to be normalized by jQuery(?) for IE8-
                var shiftKey = ( e.shiftKey ) ? e.shiftKey : ( (kc == 16) ? true : false ); // shift is pressed
                if( !kc || kc == 229 ) {
                    var ss = this.selectionStart - 1;
                    var ssv = ss || 0;
                    var char = this.value.substr(ssv,1);
                    kc = char.charCodeAt(0);
                }

                if (((kc >= 65 && kc <= 90)&& !shiftKey)||((kc >= 97 && kc <= 122)&& shiftKey)) {
                    $("#pCapsLockStat2").show();
                    $("#pCapsLockStat2").html('&lt;Caps Lock&gt;이 켜져있습니다.');
                }
                else
                {
                    $("#pCapsLockStat2").hide();
                    $("#pCapsLockStat2").html('');
                }
            }
        });
    });
    
    $(document).ready(function () {
        // 툴팁 표시
        $(".icoHelp").on("click", function () {
            $(this).closest('.mTooltip').find('.tooltip').toggle();
        });

        // 툴팁 닫기
        $(".close").on("click", function () {
            $(this).closest('.tooltip').hide();
        });
    });
    </script>
</head>


<body>
	<div id="wrap">
		<!-- container -->
		<div id="container">
			<form name="frmRegister" id="frmRegister"
				action="/admin/joinApproval" method="post"
				enctype="multipart/form-data">
				<!-- contents -->
				<div id="contents">
					<!-- header -->
					<div class="headingArea">
						<h1 class="logo">
							<a href="/admin/joinApproval" title="jobhubLogo"> <img
								class="jobhubLogo" src="images/logo_250x35.png" alt="jobhub">
							</a>
						</h1>
					</div>
					<!-- //header -->
					<div class="mFormBox" id="divKcpAuth">
						<div class="column">
							<strong class="title" id="kcpTitleName">이름</strong>
							<div class="mTooltip gMedium ePosTarget" id="divHelpTooltip">
								<button type="button" class="icon icoHelp ePosHover eTip">도움말</button>
								<div class="tooltip posTop" style="display: none;">
									<div class="content">
										<strong class="titleEm" id="tooltipTitle">가입 안내</strong>
										<ul id="tooltipText">
											<li>Jobhub 직원만 이용이 가능합니다.</li>
											<li>가입 요청 시 확인 절차를 거친 후 계정을 생성합니다.</li>
										</ul>
									</div>
									<button type="button" class="close eClose">닫기</button>
									<span class="edge"></span>
								</div>
							</div>
							<div class="formBox gFlex">
								<input type="text" name="name" id="name"
									class="fText gFull eFocus" placeholder="이름 입력"
									aria-label="이름 입력" value="${employee.name}" tabindex="1">
								<button type="button" class="btnReset">
									<i class="icoReset">입력 초기화</i>
								</button>
							</div>
							<spring:hasBindErrors name="employee">
								<c:if test="${errors.hasFieldErrors('name')}">
										이름은 필수 입력 항목입니다.<br>
										${errors.getFieldErrors('name').defaultMessage}<br>
								</c:if>
							</spring:hasBindErrors>
							<p class="message typeLeft" id="nameErr" style="display: none;"></p>
						</div>

						<div class="column">
							<strong class="title">생년월일/성별</strong>
							<div class="formBox gFlex myNum">
								<span class="myNum-input-first gFlex"> <input
									type="number" name="birthDay" id="birthDay"
									class="fText eFocus" maxlength="6" placeholder="생년월일 6자리"
									aria-label="생년월일 6자리" value="${employee.birthDay}" tabindex="2">
								</span> <span class="myNum-input-last gFlex"> <input
									type="number" name="sexCode" id="sexCode" class="fText eFocus"
									maxlength="1" aria-label="주민등록번호 7번째 자리" value="" tabindex="3">
									<!--error  class 사용 --> <span class="myNum-mark-after"><i></i><i></i><i></i><i></i><i></i><i></i></span>
								</span>
							</div>
							<p class="message typeLeft" id="errorMsg">${error}</p>
							<p class="message typeLeft" id="birthDayErr"
								style="display: none;"></p>

						</div>
					</div>

					<div class="mButton">
						<button type="submit" class="btnSubmit large gFull" id="btnSubmit"
							tabindex="15">가입 요청하기</button>
					</div>
					<div class="mUtility left">
						이미 계정이 있으신가요? <a href="/admin/login" class="txtEmLink"
							target="_blank">관리자 로그인하기</a>
					</div>
				</div>
				<!-- //contents -->
			</form>

			<!-- footer -->
			<footer id="footer">
				<p class="jobhub_direct">
					<a href="/">Jobhub 바로가기</a>
				</p>
				<p class="copyright">&copy; Jobhub Corp. All Rights Reserved.</p>
			</footer>
			<!-- //footer -->
		</div>
		<!-- //container -->
	</div>
	<script>
    // success 메시지
    var successMessage = "${success}";
    if (successMessage) {
        alert(successMessage);
    }
</script>
</body>
</html>




