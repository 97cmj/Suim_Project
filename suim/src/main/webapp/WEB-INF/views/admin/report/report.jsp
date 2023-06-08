<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
	#reportList {text-align:center;}
	#reportList>tbody>tr:hover {cursor:pointer;}
	#pagingArea {width:fit-content; margin:auto;}
	form input {width:150px!important;}
	form button {border:none!important;}
	.searchForm>form>input, .searchForm>form>div {display:inline-block;}
</style>

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
                            <h6 class="mb-4">신고 관리</h6>

							<div align="right" class="searchForm">
							<form class="d-md-flex ms-4" action="search.re">
								<div class="select">
				                    <select class="form-select form-select-sm mb-3" name="condition" style="margin-bottom: unset !important;">
				                        <option value="REPORT_TITLE">제목</option>
				                        <option value="REPORT_CONTENT">내용</option>
				                        <option value="REPORT_TYPE">유형</option>
				                        <option value="REPORT_ID">신고자</option>
				                    </select>
				                </div>
								<input class="form-control border-0" type="search" placeholder="Search" name="keyword">
                       		 	<button type="submit">
                                    <i class="fa fa-search" style="color : rgb(249,88,10)"></i>
                                </button>
                    		</form>
							</div>

							<ul class="nav nav-tabs">
								<li class="nav-item"><a
									class="nav-link <c:if test="${category eq 'A'}">active</c:if>"
									id="status-all" data-toggle="tab" href="/admin/list.re">전체</a></li>
								<li class="nav-item"><a
									class="nav-link <c:if test="${category eq 'W'}">active</c:if>"
									data-toggle="tab" id="status-pending"
									href="/admin/list.re?page=1&category=W">대기</a></li>
								<li class="nav-item"><a
									class="nav-link <c:if test="${category eq 'Y'}">active</c:if>"
									data-toggle="tab" id="status-confirm"
									href="/admin/list.re?page=1&category=Y">승인</a></li>
								<li class="nav-item"><a
									class="nav-link <c:if test="${category eq 'N'}">active</c:if>"
									data-toggle="tab" id="status-reject"
									href="/admin/list.re?page=1&category=N">반려</a></li>
							</ul>
                            <div class="tab-content pt-3" id="nav-tabContent">
                                <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
									<div class="table-responsive">
		                                <table class="table" id="reportList">
		                                    <thead>
		                                        <tr>
		                                            <th scope="col"><input class="form-check-input" type="checkbox" id="selectAll_A"></th>
		                                            <th scope="col">번호</th>
		                                            <th scope="col">유형</th>
		                                            <th scope="col">제목</th>
		                                            <th scope="col">신고당한사람</th>
		                                            <th scope="col">내용</th>
		                                            <th scope="col">신고일</th>
		                                            <th scope="col">상태</th>
		                                        </tr>
		                                    </thead>
		                                    <tbody>
		                                    <c:choose>
			                                    <c:when test="${ not empty list }">
			                                    	<c:forEach var="r" items="${ list }">
			                    						<tr>
				                                            <td scope="row"><input class="form-check-input" type="checkbox" name="checkboxName" data-id="${ r.reportNo }"></td>
				                                            <td class="rno">${ r.reportNo }</td>
				                                            <td>${ r.reportType }</td>
				                                            <td>${ r.reportTitle }</td>
				                                            <td>${ r.reportId }</td>
				                                            <td>${ r.reportContent }</td>
				                                            <td>${ r.reportDate }</td>
				                                            <td class="report-status">${ r.reportStatus }</td>
				                                        </tr>
				                                	</c:forEach>
				                                </c:when>
				                            	<c:otherwise>
				                            		<tr>
				                            			<td colspan="8">조회된 게시글이 없습니다.</td>
				                            		</tr>
				                            	</c:otherwise>
				                            </c:choose>
				                            
		                                    </tbody>
		                                </table>
		                                <div align="center">
										    <a class="btn btn-primary confirm">승인</a>
										    <a class="btn btn-danger reject">반려</a>
										</div>
										<br><br>
									
										<form id="postForm" action="" method="post">
										    <input type="hidden" name="reportNo" value="${r.reportNo}">
										    <input type="hidden" name="reportStatus" id="reportStatus" value="">
										</form>
										
										<script>
										    function postFormSubmit(value) {
										        var form = document.getElementById("postForm");
												
										        var status = document.getElementById("reportStatus");
										        status.value = value;
										        
										        
										        form.action = "updateStatus.re";
							
										        form.submit();
										    }
										    
										    
										</script>
			                           </div>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>
            <!-- Table End -->

            <script>
            $(document).ready(function() {
            	
            	var newStatus = 'Y'; // 승인 처리 후 변경할 값
            	
            	
        	    // 전체선택 체크박스 클릭 이벤트
        	    $(document).on('change', 'thead input[type="checkbox"]', function() {
        	        var checkboxes = $('tbody input[type="checkbox"]');
        	        checkboxes.prop('checked', this.checked);
        	    });

        	    // 개별 체크박스 클릭 이벤트
        	    $(document).on('change', 'tbody input[type="checkbox"]', function() {
        	        var selectAllCheckbox = $('thead input[type="checkbox"]');
        	        selectAllCheckbox.prop('checked', $('tbody input[type="checkbox"]:checked').length === $('tbody input[type="checkbox"]').length);
        	    });


				
        	    // 승인 버튼 클릭 이벤트
        	    $(document).on('click', 'a.confirm', function() {
        	        var checkedCheckboxes = $('tbody input[type="checkbox"]:checked');
        	        var updateStatuses = [];

        	        checkedCheckboxes.each(function() {
        	        	updateStatuses.push($(this).data('id'));
        	        });
        	               	        
        	        if (updateStatuses.length === 0) {
        	            alert("승인할 게시글을 선택해주세요.");
        	            return;
        	        }
        	        
        	        var confirmation = confirm("일괄 승인하시겠습니까?");
        	        if (!confirmation) {
        	            return;
        	        }

        	        // 승인 처리를 위한 Ajax 요청
        	        $.ajax({
        	            type: "POST",
        	            url: "/admin/updateStatusAll.re",
        	            data: {
        	            	reportNo : updateStatuses.join(","),
        	                reportStatus : 'Y'
        	            },
        	            success: function(response) {
        	            	// 응답 받은 경우
        	                // 화면에서 해당 데이터의 상태 업데이트
        	                if (response === 'Y') {
        	                    // updateStatuses.forEach(function(reportNo) {
        	                    //    $(`.rno:contains(${reportNo})`).siblings('.report-status').text('Y');
        	                    // });
        		            	// $('thead input[type="checkbox"]').prop('checked', false);
        		            	// $('tbody input[type="checkbox"]').prop('checked', false);
        		            	alert("승인되었습니다.");
        		            	location.reload();
        		            } else {
        		            	alert("승인에 실패했습니다.");
        		            }
        	            },
        	            error: function() {
    		            	alert("승인에 실패했습니다.");
        	            }
        	            
        	        });
        	    });
        	
	         	// 반려 버튼 클릭 이벤트
	    	    $(document).on('click', 'a.reject', function() {
	    	        var checkedCheckboxes = $('tbody input[type="checkbox"]:checked');
	    	        var updateStatuses = [];
	
	    	        checkedCheckboxes.each(function() {
	    	        	updateStatuses.push($(this).data('id'));
	    	        });
	    	               	        
	    	        if (updateStatuses.length === 0) {
	    	            alert("반려할 게시글을 선택해주세요.");
	    	            return;
	    	        }
	    	        
	    	        var confirmation = confirm("일괄 반려하시겠습니까?");
	    	        if (!confirmation) {
	    	            return;
	    	        }
	
	    	        // 반려 처리를 위한 Ajax 요청
	    	        $.ajax({
	    	            type: "POST",
	    	            url: "/admin/updateStatusAll.re",
	    	            data: {
	    	            	reportNo : updateStatuses.join(","),
	    	                reportStatus : 'N'
	    	            },
	    	            success: function(response) {
	    		            if(response === 'Y') {
	    		            	alert("반려되었습니다.");
	    		            	location.reload();
	    		            } else {
	    		            	alert("반려에 실패했습니다.");
	    		            }
	    	            },
	    	            error: function() {
			            	alert("반려에 실패했습니다.");
	    	            }
	    	        });
	    	    });
    	});
    	
    	
            // 상세로 넘기는 스크립트
            $(function() {
          	  $("#reportList>tbody>tr").click(function() {
          	    let rno = $(this).children(".rno").text();
          	    location.href = "detail.re?rno=" + rno;
          	  });
          	});
            </script>

			<br>
            <div id="pagingArea">
                <ul class="pagination">
                    
                    <c:choose>
                        <c:when test="${ pi.currentPage eq 1 }">
                            <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item"><a class="page-link" href="list.re?currentPage=${ pi.currentPage - 1 }">Previous</a></li>
                        </c:otherwise>
                    </c:choose>
                    
                    
                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }" step="1">
                        <li class="page-item"><a class="page-link" href="list.re?currentPage=${ p }">${ p }</a></li>
                    </c:forEach>
                    
                    <c:choose>
                        <c:when test="${ pi.currentPage eq pi.maxPage }">
                            <li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item"><a class="page-link" href="list.re?currentPage=${ pi.currentPage + 1 }">Next</a></li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>

            <br clear="both"><br>
            
            
            <!-- Footer Start -->
			<%@ include file="../common/footer.jsp" %>
            <!-- Footer End -->
        </div>
        <!-- Content End -->

	</div>
          