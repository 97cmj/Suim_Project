<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.suim.event.model.vo.Event" %>
<%@ page import="com.suim.event.model.vo.Eattachment" %>

<style>
	#memberList {text-align:center;}
	#memberList>tbody>tr:hover {cursor:pointer;}
	#pagingArea {width:fit-content; margin:auto;}
	form input {width:150px!important;}
	form button {border:none!important;}
	.searchForm>form>input, .searchForm>form>div {display:inline-block;}
</style>
<c:choose>
<c:when test="${ not empty loginUser and loginUser.memberId eq ('admin1') }">
	<%@ include file="../common/include.jsp" %>

	<div class="container-xxl position-relative bg-white d-flex p-0">
	
        <!-- Spinner Start -->
		<%@ include file="../common/spinner.jsp" %>
        <!-- Spinner End -->


        <!-- Sidebar Start -->
		<%@ include file="../common/sidebar.jsp" %>
        <!-- Sidebar End -->


        <!-- Content Start -->
        <div class="content">

            <!-- Navbar Start -->
			<%@ include file="../common/navbar.jsp" %>
            <!-- Navbar End -->


            <!-- Table Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="row g-4">
                    
                    <div class="col-12">
                        <div class="bg-light rounded h-100 p-4" width="">
                            <h6 class="mb-4">이벤트 관리</h6>

							<ul class="nav nav-tabs">
								<li class="nav-item"><a
									class="nav-link <c:if test="${category eq 'A'}">active</c:if>"
									data-toggle="tab" href="/admin.ev">전체</a></li>
								<li class="nav-item"><a
									class="nav-link <c:if test="${category eq '자유게시판'}">active</c:if>"
									data-toggle="tab" href="/admin.ev?cPage=1&category=자유게시판">자유게시판</a></li>
								<li class="nav-item"><a
									class="nav-link <c:if test="${category eq 'house'}">active</c:if>"
									data-toggle="tab" href="/admin.ev?cPage=1&category=house">house</a></li>
								<li class="nav-item"><a
									class="nav-link <c:if test="${category eq '종료된이벤트'}">active</c:if>"
									data-toggle="tab" href="/admin.ev?cPage=1&category=종료된이벤트">종료된이벤트</a></li>
								
							</ul>
					        <div class="tab-content pt-3" id="nav-tabContent">
					            <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
							         <div class="table-responsive">			
					        <table id="event-table" class="table">
        
					        	<thead>
					        		<tr>
					        			<c:if test="${ not empty loginUser and loginUser.memberId eq ('admin1') }">
					        			<div align="right" style="margin:0px">
							    					<a class="btn btn-secondary" style="display: inline-block; vertical-align: middle; line-height: 20px; background-color: rgb(250,107,111); height: 20px; text-decoration: none; color: #fff; padding: 0 10px; font-size: medium;" href="enrollForm.ev">
							       	 					이벤트 글작성
						 							</a>
						 				</div>
												</c:if>
					        		</tr>
					            	<tr class="table-header">
						                <td class="eListNo">No</td>
										<td>카테고리</td>
						                <td class="title">제목</td>
						                <td class="eventDate">작성일</td>
						                <td class="eventView">조회수</td>
					            	</tr>
					         	</thead>
					         	<tbody>
					         	
					         		<!-- 이벤트 카테고리별로 다른 게 나오게 함 -->
					         		<c:forEach var="e" items="${ list }">
						         		<c:if test="${e.eventCategory eq ('house')}">
						         		
						         		</c:if>
					         		
							            <tr class="table-row" style="background-color:none;">
							            	<td class="eListNo, eno">${ e.eventNo }</td>
							            	<td>${e.eventCategory }</td>
							            	<td class="title">
							                	${ e.eventTitle }
							                </td>
							                <td class="createDate"><fmt:formatDate pattern="yyyy-MM-dd" value="${e.eventDate }" /></td>
							                <td class="eventView">${ e.eventView }</td>
							            </tr>
							            
					             	</c:forEach>
							 	  </tbody>
					         	</table>
          				</div>
         			</div>
         		</div>
         	</div>
	<script>
		         $(function() {
		        	 
		        	 
		             // select 태그 변경 이벤트 리스너
		             $("#categorySelect").change(function() {
		                 var selectedOption = $(this).val(); // 선택한 옵션 값
		 
		                 // 모든 행을 숨김 처리
		                 $("#event-table tbody tr").hide();
		 
		                 if (selectedOption === "") {
		                     // 선택한 옵션이 전체 이벤트인 경우 모든 행을 보여줌
		                     $("#event-table tbody tr").show();
		                 } else {
		                     // 선택한 옵션에 해당하는 카테고리 행만 보여줌
		                     $("#event-table tbody tr").each(function() {
		                         var category = $(this).find("td:nth-child(2)").text();
		                         if (category === selectedOption) {
		                             $(this).show();
		                         }
		                     });
		                 }
		            });
		        });
		         
		         $(function() {
		          	$("#event-table>tbody>tr").click(function() {
		          		let eno = $(this).children(".eno").text();
		          		location.href = "detail.ev?eno=" + eno; //
		          	});
		          });
		</script>
		

<!-- 페이지네이션 영역 시작 -->
           <br>
			<nav id="pagingArea" style="margin-top: 30px; margin-bottom: 30px;">
				<ul class="pagination justify-content-center">
					<li class="page-item ${pi.currentPage == 1 ? 'disabled' : ''}">
						<a class="page-link" href="<c:url value='/admin.ev?cPage=${pi.currentPage - 1}&category=${category}'/>">&lt;</a>
					</li>
					<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}" step="1">
						<li class="page-item ${pi.currentPage == p ? 'active' : ''}">
							<a class="page-link" href="<c:url value='/admin.ev?cPage=${p}&category=${category}'/>">${p}</a>
						</li>
					</c:forEach>
					<li class="page-item ${pi.currentPage == pi.maxPage || pi.listCount == 0 ? 'disabled' : ''}">
						<a class="page-link" href="<c:url value='/admin.ev?cPage=${pi.currentPage + 1}&category=${category}'/>">&gt;</a>
					</li>
				</ul>
			</nav>

            <br clear="both"><br>
         </div>   
       </div>
       </div>     
            <!-- Footer Start -->
			<%@ include file="../common/footer.jsp" %>
            <!-- Footer End -->
        </div>
        <!-- Content End -->

	</div>
</c:when>

<%-- 요청한 이벤트 관리 url 로 접근한 사용자가 관리자가 아닌 경우 잘못된 접근이라는 것을 알려주고 사용자를 메인 페이지로 이동하게 함 --%>
<c:otherwise>
	<button type="reset">
		<a href="/" class="btn btn=warning">잘못된 접근입니다. 메인페이지로 이동해주세요</a>
	</button>
</c:otherwise>
</c:choose>