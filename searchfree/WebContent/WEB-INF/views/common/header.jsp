<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport"
		content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
      <!-- link that opens popup -->
      <script src=" https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"> </script>
      <!-- JS here -->
      
      <script src="http://localhost:8080/searchfree/js/vendor/modernizr-3.5.0.min.js"></script>
      
    
      <script src="http://localhost:8080/searchfree/js/vendor/jquery-1.12.4.min.js"></script>
      <script src="http://localhost:8080/searchfree/js/popper.min.js"></script>
      <script src="http://localhost:8080/searchfree/js/bootstrap.min.js"></script>
      <script src="http://localhost:8080/searchfree/js/owl.carousel.min.js"></script>
      <script src="http://localhost:8080/searchfree/js/isotope.pkgd.min.js"></script>
      <script src="http://localhost:8080/searchfree/js/ajax-form.js"></script>
      <script src="http://localhost:8080/searchfree/js/waypoints.min.js"></script>
      <script src="http://localhost:8080/searchfree/js/jquery.counterup.min.js"></script>
      <script src="http://localhost:8080/searchfree/js/imagesloaded.pkgd.min.js"></script>
      <script src="http://localhost:8080/searchfree/js/scrollIt.js"></script>
      <script src="http://localhost:8080/searchfree/js/jquery.scrollUp.min.js"></script>
      <script src="http://localhost:8080/searchfree/js/wow.min.js"></script>
      <script src="http://localhost:8080/searchfree/js/nice-select.min.js"></script>
      <script src="http://localhost:8080/searchfree/js/jquery.slicknav.min.js"></script>
      <script src="http://localhost:8080/searchfree/js/jquery.magnific-popup.min.js"></script>
      <script src="http://localhost:8080/searchfree/js/plugins.js"></script>
      <!-- <script src="http://localhost:8080/searchfree/js/gijgo.min.js"></script> -->
      <script src="http://localhost:8080/searchfree/js/slick.min.js"></script>
  
  
  
      <!--contact js-->
      <script src="http://localhost:8080/searchfree/js/contact.js"></script>
      <script src="http://localhost:8080/searchfree/js/jquery.ajaxchimp.min.js"></script>
      <script src="http://localhost:8080/searchfree/js/jquery.form.js"></script>
      <script src="http://localhost:8080/searchfree/js/jquery.validate.min.js"></script>
      <script src="http://localhost:8080/searchfree/js/mail-script.js"></script>
  
  
      <script src="http://localhost:8080/searchfree/js/main.js"></script>


	

    <!-- <link rel="manifest" href="site.webmanifest"> -->
    <link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">
    <!-- Place favicon.ico in the root directory -->

    <!-- CSS here -->
    
    <link rel="stylesheet" href="http://localhost:8080/searchfree/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://localhost:8080/searchfree/css/owl.carousel.min.css">
    <link rel="stylesheet" href="http://localhost:8080/searchfree/css/magnific-popup.css">
    <link rel="stylesheet" href="http://localhost:8080/searchfree/css/font-awesome.min.css">
    <link rel="stylesheet" href="http://localhost:8080/searchfree/css/themify-icons.css">
    <link rel="stylesheet" href="http://localhost:8080/searchfree/css/nice-select.css">
    <link rel="stylesheet" href="http://localhost:8080/searchfree/css/flaticon.css">
    <link rel="stylesheet" href="http://localhost:8080/searchfree/css/gijgo.css">
    <link rel="stylesheet" href="http://localhost:8080/searchfree/css/animate.css">
    <link rel="stylesheet" href="http://localhost:8080/searchfree/css/slick.css">
    <link rel="stylesheet" href="http://localhost:8080/searchfree/css/slicknav.css">
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css">

    <link rel="stylesheet" href="dhttp://localhost:8080/searchfree/css/style.css">
    <!-- <link rel="stylesheet" href="http://localhost:8080/searchfree/css/responsive.css"> -->


</head>
<body>
	
    <!-- header-start -->
    <header>
    	<%=application.getContextPath() %>
        <div class="header-area">
            <div id="sticky-header" class="main-header-area " style="padding: 10px;">
                <div class="container-fluid ">
                    <div class="header_bottom_border">
                        <div class="row align-items-center">
                            <div class="col-xl-3 col-lg-2">
                                <div class="logo">
                                    <a href="#">
                                        <img src="img/logo.png" alt="" >
                                    </a>
                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-7">
                                <div class="main-menu  d-none d-lg-block">
                                    <nav>
                                        <ul id="navigation">
                                            <li><a href="index.html">home</a></li>
                                            <li><a href="Listings.html">Listings</a></li>
                                            <li><a href="#">pages <i class="ti-angle-down"></i></a>
                                                <ul class="submenu">
                                                    
                                                    <li><a href="elements.html">elements</a></li>
                                                    <li><a href="single_listings.html">Single listing</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="about.html">about</a></li>
                                            <li><a href="#">blog <i class="ti-angle-down"></i></a>
                                                <ul class="submenu">
                                                    <li><a href="blog.html">blog</a></li>
                                                    <li><a href="single-blog.html">single-blog</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="">공지사항</a></li>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                            <div class="col-xl-3 col-lg-3 d-none d-lg-block">
                                <div class="Appointment">
                                    <div class="book_btn d-none d-lg-block" >
                                        <a id="modal-1207" href="#modal-container-1207" role="button"
                                            class="danger radius btn-hei-line" data-toggle="modal">로그인</a>
                                        <div class="modal fade" id="modal-container-1207" role="dialog"
                                            aria-labelledby="myModalLabel" aria-hidden="true">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="myModalLabel">Login</h5>
                                                        <button type="button" class="close" data-dismiss="modal">
                                                            <span aria-hidden="true">×</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <form class="form-signin" method="POST" action="<%= request.getContextPath()%>/member/login.do"
                                                        onsubmit="return loginValidate();">
                                                        <!-- form태그 내부에서 submit 이벤트가 발생했을 때 loginValidate() 실행, 
                                                                  결과가 false가 나오면 return false가 되므로 갱신이벤트가 사라짐(페이지가 안 넘어감)-->
                                                            <input type="text" class="form-control" id="memberId" name="memberId"
                                                                placeholder="ID" value=""> <br> 
                                                            <input type="password" class="form-control" id="memberPwd" name="memberPwd"
                                                                placeholder="password"> 
                                                                <br>
                                                                <div class="col-lg-3 col-md-4 mt-sm-30">
                                                                <div class="switch-wrap d-flex justify-content-between">
                                                                    <div class="primary-checkbox">
                                                                        <input type="checkbox" id="default-checkbox">
                                                                        <label for="default-checkbox"></label>
                                                                    </div>
                                                                    <h4>save id</h4>
                                                                </div></div>
                                                                <br><br>
                                                            <!-- <button class="book_btn d-none d-lg-block" type="submit">Login</button> -->
                                                            <a class="book_btn d-none d-lg-block text-center"  href="login_suc.html">Login</a> 
                                                            <div class="padding-login"></div>
                                                            <a class="book_btn d-none d-lg-block text-center" href="<%=request.getContextPath() %>/member/signUpForm.do">Join us</a> 
                                                            <div class="padding-login"></div>
                                                            <a class="book_btn d-none d-lg-block text-center"  href="#">find ID / password</a>
                                                            <br>
                                                        </form>
                                                    </divc>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary"
                                                            data-dismiss="modal">Close</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="mobile_menu d-block d-lg-none"></div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </header>
    <!-- header-end -->


</body>
</html>