<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>SearchFree</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- <link rel="manifest" href="site.webmanifest"> -->
    <link rel="shortcut icon" type="http://localhost:8080/SemiProject/image/x-icon" href="img/favicon.png">
    <!-- Place favicon.ico in the root directory -->

    <!-- CSS here -->
    <link rel="stylesheet" href="http://localhost:8080/SemiProject/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://localhost:8080/SemiProject/css/owl.carousel.min.css">
    <link rel="stylesheet" href="http://localhost:8080/SemiProject/css/magnific-popup.css">
    <link rel="stylesheet" href="http://localhost:8080/SemiProject/css/font-awesome.min.css">
    <link rel="stylesheet" href="http://localhost:8080/SemiProject/css/themify-icons.css">
    <link rel="stylesheet" href="http://localhost:8080/SemiProject/css/nice-select.css">
    <link rel="stylesheet" href="http://localhost:8080/SemiProject/css/flaticon.css">
    <link rel="stylesheet" href="http://localhost:8080/SemiProject/css/gijgo.css">
    <link rel="stylesheet" href="http://localhost:8080/SemiProject/css/animate.css">
    <link rel="stylesheet" href="http://localhost:8080/SemiProject/css/slick.css">
    <link rel="stylesheet" href="http://localhost:8080/SemiProject/css/slicknav.css">
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css">

    <link rel="stylesheet" href="http://localhost:8080/SemiProject/css/style.css">
    <!-- <link rel="stylesheet" href="css/responsive.css"> -->
</head>

<body>
    <!--[if lte IE 9]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
        <![endif]-->

    <!-- header-start -->
    <header>
        <div class="header-area">
            <div id="sticky-header" class="main-header-area">
                <div class="container-fluid ">
                    <div class="header_bottom_border">
                        <div class="row align-items-center">
                            <div class="col-xl-3 col-lg-2">
                                <div class="logo display-non ">
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
                                            <li><a href="contact.html">Contact</a></li>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                            <div class="col-xl-3 col-lg-3 d-none d-lg-block">
                                <div class="Appointment">
                                    <div class="book_btn d-none d-lg-block" >
                                        <a id="modal-1207" href="#modal-container-1207" role="button"
                                            class="genric-btn danger radius" data-toggle="modal">로그인</a>
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
                                                            <a class="book_btn d-none d-lg-block text-center" href="signUpForm.html">Join us</a> 
                                                            <div class="padding-login"></div>
                                                            <a class="book_btn d-none d-lg-block text-center"  href="<%=request.getContextPath() %>/member/signUpForm.do">find ID / password</a>
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


    <!-- slider_area_start -->
    <div class="slider_area ">
        <div class="single_slider  d-flex align-items-center slider_bg_1">
            <div class="container">
                <div class="row align-items-center justify-content-center">
                    <div class="col-xl-10">
                        <div class="slider_text text-center justify-content-center">
                            <p></p>
                            <h3>Search Free</h3>
                            <div class="explorer_europe">
                                <div class="container back-ground-white">
                                    <div class="explorer_wrap ">
                                        <div class="row align-items-center">
                                            <div class="col-xl-6 col-md-4">
                                                <h3></h3>
                                            </div>
                                            <div class="col-xl-6 col-md-8">
                                                <div class="explorer_tab">
                                                    <nav>
                                                        <div class="nav" id="nav-tab" role="tablist">
                                                            <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab"
                                                                href="#nav-home" role="tab" aria-controls="nav-home"
                                                                aria-selected="true">Freelancer</a>
                                                            <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab"
                                                                href="#nav-profile" role="tab" aria-controls="nav-profile"
                                                                aria-selected="false">Client</a>
                                                        </div>
                                                    </nav>
                        
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-content" id="nav-tabContent">
                                        <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <button type="button" class="btn btn-success btn-block"  id="header-tab-btn">
                                                        Freelancer 찾기
                                                    </button>
                                                </div>
                                                <div class="col-md-6">
                                                    <button type="button" class="btn btn-success btn-block" id="header-tab-btn">
                                                        Freelancer 쓰기
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
                                            <div class="row">
                                                <div class="col-md-6">
                                                     
                                                    <button type="button" class="btn btn-success btn-block"  id="header-tab-btn">
                                                        Client 찾기
                                                    </button>
                                                </div>
                                                <div class="col-md-6">
                                                     
                                                    <button type="button" class="btn btn-success btn-block"  id="header-tab-btn">
                                                        Client 쓰기
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- slider_area_end -->



    <!-- <div class="header-padding">
        <img src="img/case/1.png">
    </div> -->
    
    

    
    

    <div class="popular_catagory_area">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="section_title mb-60 text-center">
                        <p></p>
                        <h3>
                            Categories
                        </h3>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xl-3 col-md-4 col-lg-3">
                    <div class="single_catagory">
                        <div class="thumb">
                            <img src="img/catagory/1.png" alt="">
                        </div>
                        <div class="hover_overlay">
                            <div class="hover_inner">
                                <a href="Listings.html"><h4>Amazing Places</h4></a>
                                <span>05 Listings</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-md-4 col-lg-3">
                    <div class="single_catagory">
                        <div class="thumb">
                            <img src="img/catagory/2.png" alt="">
                        </div>
                        <div class="hover_overlay">
                            <div class="hover_inner">
                                <a href="Listings.html"><h4>Concerts</h4></a>
                                <span>05 Listings</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-md-4 col-lg-3">
                    <div class="single_catagory">
                        <div class="thumb">
                            <img src="img/catagory/3.png" alt="">
                        </div>
                        <div class="hover_overlay">
                            <div class="hover_inner">
                                    <a href="Listings.html"><h4>Travel guide</h4></a>
                                <span>05 Listings</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-md-4 col-lg-3">
                    <div class="single_catagory">
                        <div class="thumb">
                            <img src="img/catagory/4.png" alt="">
                        </div>
                        <div class="hover_overlay">
                            <div class="hover_inner">
                                    <a href="Listings.html"><h4>Music Festival</h4></a>
                                <span>05 Listings</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-md-4 col-lg-3">
                    <div class="single_catagory">
                        <div class="thumb">
                            <img src="img/catagory/5.png" alt="">
                        </div>
                        <div class="hover_overlay">
                            <div class="hover_inner">
                                    <a href="Listings.html"><h4>Night Club</h4></a>
                                <span>05 Listings</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-md-4 col-lg-3">
                    <div class="single_catagory">
                        <div class="thumb">
                            <img src="img/catagory/6.png" alt="">
                        </div>
                        <div class="hover_overlay">
                            <div class="hover_inner">
                                    <a href="Listings.html"><h4>Bars & Pubs</h4></a>
                                <span>05 Listings</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-md-4 col-lg-3">
                    <div class="single_catagory">
                        <div class="thumb">
                            <img src="img/catagory/7.png" alt="">
                        </div>
                        <div class="hover_overlay">
                            <div class="hover_inner">
                                    <a href="Listings.html"><h4>Cafe</h4></a>
                                <span>05 Listings</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-md-4 col-lg-3">
                    <div class="single_catagory">
                        <div class="thumb">
                            <img src="img/catagory/8.png" alt="">
                        </div>
                        <div class="hover_overlay">
                            <div class="hover_inner">
                                    <a href="Listings.html"><h4>Restaurants</h4></a>
                                <span>05 Listings</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

  


  <!-- testimonial_area  -->
  <div class="testimonial_area  ">
    <div class="container">
        <div class="row">
            <div class="col-xl-12">
                <div class="section_title mb-60 text-center">
                    <p></p>
                    <h3>
                        Recently Registered Projects

                    </h3>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-xl-12 ">
                <div class="testmonial_active owl-carousel height_testmonial">
                    <div class="single_carousel ">
                        <div class="single_testmonial  ">                           
                            <div class="explorer_europe  ">
                                <div class="container ">                                    
                                    <div class="tab-content" id="nav-tabContent">
                                        <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                                            <div class="row">
                                                <div class="col-xl-4 col-lg-4 col-md-6">
                                                    <div class="single_explorer">
                                                        <div class="thumb">
                                                            <img src="img/explorer/2.png" alt="">
                                                        </div>
                                                        <div class="explorer_bottom d-flex">
                                                            <div class="icon">
                                                                <i class="flaticon-food"></i>
                                                            </div>
                                                            <div class="explorer_info">
                                                                <h3><a href="single_listings.html">Freshly Food</a></h3>
                                                                <p>700/D, Kings road, Green lane, London</p>
                                                                <ul>
                                                                    <li> <i class="fa fa-phone"></i>
                                                                        +10 278 367 9823</li>
                                                                    <li><i class="fa fa-envelope"></i> contact@midnight.com</li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-xl-4 col-lg-4 col-md-6">
                                                    <div class="single_explorer">
                                                        <div class="thumb">
                                                            <img src="img/explorer/2.png" alt="">
                                                        </div>
                                                        <div class="explorer_bottom d-flex">
                                                            <div class="icon">
                                                                <i class="flaticon-food"></i>
                                                            </div>
                                                            <div class="explorer_info">
                                                                <h3><a href="single_listings.html">Freshly Food</a></h3>
                                                                <p>700/D, Kings road, Green lane, London</p>
                                                                <ul>
                                                                    <li> <i class="fa fa-phone"></i>
                                                                        +10 278 367 9823</li>
                                                                    <li><i class="fa fa-envelope"></i> contact@midnight.com</li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-xl-4 col-lg-4 col-md-6">
                                                    <div class="single_explorer">
                                                        <div class="thumb">
                                                            <img src="img/explorer/3.png" alt="">
                                                        </div>
                                                        <div class="explorer_bottom d-flex">
                                                            <div class="icon">
                                                                <i class="flaticon-food-1"></i>
                                                            </div>
                                                            <div class="explorer_info">
                                                                <h3><a href="single_listings.html">Midnight</a></h3>
                                                                <p>700/D, Kings road, Green lane, London</p>
                                                                <ul>
                                                                    <li> <i class="fa fa-phone"></i>
                                                                        +10 278 367 9823</li>
                                                                    <li><i class="fa fa-envelope"></i> contact@midnight.com</li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="single_carousel">
                        <div class="single_testmonial ">
                            <div class="explorer_europe  ">
                                <div class="container ">                                    
                                    <div class="tab-content" id="nav-tabContent">
                                        <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                                            <div class="row">
                                                <div class="col-xl-4 col-lg-4 col-md-6">
                                                    <div class="single_explorer">
                                                        <div class="thumb">
                                                            <img src="img/explorer/2.png" alt="">
                                                        </div>
                                                        <div class="explorer_bottom d-flex">
                                                            <div class="icon">
                                                                <i class="flaticon-food"></i>
                                                            </div>
                                                            <div class="explorer_info">
                                                                <h3><a href="single_listings.html">Freshly Food</a></h3>
                                                                <p>700/D, Kings road, Green lane, London</p>
                                                                <ul>
                                                                    <li> <i class="fa fa-phone"></i>
                                                                        +10 278 367 9823</li>
                                                                    <li><i class="fa fa-envelope"></i> contact@midnight.com</li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-xl-4 col-lg-4 col-md-6">
                                                    <div class="single_explorer">
                                                        <div class="thumb">
                                                            <img src="img/explorer/2.png" alt="">
                                                        </div>
                                                        <div class="explorer_bottom d-flex">
                                                            <div class="icon">
                                                                <i class="flaticon-food"></i>
                                                            </div>
                                                            <div class="explorer_info">
                                                                <h3><a href="single_listings.html">Freshly Food</a></h3>
                                                                <p>700/D, Kings road, Green lane, London</p>
                                                                <ul>
                                                                    <li> <i class="fa fa-phone"></i>
                                                                        +10 278 367 9823</li>
                                                                    <li><i class="fa fa-envelope"></i> contact@midnight.com</li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-xl-4 col-lg-4 col-md-6">
                                                    <div class="single_explorer">
                                                        <div class="thumb">
                                                            <img src="img/explorer/3.png" alt="">
                                                        </div>
                                                        <div class="explorer_bottom d-flex">
                                                            <div class="icon">
                                                                <i class="flaticon-food-1"></i>
                                                            </div>
                                                            <div class="explorer_info">
                                                                <h3><a href="single_listings.html">Midnight</a></h3>
                                                                <p>700/D, Kings road, Green lane, London</p>
                                                                <ul>
                                                                    <li> <i class="fa fa-phone"></i>
                                                                        +10 278 367 9823</li>
                                                                    <li><i class="fa fa-envelope"></i> contact@midnight.com</li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            
                        </div>
                    </div>
                    <div class="single_carousel">
                        <div class="single_testmonial ">
                            <div class="explorer_europe  ">
                                <div class="container ">                                    
                                    <div class="tab-content" id="nav-tabContent">
                                        <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                                            <div class="row">
                                                <div class="col-xl-4 col-lg-4 col-md-6">
                                                    <div class="single_explorer">
                                                        <div class="thumb">
                                                            <img src="img/explorer/2.png" alt="">
                                                        </div>
                                                        <div class="explorer_bottom d-flex">
                                                            <div class="icon">
                                                                <i class="flaticon-food"></i>
                                                            </div>
                                                            <div class="explorer_info">
                                                                <h3><a href="single_listings.html">Freshly Food</a></h3>
                                                                <p>700/D, Kings road, Green lane, London</p>
                                                                <ul>
                                                                    <li> <i class="fa fa-phone"></i>
                                                                        +10 278 367 9823</li>
                                                                    <li><i class="fa fa-envelope"></i> contact@midnight.com</li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-xl-4 col-lg-4 col-md-6">
                                                    <div class="single_explorer">
                                                        <div class="thumb">
                                                            <img src="img/explorer/2.png" alt="">
                                                        </div>
                                                        <div class="explorer_bottom d-flex">
                                                            <div class="icon">
                                                                <i class="flaticon-food"></i>
                                                            </div>
                                                            <div class="explorer_info">
                                                                <h3><a href="single_listings.html">Freshly Food</a></h3>
                                                                <p>700/D, Kings road, Green lane, London</p>
                                                                <ul>
                                                                    <li> <i class="fa fa-phone"></i>
                                                                        +10 278 367 9823</li>
                                                                    <li><i class="fa fa-envelope"></i> contact@midnight.com</li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-xl-4 col-lg-4 col-md-6">
                                                    <div class="single_explorer">
                                                        <div class="thumb">
                                                            <img src="img/explorer/3.png" alt="">
                                                        </div>
                                                        <div class="explorer_bottom d-flex">
                                                            <div class="icon">
                                                                <i class="flaticon-food-1"></i>
                                                            </div>
                                                            <div class="explorer_info">
                                                                <h3><a href="single_listings.html">Midnight</a></h3>
                                                                <p>700/D, Kings road, Green lane, London</p>
                                                                <ul>
                                                                    <li> <i class="fa fa-phone"></i>
                                                                        +10 278 367 9823</li>
                                                                    <li><i class="fa fa-envelope"></i> contact@midnight.com</li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /testimonial_area  -->


    <!-- footer start -->
    <footer class="footer">
        <div class="footer_top">
            <div class="container">
                <div class="row">
                    <div class="col-xl-4 col-md-6 col-lg-3">
                        <div class="footer_widget">
                            <div class="footer_logo">
                                <a href="#">
                                    <img src="img/footer_logo.png" alt="">
                                </a>
                            </div>
                            <p>
                                Esteem spirit temper too say adieus who <br> direct esteem. It esteems luckily or <br>
                                picture placing drawing.
                            </p>
                            <div class="socail_links">
                                <ul>
                                    <li>
                                        <a href="#">
                                            <i class="ti-facebook"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-google-plus"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-twitter"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-instagram"></i>
                                        </a>
                                    </li>
                                </ul>
                            </div>

                        </div>
                    </div>
                    <div class="col-xl-2 col-md-6 col-lg-3">
                        <div class="footer_widget">
                            <h3 class="footer_title">
                                Services
                            </h3>
                            <ul>
                                <li><a href="#">SEO/SEM </a></li>
                                <li><a href="#">Web design </a></li>
                                <li><a href="#">Ecommerce</a></li>
                                <li><a href="#">Digital marketing</a></li>
                            </ul>

                        </div>
                    </div>
                    <div class="col-xl-2 col-md-6 col-lg-2">
                        <div class="footer_widget">
                            <h3 class="footer_title">
                                Useful Links
                            </h3>
                            <ul>
                                <li><a href="#">About</a></li>
                                <li><a href="#">Blog</a></li>
                                <li><a href="#"> Contact</a></li>
                                <li><a href="#">Support</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-xl-4 col-md-6 col-lg-4">
                        <div class="footer_widget">
                            <h3 class="footer_title">
                                Subscribe
                            </h3>
                            <form action="#" class="newsletter_form">
                                <input type="text" placeholder="Enter your mail">
                                <button type="submit">Subscribe</button>
                            </form>
                            <p class="newsletter_text">Esteem spirit temper too say adieus who direct esteem esteems
                                luckily.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="copy-right_text">
            <div class="container">
                <div class="footer_border"></div>
                <div class="row">
                    <div class="col-xl-12">
                        <p class="copy_right text-center">
                            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!--/ footer end  -->

    <!-- link that opens popup -->
    <script src=" https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"> </script>
    <!-- JS here -->
    <script src="http://localhost:8080/SemiProject/js/vendor/modernizr-3.5.0.min.js"></script>
    <script src="http://localhost:8080/SemiProject/js/vendor/jquery-1.12.4.min.js"></script>
    <script src="http://localhost:8080/SemiProject/js/popper.min.js"></script>
    <script src="http://localhost:8080/SemiProject/js/bootstrap.min.js"></script>
    <script src="http://localhost:8080/SemiProject/js/owl.carousel.min.js"></script>
    <script src="http://localhost:8080/SemiProject/js/isotope.pkgd.min.js"></script>
    <script src="http://localhost:8080/SemiProject/js/ajax-form.js"></script>
    <script src="http://localhost:8080/SemiProject/js/waypoints.min.js"></script>
    <script src="http://localhost:8080/SemiProject/js/jquery.counterup.min.js"></script>
    <script src="http://localhost:8080/SemiProject/js/imagesloaded.pkgd.min.js"></script>
    <script src="http://localhost:8080/SemiProject/js/scrollIt.js"></script>
    <script src="http://localhost:8080/SemiProject/js/jquery.scrollUp.min.js"></script>
    <script src="http://localhost:8080/SemiProject/js/wow.min.js"></script>
    <script src="http://localhost:8080/SemiProject/js/nice-select.min.js"></script>
    <script src="http://localhost:8080/SemiProject/js/jquery.slicknav.min.js"></script>
    <script src="http://localhost:8080/SemiProject/js/jquery.magnific-popup.min.js"></script>
    <script src="http://localhost:8080/SemiProject/js/plugins.js"></script>
    <!-- <script src="http://localhost:8080/SemiProject/js/gijgo.min.js"></script> -->
    <script src="http://localhost:8080/SemiProject/js/slick.min.js"></script>



    <!--contact js-->
    <script src="http://localhost:8080/SemiProject/js/contact.js"></script>
    <script src="http://localhost:8080/SemiProject/js/jquery.ajaxchimp.min.js"></script>
    <script src="http://localhost:8080/SemiProject/js/jquery.form.js"></script>
    <script src="http://localhost:8080/SemiProject/js/jquery.validate.min.js"></script>
    <script src="http://localhost:8080/SemiProject/js/mail-script.js"></script>


    <script src="http://localhost:8080/SemiProject/js/main.js"></script>
</body>

</html>