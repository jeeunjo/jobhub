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
			<h1>FAQ 조회</h1>

			<div class="local_ov mart30">
				총 faqs 수 : <b class="fc_red">${faqsCount}</b>개
				<!--  <select id="page_rows" onchange="" class="marl5">
        <option value="30" selected="selected">30줄 정렬</option>
        <option value="50">50줄 정렬</option>
        <option value="100">100줄 정렬</option>
        <option value="150">150줄 정렬</option>
    </select> -->
				<a href="/admin/addFaqs" class="fr btn_lsmall green">FAQ 등록</a>

			</div>
			<div class="tbl_head01">
				<table>
					<colgroup>
						<col class="w100">
						<col class="w120">
						<col class="w10000">

						<col class="w110">

					</colgroup>
					<thead>
						<tr>

							<th scope="col"></th>
							<th scope="col">카테고리</th>
							<th scope="col">제목</th>

							<th scope="col">수정/삭제</th>
						</tr>
					</thead>
					<tbody class="list">
						<tr class="list0">

							<c:forEach var="faqsItem" items="${faqsList}">

								<tr class="list0">
									<td>${faqsItem.FAQsId}</td>
									<td>${faqsItem.category}</td>
									<td><a href="../modifyFaqs?FAQsId=${faqsItem.FAQsId}">${faqsItem.title}
									</a></td>

									<td><a href="/admin/removeFaqs?FAQsId=${faqsItem.FAQsId}"
										class="fr btn_lsmall red">삭제</a> <a
										href="/admin/modifyFaqs?FAQsId=${faqsItem.FAQsId}"
										class="fr btn_lsmall green">수정</a></td>
								</tr>


							</c:forEach>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<%@include file="/WEB-INF/views/admin/layout/footer.jsp"%>