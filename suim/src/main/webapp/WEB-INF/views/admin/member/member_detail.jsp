<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<style>
	.memberTableLeft{
		display: inline-block;
		float: left;
	}
	.memberTableRight{
		display: inline-block;
		float: rigth;	
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
	            <br><br>
	            <div class="innerOuter">
                <h2>회원 정보 보기</h2>
                <br>


				<!-- 테이블 시작 -->
				<div class="container-fluid pt-4 px-4">
	                <div class="row g-4">
		                <div class="col-12">
	                        <div class="bg-light rounded h-100 p-4">
	                            <h6 class="mb-4">회원 정보 보기</h6>
	                            
	                            <ul class="nav nav-tabs">
									<li class="nav-item"><a
										class="nav-link <c:if test="${category eq 'A'}">active</c:if>"
										id="status-all" data-toggle="tab" href="/admin/detail.me?id=${ m.memberId }">회원 정보</a></li>
									<li class="nav-item"><a
										class="nav-link <c:if test="${category eq 'W'}">active</c:if>"
										data-toggle="tab" id="status-pending"
										href="/admin/list.re?page=1&category=W">가맹 신청 내역</a></li>
									<li class="nav-item"><a
										class="nav-link <c:if test="${category eq 'N'}">active</c:if>"
										data-toggle="tab" id="status-reject"
										href="/admin/list.re?page=1&category=N">게시글 내역</a></li>
								</ul>
	                            <div class="tab-content pt-3" id="nav-tabContent">
	                                <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
										<br>
										<div class="table-responsive">
											<!-- 왼쪽 테이블 -->
		                					<div class="col-sm-12 col-xl-6 memberTableLeft">
				                                <table class="table" id="memberList">
			                                        <tr>
			                                            <th scope="col" width="200">이름</th>
			                                            <td>${ m.memberName }</td>
			                                        </tr>
			                                        <tr>
			                                            <th scope="row">닉네임</th>
			                                            <td>${ m.nickName }</td>
			                                        </tr>
			                                        <tr>
			                                            <th scope="row">전화번호</th>
			                                            <td>${ m.phone }</td>
			                                        </tr>
			                                        <tr>
			                                            <th scope="row">이메일</th>
			                                            <td>${ m.email }</td>
			                                        </tr>
			                                        <tr>
			                                            <th scope="row">성별</th>
			                                            <td>${ m.gender }</td>
			                                        </tr>
			                                        <c:choose>
					                                    <c:when test="${ not empty m.area }">
					                                        <tr>
					                                            <th scope="row">선호지역</th>
					                                            <td>${ m.area }</td>
					                                        </tr>
					                                    </c:when>
							                            <c:otherwise>
						                            		<tr>
						                            			<td colspan="8">선택한 선호지역이 없습니다.</td>
						                            		</tr>
						                            	</c:otherwise>
						                            </c:choose>
			                                        <tr>
			                                            <th scope="row">생년월일</th>
			                                            <td>${ m.birth }</td>
			                                        </tr>
			                                        <tr>
			                                            <th scope="row">가입일</th>
			                                            <td>${ m.enrollDate }</td>
			                                        </tr>
			                                        <tr>
			                                            <th scope="row">회원 정보 수정 날짜</th>
			                                            <td>${ m.modifyDate }</td>
			                                        </tr>
			                                        <tr>
			                                            <th scope="row">최근 로그인 날짜</th>
			                                            <td>${ m.loginDate }</td>
			                                        </tr>
			                                        <tr>
			                                            <th scope="row">상태</th>
			                                            <td>${ m.status }</td>
			                                        </tr>
				                                </table>
				                        	</div>
				                        	<!-- 오른쪽 테이블 -->
				                			<div class="col-sm-12 col-xl-6 memberTableRight">
				                                <table class="table">
				                                    <tr>
			                                            <th scope="row">프로필 사진</th>
			                                            <c:choose>
											        		<c:when test="${not empty m.changeName}">
						                                		<td><img src="${ m.changeName }" style="border-radius:200px;"></img></td>
						                                	</c:when>
													        <c:otherwise>
													            <td><img src="/resources/img/common/default_profile.png"></img></td>
													        </c:otherwise>
													    </c:choose>
			                                        </tr>
				                                </table>
				                        	</div>
				                        </div>
			                        </div>
	                            </div>
	                        </div>
	                    </div>
                	</div>
				</div>
				<!-- 테이블 끝 -->
				
				<script>
					function payment(){
						$.ajax({
							url: "admin/detail.me",
							type: "get",
							data: { id: ${ m.memberId } },
							success: function(result){
								
								console.log(result);
								
								var resultStr = "";
								
								for(var i = 0; i < result.length; i++) {
									
									resultStr += "<tr>"
											   + 	"<td>" + result[i].userId + "</td>"
											   + 	"<td>" + result[i].userName + "</td>"
											   + 	"<td>" + result[i].age + "</td>"
											   + 	"<td>" + result[i].phone + "</td>"
											   + "</tr>";
								}
								$("#contentArea").html(result);
							},
							error : function() {
								console.log("ajax 통신 실패!");
							}
						});
					}
				</script>

                <a class="btn btn-secondary" style="float:right;" href="list.me">목록으로</a>
                <br>
    
                <%-- <c:if test="${ (not empty loginUser) and (loginUser.userId eq b.boardWriter) }"> --%>
                    <div align="center">
                        <!-- 수정하기, 삭제하기 버튼은 이 글이 본인이 작성한 글일 경우에만 보여져야 함 -->
                            <a class="btn btn-primary" onclick="postFormSubmit(1);">수정하기</a>
                            <a class="btn btn-danger" onclick="postFormSubmit(2);">삭제하기</a>
                    </div>
                    <br><br>
                    
                    <!--
                        수정, 삭제 시 게시글 번호를 get 방식으로 넘기기에는 위험이 크므로
                        post 방식으로 요청 보내보기 => form 태그 필요
                    -->
                    <form id="postForm" action="" method="post">
                        <input type="hidden" name="memberId" value="${ m.memberId }">
                        <input type="hidden" name="filePath" value="${ m.changeName }">
                    </form>
                    <script>
                        // 수정하기 버튼과 삭제하기 버튼을 클릭했을 때 실행할 선언적 함수
                        function postFormSubmit(num) {
                            
                            // 해당 form 태그 선택 후 action 속성값을 각각 부여 후 곧바로 submit 시키기
                            if(num == 1) { // 수정하기 버튼을 클릭했을 경우
                                $("#postForm").attr("action", "updateForm.me").submit();
                            } else { // 삭제하기 버튼을 클릭했을 경우
                                $("#postForm").attr("action", "delete.me").submit();
                            }
                        }
                    </script>
                <%-- </c:if> --%>

            </div>
            <br><br>    
            <!-- Table End -->

            <br clear="both"><br>
            
            <!-- Footer Start -->
			<%@ include file="../common/footer.jsp" %>
            <!-- Footer End -->
        </div>
        <!-- Content End -->

	</div>
          