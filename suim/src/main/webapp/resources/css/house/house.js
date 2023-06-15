$(document).ready(function() {
		let houseNo = "${h.houseNo}";
        let houseName = "${h.houseName}";
        let memberId = "${h.memberId}";
        
		  $('#reportBtn').click(function() {
			var popupUrl = "report.ho?value=" + encodeURIComponent(houseNo) + "&value2=" + encodeURIComponent(houseName) + "&value3=" + encodeURIComponent(memberId);
		    var popupWidth = 800;
		    var popupHeight = 800;

		    var windowWidth = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
		    var windowHeight = window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight;

		    var popupX = (windowWidth / 2) - (popupWidth / 2) + window.screenX;
		    var popupY = (windowHeight / 2) - (popupHeight / 2) + window.screenY;

		    var options = "width=" + popupWidth + ",height=" + popupHeight + ",left=" + popupX + ",top=" + popupY;

		    var popupWindow = window.open(popupUrl, "신고 팝업창", options);
		    popupWindow.document.documentElement.classList.add('popup');
		  });
		});



$(document).ready(function() {
			  <c:if test="${lo > 0}">
			    var heartIcon = $(".fa-heart");
			    heartIcon.removeClass("fa-regular").addClass("fa-solid fa-bounce").css("color", "#ED0707");
			    heartIcon.one("animationiteration webkitAnimationIteration oanimationiteration", function() {
	          $(this).removeClass("fa-bounce");
			    });
			  </c:if>
			});
		function heart(hno) {
		    var heartIcon = $(".fa-heart");
		    var isLiked = heartIcon.hasClass("fa-solid");
		    var type = isLiked ? "unlike" : "like"; // 하트가 칠해져 있다면 "unlike", 칠해져 있지 않다면 "like" 지정
		    $.ajax({
		        url: "heart.ho", // 서블릿으로 전송
		        type: "get",
		        data: {
		            hno: hno, // 메뉴번호랑 타입(like, unlike) 전달
		            type: type
		        },
		        success: function(response) {
		            if (response === "success") { // 성공적인 응답일 경우
		              if (isLiked) { // like 상태일 경우 기존 상태를 지우고 unlike 상태로 변환
		                heartIcon.removeClass("fa-solid").addClass("fa-regular fa-bounce").css("color", "");
		              } else { // unlike 상태일 경우 기존 상태를 지우고 like 상태로 변환
		                heartIcon.removeClass("fa-regular").addClass("fa-solid fa-bounce").css("color", "#ED0707");
		              }
		              heartIcon.one("animationiteration webkitAnimationIteration oanimationiteration", function() {
		                $(this).removeClass("fa-bounce");
		              });
		            }
		          },
		        });
		      }
		
		
		$(document).ready(function() {
		    $("#chatBtn").click(function() {
		        var muser = "${h.memberId}"; // JSP 표현식으로부터 값을 가져옴
		        var isLoggedIn = "${Id}"; // JSP 표현식에서 중괄호({})를 제거하여 JavaScript 변수에 할당
		            window.location.href = "house.ch?muser=" + muser;
		    });
		});

var map = new kakao.maps.Map(document.getElementById('map'), { // 지도를 표시할 div
		center : new kakao.maps.LatLng(37.534219, 126.901577), // 지도의 중심좌표
		level : 5
	// 지도의 확대 레벨
	});
	// 주소-좌표 변환 객체 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();

	geocoder
			.addressSearch(
					'${h.houseAddress}',
					function(result, status) {

						// 정상적으로 검색이 완료됐으면 
						if (status === kakao.maps.services.Status.OK) {

							var coords = new kakao.maps.LatLng(
									result[0].y, result[0].x);

							// 결과값으로 받은 위치를 마커로 표시합니다
							var marker = new kakao.maps.Marker({
								map : map,
								position : coords
							});

							// 인포윈도우로 장소에 대한 설명을 표시합니다
							var infowindow = new kakao.maps.InfoWindow(
									{
										content : '<div style="width:150px;text-align:center;padding:6px 0;">${h.houseName}</div>'
									});
							infowindow.open(map, marker);

							// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
							map.setCenter(coords);
						}
					});
	
	function rezPopup() {

        var popupUrl = "houseRez.ho?value=" + encodeURIComponent(houseNo) + "&value2=" + encodeURIComponent(houseName) + "&value3=" + encodeURIComponent(memberId);
        	  var width = 500;
              var height = 500;
              var left = (screen.width - width) / 2;
              var top = (screen.height - height) / 2;
              var popup = window.open(popupUrl, "popup", "width=" + width + ",height=" + height + ",left=" + left + ",top=" + top);
    }
	
	</script><script>
	$(document).ready(function() {
		let houseNo = "${h.houseNo}";
        let houseName = "${h.houseName}";
        let memberId = "${h.memberId}";
        
		  $('#reportBtn').click(function() {
			var popupUrl = "report.ho?value=" + encodeURIComponent(houseNo) + "&value2=" + encodeURIComponent(houseName) + "&value3=" + encodeURIComponent(memberId);
		    var popupWidth = 800;
		    var popupHeight = 800;

		    var windowWidth = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
		    var windowHeight = window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight;

		    var popupX = (windowWidth / 2) - (popupWidth / 2) + window.screenX;
		    var popupY = (windowHeight / 2) - (popupHeight / 2) + window.screenY;

		    var options = "width=" + popupWidth + ",height=" + popupHeight + ",left=" + popupX + ",top=" + popupY;

		    var popupWindow = window.open(popupUrl, "신고 팝업창", options);
		    popupWindow.document.documentElement.classList.add('popup');
		  });
		});



$(document).ready(function() {
			  <c:if test="${lo > 0}">
			    var heartIcon = $(".fa-heart");
			    heartIcon.removeClass("fa-regular").addClass("fa-solid fa-bounce").css("color", "#ED0707");
			    heartIcon.one("animationiteration webkitAnimationIteration oanimationiteration", function() {
	          $(this).removeClass("fa-bounce");
			    });
			  </c:if>
			});
		function heart(hno) {
		    var heartIcon = $(".fa-heart");
		    var isLiked = heartIcon.hasClass("fa-solid");
		    var type = isLiked ? "unlike" : "like"; // 하트가 칠해져 있다면 "unlike", 칠해져 있지 않다면 "like" 지정
		    $.ajax({
		        url: "heart.ho", // 서블릿으로 전송
		        type: "get",
		        data: {
		            hno: hno, // 메뉴번호랑 타입(like, unlike) 전달
		            type: type
		        },
		        success: function(response) {
		            if (response === "success") { // 성공적인 응답일 경우
		              if (isLiked) { // like 상태일 경우 기존 상태를 지우고 unlike 상태로 변환
		                heartIcon.removeClass("fa-solid").addClass("fa-regular fa-bounce").css("color", "");
		              } else { // unlike 상태일 경우 기존 상태를 지우고 like 상태로 변환
		                heartIcon.removeClass("fa-regular").addClass("fa-solid fa-bounce").css("color", "#ED0707");
		              }
		              heartIcon.one("animationiteration webkitAnimationIteration oanimationiteration", function() {
		                $(this).removeClass("fa-bounce");
		              });
		            }
		          },
		        });
		      }
		
		
		$(document).ready(function() {
		    $("#chatBtn").click(function() {
		        var muser = "${h.memberId}"; // JSP 표현식으로부터 값을 가져옴
		        var isLoggedIn = "${Id}"; // JSP 표현식에서 중괄호({})를 제거하여 JavaScript 변수에 할당
		            window.location.href = "house.ch?muser=" + muser;
		    });
		});

var map = new kakao.maps.Map(document.getElementById('map'), { // 지도를 표시할 div
		center : new kakao.maps.LatLng(37.534219, 126.901577), // 지도의 중심좌표
		level : 5
	// 지도의 확대 레벨
	});
	// 주소-좌표 변환 객체 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();

	geocoder
			.addressSearch(
					'${h.houseAddress}',
					function(result, status) {

						// 정상적으로 검색이 완료됐으면 
						if (status === kakao.maps.services.Status.OK) {

							var coords = new kakao.maps.LatLng(
									result[0].y, result[0].x);

							// 결과값으로 받은 위치를 마커로 표시합니다
							var marker = new kakao.maps.Marker({
								map : map,
								position : coords
							});

							// 인포윈도우로 장소에 대한 설명을 표시합니다
							var infowindow = new kakao.maps.InfoWindow(
									{
										content : '<div style="width:150px;text-align:center;padding:6px 0;">${h.houseName}</div>'
									});
							infowindow.open(map, marker);

							// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
							map.setCenter(coords);
						}
					});
	
	function rezPopup() {

        var popupUrl = "houseRez.ho?value=" + encodeURIComponent(houseNo) + "&value2=" + encodeURIComponent(houseName) + "&value3=" + encodeURIComponent(memberId);
        	  var width = 500;
              var height = 500;
              var left = (screen.width - width) / 2;
              var top = (screen.height - height) / 2;
              var popup = window.open(popupUrl, "popup", "width=" + width + ",height=" + height + ",left=" + left + ",top=" + top);
    }