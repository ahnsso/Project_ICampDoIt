<%@page import="com.exam.search.SearchkeyTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
//session 값 가져오기
int ucode = -1;
String id ="";
if(session.getAttribute("id") != null){
	ucode = (int)session.getAttribute("ucode");
	id = (String)session.getAttribute("id");
}

SearchkeyTO kto = (SearchkeyTO)request.getAttribute("kto");

String address="";
String titleaddr="";
if( kto.getAddr1().matches(".*[ㄱ-ㅎㅏ-ㅣ가-힣]+.*") == false ){
	address = kto.getDoNm() + " " + kto.getSigunguNm() + " " + kto.getAddr1();
}

if(kto.getDoNm().equals("default") && !kto.getSigunguNm().equals("default")){
	titleaddr= kto.getSigunguNm();
}else if(!kto.getDoNm().equals("default") && kto.getSigunguNm().equals("default")){
	titleaddr= kto.getDoNm();
}else if(!kto.getDoNm().equals("default") && !kto.getSigunguNm().equals("default")){
	titleaddr= kto.getDoNm() + " " +kto.getSigunguNm();
}

String intro="";
if(kto.getIntro().equals("default")){
	intro = " ";
}else{
	intro = kto.getIntro();
};

//캠핑장 시설정보
StringBuilder campInfo1 = new StringBuilder();
StringBuilder campInfo2 = new StringBuilder();
 
kto.getSbrsCl();
if(kto.getSbrsCl().indexOf("전기") != -1){
	System.out.println("전기있음");
	campInfo1.append( "<li class=\"mb-2\"> <i class=\"fa fa-bolt text-secondary w-1rem me-3 text-center\"></i><span class=\"text-sm\">전기</span></li>");
}

if(kto.getSbrsCl().indexOf("와이파이") != -1){
	System.out.println("와이파이");
	campInfo1.append( "<li class=\"mb-2\"> <i class=\"fa fa-wifi text-secondary w-1rem me-3 text-center\"></i><span class=\"text-sm\">와이파이</span></li>");
};

if(kto.getSbrsCl().indexOf("온수") != -1){
	System.out.println("온수");
	campInfo1.append( "<li class=\"mb-2\"> <i class=\"fa fa-solid fa-shower text-secondary w-1rem me-3 text-center\"></i><span class=\"text-sm\">온수</span></li>");
};

if(kto.getSbrsCl().indexOf("물놀이장") != -1){
	System.out.println("물놀이장");
	campInfo1.append( "<li class=\"mb-2\"> <i class=\"fa fa-regular fa-water text-secondary w-1rem me-3 text-center\"></i><span class=\"text-sm\">물놀이장</span></li>");
};


if(kto.getSbrsCl().indexOf("장작판매") != -1){
	campInfo2.append( "<li class=\"mb-2\"> <i class=\"fa fa-regular fa-fire text-secondary w-1rem me-3 text-center\"></i><span class=\"text-sm\">장작판매</span></li>");
};
if(kto.getSbrsCl().indexOf("산책로") != -1){
	campInfo2.append( "<li class=\"mb-2\"> <i class=\"fa fa-solid fa-shoe-prints text-secondary w-1rem me-3 text-center\"></i><span class=\"text-sm\">산책로</span></li>");
};
if(kto.getSbrsCl().indexOf("운동시설") != -1){
	campInfo2.append( "<li class=\"mb-2\"> <i class=\"fa fa-solid fa-dumbbell text-secondary w-1rem me-3 text-center\"></i><span class=\"text-sm\">운동시설</span></li>");
};
if(kto.getSbrsCl().indexOf("마트") != -1 || kto.getSbrsCl().indexOf("편의점") != -1){
	campInfo2.append( "<li class=\"mb-2\"> <i class=\"fa fa-regular fa-store text-secondary w-1rem me-3 text-center\"></i><span class=\"text-sm\">마트,편의점</span></li>");
};
%>

<!DOCTYPE html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>I CAMP DO IT</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <link rel="stylesheet" href="./resources/bootstrap-5/html/css/font.css" type="text/css">
    <!-- Price Slider Stylesheets -->
    <link rel="stylesheet" href="./resources/bootstrap-5/html/vendor/nouislider/nouislider.css">
    <!-- Google fonts - Playfair Display-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700">
    <!-- Google fonts - Poppins-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,400i,700">
    <!-- swiper-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/css/swiper.min.css">
    <!-- Magnigic Popup-->
    <link rel="stylesheet" href="./resources/bootstrap-5/html/vendor/magnific-popup/magnific-popup.css">
    <!-- Leaflet Maps-->
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.5.1/dist/leaflet.css" integrity="sha512-xwE/Az9zrjBIphAcBb3F6JVqxf46+CDLwfLMHloNu6KEQCAWi6HcDUbeOfBIptF7tcCzusKFjFw2yuvEpDL9wQ==" crossorigin="">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="./resources/bootstrap-5/html/css/style.green.css" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="./resources/bootstrap-5/html/css/custom.css">
    <!-- Favicon-->
    <link rel="shortcut icon" href="./resources/bootstrap-5/html/img/logo2.svg">
    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
  </head>
  <body style="padding-top: 72px;">
    <header class="header">
      <!-- Navbar 로고부분-->
      <nav class="navbar navbar-expand-lg fixed-top shadow navbar-light bg-white">
        <div class="container-fluid">
          	<a class="navbar-brand py-1" href="./home.do"><img src="./resources/bootstrap-5/html/img/logo.svg" alt="Directory logo"></a>          
          <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation"><i class="fa fa-bars"></i></button>
          
          <div class="collapse navbar-collapse justify-content-center" id="navbarCollapse">      
	          <ul class="navbar-nav">
	          
	              <!-- About 페이지 링크 -->
	              <li class="nav-item">
	              	<a class="nav-link" href="./about.do">About</a>
	              </li>
	              
	              <!-- Customer Care 페이지 -->
				  <li class="nav-item dropdown">
				  	<a class="nav-link dropdown-toggle" id="noticeDropdownMenuLink" href="#" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Customer Care</a>
	                <div class="dropdown-menu" aria-labelledby="noticeDropdownMenuLink"><a class="dropdown-item" href="./notice.do">공지사항</a><a class="dropdown-item" href="/faq.do">FAQ</a></div>
	              </li>
	              
	              <!-- Search 페이지 -->
	              <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" id="searchDropdownMenuLink" href="#" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                   Search</a>
	                <div class="dropdown-menu dropdown-menu-end" aria-labelledby="searchDropdownMenuLink">
	                  <a class="dropdown-item" href="./searchkey.do">일반검색</a><a class="dropdown-item" href="./searchmap.do">지도검색</a>
	                </div>
	              </li>
	              
	              <!-- Communication 페이지 -->      
	              <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" id="communicationDropdownMenuLink" href="#" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                   Communication</a>
	                <div class="dropdown-menu dropdown-menu-end" aria-labelledby="communicationDropdownMenuLink">
	                  <a class="dropdown-item" href="./mboardlist.do">게시판</a><a class="dropdown-item" href="./hboardlist.do">혼캠 자료실</a>
	                </div>
	              </li>
	              
	              <!-- MyPage 페이지 -->      
	              <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" id="mypageDropdownMenuLink" href="#" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                   MyPage</a>
	                <div class="dropdown-menu dropdown-menu-end" aria-labelledby="mypageDropdownMenuLink">
	                  <a class="dropdown-item" href="./mypage.do">내 정보</a><a class="dropdown-item" href="./mypagesub.do">찜한 목록</a><a class="dropdown-item" href="./mypagemylist.do">내가 쓴 글</a>
	                </div>
	              </li>
	            </ul>
         	</div>
         	
         	<form class="d-flex">
         		<%if(ucode == -1){ %>
             	<button class="btn btn-outline-primary btn-sm" type="button" onclick="location.href='./login.do'">Login</button>
             	<%}else{ %>
             	<span class="mx-2"><strong><%=id%></strong>님 </span>
             	<button class="btn btn-outline-primary btn-sm" type="button" onclick="location.href='./logout.do'">Logout</button>
             	<%}; %>
             </form>
         </div>
      </nav>
      <!-- /Navbar -->
    </header>
    
    <div class="container py-5">
      <div class="row">
        <div class="col-lg-8"> 
          <div class="text-block">
            <p class="text-primary" style="font-family: 'GmarketSansMedium';"><i class="fa-map-marker-alt fa me-1"></i><%=titleaddr%></p>
            <h1 style="font-family: 'GmarketSansBold';"><%=kto.getFacltNm()%></h1>
            <br />
            
            
            <!-- 찜버튼 3 -->
            <div align="right">
             <button type="button" class="btn btn-outline-danger">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">
 				 <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"></path>
				</svg>
				찜하기
             </button>
            </div>
          </div>
            
           <!-- 캠핑장 소개 -->
           <div class="text-block">
           	 <h4 class="mb-4" style="font-family: 'GmarketSansMedium';">캠핑장 소개</h4>
             <p class="text-muted fw-light"><%=intro%></p>
           </div>
          	
           <!-- 캠핑장 시설정보 -->
           <div class="text-block">
	         <h4 class="mb-4" style="font-family: 'GmarketSansMedium';">캠핑장 시설정보</h4>
	           <div class="row"> 
              	 <div class="col-md-6">
		           <ul class="list-unstyled text-muted">
		          <!-- 
		             <li class="mb-2"> <i class="fa fa-wifi text-secondary w-1rem me-3 text-center"></i><span class="text-sm">와이파이</span></li>
		             <li class="mb-2"><i class="fa fa-solid fa-bolt text-secondary w-1rem me-3 text-center"></i><span class="text-sm">전기</span></li>
		             <li class="mb-2"><i class="fa fa-solid fa-shower text-secondary w-1rem me-3 text-center"></i><span class="text-sm">온수</span></li>
		             <li class="mb-2"><i class="fa fa-regular fa-water text-secondary w-1rem me-3 text-center"></i><span class="text-sm">물놀이장</span></li>
		              -->
		              <%=campInfo1.toString()%>
		             
		           </ul>
                 </div>
                 <div class="col-md-6">
		           <ul class="list-unstyled text-muted">
		           		<%=campInfo2.toString()%>
		           <!--  
		             <li class="mb-2"><i class="fa fa-regular fa-fire text-secondary w-1rem me-3 text-center"></i><span class="text-sm">장작판매</span></li>
		             <li class="mb-2"><i class="fa fa-solid fa-shoe-prints text-secondary w-1rem me-3 text-center"></i><span class="text-sm">산책로</span></li>
		             <li class="mb-2"><i class="fa fa-solid fa-dumbbell text-secondary w-1rem me-3 text-center"></i><span class="text-sm">운동시설</span></li>
		             <li class="mb-2"><i class="fa fa-regular fa-store text-secondary w-1rem me-3 text-center"></i><span class="text-sm">마트,편의점</span></li>
		             
		           
		             <li class="mb-2"> <i class="fa fa-bed me-1 text-secondary w-1rem me-3 text-center"></i><span class="text-sm">bed</span></li>
		             -->
		           </ul>
              	 </div>
               </div>
           </div>
            
           <!-- 기타 주요시설 -->
           <div class="text-block"> 
             <h4 class="mb-4" style="font-family: 'GmarketSansMedium';">기타 주요시설</h4>
               <div class="table-responsive text-sm mb-3">
                <table class="table table-striped">
                <tbody>
                  <tr>
                    <td class="fw-bold" style="font-family: 'GmarketSansMedium';">주요시설</td>
                    <td>일반야영장 / 자동차야영장사이트 / 카라반 / 개인카라반사이트</td>
                    <td class="text-end"></td>
                    <td class="text-center"></td>
                    <td class="text-end"></td>
                  </tr>
                  <tr>
                    <td class="fw-bold" style="font-family: 'GmarketSansMedium';">입지</td>
                    <td>섬 / 강</td>
                    <td class="text-end"></td>
                    <td class="text-center"></td>
                    <td class="text-end"></td>
                  </tr>
                  <tr>
                    <td class="fw-bold" style="font-family: 'GmarketSansMedium';">바닥형태</td>
                    <td>테크 / 맨흙</td>
                    <td class="text-end"></td>
                    <td class="text-center"></td>
                    <td class="text-end"></td>
                  </tr>
                  <tr>
                    <td class="fw-bold" style="font-family: 'GmarketSansMedium';">캠핑장비 대여</td>
                    <td>화로대</td>
                    <td class="text-end"></td>
                    <td class="text-center"></td>
                    <td class="text-end"></td>
                  </tr>
                  <tr>
                    <td class="fw-bold" style="font-family: 'GmarketSansMedium';">기타정보</td>
                    <td>개인 트레일러 입장가능 / 반려동물 동반 불가능</td>
                    <td class="text-end"></td>
                    <td class="text-center"></td>
                    <td class="text-end"></td>
                  </tr>
               </tbody>
               </table>
              </div>
           </div>
                   
           <!-- 갤러리 -->  
           <div class="text-block">
	         <h4 class="mb-4" style="font-family: 'GmarketSansMedium';">갤러리</h4>
	         <div class="row gallery mb-3 ms-n1 me-n1">
	            <div class="col-lg-4 col-6 px-1 mb-2"><a href="./resources/bootstrap-5/html/img/photo/자라1.jpg" data-fancybox="gallery" title="Our street"><img class="img-fluid" src="./resources/bootstrap-5/html/img/photo/자라1.jpg" alt="..."></a></div>
	            <div class="col-lg-4 col-6 px-1 mb-2"><a href="./resources/bootstrap-5/html/img/photo/자라2.jpg" data-fancybox="gallery" title="Outside"><img class="img-fluid" src="./resources/bootstrap-5/html/img/photo/자라2.jpg" alt="..."></a></div>
	            <div class="col-lg-4 col-6 px-1 mb-2"><a href="./resources/bootstrap-5/html/img/photo/자라3.jpg" data-fancybox="gallery" title="Rear entrance"><img class="img-fluid" src="./resources/bootstrap-5/html/img/photo/자라3.jpg" alt="..."></a></div>
	            <div class="col-lg-4 col-6 px-1 mb-2"><a href="./resources/bootstrap-5/html/img/photo/자라4.jpg" data-fancybox="gallery" title="Kitchen"><img class="img-fluid" src="./resources/bootstrap-5/html/img/photo/자라4.jpg" alt="..."></a></div>
	            <div class="col-lg-4 col-6 px-1 mb-2"><a href="./resources/bootstrap-5/html/img/photo/자라5.jpg" data-fancybox="gallery" title="Bedroom"><img class="img-fluid" src="./resources/bootstrap-5/html/img/photo/자라5.jpg" alt="..."></a></div>
	            <div class="col-lg-4 col-6 px-1 mb-2"><a href="./resources/bootstrap-5/html/img/photo/자라6.jpg" data-fancybox="gallery" title="Bedroom"><img class="img-fluid" src="./resources/bootstrap-5/html/img/photo/자라6.jpg" alt="..."></a></div>
	         </div>
           </div>
          
           <!-- 리뷰 댓글보기 -->
           <div class="text-block">
	         <h4 class="mb-4" style="font-family: 'GmarketSansMedium';">평점리뷰</h4>
	         <div class="d-flex d-block d-sm-flex review">
              <!--
              <div class="text-md-center flex-shrink-0 me-4 me-xl-5"><img class="d-block avatar avatar-xl p-2 mb-2" src="img/avatar/avatar-8.jpg" alt="PadmÃ© Amidala"><span class="text-uppercase text-muted text-sm">Dec 2018</span></div>
              -->
              <div>
                <h6 class="mt-2 mb-1">rina</h6>
                <div class="mb-2"><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-primary"></i>
                </div>
                <p class="text-muted text-sm">잘 다녀갑니다. 재방문 의사 있어요.     </p>
              </div>
	         </div>
	         <div class="d-flex d-block d-sm-flex review">
              <!--
              <div class="text-md-center flex-shrink-0 me-4 me-xl-5"><img class="d-block avatar avatar-xl p-2 mb-2" src="img/avatar/avatar-2.jpg" alt="Luke Skywalker"><span class="text-uppercase text-muted text-sm">Dec 2018</span></div>
              -->
	          <div>
                <h6 class="mt-2 mb-1">byeongchan</h6>
                <div class="mb-2"><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-gray-200"></i>
                </div>
                <p class="text-muted text-sm">시설이 편리하게 되어있어 좋았습니다.     </p>
              </div>
            </div>
            <div class="d-flex d-block d-sm-flex review">
              <!--
              <div class="text-md-center flex-shrink-0 me-4 me-xl-5"><img class="d-block avatar avatar-xl p-2 mb-2" src="img/avatar/avatar-3.jpg" alt="Princess Leia"><span class="text-uppercase text-muted text-sm">Dec 2018</span></div>
              -->
              <div>
                <h6 class="mt-2 mb-1">soyeon</h6>
                <div class="mb-2"><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-gray-200"></i><i class="fa fa-xs fa-star text-gray-200"></i>
                </div>
                <p class="text-muted text-sm">깔끔하고 좋아요.     </p>
              </div>
            </div>
            <div class="d-flex d-block d-sm-flex review">
              <!--
              <div class="text-md-center flex-shrink-0 me-4 me-xl-5"><img class="d-block avatar avatar-xl p-2 mb-2" src="img/avatar/avatar-4.jpg" alt="Jabba Hut"><span class="text-uppercase text-muted text-sm">Dec 2018</span></div>
              -->
              <div>
                <h6 class="mt-2 mb-1">jeehyeon</h6>
                <div class="mb-2"><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-primary"></i>
                </div>
                <p class="text-muted text-sm">힐링하고 갑니다! 자라섬 캠핑장 추천해요!    </p>
              </div>
	         </div>
	         
	         <!-- 리뷰 등록 -->
	         <div class="py-5">
              <button class="btn btn-outline-primary" type="button" data-bs-toggle="collapse" data-bs-target="#leaveReview" aria-expanded="false" aria-controls="leaveReview">리뷰남기기</button>
              <div class="collapse mt-4" id="leaveReview">
                <!--<h5 class="mb-4">Leave a review</h5>-->
                <form class="form" id="contact-form" method="get" action="#">
                  <div class="row">
                    <div class="col-sm-6">
                      <div class="mb-4">
                        <label class="form-label" for="rating">평점 *</label>
                        <select class="form-select focus-shadow-0" name="rating" id="rating">
                          <option value="5">&#9733;&#9733;&#9733;&#9733;&#9733; (5/5)</option>
                          <option value="4">&#9733;&#9733;&#9733;&#9733;&#9734; (4/5)</option>
                          <option value="3">&#9733;&#9733;&#9733;&#9734;&#9734; (3/5)</option>
                          <option value="2">&#9733;&#9733;&#9734;&#9734;&#9734; (2/5)</option>
                          <option value="1">&#9733;&#9734;&#9734;&#9734;&#9734; (1/5)</option>
                        </select>
                      </div>
                    </div>
                  </div>
                  <div class="mb-4">
                    <label class="form-label" for="review">리뷰내용 *</label>
                    <textarea class="form-control" rows="4" name="review" id="review" placeholder="리뷰를 남겨주세요." required="required"></textarea>
                  </div>
                  <button class="btn btn-primary" type="submit">리뷰 등록</button>
                </form>
              </div>
	         </div>
          </div>
        </div>
        <div class="col-lg-4">        
          <div class="p-4 shadow ms-lg-4 rounded sticky-top" style="top: 100px; width: 400px; height: 500px;"><img class="bg-image" style="border-radius: 8px;" src="<%=kto.getFirstImageUrl() %>" alt="Card image">
          </div>
        </div>
      </div>
    </div>
    
    
    <!-- Footer-->
    <footer class="position-relative z-index-10 d-print-none">
      <!-- Copyright section of the footer-->
      <div class="py-4 fw-light bg-gray-800 text-gray-300">
        <div class="container">
          <div class="row align-items-center">
            <div class="col-md-6 text-center text-md-start">
              <p class="text-sm mb-md-0">&copy; 2022, Your company.  All rights reserved.</p>
            </div>
            <div class="col-md-6">
              <ul class="list-inline mb-0 mt-2 mt-md-0 text-center text-md-end">
                <li class="list-inline-item"><img class="w-2rem" src="./resources/bootstrap-5/html/img/visa.svg" alt="..."></li>
                <li class="list-inline-item"><img class="w-2rem" src="./resources/bootstrap-5/html/img/mastercard.svg" alt="..."></li>
                <li class="list-inline-item"><img class="w-2rem" src="./resources/bootstrap-5/html/img/paypal.svg" alt="..."></li>
                <li class="list-inline-item"><img class="w-2rem" src="./resources/bootstrap-5/html/img/western-union.svg" alt="..."></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </footer>
    <!-- JavaScript files-->
    <script>
      // ------------------------------------------------------- //
      //   Inject SVG Sprite - 
      //   see more here 
      //   https://css-tricks.com/ajaxing-svg-sprite/
      // ------------------------------------------------------ //
      function injectSvgSprite(path) {
      
          var ajax = new XMLHttpRequest();
          ajax.open("GET", path, true);
          ajax.send();
          ajax.onload = function(e) {
          var div = document.createElement("div");
          div.className = 'd-none';
          div.innerHTML = ajax.responseText;
          document.body.insertBefore(div, document.body.childNodes[0]);
          }
      }    
      // to avoid CORS issues when viewing using file:// protocol, using the demo URL for the SVG sprite
      // use your own URL in production, please :)
      // https://demo.bootstrapious.com/directory/1-0/icons/orion-svg-sprite.svg
      //- injectSvgSprite('${path}icons/orion-svg-sprite.svg'); 
      injectSvgSprite('https://demo.bootstrapious.com/directory/1-4/icons/orion-svg-sprite.svg'); 
      
    </script>
    <!-- jQuery-->
    <script src="./resources/bootstrap-5/html/vendor/jquery/jquery.min.js"></script>
    <!-- Bootstrap JS bundle - Bootstrap + PopperJS-->
    <script src="./resources/bootstrap-5/html/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Magnific Popup - Lightbox for the gallery-->
    <script src="./resources/bootstrap-5/html/vendor/magnific-popup/jquery.magnific-popup.min.js"></script>
    <!-- Smooth scroll-->
    <script src="./resources/bootstrap-5/html/vendor/smooth-scroll/smooth-scroll.polyfills.min.js"></script>
    <!-- Bootstrap Select-->
    <script src="./resources/bootstrap-5/html/vendor/bootstrap-select/js/bootstrap-select.min.js"></script>
    <!-- Object Fit Images - Fallback for browsers that don't support object-fit-->
    <script src="./resources/bootstrap-5/html/vendor/object-fit-images/ofi.min.js"></script>
    <!-- Swiper Carousel                       -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/js/swiper.min.js"></script>
    <script>var basePath = ''</script>
    <!-- Main Theme JS file    -->
    <script src="./resources/bootstrap-5/html/js/theme.js"></script>
    <!-- Map-->
    <script src="https://unpkg.com/leaflet@1.5.1/dist/leaflet.js" integrity="sha512-GffPMF3RvMeYyc1LWMHtK8EbPv0iNZ8/oTtHPx9/cc2ILxQ+u905qIwdpULaqDkyBKgOaB57QTMg7ztg8Jm2Og==" crossorigin=""></script>
    <!-- Available tile layers-->
    <script src="./resources/bootstrap-5/html/js/map-layers.js"> </script>
    <script src="./resources/bootstrap-5/html/js/map-detail.js"></script>
    <script>
      createDetailMap({
          mapId: 'detailMap',
          mapZoom: 14,
          mapCenter: [40.732346, -74.0014247],
          circleShow: true,
          circlePosition: [40.732346, -74.0014247]
      })
      
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"> </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-date-range-picker/0.19.0/jquery.daterangepicker.min.js"> </script>
    <script src="js/datepicker-detail.js">   </script>
  </body>
</html>