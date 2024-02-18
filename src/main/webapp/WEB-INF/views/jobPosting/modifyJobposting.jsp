<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/WEB-INF/views/admin/layout/header.jsp" %>
<%
String currentPage = "jobpostingMain"; // 현재 페이지 정보
request.setAttribute("currentPage", currentPage);
%>
<%@include file="/WEB-INF/views/admin/layout/snb.jsp" %>
     <div id="wrapper">
        <div id="content">
            <div class="s_wrap">
                <h1>채용공고 수정</h1>
                

                <!-- 등록 -->
                <h2>*표시는 필수 입력 항목입니다.</h2>
                <form method="post" action="/modifyJobposting">
                <input type="hidden" name="postingId" value="${jobposting.postingId}">
                    <!-- <input type="hidden" name="code" value="list"> -->
                    <div class="tbl_frm01">
                        <table class="tablef">
                            <colgroup>
                                <col class="w100">
                                <col>
                                <col class="w100">
                                <col>
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row">제목*</th>
                                    <td colspan="3">
                                        <input type="text" name="title" class="frm_input" size="100" value="${jobposting.title}" readonly style="cursor: not-allowed;">
                                    </td>
                                </tr>
                                
                                <tr>
                                    <th scope="row">직무*</th>
                                    <td>
                                       <input type="text" name="cate" value="${jobposting.jobsCateName}" readonly class="frm_input" style="cursor: not-allowed;">
									</td>
									
                                    <th scope="row">직무명*</th>
                                    <td>
                                  		<input type="text" name="item" value="${jobposting.jobsItemName}" readonly class="frm_input" style="cursor: not-allowed;" >      
									</td>
                                </tr>
                                
                                <tr>
                                    <th scope="row">경력조건*</th>
                                    <td>
                                    <select name="careerCondition" required>
											<option <c:if test="${jobposting.careerCondition == '신입'}">selected</c:if>>신입</option>
			<option <c:if test="${jobposting.careerCondition == '경력'}">selected</c:if>>경력</option>
			<option <c:if test="${jobposting.careerCondition == '무관'}">selected</c:if>>무관</option>
									</select>
									</td>
									
                                    <th scope="row">고용형태*</th>
                                    <td>
                                        <select name="employmentType" required>
			<option <c:if test="${jobposting.employmentType == '신입'}">selected</c:if>>정규직</option>
			<option <c:if test="${jobposting.employmentType == '계약직'}">selected</c:if>>계약직</option>
			<option <c:if test="${jobposting.employmentType == '무기계약직'}">selected</c:if>>무기계약직</option>
			<option <c:if test="${jobposting.employmentType == '인턴'}">selected</c:if>>인턴</option>
		</select> 
                                    </td>
                                </tr>

                                   <tr>
    <th scope="row">노출일</th>
    <td>
        <label for="post_fr_date" class="sound_only">시작일</label>
        <input type="date" name="postStartDate" required value="${jobposting.postStartDate}"  id="post_fr_date" class="frm_input w160" maxlength="10">
        ~
        <label for="post_to_date" class="sound_only">종료일</label>
        <input type="date" name="postEndDate" id="post_to_date" required value="${jobposting.postEndDate}"  id="post_to_date" class="frm_input w160">
    </td>
    <th scope="row">지원일</th>
    <td>
        <label for="app_fr_date" class="sound_only">시작일</label>
        <input type="date" name="applicationStart" required value="${jobposting.applicationStart}"  id="app_fr_date" class="frm_input w160" maxlength="10">
        ~
        <label for="app_to_date" class="sound_only">종료일</label>
        <input type="date" name="applicationDeadline" required value="${jobposting.applicationDeadline}"  id="app_to_date" class="frm_input w160">
    </td>
</tr>

                                <tr>
                                    <th scope="row">노출 상태*</th>
                                    <td colspan="3">
                                        <label><input type="radio" name="postStatus" value="O" <c:if test="${jobposting.postStatus == 'O'}">checked</c:if>>노출</label> 
		<label><input type="radio" name="postStatus" value="X" <c:if test="${jobposting.postStatus == 'X'}">checked</c:if>>비노출</label> 
		<label><input type="radio" name="postStatus" value="S" <c:if test="${jobposting.postStatus == 'S'}">checked</c:if>>임시저장</label> 
                                    </td>
                                </tr>

                                <tr>
                                    <th scope="row">질문1 *</th>
                                    <td colspan="3"> 
                                        <input type="text" name="question1" required value="${jobposting.question1}" class="frm_input" size="100">
                                    </td>
                                </tr>

                                <tr>
                                    <th scope="row">질문2</th>
                                    <td colspan="3">
                                        <input type="text" name="question2" value="${jobposting.question2}" class="frm_input" size="100">
                                    </td>
                                </tr>

                                <tr>
                                    <th scope="row">질문3</th>
                                    <td colspan="3">
                                        <input type="text" name="question3" value="${jobposting.question3}" class="frm_input" size="100">
                                    </td>
                                </tr>

                                <tr>
                                    <th scope="row">채용 공고</th>
                                    <td colspan="3">
                                        <div style="height: 1300px;" class="descriptionContainer">
                                            <label>담당업무*</label> <br>
		                                    <textarea name="assignedTask" class="frm_textarea" required>${description.assignedTask}</textarea>
                                            
                                            <br> <label>자격요건*</label> <br>
                                            <textarea name="requirements" class="frm_textarea" required>${description.requirements}</textarea>
                                    
                                            <br> <label>우대사항*</label> <br>
                                            <textarea name="preferentialTreatment" class="frm_textarea" required>${description.preferentialTreatment}</textarea>
                                    
                                            <br> <label>전형안내*</label> <br>
                                            <textarea name="screeningGuide" class="frm_textarea" required>${description.screeningGuide}</textarea>
                                    
                                            <br> <label>근무형태*</label> <br>
                                            <textarea name="workForm" class="frm_textarea" required>${description.workForm}</textarea>
                                    
                                            <br> <label>근무지*</label> <br>
                                            <textarea name="workPlace" class="frm_textarea" required>${description.workPlace}</textarea>
                                    
                                            <br> <label>근무시간*</label> <br>
                                            <textarea name="workingHours" class="frm_textarea" required>${description.workingHours}</textarea>
                                    
                                            <br> <label>기타*</label> <br>
                                            <textarea name="etc" class="frm_textarea" required>${description.etc}</textarea>
                                    
                                            <br> <label>보훈 취업지원 대상 및 장애인 서류 제출 안내* </label> <br>
                                            <textarea name="submissionGuide" class="frm_textarea" required>${description.submissionGuide}</textarea>

                                        </div>
                                        
                                    </td>

                                </tr>

                            </tbody>
                        </table>
                    </div>

                    <div class="btn_confirm">
                        <input type="submit" value="수정" class="btn_medium" id="modiBtn">
                    </div>
                    
                    	<script>
                    	
                    	document.getElementById("modiBtn").addEventListener("click", function(event) {
                    	    // required 속성이 있는 input 요소들을 모두 가져옵니다.
                    	    var requiredInputs = document.querySelectorAll('[required]');
                    	    
                    	    // 모든 required input 요소들을 순회하면서 값이 있는지 확인합니다.
                    	    var allInputsFilled = true;
                    	    for (var i = 0; i < requiredInputs.length; i++) {
                    	        if (!requiredInputs[i].value) { // 값이 없으면
                    	            allInputsFilled = false;
                    	            break;
                    	        }
                    	    }
                    	    
                    	    // 모든 required input 요소들이 값이 있는 경우에만 수정 확인 창을 띄웁니다.
                    	    if (allInputsFilled) {
                    	        var confirmation = confirm("수정하겠습니까?");
                    	        
                    	        // 확인을 눌렀을 경우
                    	        if (confirmation) {
                    	            alert("수정되었습니다.");
                    	            // 폼 제출
                    	            return true;
                    	        } else {
                    	            // 취소를 눌렀을 경우
                    	            // 폼 제출 취소
                    	            event.preventDefault();
                    	            return false;
                    	        }
                    	    } else {
                    	        alert("필수 입력 항목을 모두 채워주세요."); // 모든 required input 요소가 값을 갖고 있지 않은 경우
                    	        event.preventDefault(); // 폼 제출 취소
                    	        return false;
                    	    }
                    	});

                    	
                    	//달력
                    	
                    	  // 노출일 시작일과 종료일
    var postStartDateInput = document.getElementById("post_fr_date");
    var postEndDateInput = document.getElementById("post_to_date");

    postStartDateInput.addEventListener("change", function() {
        postEndDateInput.min = postStartDateInput.value;
        if (postEndDateInput.value < postStartDateInput.value) {
            postEndDateInput.value = postStartDateInput.value;
        }
    });
    postEndDateInput.min = postStartDateInput.value;

    // 지원일 시작일과 종료일
    var appStartDateInput = document.getElementById("app_fr_date");
    var appEndDateInput = document.getElementById("app_to_date");

    appStartDateInput.addEventListener("change", function() {
        appEndDateInput.min = appStartDateInput.value;
        if (appEndDateInput.value < appStartDateInput.value) {
            appEndDateInput.value = appStartDateInput.value;
        }
    });
    appEndDateInput.min = appStartDateInput.value;

</script>
                </form>

            
            </div>
        </div>
    </div>
<%@include file="/WEB-INF/views/admin/layout/footer.jsp" %>