<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="ch.qos.logback.core.recovery.ResilientSyslogOutputStream"%>
<%@ page import="com.exam.hboard.HBoardTO" %>
<%@ page import="com.exam.nboard.NBoardTO" %>
<%@ page import="com.exam.nboard.NFileTO" %>
<%@ page import="com.exam.mboard.BoardTO" %>
<%@ page import="com.exam.mboard.FileTO" %>
<%@page import="java.util.ArrayList"%>
<%
	//session 값 가져오기
	int ucode = -1;
	String id ="";
	if(session.getAttribute("id") != null){
		ucode = (int)session.getAttribute("ucode");
		id = (String)session.getAttribute("id");
	}
	
	int cpage = (Integer)request.getAttribute("cpage");
	
	String subjectValue = (String)request.getAttribute( "subjectValue" );
	String seq = "";
	String subject = "";
	String writer = "";
	String title = "";
	String content = "";
	String wdate = "";
	String hit = "";	
	String filename = "";
	
	long filesize = 0;	
	StringBuilder fileHtml = new StringBuilder();
	
	if( subjectValue.equals("4")  ) {
		HBoardTO hto = (HBoardTO)request.getAttribute("hto");
		
		seq = hto.getSeq();
		subject = hto.getSubject();
		writer = hto.getWriter();
		title = hto.getTitle();
		content = hto.getContent();
		wdate = hto.getWdate();
		hit = hto.getHit();	
		filename = hto.getFilename();
		filesize = hto.getFilesize();

		fileHtml.append("<input type=\"hidden\" name=\"filename\" value=\"" + filename + "\"/>");
		fileHtml.append("<input type=\"hidden\" name=\"filesize\" value=\"" + filesize + "\"/>");

		
	} else if( subjectValue.equals("5")  ) {
		NBoardTO nto = (NBoardTO)request.getAttribute("nto");
		NFileTO nfto = (NFileTO)request.getAttribute("nfto");
		
		seq = nto.getSeq();
		subject = nto.getSubject();
		writer = nto.getWriter();
		title = nto.getTitle();
		content = nto.getContent();
		wdate = nto.getWdate();
		hit = nto.getHit();	
		filename = nfto.getFilename();
		filesize = nfto.getFilesize();
		
		ArrayList<NFileTO> fileArr = (ArrayList<NFileTO>) request.getAttribute("fileArr");
		for (NFileTO fto : fileArr) {
			filename = fto.getFilename();
			filesize = fto.getFilesize();
			fileHtml.append("<input type=\"hidden\" name=\"filename\" value=\"" + filename + "\"/>");
			fileHtml.append("<input type=\"hidden\" name=\"filesize\" value=\"" + filesize + "\"/>");
		}
		
	}
%>

<!DOCTYPE html>
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="apple-touch-icon" sizes="76x76" href="./resources/bootstrap-5/html/admin/img/apple-icon.png">
  <link rel="icon" type="image/png" href="./resources/bootstrap-5/html/img/logo2.svg">
  <title>I Camp Do It Administrator</title>  
  <!--     Fonts and icons     -->
  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,900|Roboto+Slab:400,700" />
  <!-- Nucleo Icons -->
  <link href="./resources/bootstrap-5/html/admin/css/nucleo-icons.css" rel="stylesheet" />
  <link href="./resources/bootstrap-5/html/admin/css/nucleo-svg.css" rel="stylesheet" />
  <!-- Font Awesome Icons -->
  <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
  <!-- Material Icons -->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Round" rel="stylesheet">
  <!-- CSS Files -->
  <link id="pagestyle" href="./resources/bootstrap-5/html/admin/css/material-dashboard.css?v=3.0.4" rel="stylesheet" /> 
  <link rel="stylesheet" href="./resources/bootstrap-5/html/summernote/summernote-lite.css" />
  <!-- Sweet Alert -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script> 
</head>

<body class="g-sidenav-show  bg-gray-200">
	<aside class="sidenav navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-3 bg-gradient-dark" id="sidenav-main">
		<div class="sidenav-header" style="text-align: center">
			<i class="fas fa-times p-3 cursor-pointer text-white opacity-5 position-absolute end-0 top-0 d-none d-xl-none" aria-hidden="true" id="iconSidenav"></i> 
			<a class="navbar-brand m-0" href="./admin.do" target="_blank"> 
			  <span class="ms-1 font-weight-bold text-white">I CAMP DO IT<br />administer </span>
			</a>
		</div>
		<hr class="horizontal light mt-0 mb-2">
		 <div class="collapse navbar-collapse  w-auto" id="sidenav-collapse-main">
		  <ul class="navbar-nav">		  
	    	<li class="nav-item">
 				<a class="nav-link text-white " href="./admin.do">   
     				<div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
      				 <i class="material-icons opacity-10">dashboard</i>
     				</div>   
				<span class="nav-link-text ms-1">관리자 홈</span>
			  </a>
			</li>						
			<li class="nav-item">
			  <a class="nav-link text-white " href="./admin_users.do">			    
			      <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
			        <i class="material-icons opacity-10">person</i>
			      </div>			    
			    <span class="nav-link-text ms-1">회원 관리</span>
			  </a>
			</li>			  
			<li class="nav-item">
			  <a class="nav-link text-white " href="./admin_board.do">			    
			      <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
			        <i class="material-icons opacity-10">table_view</i>
			      </div>			    
			    <span class="nav-link-text ms-1">게시판 관리</span>
			  </a>
			</li>
			<li class="nav-item">
			  <a class="nav-link text-white " href="./home.do">			    
			      <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
			        <i class="material-icons opacity-10">assignment</i>
			      </div>			    
			    <span class="nav-link-text ms-1">사용자 페이지</span>
			  </a>
			</li>			  			
			<li class="nav-item">
			  <a class="nav-link text-white " href="./logout.do">			    
			      <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
			        <i class="material-icons opacity-10">logout</i>
			      </div>			    
			    <span class="nav-link-text ms-1">Log out</span>
			  </a>
			</li>    
		  </ul>
		 </div>		
	</aside>
	
  <!-- Write Section-->
	<div class="main-content px-5">		
		  <form method="post" id="afrm" name="afrm">
		  <input type="hidden" name="modifyOk" id="modifyOk" value="default"/>
		  <div id="filebody">
			<%=fileHtml.toString()%>
		  </div>
		  <div id="newfilebody">
			
		  </div>
		  <input type="hidden" name="newFilesize" id="newFilesize" value="0000" />
		  <input type="hidden" name="vcode" id="vcode" value="default"/>
	
			<div class="card my-2 px-5 justify-content-center">
				<div class="card-header p-0 position-relative mt-4 mx-2 z-index-2">
					<div class="bg-gradient-secondary shadow-primary border-radius-lg pt-4 pb-3 px-5">
					   <h6 class="text-white text-capitalize ps-3">글 수정</h6>
					</div>
				</div>
				<div class="card-body px-0 pb-2">
					<div class="table-responsive px-5">
						<div class="input-group input-group-outline pb-3 ">
							<input class="form-control" value="<%=title %>" id="title" name="title" type="title" placeholder="제목을 입력해주세요." />
						</div>
						<textarea id="summernote" name="content"><%=content %></textarea>
					</div>
				</div>
				 <input type="hidden" id="subject" name="subject" value="<%=subject%>" />   
                 <input type="hidden" id="seq" name="seq" value="<%=seq%>" />   
                 <input type="hidden" id="cpage" name="cpage" value="<%=cpage%>"/>  
                 <input type="hidden" id="filename" name="filename" value="<%=filename%>"/>  
                 <input type="hidden" id="filesize" name="filesize" value="<%=filesize%>"/>  
				<div class="row">
				  <div class="col-lg-8">
			        <input type="button" value="목록" class="btn btn-success" style="cursor: pointer;" onclick="location.href='admin_board.do?subjectValue=<%=subjectValue%>&cpage=<%=cpage %>'" />
			      </div>
			      <div class="col-lg-4 text-lg-end">
			        <input type="button" value="수정" id="mbtn" class="btn btn-success" style="cursor: pointer;"/> 
			        <input type="button" value="취소" id="cbtn" class="btn btn-success" style="cursor: pointer;" onclick="location.href='/admin_board.do?subjectValue=<%=subjectValue%>&cpage=<%=cpage %>'" />
			      </div>
				</div>
			</div>
		  </form>
		</div>
  <!--   Core JS Files   -->
	<script src="./resources/bootstrap-5/html/admin/js/core/popper.min.js"></script>
	<script src="./resources/bootstrap-5/html/admin/js/core/bootstrap.min.js"></script>
	<script src="./resources/bootstrap-5/html/admin/js/plugins/perfect-scrollbar.min.js"></script>
	<script src="./resources/bootstrap-5/html/admin/js/plugins/smooth-scrollbar.min.js"></script>
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
	<script> var basePath = '' </script>
	<!-- Main Theme JS file    -->
	<script src="./resources/bootstrap-5/html/js/theme.js"></script>
	<!-- jquery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<!-- summernote -->
	<script src="./resources/bootstrap-5/html/summernote/summernote-lite.js"></script>
	<script src="./resources/bootstrap-5/html/summernote/lang/summernote-ko-KR.js"></script>

	<script>    
	
	const Toast = Swal.mixin({
	    toast: true,
	    position: 'center-center',
	    showConfirmButton: false,
	    timer: 3000,
	    timerProgressBar: false,
	    didOpen: (toast) => {
	        toast.addEventListener('mouseenter', Swal.stopTimer)
	        toast.addEventListener('mouseleave', Swal.resumeTimer)
	    }
	})
	
 	document.getElementById( 'cbtn' ).onclick = function() { 		
 		var subject = $('#subject').val();
 		var filename = $('#newfilename').val();
 		var cpage = $( '#cpage').val();
 		var subjectValue = $('#subject').val();
 		
	    var data = {'filename' : filename, 'subject' : subject, 'cpage' : cpage, 'subjectValue' : subjectValue };	    	
	    var formdata = $("#afrm").serialize();
		$.ajax({
			data : formdata,
			type : "post",
			url : '/awritecancel.do',
			success : function() {
				location.href='/admin_board.do?subjectValue='+subjectValue+'&cpage='+cpage;
			},
			error: function() {
				Toast.fire({
 				    icon: 'warning',
 				    title: '수정 취소 오류'
 				})
	        }
		});
	}
	 
       document.getElementById( 'mbtn' ).onclick = function() {	
    	 var formdata = $("#afrm").serialize();
    	 var subjectValue = $('#subject').val();
    	 var cpage = $( '#cpage').val();
    	 var seq = $('#seq').val();
    	 var filename = $('input[name=filename]').val();
    	 
	     if(($('#title').val() != '')&&($('#summernote').val() != '')){	        
					
			$.ajax({
				data : formdata,				
				type : "POST",
				url : './admin_board_modify_ok.do',
				dataType : 'text',
				success : function(flag) {	
					
					if( flag == 0 ) {
						Swal.fire({
							title: '게시글 수정 성공',     
							text:	' ', 
							icon:	'success',
							confirmButtonColor: '#1cb36e', // confrim 버튼 색깔 지정
							confirmButtonText: '확인', // confirm 버튼 텍스트 지정
						}).then((result) => {
							if (result.isConfirmed) {
								location.href='/admin_board.do?subjectValue='+subjectValue+'&cpage='+cpage+'&seq='+ seq;
				  			 } 
				  		 })
					} else {
						Swal.fire({
							title: '게시글 수정 실패',     
							text:	' ', 
							icon:	'warning',
							confirmButtonColor: '#1cb36e',
							confirmButtonText: '확인',
						})
						history.back();
					}
					
				},
				error: function(request, status, error) {
					alert("status : " + request.status + ", message : " + request.responseText + ", error : " + error);
		        }
			});
	     } else {
	    	 	Toast.fire({
				    icon: 'warning',
				    title: '게시글 수정 오류'
				})
		        $('#title').focus();
		 } 
	   }
	
	$(document).ready(function() {
		let date = new Date().getTime().toString(36);
		$('#vcode').val(date);

		var fontList = ['맑은 고딕','굴림','돋움','바탕','궁서','NotoSansKR','Arial','Courier New','Verdana','Tahoma'];
		$('#summernote').summernote({
			placeholder : '내용을 입력해주세요. (이미지는 1장만 업로드 가능합니다.)',
			minHeight : null,
			maxHeight : null,
			tabsize : 2,
			height : 550,
			width : 1100,
			lang : 'ko-KR',
			fontNames: fontList,
			maximumImageFileSize: 10485760,
            fontNamesIgnoreCheck: fontList,
			toolbar: [
                ['style', ['style']],
                ['font', ['fontname','fontsize']],
                ['fontstyle', ['bold','italic','underline','strikethrough','forecolor','backcolor','color','clear']],
                ['paragraph', ['paragraph','height','ul','ol']],
                ['insert', ['table','hr','link','picture']],
                ['view', ['codeview', 'help']]
            ],
            
		    callbacks: { //이미지를 첨부하는 부분
				onImageUpload : function(files, editor, welEditable) {					
					for (var i = 0; i < files.length; i++) {
						sendFile(files[i], editor, welEditable);
					}
					
				}
			} 
        });
	});

	// 이미지 파일 업로드
	function sendFile(file, editor, welEditable) {
		var imgUrl = '';
		var hImgUrl = './h_upload/';
		var nImgUrl = './n_upload/';
		var data = new FormData();
		data.append('image', file);
		data.append('subject', $('#subject').val());
		$.ajax({
			data : data,
			type : "POST",
			url : '/amodify_image.do',
			cache : false,
			contentType : false,
			enctype : 'multipart/form-data',
			processData : false,
			success : function(result) {
				
				let str= result.split('@');
				var subject = $('#subject').val();
				
				if( $('#subject').val() == 4 ) {
					imgUrl = hImgUrl + str[0];
				} else if( $('#subject').val() == 5 ) {
					imgUrl = nImgUrl + str[0];
				}							
				
				$('#summernote').summernote( 'insertImage', imgUrl );
				
				if(str[0] != null){
            		
					$('#newfilebody').append("<input type=\"hidden\" name=\"newfilename\" value=\""+str[0]+"\"/>");
            		$('#newfilebody').append("<input type=\"hidden\" name=\"newfilesize\" value=\""+str[1]+"\"/>"); 
	                
            	}else{
            		Toast.fire({
     				    icon: 'warning',
     				    title: '이미지 파일 업로드 오류'
     				})
            	};
			},
			error: function() {
				Toast.fire({
 				    icon: 'warning',
 				    title: '이미지 사이즈는 128MB 미만이어야 합니다.'
 				})
	        }
		});
	}
	    
  </script>
    
  <!-- Github buttons -->
  <script async defer src="https://buttons.github.io/buttons.js"></script>
  <!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="./resources/bootstrap-5/html/admin/js/material-dashboard.min.js?v=3.0.4"></script>
</body>

</html>