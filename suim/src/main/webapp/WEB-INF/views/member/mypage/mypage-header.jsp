<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style>
.actives {
	color: black !important;
}

.profile {
	margin: 0 auto;
	width: 100%;
	height: 100%;
	border-radius: 50%;
}
.container {
	padding : 0px;
}
</style>

<div class="container" style="margin-top: 75px;">
	<div class="row">
		<div class="col-md-12">
			<div id="content" class="content content-full-width"
				style="background: white;">
				<!-- begin profile -->
				<div class="profile">
					<div class="profile-header">
						<div class="profile-header-cover"></div>
						<div class="profile-header-content">
							<div class="profile-header-img">


								<c:choose>
									<c:when test="${empty loginUser.changeName}">
										<img src="/resources/img/common/default_profile.png" alt="사진"
											style="width: 100%; height: 100%">
									</c:when>
									<c:otherwise>
										<img src="${ loginUser.changeName }" alt="사진"
											style="width: 100%; height: 100%">
									</c:otherwise>
								</c:choose>

							</div>
							<div class="profile-header-info">
								<c:choose>
									<c:when test="${not empty loginUser }">
										<h4 class="m-t-10 m-b-5">${ loginUser.nickName }</h4>
										<c:choose>
											<c:when test="${not empty loginUser.memberComment}">
												<p class="m-b-10">${ loginUser.memberComment }</p>
											</c:when>
											<c:otherwise>
												<p class="m-b-10">회원 메시지가 없습니다</p>
											</c:otherwise>
										</c:choose>

										<button type="button" class="editModalBtn"
											data-bs-toggle="modal" data-bs-target="#myModal"
											style="color: white; height: 40px; background: transparent;">수정하기</button>
									</c:when>
									<c:otherwise>
										<h4 class="m-t-10 m-b-5">손님</h4>
										<p class="m-b-10">로그인 후 이용가능합니다.</p>
										<button
											style="color: white; height: 40px; background: transparent;">
											<a href="/member/login">로그인</a>
										</button>
									</c:otherwise>
								</c:choose>

							</div>
						</div>
						<c:set var="currentUrl" value="${pageContext.request.requestURI}" />
						<c:set var="suffix"
							value="${fn:substringAfter(currentUrl, '/mypage/')}" />
						<c:set var="pageUrl" value="${fn:substringBefore(suffix, '.jsp')}" />

						<ul class="profile-header-tab nav nav-tabs">
							<li class="nav-item"><a href="/mypage/timeline"
								class="nav-link ${fn:startsWith(pageUrl, 'timeline') ? 'actives' : ''}"><i class="fa-solid fa-bell"></i> 알림</a></li>
							<li class="nav-item"><a href="/mypage/board"
								class="nav-link ${fn:startsWith(pageUrl, 'board') ? 'actives' : ''}"><i class="fa-solid fa-scroll"></i> 내
									게시글</a></li>
							<li class="nav-item"><a href="/mypage/wish"
								class="nav-link ${fn:startsWith(pageUrl, 'wish') ? 'actives' : ''}"><i class="fa-solid fa-heart-circle-plus"></i> 찜목록</a></li>
							<li class="nav-item"><a href="/mypage/house"
								class="nav-link ${fn:startsWith(pageUrl, 'house') ? 'actives' : ''}"><i class="fa-solid fa-house"></i> 셰어하우스</a></li>
							<li class="nav-item"><a href="/mypage/reservation"
								class="nav-link ${fn:startsWith(pageUrl, 'reservation') ? 'actives' : ''}"><i class="fa-regular fa-calendar-check"></i> 예약내역</a></li>
							<li class="nav-item"><a href="/mypage/profile"
								class="nav-link ${fn:startsWith(pageUrl, 'profile') ? 'actives' : ''}"><i class="fa-solid fa-address-card"></i> 내정보</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>





<div class="modal fade" id="myModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered"
		style="max-width: 400px !important;">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="exampleModalLabel"
					style="margin-left: 150px">정보 수정</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body" style="text-align: left">
				<form id="updateForm" method="post" action="/mypage/updateProfile"
					enctype="multipart/form-data">
					<div id="fileupload_profile_img2" class="fileupload_profile_img">
						<c:choose>
							<c:when test="${empty loginUser.changeName}">
								<div id="profile_img2" class="profile"
									style="background: url(/resources/img/common/default_profile.png) 50% 50%/cover no-repeat;"></div>
							</c:when>
							<c:otherwise>
								<div id="profile_img2" class="profile"
									style="background: url(${loginUser.changeName}) 50% 50% / cover no-repeat;"></div>
							</c:otherwise>
						</c:choose>
						<span class="over"><i class="fa-solid fa-camera"
							style="color: #f2f2f2; margin-top: 7px;"></i></span>
						<div id="drop_profile_img2" class="drop_profile_img">
							<input title="프로필 업로드" type="file" name="file"
								style="width: 100%; height: 100%; cursor: pointer;"
								accept="image/jpeg, image/jpg, image/png, image/gif, image/svg+xml">
						</div>
					</div>
					<input class="form-control" type="text" name="nickName"
						placeholder="닉네임" value="${ loginUser.nickName }"
						required="required"
						style="width: 150px; margin: 0 auto; text-align: center; margin-bottom: 25px;">

					<input class="form-control" type="text" name="memberComment"
						placeholder="프로필 메시지" value="${ loginUser.memberComment }"
						style="width: 300px; margin: 0 auto; text-align: center;">

					<div class="input-border"
						style="height: 800px; width: 349px; margin: 20px auto;">


						<div class="input_block form-group">
							<div class="input_form _item _uid">
								<input title="아이디" type="text" name="memberId"
									readonly="readonly" value="${ loginUser.memberId }"
									placeholder="이메일" required="required"><i
									aria-hidden="true" class="zmdi zmdi-check"></i>
								<div class="alert-block _msg"></div>
							</div>
							<div class="input_block form-group">
								<div class="input_form _item _uid">
									<input title="이메일" type="email" name="email"
										readonly="readonly" value="${ loginUser.email }"
										placeholder="이메일" required="required"><i
										aria-hidden="true" class="zmdi zmdi-check"></i>
									<div class="alert-block _msg"></div>
								</div>
								<div class="input_form brt _item _passwd_org">
									<input title="기본 비밀번호 입력" type="password" name="memberPwd"
										autocomplete="off" placeholder="기본 비밀번호 입력"> <i
										aria-hidden="true" class="zmdi zmdi-check"></i>
									<div class="alert-block _msg"></div>
								</div>
								<div class="input_form brt _item _passwd">
									<input title="비밀번호" type="password" name="changePwd1"
										autocomplete="off" placeholder="비밀번호를 변경 하는 경우 입력하세요">
									<i aria-hidden="true" class="zmdi zmdi-check"></i>
									<div class="alert-block first-letter-uppercase _msg"></div>
								</div>
								<div class="input_form brt _item _passwd_confirm">
									<input title="비밀번호 확인" type="password" name="changePwd2"
										autocomplete="off" placeholder="비밀번호 확인"> <i
										aria-hidden="true" class="zmdi zmdi-check"></i>
									<div class="alert-block _msg"></div>
								</div>
							</div>
							<div class="input_block form-group">
								<label class="mini-tit" for="join_name">이름을 입력해주세요<span
									style="color: red">*</span></label>
								<div class="input_form _item _name">
									<input title="이름을 입력하세요" type="text" id="join_name"
										name="memberName" placeholder="이름을 입력하세요"
										value="${ loginUser.memberName }" required="required">
								</div>
							</div>
							<div class="input_block form-group">
								<label class="mini-tit" for="join_name">성별</label> <select
									title="성별" class="form-select" id="birth_y" name="gender">

									<option value="M"
										<c:if test="${loginUser.gender eq 'M'}">selected</c:if>>남자</option>
									<option value="F"
										<c:if test="${loginUser.gender eq 'F'}">selected</c:if>>여자</option>
								</select>
							</div>
							<div class="input_block form-group">
								<label class="mini-tit" for="join_name">연락처</label> <input
									class="input_form" type="tel" id="join_callnum" name="phone"
									placeholder="연락처" value="${ loginUser.phone }"
									required="required">
							</div>
							<c:set var="birthYear" value="${loginUser.birth.substring(0, 4)}" />
							<c:set var="birthMonth"
								value="${loginUser.birth.substring(4, 6)}" />
							<c:set var="birthDay" value="${loginUser.birth.substring(6, 8)}" />
							<div class="input_block form-group">
								<label class="mini-tit" for="join_name">생년월일</label>
								<div class="info" id="info__birth" align="left">
									<div style="display: inline-block; width: 120px;">
										<select class="form-select" id="birth-year">
											<option selected>${birthYear}</option>
										</select>
									</div>
									<div style="display: inline-block; width: 107px">
										<select class="form-select" id="birth-month">
											<option selected>${birthMonth}</option>
										</select>
									</div>
									<div style="display: inline-block; width: 107px">
										<select class="form-select" id="birth-day">
											<option selected>${birthDay}</option>
										</select>
									</div>
									<div id="info_birth" class="error-msg"></div>
									<input type="hidden" name="birth" id="birth-date-input"
										value="${birthYear}${birthMonth}${birthDay}">
								</div>
							</div>

							<div class="form-group">
								<label class="mini-tit" for="area">희망지역</label>
								<div class="col-sm-12">
									<input type="text" class="form-control" name="area"
										value="${loginUser.area }" id="area"
										placeholder="희망지역을 입력해주세요" readonly
										style="border: 1px solid #ced4da;">
									<p class="good-text" id="info_area">희망지역의 쉐어하우스를 우선적으로
										추천해드려요!</p>
									<button type="button" onclick="searchAddr();">
										<i class="fa-solid fa-magnifying-glass"
											style="font-size: 12px"></i> 검색
									</button>
								</div>

							</div>
							<div class="text-center">
								<c:if test="${ not empty loginUser.naverLogin }">
								소셜로그인 상태<br>
									<img src="/resources/img/member/naverBtn.png"
										style="width: 20px; height: 20px;"> 연결됨
								<input type="hidden" name="naverLogin"
										value="${loginUser.naverLogin}" />
								</c:if>
							</div>

						</div>
					</div>
					<div class="modal-footer justify-content-center">
						<button type="submit" class="btn btn-primary"
							style="width: 250px;">확인</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>


<script>
var birthYear = "${birthYear}";
var birthMonth = "${birthMonth}";
var birthDay = "${birthDay}";

document.getElementById("birth-year").value = birthYear;
document.getElementById("birth-month").value = birthMonth;
document.getElementById("birth-day").value = birthDay;

document.getElementById("birth-date-input").value = birthYear + birthMonth + birthDay;

const form = document.getElementById("updateForm");
const birthErrorMsgEl = document.getElementById("info_birth");

form.addEventListener("submit", function (event) {
    event.preventDefault(); // 기본 전송 동작 중지

    const birthArr = [
        document.getElementById("birth-year").value,
        document.getElementById("birth-month").value,
        document.getElementById("birth-day").value
    ];

    // 유효성 검사
    const isBirthValid = checkBirthValid(birthArr);
    if (!isBirthValid) {
        birthErrorMsgEl.style.color = 'rgba(255,0,0, 0.8)';
        birthErrorMsgEl.textContent = "생년월일을 다시 확인해주세요";
        return; // 전송 중지
    }

    // 전송할 작업 수행
    form.submit();
});

function checkBirthValid(birthArr) {
    const y = birthArr[0];
    const m = birthArr[1];
    const d = birthArr[2];

    // 생년월일 모두 선택 완료 시
    if (y > 0 && m > 0 && d > 0) {
        if ((m == 4 || m == 6 || m == 9 || m == 11) && d == 31) {
            return false;
        } else if (m == 2) {
            if (((y % 4 == 0) && (y % 100 != 0)) || (y % 400 == 0)) { // 윤년
                if (d > 29) { // 윤년은 29일까지
                    return false;
                }
            } else { // 평년
                if (d > 28) { // 평년은 28일까지
                    return false;
                }
            }
        }
    }

    return true; // 유효한 날짜
}

const birthYearEl = document.getElementById("birth-year");
const birthMonthEl = document.getElementById("birth-month");
const birthDayEl = document.getElementById("birth-day");

const isOptionExisted = {
    year: false,
    month: false,
    day: false
};


birthYearEl.addEventListener('focus', function () {
    // Year options creation (on first click)
    if (!isOptionExisted.year) {
        isOptionExisted.year = true;
        for (let i = 2023; i >= 1960; i--) {
            const yearOption = document.createElement('option');
            yearOption.setAttribute('value', i);
            yearOption.innerText = i;
            birthYearEl.appendChild(yearOption);
        }
    }
});

birthMonthEl.addEventListener('focus', function () {
    // Month options creation (on first click)
    if (!isOptionExisted.month) {
        isOptionExisted.month = true;
        for (let i = 1; i <= 12; i++) {
            const monthOption = document.createElement('option');
            const month = i < 10 ? '0' + i : i;
            monthOption.setAttribute('value', month);
            monthOption.innerText = month;
            birthMonthEl.appendChild(monthOption);
        }
    }
});

birthDayEl.addEventListener('focus', function () {
    // Day options creation (on first click)
    if (!isOptionExisted.day) {
        isOptionExisted.day = true;
        for (let i = 1; i <= 31; i++) {
            const dayOption = document.createElement('option');
            const day = i < 10 ? '0' + i : i;
            dayOption.setAttribute('value', day);
            dayOption.innerText = day;
            birthDayEl.appendChild(dayOption);
        }
    }
});

const birthArr = [birthYear, birthMonth, birthDay];

birthYearEl.addEventListener('change', () => {
    birthArr[0] = birthYearEl.value;
    updateBirthDate();
});

birthMonthEl.addEventListener('change', () => {
    birthArr[1] = birthMonthEl.value;
    updateBirthDate();
});

birthDayEl.addEventListener('change', () => {
    birthArr[2] = birthDayEl.value;
    updateBirthDate();
});

function updateBirthDate() {
    const birthDateInput = document.querySelector('#birth-date-input');
    const formattedDate = birthArr.join('');
    birthDateInput.value = formattedDate;
}
	
	
	
	
	    function searchAddr() {
	    var themeObj = {
	   //bgColor: "", //바탕 배경색
	   //searchBgColor: "#black", //검색창 배경색
	   //contentBgColor: "", //본문 배경색(검색결과,결과없음,첫화면,검색서제스트)
	   //pageBgColor: "", //페이지 배경색
	   //textColor: "", //기본 글자색
	   queryTextColor: "#black" //검색창 글자색
	   //postcodeTextColor: "", //우편번호 글자색
	   //emphTextColor: "", //강조 글자색
	   //outlineColor: "", //테두리
	    };
	
	    var width = 500; 
	    var height = 600; 
	
	
	    new daum.Postcode({
	
	        width: width, 
	        height: height,
	
		oncomplete : function(data) {
	
	
	        var addr = ''; // 주소 변수
	        var extraAddr = ''; // 참고항목 변수
	
	        if (data.userSelectedType === 'R') {
	            addr = data.roadAddress;
	        } else { 
	            addr = data.jibunAddress;
	        }
	
	        if(data.userSelectedType === 'R'){
	
	            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                extraAddr += data.bname;
	            }
	            if(data.buildingName !== '' && data.apartment === 'Y'){
	                extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	            }
	
	            if(extraAddr !== ''){
	                extraAddr = ' (' + extraAddr + ')';
	            }
	
	            document.getElementById("area").value = extraAddr;
	
	        } else {
	            document.getElementById("area").value = '';
	        }
	
	        //document.getElementById('zipCode').value = data.zonecode;
	        document.getElementById("area").value = addr;
	        document.getElementById("area").focus();
	
	
		}
	    , theme: themeObj
	    }).open({
	        left: (window.screen.width / 2) - (width / 2),
	        top: (window.screen.height / 2) - (height / 2)
	    });
	};
</script>
<script>
	var profileImg = document.getElementById("profile_img2");
	
	//Add event listener for file input change
	document.getElementById("drop_profile_img2").addEventListener("change", function(event) {
	// Get the selected file
	var file = event.target.files[0];
	
	// Create a FileReader object to read the file
	var reader = new FileReader();
	
	// Set up the onload event handler
	reader.onload = function(e) {
	 // Set the image source to the loaded data URL
	 profileImg.style.backgroundImage = "url(" + e.target.result + ")";
	};
	
	// Read the file as a data URL
	reader.readAsDataURL(file);
	});
</script>