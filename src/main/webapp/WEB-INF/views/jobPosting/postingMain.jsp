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
                <h1>채용공고 조회</h1>

                <!-- 검색 -->
                <h2>검색</h2>
                <form id="fsearch" action ="">
                    <!-- <input type="hidden" name="code" value="list"> -->
                   <%--  <input type="hidden" name="postingId" value="${jobpostingItem.postingId}"> --%>
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
                                    <th scope="row">제목</th>
                                    <td colspan="3">
                                       <!--  <select name="sfl" class="w120">
                                            <option value="title">제목</option>
                                            <option value="job_name">직무</option>
                                            <option >고용형태</option>
                                            
                                        </select> -->
                                        <input type="text" name="keyword" value="" class="frm_input" size="100">
                                    </td>
                                </tr>
                              <!--   <tr>
                                    <th scope="row">작성일</th>
                                    <td colspan="3">
                                        
                                        <label for="fr_date" class="sound_only">시작일</label>
                                        <input type="date" name="fr_date" value="" id="fr_date" class="frm_input w100"
                                            maxlength="10" >
                                       
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">노출상태</th>
                                    
                                    <td colspan="3">
                                        <select name="permission_code" class="w120" maxlength="10">
                                            <option value="1">O</option>
                                            <option value="2">X</option>
                                            <option value="3">S</option>
                                        </select>
                                    </td> 
                                    

                                </tr>-->
                            </tbody>
                        </table>
                    </div>
                    <div class="btn_confirm">
                        <input type="submit" value="검색" class="btn_medium">
                        <input type="button" value="초기화" id="frmRest" class="btn_medium grey"  onclick="reset()">
                    </div>
                </form>
                <!-- //검색 -->
                
                
	
<!-- 검색결과 리스트 -->
 <div class="local_ov mart30">
    총 공고 수 : <b class="fc_red">${postingCount}</b>개

    <a href="../jobposting" class="fr btn_lsmall green">신규공고 등록</a>
    
</div>
<div class="tbl_head01">
    <table>
        <colgroup>
            <col class="w100">
            <col class="w2000">
            <col class="w100">
            <col class="w100">
            <col class="w120">
            <col class="w70">
        </colgroup>
        <thead>
            <tr>
               
                <th scope="col"></th>
                <th scope="col">제목</th>
                <th scope="col">고용형태</th>
                <th scope="col">작성일</th>
                <th scope="col">노출상태</th>
                <th scope="col">수정</th>
            </tr>
        </thead>
        <tbody class="list">
            <tr class="list0">

               <c:forEach var="jobpostingItem" items="${jobpostingList}">

					<tr class="list0">
						<td>${jobpostingItem.postingId}</td>
						<td><a href="../modifyJobposting?postingId=${jobpostingItem.postingId}">${jobpostingItem.title}</a></td>
						<td>${jobpostingItem.employmentType}</td>
						<td>${jobpostingItem.postWrittenDate}</td>
						<td>${jobpostingItem.postStatus}</td>
						<td> <a href="/admin/modifyJobposting?postingId=${jobpostingItem.postingId}" class="fr btn_lsmall green">수정</a></td>
					</tr>
	</c:forEach> 
            </tr>
        </tbody>
    </table>
</div>

</div>
</div>
</div>
    
    
    <script>
        function reset() {
            document.getElementById("frmRest").value = "";
        }
        
        
    </script>
<%@include file="/WEB-INF/views/admin/layout/footer.jsp" %>