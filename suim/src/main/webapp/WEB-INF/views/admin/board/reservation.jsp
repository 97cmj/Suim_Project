<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
	#rezBoardList {text-align:center;}
	#rezBoardList>tbody>tr:hover {
		cursor:pointer;
		background-color: #d3d3d3; 
		box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
	}
	#pagingArea {width:fit-content; margin:auto;}
	.searchForm>form>input{
		width:150px!important;
		display:inline-block;
	}
	.searchForm>form>button {border:none!important;}
	.searchForm>form>div {display:inline-block;}
	#modification, #deleteControl{
		background-color: #FA6B6F;
		color : white;
	    text-decoration: none;
	    border : none;
	    border-radius : 5px;
	    padding : 2px 10px;
	}
	.delConDiv{
		text-align: right;
	}
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
                            <h6 class="mb-4">예약 관리</h6>

							<div align="right" class="searchForm">
							<form class="d-md-flex ms-4" action="/admin/adminRezKeySearch.bo" method="get">
								<div class="select">
				                    <select class="form-select form-select-sm mb-3" name="condition" style="margin-bottom: unset !important;">
				                        <option value="rezTitle">셰어하우스 이름</option>
				                        <option value="sendMemberId">예약자 Id</option>
				                        <option value="recMemberId">호스트 Id</option>
				                    </select>
				                </div>
								<input class="form-control border-0" type="search" placeholder="Search" name="keyword">
                       		 	<button type="submit">
                                    <i class="fa fa-search" style="color : rgb(249,88,10)"></i>
                                </button>
                    		</form>
							</div>
							<form id="enrollForm" method="get" action="/admin/adminRezDeSearch.bo" enctype="multipart/form-data">     
								<div class="search-filter">
								    <label for="rezStatus">예약상태:</label>
								    <select id="rezStatus" name="rezStatus" style="border-radius: 8px;">
								        <option value="all">예약상태를 선택하세요</option>
								        <option value="예약신청" >예약신청</option>
								        <option value="예약확정" >예약확정</option>
								        <option value="예약취소" >예약취소</option>
								    </select>
								
								    &nbsp;&nbsp;
								    
								    <label for="del">삭제상태:</label>
								    <select id="del" name="del" style="border-radius: 8px;">
								        <option value="all">삭제상태 선택</option>
								        <option value="N" >등록</option>
								        <option value="Y" >삭제</option>
								    </select>
									&nbsp;&nbsp;
								
								    <label for="dc">조건:</label>
								    <select id="dc" name="dc" style="border-radius: 8px;">
								        <option value="all">날짜 조건을 선택하세요</option>
								        <option value="before">오늘 이전</option>
								        <option value="after">오늘 이후</option>
								        <option value="today">오늘</option>
								    </select>
								    
								    <button onclick="updateTableList()" class="btn btn-secondary2" style="display: inline-block; vertical-align: middle; line-height: 20px; background-color: rgb(250,107,111); height: 20px; text-decoration: none; color: #fff; padding: 0 10px; font-size: medium; margin-bottom: 03px;">검색</button>
								</div>
							</form>
							
							
								
                            <div class="tab-content pt-3" id="nav-tabContent">
                                <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
									<div class="table-responsive">
										<form action="/admin/adminRezDelete.bo" method="post" >
		                                <table class="table" id="rezBoardList">
		                                    <thead>
		                                        <tr>
		                                            <th scope="col"><input class="form-check-input" type="checkbox" id="selectAll_A"></th>
		                                            <th scope="col">번호</th>
		                                            <th scope="col" style="width: 200px;">셰어하우스 이름</th>
		                                            <th scope="col">예약 신청일</th>
		                                            <th scope="col">예약자 Id</th>
		                                            <th scope="col">호스트 Id</th>
		                                            <th scope="col">예약일</th>
		                                            <th scope="col">예약시간</th>
		                                            <th scope="col">예약상태</th>
		                                            <th scope="col">삭제상태</th>
		                                        </tr>
		                                    </thead>
		                                    <tbody>
		                                    <c:choose>
			                                    <c:when test="${ not empty list }">
			                                    	<c:forEach var="r" items="${ list }">
				                    					<tr>
					                                      	<td scope="row"><input class="form-check-input" type="checkbox" name="checkboxName" value="${r.rezNo}"></td>
					                                        <td class="rno">${ r.rezNo }</td>
					                                        <td>${ r.houseName }</td>
					                                        <td>${ r.rezRequestDate }</td>
					                                        <td>${ r.sendMemberId }</td>
					                                        <td>${ r.recMemberId }</td>
					                                        <td>${ r.rezDate }</td>
					                                        <td>${ r.rezHour }</td>					                                        	
					                                        <td>${ r.rezStatus }</td>
					                                        <c:if test="${ r.delStatus eq 'N'}">
																    <td>등록</td>
																</c:if>
															<c:if test="${r.delStatus eq 'Y'}">
																    <td>삭제</td>
															</c:if>		
					                                    </tr>
				                                	</c:forEach>
				                                </c:when>
				                            	<c:otherwise>
				                            		<tr>
				                            			<td colspan="10">조회된 게시글이 없습니다.</td>
				                            		</tr>
				                            	</c:otherwise>
				                            </c:choose>
		                                    </tbody>
	                                	</table>
	                                	<div class="delConDiv">
		                                	<input type="submit" id="deleteControl" name="deleteControl" value="삭제">
		                                	<input type="submit" id="deleteControl" name="deleteControl" value="복구">
		                                </div>	
	                                </form>
                            	</div>
                        </div>
                    </div>

                </div>
            </div>
            <!-- Table End -->

            <script>
            $(function() {
                if (${ not empty list }) {
	                $("#rezBoardList>tbody>tr").on("click", function(event) {
	                    if (event.target.type !== "checkbox") {
	                        let rno = $(this).children(".rno").text();
	                        location.href = "/admin/adminRezDetail.ho?rno=" + rno;
	                    }
	                });
                }
            });
            
            
            $(document).ready(function() {
            	            	
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

       
             	// 전체선택 체크박스 클릭 이벤트
        	    $(document).on('change', 'thead input[type="checkbox"]', function() {
        	        var checkboxes = $('tbody input[type="checkbox"]');
        	        checkboxes.prop('checked', this.checked);
        	    });
        	});
            </script>
			<br>
			<c:if test="${empty param.del and empty param.condition}">
				<nav id="pagingArea" style="margin-top: 30px; margin-bottom: 30px;">
					<ul class="pagination justify-content-center">
						<li class="page-item ${pi.currentPage == 1 ? 'disabled' : ''}">
							<a class="page-link" href="<c:url value='/admin/adminRez.ho?currentPage=${pi.currentPage - 1}'/>">&lt;</a>
						</li>
						<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}" step="1">
							<li class="page-item ${pi.currentPage == p ? 'active' : ''}">
								<a class="page-link" href="<c:url value='/admin/adminRez.ho?currentPage=${p}'/>">${p}</a>
							</li>
						</c:forEach>
						<li class="page-item ${pi.currentPage == pi.maxPage || pi.listCount == 0 ? 'disabled' : ''}">
							<a class="page-link" href="<c:url value='/admin/adminRez.ho?currentPage=${pi.currentPage + 1}'/>">&gt;</a>
						</li>
					</ul>
				</nav>
			</c:if>
			<c:if test="${not empty param.del and empty param.condition}">
				<nav id="pagingArea" style="margin-top: 30px; margin-bottom: 30px;">
					<ul class="pagination justify-content-center">
						<li class="page-item ${pi.currentPage == 1 ? 'disabled' : ''}">
							<a class="page-link" href="<c:url value='/admin/adminRezDeSearch.bo?currentPage=${pi.currentPage - 1}&rezStatus=${rezStatus}&dc=${dc}&del=${del}'/>">&lt;</a>
						</li>
						<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}" step="1">
							<li class="page-item ${pi.currentPage == p ? 'active' : ''}">
								<a class="page-link" href="<c:url value='/admin/adminRezDeSearch.bo?currentPage=${p}&rezStatus=${rezStatus}&dc=${dc}&del=${del}'/>">${p}</a>
							</li>
						</c:forEach>
						<li class="page-item ${pi.currentPage == pi.maxPage || pi.listCount == 0 ? 'disabled' : ''}">
							<a class="page-link" href="<c:url value='/admin/adminRezDeSearch.bo?currentPage=${pi.currentPage + 1}&rezStatus=${rezStatus}&dc=${dc}&del=${del}'/>">&gt;</a>
						</li>
					</ul>
				</nav>
			</c:if>
			<c:if test="${empty param.del and not empty param.condition}">
				<nav id="pagingArea" style="margin-top: 30px; margin-bottom: 30px;">
					<ul class="pagination justify-content-center">
						<li class="page-item ${pi.currentPage == 1 ? 'disabled' : ''}">
							<a class="page-link" href="<c:url value='/admin/adminRezKeySearch.bo?currentPage=${pi.currentPage - 1}&condition=${condition}&keyword=${keyword}'/>">&lt;</a>
						</li>
						<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}" step="1">
							<li class="page-item ${pi.currentPage == p ? 'active' : ''}">
								<a class="page-link" href="<c:url value='/admin/adminRezKeySearch.bo?currentPage=${p}&condition=${condition}&keyword=${keyword}'/>">${p}</a>
							</li>
						</c:forEach>
						<li class="page-item ${pi.currentPage == pi.maxPage || pi.listCount == 0 ? 'disabled' : ''}">
							<a class="page-link" href="<c:url value='/admin/adminRezKeySearch.bo?currentPage=${pi.currentPage + 1}&condition=${condition}&keyword=${keyword}'/>">&gt;</a>
						</li>
					</ul>
				</nav>
			</c:if>
			
            <br clear="both"><br>
            
            <!-- Footer Start -->
			<%@ include file="../common/footer.jsp" %>
            <!-- Footer End -->
        </div>
        <!-- Content End -->
	</div>
	
	<script>
	    var alertMsg = "<%= session.getAttribute("alertMsg") %>";
	    if (alertMsg && alertMsg !== "null" && alertMsg !== "") {
	        alert(alertMsg);
	        <% session.removeAttribute("alertMsg"); %>
	    }
	</script>
            