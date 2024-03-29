<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/WEB-INF/views/admin/layout/header.jsp" %>
<%
String currentPage = "faq"; // 현재 페이지 정보
request.setAttribute("currentPage", currentPage);
%>
<%@include file="/WEB-INF/views/admin/layout/snb.jsp" %>
     <div id="wrapper">
        <div id="content">
            <div class="s_wrap">
                <h1>FAQ 수정</h1>

                <!-- 수정 -->
              
                <form method="post" action="/modifyFaqs">
                    <!-- <input type="hidden" name="code" value="list"> -->
                    <input type="hidden" name="FAQsId" value="${faqs.FAQsId}">
                    
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
                                    <th scope="row">카테고리</th>
                                    <td colspan="3"> 
                                       <select name="category" id="category" required>
		<option value="채용일반" <c:if test="${faqs.category == '채용일반'}">selected</c:if>>채용 일반</option>	
		<option value="채용과정" <c:if test="${faqs.category == '채용과정'}">selected</c:if>>채용 과정</option>
		<option value="지원서작성" <c:if test="${faqs.category == '지원서작성'}">selected</c:if>>지원서 작성</option>
		<option value="시스템오류" <c:if test="${faqs.category == '시스템오류'}">selected</c:if>>시스템 오류</option>
	</select>
                                    </td>
                                </tr>

                                <tr>
                                    <th scope="row">제목</th>
                                    <td colspan="3">
                                        <input type="text" name="title" required value="${faqs.title}" class="frm_input" size="100">
                                    </td>
                                </tr>

                                <tr>
                                    <th scope="row">내용</th>
                                    <td colspan="3">
                                        <!-- <input type="text" name="question3" value="" class="frm_input" size="100"> -->
                                        <textarea name="content" class="frm_textarea" required >${faqs.content}</textarea>
                                    </td>
                                </tr>

                            </tbody>
                        </table>
                    </div>

                    <div class="btn_confirm">
                        <input type="submit" value="수정" class="btn_medium">
                    </div>
                </form>

            
            </div>
        </div>
    </div>

    <!-- footer -->
    <div id="ft">
        <p>Copyright &copy; Jobhub. All rights reserved.</p>
    </div>
    <div id="ajax-loading"><img src="./sources/common/img/ajax-loader.gif"></div>
    <div id="anc_header"><a href="#anc_hd"><span></span>TOP</a></div>
    <script src="./sources/admin/js/admin.js"></script>
    <script src="./sources/common/js/wrest.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var chkAll = document.querySelector('input[name="chkall"]');
            chkAll.addEventListener('change', function () {
                var checkboxes = document.querySelectorAll('input[name="chk[]"]');
                checkboxes.forEach(function (checkbox) {
                    checkbox.checked = chkAll.checked;
                });
            });
        });

	
	</script>


</body>
</html>

