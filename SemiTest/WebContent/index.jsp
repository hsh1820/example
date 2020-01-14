<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.kh.SemiTest.member.model.vo.Member"%>

<%
	String msg = (String)session.getAttribute("msg");
	Member loginMember = (Member)session.getAttribute("loginMember");
	
%>
<!doctype html>
<html class="no-js" lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Directory</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- <link rel="manifest" href="site.webmanifest"> -->
    <link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">
    <!-- Place favicon.ico in the root directory -->

    <!-- CSS here -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/themify-icons.css">
    <link rel="stylesheet" href="css/nice-select.css">
    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/gijgo.css">
    <link rel="stylesheet" href="css/animate.css">
    <link rel="stylesheet" href="css/slick.css">
    <link rel="stylesheet" href="css/slicknav.css">
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css">

    <link rel="stylesheet" href="css/style.css">
    <!-- <link rel="stylesheet" href="css/responsive.css"> -->
    
    <script> 
		// 로그인 실패 메세지 출력 후 
		// session에 남아있는 "msg" 속성 제거
		<% if(msg != null) {  %> // 로그인이 실패한 경우
			alert("<%=msg%>");			
		<% 
				session.removeAttribute("msg");
			}
		%>
		
	</script>
</head>
<script>
		// 로그인 유효성 검사
		function loginValidate(){
			// trim() : 문자열 앞뒤 공백 제거
			if( $("#memberId").val().trim().length == 0) {
				alert("아이디를 입력하세요.");
				$("#memberId").focus();
				
				return false; /* 폼태그 기본 동작(값넘김) 제거 */
			}
			if( $("#memberPwd").val().trim().length == 0) {
				alert("비밀번호를 입력하세요.");
				$("#memberPwd").focus();
				
				return false; /* 폼태그 기본 동작 제거 */
			}
			
			return true;
		}
	</script>

<body>



    <!-- slider_area_start -->
    <div class="slider_area">
        <div class="single_slider  d-flex align-items-center slider_bg_1">
            <div class="container">
                <div class="row align-items-center justify-content-center">
                    <div class="col-xl-10">
                        <div class="slider_text text-center justify-content-center">
                            <p>Find Nearby Attraction</p>
                            <h3>Find Nearby Attraction</h3>
                            <div class="search_form">
                                <form action="#">
                                    <div class="row align-items-center">
                                        <div class="col-xl-5 col-md-4">
                                            <div class="input_field">
                                                <input type="text" placeholder="What are you finding?">
                                            </div>
                                        </div>
                                        <div class="col-xl-4 col-md-4">
                                            <div class="input_field location">
                                                <input type="text" placeholder="Location">
                                            </div>
                                        </div>
                                        <div class="col-xl-3 col-md-4">
                                            <div class="button_search">
                                                <button class="boxed-btn2" type="submit">Search</button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="quality">
                                <ul>
                                    <li>
                                        <button>Hotel</button>
                                    </li>
                                    <li>
                                        <button>Food</button>
                                    </li>
                                    <li>
                                        <button>Shopping</button>
                                    </li>
                                    <li>
                                        <button>Bar & Pubs</button>
                                    </li>
                                    <li>
                                        <button>Bar & Pubs</button>
                                    </li>
                                    <li>
                                        <button>Places</button>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- slider_area_end -->

    <div class="popular_catagory_area">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="section_title mb-60 text-center">
                        <p>Discover</p>
                        <h3>
                            Most Popular Categories
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

    <div class="explorer_europe">
        <div class="container">
            <div class="explorer_wrap">
                <div class="row align-items-center">
                    <div class="col-xl-6 col-md-4">
                        <h3>Explore Europe</h3>
                    </div>
                    <div class="col-xl-6 col-md-8">
                        <div class="explorer_tab">
                            <nav>
                                <div class="nav" id="nav-tab" role="tablist">
                                    <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab"
                                        href="#nav-home" role="tab" aria-controls="nav-home"
                                        aria-selected="true">England</a>
                                    <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab"
                                        href="#nav-profile" role="tab" aria-controls="nav-profile"
                                        aria-selected="false">Switzerland</a>
                                    <a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab"
                                        href="#nav-contact" role="tab" aria-controls="nav-contact"
                                        aria-selected="false">Italy</a>
                                    <a class="nav-item nav-link" id="nav-contact-tab2" data-toggle="tab"
                                        href="#nav-contact2" role="tab" aria-controls="nav-contact"
                                        aria-selected="false">France</a>
                                    <a class="nav-item nav-link" id="nav-contact-tab3" data-toggle="tab"
                                        href="#nav-contact3" role="tab" aria-controls="nav-contact"
                                        aria-selected="false">Germany</a>
                                </div>
                            </nav>

                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-content" id="nav-tabContent">
                <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                    <div class="row">
                        <div class="col-xl-4 col-lg-4 col-md-6">
                            <div class="single_explorer">
                                <div class="thumb">
                                    <img src="img/explorer/1.png" alt="">
                                </div>
                                <div class="explorer_bottom d-flex">
                                    <div class="icon">
                                        <i class="flaticon-beach"></i>
                                    </div>
                                    <div class="explorer_info">
                                        <h3><a href="single_listings.html">Saintmartine</a></h3>
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
                        <div class="col-xl-4 col-lg-4 col-md-6">
                            <div class="single_explorer">
                                <div class="thumb">
                                    <img src="img/explorer/4.png" alt="">
                                </div>
                                <div class="explorer_bottom d-flex">
                                    <div class="icon">
                                        <i class="flaticon-barbershop"></i>
                                    </div>
                                    <div class="explorer_info">
                                        <h3><a href="single_listings.html">Barber</a></h3>
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
                                    <img src="img/explorer/5.png" alt="">
                                </div>
                                <div class="explorer_bottom d-flex">
                                    <div class="icon">
                                        <i class="flaticon-cabin"></i>
                                    </div>
                                    <div class="explorer_info">
                                        <h3><a href="single_listings.html">Montana Resort</a></h3>
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
                                    <img src="img/explorer/6.png" alt="">
                                </div>
                                <div class="explorer_bottom d-flex">
                                    <div class="icon">
                                        <i class="flaticon-shop"></i>
                                    </div>
                                    <div class="explorer_info">
                                        <h3><a href="single_listings.html">Yelled Shopping</a></h3>
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
                <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
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
                                        <img src="img/explorer/1.png" alt="">
                                    </div>
                                    <div class="explorer_bottom d-flex">
                                        <div class="icon">
                                            <i class="flaticon-beach"></i>
                                        </div>
                                        <div class="explorer_info">
                                            <h3><a href="single_listings.html">Saintmartine</a></h3>
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
                        <div class="col-xl-4 col-lg-4 col-md-6">
                            <div class="single_explorer">
                                <div class="thumb">
                                    <img src="img/explorer/4.png" alt="">
                                </div>
                                <div class="explorer_bottom d-flex">
                                    <div class="icon">
                                        <i class="flaticon-barbershop"></i>
                                    </div>
                                    <div class="explorer_info">
                                        <h3><a href="single_listings.html">Barber</a></h3>
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
                                    <img src="img/explorer/5.png" alt="">
                                </div>
                                <div class="explorer_bottom d-flex">
                                    <div class="icon">
                                        <i class="flaticon-cabin"></i>
                                    </div>
                                    <div class="explorer_info">
                                        <h3><a href="single_listings.html">Montana Resort</a></h3>
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
                                    <img src="img/explorer/6.png" alt="">
                                </div>
                                <div class="explorer_bottom d-flex">
                                    <div class="icon">
                                        <i class="flaticon-shop"></i>
                                    </div>
                                    <div class="explorer_info">
                                        <h3><a href="single_listings.html">Yelled Shopping</a></h3>
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
                <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">
                    <div class="row">
                            <div class="col-xl-4 col-lg-4 col-md-4">
                                    <div class="single_explorer">
                                        <div class="thumb">
                                            <img src="img/explorer/4.png" alt="">
                                        </div>
                                        <div class="explorer_bottom d-flex">
                                            <div class="icon">
                                                <i class="flaticon-barbershop"></i>
                                            </div>
                                            <div class="explorer_info">
                                                <h3><a href="single_listings.html">Barber</a></h3>
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
                                    <img src="img/explorer/1.png" alt="">
                                </div>
                                <div class="explorer_bottom d-flex">
                                    <div class="icon">
                                        <i class="flaticon-beach"></i>
                                    </div>
                                    <div class="explorer_info">
                                        <h3><a href="single_listings.html">Saintmartine</a></h3>
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

                        <div class="col-xl-4 col-lg-4 col-md-6">
                            <div class="single_explorer">
                                <div class="thumb">
                                    <img src="img/explorer/5.png" alt="">
                                </div>
                                <div class="explorer_bottom d-flex">
                                    <div class="icon">
                                        <i class="flaticon-cabin"></i>
                                    </div>
                                    <div class="explorer_info">
                                        <h3><a href="single_listings.html">Montana Resort</a></h3>
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
                                    <img src="img/explorer/6.png" alt="">
                                </div>
                                <div class="explorer_bottom d-flex">
                                    <div class="icon">
                                        <i class="flaticon-shop"></i>
                                    </div>
                                    <div class="explorer_info">
                                        <h3><a href="single_listings.html">Yelled Shopping</a></h3>
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
                <div class="tab-pane fade" id="nav-contact2" role="tabpanel" aria-labelledby="nav-contact-tab2">
                    <div class="row">
                        <div class="col-xl-4 col-lg-4 col-md-6">
                            <div class="single_explorer">
                                <div class="thumb">
                                    <img src="img/explorer/1.png" alt="">
                                </div>
                                <div class="explorer_bottom d-flex">
                                    <div class="icon">
                                        <i class="flaticon-beach"></i>
                                    </div>
                                    <div class="explorer_info">
                                        <h3><a href="single_listings.html">Saintmartine</a></h3>
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
                        <div class="col-xl-4 col-lg-4 col-md-6">
                            <div class="single_explorer">
                                <div class="thumb">
                                    <img src="img/explorer/4.png" alt="">
                                </div>
                                <div class="explorer_bottom d-flex">
                                    <div class="icon">
                                        <i class="flaticon-barbershop"></i>
                                    </div>
                                    <div class="explorer_info">
                                        <h3><a href="single_listings.html">Barber</a></h3>
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
                                    <img src="img/explorer/5.png" alt="">
                                </div>
                                <div class="explorer_bottom d-flex">
                                    <div class="icon">
                                        <i class="flaticon-cabin"></i>
                                    </div>
                                    <div class="explorer_info">
                                        <h3><a href="single_listings.html">Montana Resort</a></h3>
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
                                    <img src="img/explorer/6.png" alt="">
                                </div>
                                <div class="explorer_bottom d-flex">
                                    <div class="icon">
                                        <i class="flaticon-shop"></i>
                                    </div>
                                    <div class="explorer_info">
                                        <h3><a href="single_listings.html">Yelled Shopping</a></h3>
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
                <div class="tab-pane fade" id="nav-contact3" role="tabpanel" aria-labelledby="nav-contact-tab3">
                    <div class="row">
                        <div class="col-xl-4 col-lg-4 col-md-6">
                            <div class="single_explorer">
                                <div class="thumb">
                                    <img src="img/explorer/1.png" alt="">
                                </div>
                                <div class="explorer_bottom d-flex">
                                    <div class="icon">
                                        <i class="flaticon-beach"></i>
                                    </div>
                                    <div class="explorer_info">
                                        <h3><a href="single_listings.html">Saintmartine</a></h3>
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
                        <div class="col-xl-4 col-lg-4 col-md-6">
                            <div class="single_explorer">
                                <div class="thumb">
                                    <img src="img/explorer/4.png" alt="">
                                </div>
                                <div class="explorer_bottom d-flex">
                                    <div class="icon">
                                        <i class="flaticon-barbershop"></i>
                                    </div>
                                    <div class="explorer_info">
                                        <h3><a href="single_listings.html">Barber</a></h3>
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
                                    <img src="img/explorer/5.png" alt="">
                                </div>
                                <div class="explorer_bottom d-flex">
                                    <div class="icon">
                                        <i class="flaticon-cabin"></i>
                                    </div>
                                    <div class="explorer_info">
                                        <h3><a href="single_listings.html">Montana Resort</a></h3>
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
                                    <img src="img/explorer/6.png" alt="">
                                </div>
                                <div class="explorer_bottom d-flex">
                                    <div class="icon">
                                        <i class="flaticon-shop"></i>
                                    </div>
                                    <div class="explorer_info">
                                        <h3><a href="single_listings.html">Yelled Shopping</a></h3>
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


    <!-- sprayed_area  -->
    <div class="sprayed_area overlay">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="text text-center">
                        <h3>Sprayed Your Business with Us </h3>
                        <p>Esteem spirit temper too say adieus who direct esteem. It esteems luckily or picture placing
                            drawing <br> apartments frequently or motionless.</p>
                        <a href="#" class="boxed-btn2">Add Your Business</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--/ sprayed_area end  -->

    <!-- testimonial_area  -->
    <div class="testimonial_area  ">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="section_title mb-60 text-center">
                        <p>Testimonials</p>
                        <h3>
                            What our Client Says
                        </h3>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xl-12">
                    <div class="testmonial_active owl-carousel">
                        <div class="single_carousel">
                            <div class="single_testmonial text-center">
                                <div class="quote">
                                    <img src="img/svg_icon/quote.svg" alt="">
                                </div>
                                <p>Donec imperdiet congue orci consequat mattis. Donec rutrum porttitor <br>
                                    sollicitudin. Pellentesque id dolor tempor sapien feugiat ultrices nec sed neque.
                                    <br>
                                    Fusce ac mattis nulla. Morbi eget ornare dui. </p>
                                <div class="testmonial_author">
                                    <div class="thumb">
                                        <img src="img/case/testmonial.png" alt="">
                                    </div>
                                    <h3>Robert Thomson</h3>
                                    <span>Business Owner</span>
                                </div>
                            </div>
                        </div>
                        <div class="single_carousel">
                            <div class="single_testmonial text-center">
                                <div class="quote">
                                    <img src="img/svg_icon/quote.svg" alt="">
                                </div>
                                <p>Donec imperdiet congue orci consequat mattis. Donec rutrum porttitor <br>
                                    sollicitudin. Pellentesque id dolor tempor sapien feugiat ultrices nec sed neque.
                                    <br>
                                    Fusce ac mattis nulla. Morbi eget ornare dui. </p>
                                <div class="testmonial_author">
                                    <div class="thumb">
                                        <img src="img/case/testmonial.png" alt="">
                                    </div>
                                    <h3>Robert Thomson</h3>
                                    <span>Business Owner</span>
                                </div>
                            </div>
                        </div>
                        <div class="single_carousel">
                            <div class="single_testmonial text-center">
                                <div class="quote">
                                    <img src="img/svg_icon/quote.svg" alt="">
                                </div>
                                <p>Donec imperdiet congue orci consequat mattis. Donec rutrum porttitor <br>
                                    sollicitudin. Pellentesque id dolor tempor sapien feugiat ultrices nec sed neque.
                                    <br>
                                    Fusce ac mattis nulla. Morbi eget ornare dui. </p>
                                <div class="testmonial_author">
                                    <div class="thumb">
                                        <img src="img/case/testmonial.png" alt="">
                                    </div>
                                    <h3>Robert Thomson</h3>
                                    <span>Business Owner</span>
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
    <script src="js/vendor/modernizr-3.5.0.min.js"></script>
    <script src="js/vendor/jquery-1.12.4.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/isotope.pkgd.min.js"></script>
    <script src="js/ajax-form.js"></script>
    <script src="js/waypoints.min.js"></script>
    <script src="js/jquery.counterup.min.js"></script>
    <script src="js/imagesloaded.pkgd.min.js"></script>
    <script src="js/scrollIt.js"></script>
    <script src="js/jquery.scrollUp.min.js"></script>
    <script src="js/wow.min.js"></script>
    <script src="js/nice-select.min.js"></script>
    <script src="js/jquery.slicknav.min.js"></script>
    <script src="js/jquery.magnific-popup.min.js"></script>
    <script src="js/plugins.js"></script>
    <!-- <script src="js/gijgo.min.js"></script> -->
    <script src="js/slick.min.js"></script>



    <!--contact js-->
    <script src="js/contact.js"></script>
    <script src="js/jquery.ajaxchimp.min.js"></script>
    <script src="js/jquery.form.js"></script>
    <script src="js/jquery.validate.min.js"></script>
    <script src="js/mail-script.js"></script>


    <script src="js/main.js"></script>
</body>

</html>