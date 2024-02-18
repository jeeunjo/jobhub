<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/WEB-INF/views/admin/layout/header.jsp"%>
<%
String currentPage = "faq"; // 현재 페이지 정보
request.setAttribute("currentPage", currentPage);
%>
<%@include file="/WEB-INF/views/admin/layout/snb.jsp"%>
     <div id="wrapper">
        <div id="content">
            <div class="s_wrap">
                <h1>FAQ 등록</h1>

                <!-- 등록  -->
              
                <form  method="post" action="/addFaqs">
                    <input type="hidden" name="code" value="list">
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
		<option value="채용일반">채용 일반</option>	
		<option value="채용과정">채용 과정</option>
		<option value="지원서작성">지원서 작성</option>
		<option value="시스템오류">시스템 오류</option>
	</select>
                                    </td>
                                </tr>

                                <tr>
                                    <th scope="row">제목</th>
                                    <td colspan="3">
                                        <input type="text" name="title" required value="" class="frm_input" size="100">
                                    </td>
                                </tr>

                                <tr>
                                    <th scope="row">내용</th>
                                    <td colspan="3">
                                        <!-- <input type="text" name="question3" value="" class="frm_input" size="100"> -->
                                        <textarea name="content" class="frm_textarea" required ></textarea>
                                    </td>
                                </tr>

                            </tbody>
                        </table>
                    </div>

                    <div class="btn_confirm">
                        <input type="submit" value="등록" class="btn_medium">
                    </div>
                </form>

            
            </div>
        </div>
    </div>
<%@include file="/WEB-INF/views/admin/layout/footer.jsp"%>