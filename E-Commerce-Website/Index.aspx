<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="E_Commerce_Website.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section id="billboard" class="overflow-hidden">

        <button class="button-prev">
            <i class="icon icon-chevron-left"></i>
        </button>
        <button class="button-next">
            <i class="icon icon-chevron-right"></i>
        </button>
        <div class="swiper main-swiper">
            <div class="swiper-wrapper">
                <div class="swiper-slide" style="background-image: url('assets/user/images/banner1.jpg'); background-repeat: no-repeat; background-size: cover; background-position: center;">
                    <div class="banner-content">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-6">
                                    <h2 class="banner-title">Summer Collection</h2>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed eu feugiat amet, libero ipsum enim pharetra hac.</p>
                                    <div class="btn-wrap">
                                        <a href="shop.html" class="btn btn-light btn-medium d-flex align-items-center" tabindex="0">Shop it now <i class="icon icon-arrow-io"></i>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="swiper-slide" style="background-image: url('assets/user/images/banner2.jpg'); background-repeat: no-repeat; background-size: cover; background-position: center;">
                    <div class="banner-content">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-6">
                                    <h2 class="banner-title">Casual Collection</h2>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed eu feugiat amet, libero ipsum enim pharetra hac.</p>
                                    <div class="btn-wrap">
                                        <a href="shop.html" class="btn btn-light btn-light-arrow btn-medium d-flex align-items-center" tabindex="0">Shop it now <i class="icon icon-arrow-io"></i>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section id="featured-products" class="product-store padding-large">
        <div class="container">
            <div class="section-header d-flex flex-wrap align-items-center justify-content-between">
                <h2 class="section-title">Product Categories</h2>
                <div class="btn-wrap">
                    <a href="shop.html" class="d-flex align-items-center">View all products <i class="icon icon icon-arrow-io"></i></a>
                </div>
            </div>
            <div class="swiper product-swiper overflow-hidden">
                <div class="swiper-wrapper">
                    <asp:Repeater ID="rptCategories" runat="server">
                        <ItemTemplate>
                            <div class="swiper-slide">
                                <div class="product-item" style="border: red 1px solid; padding: 20px;">
                                    <div class="product-detail">
                                        <h3 class="product-title">
                                            <a href="Products.aspx?CategoryId=<%# Eval("Id") %>"><%# Eval("Name") %></a>
                                        </h3>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>




                </div>
            </div>
            <div class="swiper-pagination"></div>
        </div>
    </section>

    <section id="latest-collection">
        <div class="container">
            <div class="product-collection row">
                <div class="col-lg-7 col-md-12 left-content">
                    <div class="collection-item">
                        <div class="products-thumb">
                            <img src="assets/user/images/collection-item1.jpg" alt="collection item" class="large-image image-rounded">
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6 product-entry">
                            <div class="categories">casual collection</div>
                            <h3 class="item-title">street wear.</h3>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dignissim massa diam elementum.</p>
                            <div class="btn-wrap">
                                <a href="shop.html" class="d-flex align-items-center">shop collection <i class="icon icon-arrow-io"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-5 col-md-12 right-content flex-wrap">
                    <div class="collection-item top-item">
                        <div class="products-thumb">
                            <img src="assets/user/images/collection-item2.jpg" alt="collection item" class="small-image image-rounded">
                        </div>
                        <div class="col-md-6 product-entry">
                            <div class="categories">Basic Collection</div>
                            <h3 class="item-title">Basic shoes.</h3>
                            <div class="btn-wrap">
                                <a href="shop.html" class="d-flex align-items-center">shop collection <i class="icon icon-arrow-io"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="collection-item bottom-item">
                        <div class="products-thumb">
                            <img src="assets/user/images/collection-item3.jpg" alt="collection item" class="small-image image-rounded">
                        </div>
                        <div class="col-md-6 product-entry">
                            <div class="categories">Best Selling Product</div>
                            <h3 class="item-title">woolen hat.</h3>
                            <div class="btn-wrap">
                                <a href="shop.html" class="d-flex align-items-center">shop collection <i class="icon icon-arrow-io"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section id="subscribe" class="padding-large">
        <div class="container">
            <div class="row">
                <div class="block-text col-md-6">
                    <div class="section-header">
                        <h2 class="section-title">Get 25% off Discount Coupons</h2>
                    </div>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dictumst amet, metus, sit massa posuere maecenas. At tellus ut nunc amet vel egestas.</p>
                </div>
                <div class="subscribe-content col-md-6">
                    <form id="form" class="d-flex justify-content-between">
                        <input type="text" name="email" placeholder="Enter your email addresss here">
                        <button class="btn btn-dark">Subscribe Now</button>
                    </form>
                </div>
            </div>
        </div>
    </section>

  
    <section id="testimonials" class="padding-large no-padding-bottom">
        <div class="container">
            <div class="reviews-content">
                <div class="row d-flex flex-wrap">
                    <div class="col-md-2">
                        <div class="review-icon">
                            <i class="icon icon-right-quote"></i>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="swiper testimonial-swiper overflow-hidden">
                            <div class="swiper-wrapper">
                                <div class="swiper-slide">
                                    <div class="testimonial-detail">
                                        <p>“Dignissim massa diam elementum habitant fames. Id nullam pellentesque nisi, eget cursus dictumst pharetra, sit. Pulvinar laoreet id porttitor egestas dui urna. Porttitor nibh magna dolor ultrices iaculis sit iaculis.”</p>
                                        <div class="author-detail">
                                            <div class="name">By Maggie Rio</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="swiper-slide">
                                    <div class="testimonial-detail">
                                        <p>“Dignissim massa diam elementum habitant fames. Id nullam pellentesque nisi, eget cursus dictumst pharetra, sit. Pulvinar laoreet id porttitor egestas dui urna. Porttitor nibh magna dolor ultrices iaculis sit iaculis.”</p>
                                        <div class="author-detail">
                                            <div class="name">By John Smith</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-arrows">
                            <button class="prev-button">
                                <i class="icon icon-arrow-left"></i>
                            </button>
                            <button class="next-button">
                                <i class="icon icon-arrow-right"></i>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section id="flash-sales" class="product-store padding-large">

        <div class="container">
            <div class="section-header">
                <h2 class="section-title">Flash sales</h2>
            </div>
            <div class="swiper product-swiper flash-sales overflow-hidden">

                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <div class="product-item">
                            <img src="assets/user/images/selling-products9.jpg" alt="Books" class="product-image">
                            <div class="cart-concern">
                                <div class="cart-button d-flex justify-content-between align-items-center">
                                    <button type="button" class="btn-wrap cart-link d-flex align-items-center">
                                        add to cart <i class="icon icon-arrow-io"></i>
                                    </button>
                                    <button type="button" class="view-btn tooltip
                        d-flex">
                                        <i class="icon icon-screen-full"></i>
                                        <span class="tooltip-text">Quick view</span>
                                    </button>
                                    <button type="button" class="wishlist-btn">
                                        <i class="icon icon-heart"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="discount">10% Off</div>
                            <div class="product-detail">
                                <h3 class="product-title">
                                    <a href="single-product.html">Full sleeve cover shirt</a>
                                </h3>
                                <div class="item-price text-primary">
                                    <del class="prev-price">$50.00</del>$40.00
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="product-item">
                            <img src="assets/user/images/selling-products10.jpg" alt="Books" class="product-image">
                            <div class="cart-concern">
                                <div class="cart-button d-flex justify-content-between align-items-center">
                                    <button type="button" class="btn-wrap cart-link d-flex align-items-center">
                                        add to cart <i class="icon icon-arrow-io"></i>
                                    </button>
                                    <button type="button" class="view-btn tooltip
                        d-flex">
                                        <i class="icon icon-screen-full"></i>
                                        <span class="tooltip-text">Quick view</span>
                                    </button>
                                    <button type="button" class="wishlist-btn">
                                        <i class="icon icon-heart"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="discount">10% Off</div>
                            <div class="product-detail">
                                <h3 class="product-title">
                                    <a href="single-product.html">Long Sleeve T-shirt</a>
                                </h3>
                                <div class="item-price text-primary">
                                    <del class="prev-price">$50.00</del>$40.00
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="product-item">
                            <img src="assets/user/images/selling-products11.jpg" alt="Books" class="product-image">
                            <div class="cart-concern">
                                <div class="cart-button d-flex justify-content-between align-items-center">
                                    <button type="button" class="btn-wrap cart-link d-flex align-items-center">
                                        add to cart <i class="icon icon-arrow-io"></i>
                                    </button>
                                    <button type="button" class="view-btn tooltip
                        d-flex">
                                        <i class="icon icon-screen-full"></i>
                                        <span class="tooltip-text">Quick view</span>
                                    </button>
                                    <button type="button" class="wishlist-btn">
                                        <i class="icon icon-heart"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="discount">10% Off</div>
                            <div class="product-detail">
                                <h3 class="product-title">
                                    <a href="single-product.html">Grey Check Coat</a>
                                </h3>
                                <div class="item-price text-primary">
                                    <del class="prev-price">$55.00</del>$45.00
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="product-item">
                            <img src="assets/user/images/selling-products12.jpg" alt="Books" class="product-image">
                            <div class="cart-concern">
                                <div class="cart-button d-flex justify-content-between align-items-center">
                                    <button type="button" class="btn-wrap cart-link d-flex align-items-center">
                                        add to cart <i class="icon icon-arrow-io"></i>
                                    </button>
                                    <button type="button" class="view-btn tooltip
                        d-flex">
                                        <i class="icon icon-screen-full"></i>
                                        <span class="tooltip-text">Quick view</span>
                                    </button>
                                    <button type="button" class="wishlist-btn">
                                        <i class="icon icon-heart"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="discount">10% Off</div>
                            <div class="product-detail">
                                <h3 class="product-title">
                                    <a href="single-product.html">Silk White Shirt</a>
                                </h3>
                                <div class="item-price text-primary">
                                    <del class="prev-price">$45.00</del>$35.00
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="product-item">
                            <img src="assets/user/images/selling-products8.jpg" alt="Books" class="product-image">
                            <div class="cart-concern">
                                <div class="cart-button d-flex justify-content-between align-items-center">
                                    <button type="button" class="btn-wrap cart-link d-flex align-items-center">
                                        add to cart <i class="icon icon-arrow-io"></i>
                                    </button>
                                    <button type="button" class="view-btn tooltip
                        d-flex">
                                        <i class="icon icon-screen-full"></i>
                                        <span class="tooltip-text">Quick view</span>
                                    </button>
                                    <button type="button" class="wishlist-btn">
                                        <i class="icon icon-heart"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="discount">10% Off</div>
                            <div class="product-detail">
                                <h3 class="product-title">
                                    <a href="single-product.html">Blue Jeans pant</a>
                                </h3>
                                <div class="item-price text-primary">
                                    <del class="prev-price">$45.00</del>$35.00
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="swiper-pagination"></div>

            </div>
        </div>
    </section>

    <section class="shoppify-section-banner">
        <div class="container">
            <div class="product-collection">
                <div class="left-content collection-item">
                    <div class="products-thumb">
                        <img src="assets/user/images/model.jpg" alt="collection item" class="large-image image-rounded">
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6 product-entry">
                        <div class="categories">Denim collection</div>
                        <h3 class="item-title">The casual selection.</h3>
                        <p>Vel non viverra ligula odio ornare turpis mauris. Odio aliquam, tincidunt ut vitae elit risus. Tempor egestas condimentum et ac rutrum dui, odio.</p>
                        <div class="btn-wrap">
                            <a href="shop.html" class="d-flex align-items-center">shop collection <i class="icon icon-arrow-io"></i>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section id="quotation" class="align-center padding-large">
        <div class="inner-content">
            <h2 class="section-title divider">Quote of the day</h2>
            <blockquote>
                <q>It's true, I don't like the whole cutoff-shorts-and-T-shirt look, but I think you can look fantastic in casual clothes.</q>
                <div class="author-name">- Dr. Seuss</div>
            </blockquote>
        </div>
    </section>

    <hr>
    <section id="latest-blog" class="padding-large">
        <div class="container">
            <div class="section-header d-flex flex-wrap align-items-center justify-content-between">
                <h2 class="section-title">our Journal</h2>
                <div class="btn-wrap align-right">
                    <a href="blog.html" class="d-flex align-items-center">Read All Articles <i class="icon icon icon-arrow-io"></i>
                    </a>
                </div>
            </div>
            <div class="row d-flex flex-wrap">
                <article class="col-md-4 post-item">
                    <div class="image-holder zoom-effect">
                        <a href="single-post.html">
                            <img src="assets/user/images/post-img1.jpg" alt="post" class="post-image">
                        </a>
                    </div>
                    <div class="post-content d-flex">
                        <div class="meta-date">
                            <div class="meta-day text-primary">22</div>
                            <div class="meta-month">Aug-2021</div>
                        </div>
                        <div class="post-header">
                            <h3 class="post-title">
                                <a href="single-post.html">top 10 casual look ideas to dress up your kids</a>
                            </h3>
                            <a href="blog.html" class="blog-categories">Fashion</a>
                        </div>
                    </div>
                </article>
                <article class="col-md-4 post-item">
                    <div class="image-holder zoom-effect">
                        <a href="single-post.html">
                            <img src="assets/user/images/post-img2.jpg" alt="post" class="post-image">
                        </a>
                    </div>
                    <div class="post-content d-flex">
                        <div class="meta-date">
                            <div class="meta-day text-primary">25</div>
                            <div class="meta-month">Aug-2021</div>
                        </div>
                        <div class="post-header">
                            <h3 class="post-title">
                                <a href="single-post.html">Latest trends of wearing street wears supremely</a>
                            </h3>
                            <a href="blog.html" class="blog-categories">Trending</a>
                        </div>
                    </div>
                </article>
                <article class="col-md-4 post-item">
                    <div class="image-holder zoom-effect">
                        <a href="single-post.html">
                            <img src="assets/user/images/post-img3.jpg" alt="post" class="post-image">
                        </a>
                    </div>
                    <div class="post-content d-flex">
                        <div class="meta-date">
                            <div class="meta-day text-primary">28</div>
                            <div class="meta-month">Aug-2021</div>
                        </div>
                        <div class="post-header">
                            <h3 class="post-title">
                                <a href="single-post.html">types of comfortable clothes ideas for women</a>
                            </h3>
                            <a href="blog.html" class="blog-categories">Inspiration</a>
                        </div>
                    </div>
                </article>
            </div>
        </div>
    </section>

    <section id="brand-collection" class="padding-medium bg-light-grey">
        <div class="container">
            <div class="d-flex flex-wrap justify-content-between">
                <img src="assets/user/images/brand1.png" alt="phone" class="brand-image">
                <img src="assets/user/images/brand2.png" alt="phone" class="brand-image">
                <img src="assets/user/images/brand3.png" alt="phone" class="brand-image">
                <img src="assets/user/images/brand4.png" alt="phone" class="brand-image">
                <img src="assets/user/images/brand5.png" alt="phone" class="brand-image">
            </div>
        </div>
    </section>

    <section id="instagram" class="padding-large">
        <div class="container">
            <div class="section-header">
                <h2 class="section-title">Follow our instagram</h2>
            </div>
            <p>
                Our official Instagram account <a href="#">@ultras</a> or <a href="#">#ultras_clothing</a>
            </p>
            <div class="row d-flex flex-wrap justify-content-between">
                <div class="col-lg-2 col-md-4 col-sm-6">
                    <figure class="zoom-effect">
                        <img src="assets/user/images/insta-image1.jpg" alt="instagram" class="insta-image">
                        <i class="icon icon-instagram"></i>
                    </figure>
                </div>
                <div class="col-lg-2 col-md-4 col-sm-6">
                    <figure class="zoom-effect">
                        <img src="assets/user/images/insta-image2.jpg" alt="instagram" class="insta-image">
                        <i class="icon icon-instagram"></i>
                    </figure>
                </div>
                <div class="col-lg-2 col-md-4 col-sm-6">
                    <figure class="zoom-effect">
                        <img src="assets/user/images/insta-image3.jpg" alt="instagram" class="insta-image">
                        <i class="icon icon-instagram"></i>
                    </figure>
                </div>
                <div class="col-lg-2 col-md-4 col-sm-6">
                    <figure class="zoom-effect">
                        <img src="assets/user/images/insta-image4.jpg" alt="instagram" class="insta-image">
                        <i class="icon icon-instagram"></i>
                    </figure>
                </div>
                <div class="col-lg-2 col-md-4 col-sm-6">
                    <figure class="zoom-effect">
                        <img src="assets/user/images/insta-image5.jpg" alt="instagram" class="insta-image">
                        <i class="icon icon-instagram"></i>
                    </figure>
                </div>
                <div class="col-lg-2 col-md-4 col-sm-6">
                    <figure class="zoom-effect">
                        <img src="assets/user/images/insta-image6.jpg" alt="instagram" class="insta-image">
                        <i class="icon icon-instagram"></i>
                    </figure>
                </div>
            </div>
        </div>
    </section>

    <section id="shipping-information">
        <hr>
        <div class="container">
            <div class="row d-flex flex-wrap align-items-center justify-content-between">
                <div class="col-md-3 col-sm-6">
                    <div class="icon-box">
                        <i class="icon icon-truck"></i>
                        <h4 class="block-title">
                            <strong>Free shipping</strong> Over $200
                        </h4>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="icon-box">
                        <i class="icon icon-return"></i>
                        <h4 class="block-title">
                            <strong>Money back</strong> Return within 7 days
                        </h4>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="icon-box">
                        <i class="icon icon-tags1"></i>
                        <h4 class="block-title">
                            <strong>Buy 4 get 5th</strong> 50% off
                        </h4>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="icon-box">
                        <i class="icon icon-help_outline"></i>
                        <h4 class="block-title">
                            <strong>Any questions?</strong> experts are ready
                        </h4>
                    </div>
                </div>
            </div>
        </div>
        <hr>
    </section>




</asp:Content>
