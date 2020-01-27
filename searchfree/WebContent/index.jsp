<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Directory</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- <link rel="manifest" href="site.webmanifest"> -->
    <link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">
    <!-- Place favicon.ico in the root directory -->

    <!-- CSS here -->
    <link rel="stylesheet" href="http://localhost:8080/searchfree/http://localhost:8080/searchfree/css.bootstrap.min.css">
    <link rel="stylesheet" href="http://localhost:8080/searchfree/css.owl.carousel.min.css">
    <link rel="stylesheet" href="http://localhost:8080/searchfree/css.magnific-popup.css">
    <link rel="stylesheet" href="http://localhost:8080/searchfree/css.font-awesome.min.css">
    <link rel="stylesheet" href="http://localhost:8080/searchfree/css.themify-icons.css">
    <link rel="stylesheet" href="http://localhost:8080/searchfree/css.nice-select.css">
    <link rel="stylesheet" href="http://localhost:8080/searchfree/css.flaticon.css">
    <link rel="stylesheet" href="http://localhost:8080/searchfree/css.gijgo.css">
    <link rel="stylesheet" href="http://localhost:8080/searchfree/css.animate.css">
    <link rel="stylesheet" href="http://localhost:8080/searchfree/css.slick.css">
    <link rel="stylesheet" href="http://localhost:8080/searchfree/css.slicknav.css">
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css">

    <link rel="stylesheet" href="http://localhost:8080/searchfree/css.style.css">
    <!-- <link rel="stylesheet" href="http://localhost:8080/searchfree/css.responsive.css"> -->
</head>

<body>
    <!--[if lte IE 9]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
        <![endif]-->

    <!-- header-start -->
     <%@ include file="WEB-INF/views/common/header.jsp"%>
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


     <%@ include file="WEB-INF/views/common/footer.jsp"%>
    <!--/ footer end  -->

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
</body>

</html>
  