<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.offcanvas-profile {
	width: 200px;
 	height: 200px; 
 	margin-left: 25px;
}

.notification {
  display: block;
  padding: 10px;
  background-color: #f7f7f7;
  border: 1px solid #ccc;
  border-radius: 4px;
  margin-bottom: 10px;
  font-size: 14px;
  color: #333;
  text-decoration: none;
}

.notification:hover {
  background-color: #eaeaea;
}

.notification .time {
  color: #888;
  margin-left: 10px;
}

.notification .content {
  font-weight: bold;
}

</style>

	<script type="text/javascript">
		var socket = null;

		var isFirstLoad = true;
		var isUpdatingNotification = false;
		var isVibrating = false;

		
		$(document).ready(function(){ //페이지가 새로고침 되면 웹소켓을 연결시킨다.
			
		if(${loginUser != null}){
			connectWs();
			addMessageToNotificationList('${loginUser.memberId}');
			notificationCount();
			}

		});
		
		function connectWs(){
		var ws = new SockJS("/notification");
		socket = ws;
		
		ws.onopen = function() {

		};	
			
			ws.onmessage = function(event) {
				 
				 addMessageToNotificationList(event.data);
				 notificationCount();
				 if (!isFirstLoad && !isUpdatingNotification && !isVibrating) {
				      vibrateButton();
				    }
				    isFirstLoad = false;
			 };
			ws.onclose = function() {

		 };
		};

		

		function addMessageToNotificationList(message) {

			  // AJAX 요청 보내기
			  $.ajax({
			    url: '/selectRecentNotification', // 변경된 데이터를 가져올 URL
			    method: 'GET',
			    dataType: 'json',
			    data : {
			    	receiverId : '${loginUser.memberId}'
			    },
			    
			    success: function(data) {
			    	
			      // 서버로부터 받은 데이터로 목록 업데이트
			      selectRecentNotification(data);
			      if (!isFirstLoad && !isVibrating) {
			          vibrateButton();
			        }
			        isUpdatingNotification = false;
			  		
			   
			      
			    },
			    error: function(error) {
			      console.error('웹소켓 에러 발생:', error);
			    }
			  });
			};

			
			function vibrateButton() {
				  if (isVibrating) {
				    return;
				  }
				  isVibrating = true;

				  var counter = 0;
				  var intervalId = setInterval(function() {
				    if (counter >= 5) {
				      clearInterval(intervalId);
				      $('#notificationButton').removeClass('vibrate');
				      isVibrating = false;
				      return;
				    }

				    $('#notificationButton').toggleClass('vibrate');
				    counter++;
				  }, 500); // Repeat every 500ms (adjust as needed)
				}
			
			
			


	 function selectRecentNotification(data) {
		  // 받은 데이터를 사용하여 목록 업데이트
		  var notificationList = $('#notificationList');
		  notificationList.empty(); // 목록 비우기

		  
		  if (data.length === 0) {
	    	  var notificationItem = $('<li style="list-style-type: none; padding-top : 350px; font-weight : bold; font-size : 20px;">').text('알림이 존재하지 않습니다.');
	    	  notificationList.prepend(notificationItem);
	    	  return;
	    	}

		  // 데이터를 순회하면서 목록에 추가
		  for (var i = 0; i < data.length; i++) {
		    var notification = data[i];
		    var senderId = notification.senderId;
		    var createdTime = new Date(notification.createdTime);
		    var content = notification.content;
		    var postType = notification.postType;
		    var postNo = notification.postNo;
		    var receiverId = notification.receiverId;

		    
		    
		    
		   


		    var notificationText = '';
		    if (postType === 'board') {
		

		    	 notificationText = '<a href="/detail.bo?bno=' + postNo + '" onclick="notificationDelete(\'' + '/detail.bo?bno=' + postNo + '\', \'' + postNo + '\', \'board\', \'' + receiverId + '\')" class="notification">' + senderId + '님이 ' + createdTime.toLocaleString() + '에 자유게시판의 <span class="content">' + content + '</span>에 댓글을 달았습니다. <span class="time">' + createdTime.toLocaleString() + '</span></a>';

		    } else {
		      // 다른 postType에 대한 처리를 추가할 수 있습니다.
		    }

		    var notificationItem = $('<li style="list-style-type : none"></li>').html(notificationText);
		    notificationList.prepend(notificationItem);
		  }

		  
		};
		
		
		function notificationCount() {
			var notificationList = $('#notificationList');
			 $.ajax({
				    url: '/notificationCount',
				    method: 'GET',
				    dataType: 'json',
				    data : {
				    	receiverId : '${loginUser.memberId}'
				    },
				    success: function(data) {
				    	
				    	var count = data;

				          // Display the updated count next to the notificationButton
				          var countElement = $('<span style="font-size: 14px; ">').addClass('notification-count').text(count);

				          
				          $('#notificationButton .notification-count').remove(); // Remove the previous count
				          $('#notificationButton').append(countElement);
				          
				    }
			 });
		};
		
				
		
		function notificationDelete(linkUrl, postNo, postType, receiverId) {
			  // AJAX 요청 보내기
			  $.ajax({
			    url: '/notificationDelete', // 댓글 알림 삭제를 처리하는 URL
			    method: 'POST',
			    data: {
			      postNo: postNo, // 게시물 번호 전달
			      postType: postType, // 게시물 유형 전달
			      receiverId: receiverId // 수신자 ID 전달
			    },
			    dataType: 'json',
			    success: function(response) {
			      // 요청이 성공하면 링크로 이동
			      if (response.success) {



			        // 링크로 이동
			        window.location.href = linkUrl;
			      } else {
			        console.error('댓글 알림 삭제 실패:', response.message);
			      }
			    },
			    error: function(error) {
			      console.error('댓글 알림 삭제 요청 실패:', error);
			    }
			  });
			}
	</script>


	<c:if test="${ not empty alertMsg }">
		<script>
			alert("${ alertMsg }");
		</script>
		<c:remove var="alertMsg" scope="session" />
	</c:if>

	<c:if test="${ not empty toastError }">
		<script>
		toastr.error("${ toastError }");
		</script>
		<c:remove var="toastError" scope="session" />
	</c:if>
	
	<c:if test="${ not empty toastSuccess }">
		<script>
		toastr.success("${ toastSuccess }");
		</script>
		<c:remove var="toastSuccess" scope="session" />
	</c:if>

	<c:set var="currentPath" value="${pageContext.request.servletPath}" />
	<c:if test="${!currentPath.equals('/WEB-INF/views/main.jsp')}">
	  <script>
	    window.addEventListener('DOMContentLoaded', function() {
	      var navbarCollapsible = document.querySelector('#mainNav');
	      navbarCollapsible.style.backgroundColor = 'white';
	    });
	  </script>
	</c:if>
	
	
	
	<button id="notificationButton"><i class="fas fa-bell"></i></button>

<style>
#notificationButton {
  position: fixed;
  right: 10px;

  bottom: 41px;
  width: 60px;
  height: 60px;
  border-radius: 50%;
  background-color: #000000;
  color: #ffffff;
  font-size: 32px;

  border: none;
  outline: none;
  cursor: pointer;
  z-index : 9999;

  box-shadow : rgba(255, 255, 255, 0.12) 0px 0px 2px 0px inset, rgba(0, 0, 0, 0.05) 0px 0px 2px 1px, rgba(0, 0, 0, 0.22) 0px 4px 20px;
}

#notificationButton:hover {
  box-shadow: 0 0 30px rgba(0, 0, 0, 0.3);

}

#notificationModal {
  display: none;
  position: fixed;
  right: 0;
  top: 0;
  width: 300px;
  height: 100%;
  background-color: #fff;

  z-index: 9998;

  overflow-y: auto;
  box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
}

.modal-content {
  padding: 20px;
}

.close {
  position: absolute;
  top: 10px;
  right: 20px;
  font-size: 24px;
  cursor: pointer;
}


@keyframes vibrate {
  0% {
    transform: translate(-2px, -2px);
    background-color: rgb(250, 107, 111);
  }
  25% {
    transform: translate(2px, -2px);
    background-color: rgb(250, 107, 111);
  }
  50% {
    transform: translate(2px, 2px);
    background-color: rgb(250, 107, 111);
  }
  75% {
    transform: translate(-2px, 2px);
    background-color: rgb(250, 107, 111);
  }
  100% {
    transform: translate(-2px, -2px);
    background-color: rgb(250, 107, 111);
  }
}

.vibrate {
  animation: vibrate 0.1s infinite linear;
}

</style>


	<div id="notificationModal">

	<div class="modal-header justify-content-center" style="border-bottom : 1px solid #e0e0e0; height : 60px;">
	<h3>알림</h3>
	<span class="close">&times;</span>
	</div>
  <div class="modal-content">

    <ul id="notificationList"></ul>
  </div>
</div>
	
<script>


$('#notificationButton').click(function(e) {
    console.log('click');
    e.stopPropagation();
    $('#notificationModal').toggle();
  });

  // Hide the modal window when the close modal window button is clicked
  $('#notificationModal .close').click(function(e) {
    e.stopPropagation();
    $('#notificationModal').hide();
  });

  $(document).click(function(event) {
    var modal = $('#notificationModal');
    if (!modal.is(event.target) && modal.has(event.target).length === 0) {
      modal.hide();
    }
  });


</script>

	
	
	
	
	
	<header>
	        <nav class="navbar navbar-expand-lg navbar-light fixed-top header_wrap" id="mainNav">
	            <div class="header container px-4 px-lg-5">
	                <a class="navbar-brand" href="/"><img class="logo" src="/resources/img/common/sim5.png"></a>
	                
	                <ul class="nav nav-pills navi">
          
	                        <li class="nav-item"><a href="" class="nav-link nav-text">방 찾기</a></li>

	                        <li class="nav-item">
	                            <a href="#" class="nav-link nav-text">쉼</a>
	                            <ul>
	                                <li><a href="">쉼 소개</a></li>
	                            </ul>
	                        </li>
	                        <li class="nav-item">
	                            <a href="#" class="nav-link nav-text">커뮤니티</a>
	                            <ul>
	                                <li><a href="/list.bo">자유게시판</a></li>

	                                <li><a href="/list.in">입주후기</a></li>

	                                <li><a href="/list.fi">사람구해요</a></li>
	                            </ul>
	                        </li>
	                        
	                        <c:choose>
				            	<c:when test="${ empty loginUser }">
					                <!-- 로그인 전 -->
					                 <li class="nav-item">
	                            		<a href="/member/login" class="nav-link nav-text">로그인</a>
	                        		</li>
				                </c:when>
				                <c:otherwise>
					                <li class="nav-item">
	                            		<a href="#" class="nav-link nav-text">${ loginUser.memberName }님</a>
		                            	<ul>
			                                <li><a href="/mypage/timeline">마이페이지</a></li>

			                                <li><a href="/chat.ch">채팅방</a>
			                                
			                                <li>
			                                <form id="logout-form1" action="/member/logout" method="post">
			                                <a href="#" onclick="event.preventDefault(); logout();">로그아웃</a>
			                                </form>
			                                </li>
			                                
		                            	</ul>
	                        		</li>
				                </c:otherwise>
				            </c:choose>    
	                        
	                        <li class="nav-item">
	                            <a href="#" class="nav-link nav-text">고객센터</a>
	                            <ul>
	                                <li><a href="/notice.no">공지사항</a></li>
	                                <li><a href="/faqList">자주 묻는 질문</a></li>
	                                <li><a href="/event.ev">이벤트</a></li>  
	                            </ul>
	                        </li>
	                </ul>
	                
	                    <!-- 햄버거 메뉴 -->
	                    <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar">
	                            <span class="navbar-toggler-icon"></span>
	                    </button>
	                    <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
	                        <div class="offcanvas-header">
	                        <c:choose>
				            	<c:when test="${ empty loginUser }">
	                            <h5 class="offcanvas-title" id="offcanvasNavbarLabel">&nbsp;&nbsp;&nbsp;&nbsp;로그인 해주세요.</h5>
	                           	</c:when>
	                       </c:choose>
	                            <button type="button" class="btn-close text-reset"
	                                data-bs-dismiss="offcanvas" aria-label="Close"></button>
	                        </div>
	                        <div class="offcanvas-body">
	                        
	                        
	                        <c:choose>
				            	<c:when test="${ empty loginUser }">
					                 <div class="user-button">
	                                <button type="button"
	                                    style="width: 150px; margin-right: 20px; margin-left: 20px;"
	                                    class="btn btn-success btn-lg" onclick="location.href='/member/login'">로그인</button>
	                                <button type="button" style="width: 150px;"
	                                    class="btn btn-outline-success btn-lg" onclick="location.href='/member/join'">회원가입</button>
	                            	</div>
				                </c:when>
				            </c:choose>
	                            <ul class="navbar-nav justify-content-end flex-grow-1 pe-3 pb-2">
									<c:choose>
									  <c:when test="${not empty loginUser}">
									    <c:choose>
									      <c:when test="${empty loginUser.changeName}">
									        <img src="/resources/img/common/default_profile.png" class="offcanvas-profile">
									      </c:when>
									      <c:otherwise>
									        <img src="${loginUser.changeName}" class="offcanvas-profile"/>
									      </c:otherwise>
									    </c:choose>
									  </c:when>
									</c:choose>

	                                <c:if test="${not empty loginUser }">
	                                
	                                <li class="nav-item dropdown m-4">
	                                    <a class="side-black" href="#" id="offcanvasNavbarDropdown1" role="button" data-bs-toggle="dropdown" aria-expanded="false">${ loginUser.nickName }님</a>
	                                        <ul class="dropdown-menu" aria-labelledby="offcanvasNavbarDropdown1">
	                                           <li><a class="dropdown-item" href="mypage">마이페이지</a></li>
	                                           <li><a class="dropdown-item" href="chat.ch">채팅방</a></li>
	                                           <li><form id="logout-form2" action="/member/logout" method="post"><a class="dropdown-item" href="#" onclick="event.preventDefault(); logout();">로그아웃</a></form></li>
	                                        </ul> 
	                                </li>
	                                
	                                </c:if>
	                                
	                                <li class="nav-item offcanvas-text m-4">
	                                    <a class="side-black" aria-current="page" href="">방 찾기</a>
	                                </li>
	                                
	                                <li class="nav-item dropdown m-4">
	                                    <a class="side-black" href="#" id="offcanvasNavbarDropdown1" role="button" data-bs-toggle="dropdown" aria-expanded="false">셰어하우스 쉼</a>
	                                        <ul class="dropdown-menu" aria-labelledby="offcanvasNavbarDropdown1">
	                                           <li><a class="dropdown-item" href="#">쉼 소개</a></li>
	                                        </ul> 
	                                </li>
	                                <li class="nav-item dropdown m-4"><a class="side-black" href="#" id="offcanvasNavbarDropdown2" role="button" data-bs-toggle="dropdown" aria-expanded="false">커뮤니티 </a>
	                                    <ul class="dropdown-menu" aria-labelledby="offcanvasNavbarDropdown2">
	                                        <li><a class="dropdown-item" href="list.bo">자유게시판</a></li>
	                                        <li><a class="dropdown-item" href="list.fi">사람구해요</a></li>

	                                        <li><a class="dropdown-item" href="list.in">입주 후기 </a></li>                                            

	                                    </ul>
	                                </li>
	                                <li class="nav-item dropdown m-4"><a class="side-black" href="#" id="offcanvasNavbarDropdown3" role="button" data-bs-toggle="dropdown" aria-expanded="false">고객센터 </a>
	                                    <ul class="dropdown-menu" aria-labelledby="offcanvasNavbarDropdown3">
	                                        <li><a class="dropdown-item" href="notice.no">공지사항</a></li>
	                                        <li><a class="dropdown-item" href="/faqList">자주 묻는 질문</a></li> 
	                                        <li><a class="dropdown-item" href="event.ev">이벤트</a></li>                    
	                                    </ul>
	                                </li>
	                            </ul>
	                        </div>
	                    </div>
	            </div>
	        </nav>
	    </header>
	    
	    
	    <script>
    function logout() {
        $.ajax({
            url: '/member/logout',
            method: 'POST',
            success: function(response) {
            	alert('로그아웃 되었습니다.');
                location.reload(true);
            }
        });
    }
	</script>