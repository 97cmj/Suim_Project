<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
                <!-- Navbar Start -->
                <nav class="navbar navbar-expand bg-light navbar-light sticky-top px-4 py-0">
                    <a href="index.html" class="navbar-brand d-flex d-lg-none me-4">
                        <h2 class="text-primary mb-0"><i class="fa fa-hashtag"></i></h2>
                    </a>
                    <a href="#" class="sidebar-toggler flex-shrink-0">
                        <i class="fa fa-bars"></i>
                    </a>
                    <!-- 
                    <form class="d-none d-md-flex ms-4">
                        <input class="form-control border-0" type="search" placeholder="Search">
                    </form>
                    -->
                    <div class="navbar-nav align-items-center ms-auto">
                    	<!--
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                                <i class="fa fa-bell me-lg-2"></i>
                                <span class="d-none d-lg-inline-flex">알림</span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                                <a href="#" class="dropdown-item">
                                    <h6 class="fw-normal mb-0">Profile updated</h6>
                                    <small>15 minutes ago</small>
                                </a>
                                <hr class="dropdown-divider">
                                <a href="#" class="dropdown-item">
                                    <h6 class="fw-normal mb-0">New user added</h6>
                                    <small>15 minutes ago</small>
                                </a>
                                <hr class="dropdown-divider">
                                <a href="#" class="dropdown-item">
                                    <h6 class="fw-normal mb-0">Password changed</h6>
                                    <small>15 minutes ago</small>
                                </a>
                                <hr class="dropdown-divider">
                                <a href="#" class="dropdown-item text-center">See all notifications</a>
                            </div>
                        </div>
                        -->
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                            <c:choose>
				        		<c:when test="${not empty loginUser.changeName}">
                                	<img class="rounded-circle me-lg-2" src="${loginUser.changeName}" alt="" style="width: 40px; height: 40px;">
                               	</c:when>
						        <c:otherwise>
						            <img class="rounded-circle me-lg-2" src="/resources/img/common/default_profile.png" style="width: 40px; height: 40px;"></img>
						        </c:otherwise>
						    </c:choose>
							<span class="d-none d-lg-inline-flex">${ loginUser.nickName }</span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                                <a href="#" class="dropdown-item" onclick="event.preventDefault(); logout();">로그아웃</a>
                            </div>
                            <script>
	                            function logout() {
	                		        $.ajax({
	                		            url: '/member/logout',
	                		            method: 'POST',
	                		            success: function(response) {
	                		            	alert("로그아웃 되었습니다.");
	                		                location.reload(true);
	                		            }
	                		        });
	                		    }
                            </script>
                        </div>
                    </div>
                </nav>
                <!-- Navbar End -->
