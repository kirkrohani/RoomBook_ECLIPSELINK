<!DOCTYPE html>
<html lang="en" class="no-js">
<%@ taglib prefix="jst" uri="http://java.sun.com/jsp/jstl/core" %>
<jst:import url="includes/header.jsp" />
<body>
    <div id="home" class="boxed-view">
    	<!-- INCLUDE FILE: header.jsp which includes header shortcode area(email/phone) and main navigation bar -->
		<jst:import url="includes/menubar.jsp" />
		
        <!-- main content -->
		<section class="slider-box">
			<div class="slider-mask"></div>
			<div class="simple-slider">
			    <ul class="clean-list">
			    	<li><a href="#"><img src="img/main-slider/slide-one.jpg" alt="slide"/></a></li>
			    	<li><a href="#"><img src="img/main-slider/slide-two.jpg" alt="slide"/></a></li>
			    </ul>
			</div>
			<div class="container custom-controls">
				<div class="row">
					<div class="col-md-8 col-md-offset-2">
						<div class="slider-helper">
							<ul class="clean-list">
								<li class="text-white text-center">
									<h1 class="font-6x font-100">Visit our hotel</h1>
									<p class="darken font-100 welcome-mess">Welcome!</p>
									<p class="uppercase letter-spacing"><b>You are Welcome</b></p>
								</li>
								<li class="text-white text-center">
									<h1 class="font-6x font-100">Visit our hotel</h1>
									<p class="darken welcome-mess">With us you will enjoy your Vacation</p>
									<p class="uppercase letter-spacing"><b>Enjoy your stay</b></p>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="container custom-controls">
				<span id="controls">
					<a href="#" class="prev-nav" data-target="prev"><i class="icon-83"></i></a>
					<a href="#" class="next-nav" data-target="next"><i class="icon-90"></i></a>
				</span>
			</div>	
		</section> <!-- /.slider-box -->
		<section class="box border-bottom book-box" data-stellar-background-ratio="0.5">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<jst:choose>
							<jst:when test="${errorMessage != null}">
								<h4 class="the-title text-center font-300"><i class="icon-141"></i> <jst:out value="${errorMessage}" /></h4>
							</jst:when>
							<jst:otherwise>
								<h4 class="the-title text-center font-300"><i class="icon-141"></i> Make a Booking</h4>	
							</jst:otherwise>
						</jst:choose>
						
						<div class="dark-blue booking-form">
							<form action="/${Context_Root}/Reservation" class="row no-padding">
								<div class="col-md-2 col-sm-12">
									<select name="room-type" class="roomtype-select" value="<jst:out value='${roomTypeId}' />" >
										<option value="">Room Type </option>
											
										<jst:forEach items="${roomTypes}" var="type">
											<option value="<jst:out value='${type.roomTypeId}' />"> ${type.roomTypeName}</</option>
									</jst:forEach>
									</select>
								</div>
								<div class="col-md-2 col-sm-6">
									<i class="icon-233"></i>
									<input type="text" name="check-in" id="check-in" placeholder="Check in" value="<jst:out value='${checkInDate}' />">
								</div>
								<div class="col-md-2 col-sm-6">
									<i class="icon-233"></i>
									<input type="text" name="check-out" id="check-out"placeholder="Check out" value="<jst:out value='${checkOutDate}' />">
								</div>
								<div class="col-md-4 col-sm-12">
									<input type="text" name="number-guests" class="darken text-white" placeholder="Number of Guests" value="<jst:out value='${numberOfGuests}' />">
								</div>
								<div class="col-md-2 col-sm-12 text-right">
									<button type="submit" class="button-md green hover-dark-green soft-corners">Book Now</button>
								</div>
								<input type="hidden" id="action" name="action" value="Partial_Booking">
							</form>
						</div>
					</div>
				</div>
			</div>
		</section> <!-- /.book-form -->
		<section class="box border-bottom">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="text-dark-blue text-center fancy-heading">
							<h1 class="font-700">Facilities</h1>
							<hr class="text-dark-blue size-30 center-me">
							<p>What we can offer</p>				
						</div>
					</div>
				</div> <!-- /.row -->
				<ul class="clean-list facilities-items text-center row">
					<li class="col-md-3 col-sm-4">
						<div class="facility-item">
							<div class="shape-square aquablue">
								<figure>
									<a href="#">
										<img src="http://placehold.it/800x800" alt="facilities">
									</a>
								</figure>
							</div>
							<span class="uppercase font-300 text-white facility-text">GYM</span>					
						</div>
					</li>
					<li class="col-md-3 col-sm-4">
						<div class="facility-item">
							<div class="shape-square aquablue">
								<figure>
									<a href="#">
										<img src="http://placehold.it/800x800" alt="facilities">
									</a>
								</figure>
							</div>
							<span class="uppercase font-300 text-white facility-text">SPA</span>					
						</div>
					</li>
					<li class="col-md-3 col-sm-4">
						<div class="facility-item">
							<div class="shape-square aquablue">
								<figure>
									<a href="#">
										<img src="http://placehold.it/800x800" alt="facilities">
									</a>
								</figure>
							</div>
							<span class="uppercase font-300 text-white facility-text">Rooms</span>					
						</div>
					</li>
					<li class="col-md-3 col-sm-4">
						<div class="facility-item">
							<div class="shape-square aquablue">
								<figure>
									<a href="#">
										<img src="http://placehold.it/800x800" alt="facilities">
									</a>
								</figure>
							</div>
							<span class="uppercase font-300 text-white facility-text">Italian food</span>					
						</div>
					</li>
					<li class="col-md-3 col-sm-4">
						<div class="facility-item">
							<div class="shape-square aquablue">
								<figure>
									<a href="#">
										<img src="http://placehold.it/800x800" alt="facilities">
									</a>
								</figure>
							</div>
							<span class="uppercase font-300 text-white facility-text">Business meetings</span>					
						</div>
					</li>
					<li class="col-md-3 col-sm-4">
						<div class="facility-item">
							<div class="shape-square aquablue">
								<figure>
									<a href="#">
										<img src="http://placehold.it/800x800" alt="facilities">
									</a>
								</figure>
							</div>
							<span class="uppercase font-300 text-white facility-text">Fourchette</span>					
						</div>
					</li>
					<li class="col-md-3 col-sm-4">
						<div class="facility-item">
							<div class="shape-square aquablue">
								<figure>
									<a href="#">
										<img src="http://placehold.it/800x800" alt="facilities">
									</a>
								</figure>
							</div>
							<span class="uppercase font-300 text-white facility-text">Parking</span>					
						</div>
					</li>
				</ul>
			</div> <!-- /.container -->
		</section> <!-- /.facilities -->

		<section class="box border-bottom">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="text-dark-blue text-center fancy-heading">
							<h1 class="font-700">Rooms</h1>
							<hr class="text-dark-blue size-30 center-me">
							<p>what kind of rooms we have</p>				
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-md-12">
						<span id="controls-carousel">
							<a href="#" class="prev-nav soft-corners text-grey hover-grey" data-target="prev"><i class="icon-83"></i></a>
							<a href="#" class="next-nav soft-corners text-grey hover-grey" data-target="next"><i class="icon-90"></i></a>
						</span>
						<div id="rooms-slider" class="row">
							<ul class="clean-list rooms-items">
								<li>
									<div class="text-center">
										<h3 class="text-dark-blue"><a href="#" class="text-dark-blue hover-text-aquablue">Standard Suite</a></h3>
										<figure>
											<a href="http://placehold.it/600x600" class="zoom-image" title="Hotelia rooms" rel="gallery-1"><img src="http://placehold.it/600x600" alt="portfolio item"></a>
											<figcaption class="aquablue text-white">
												<ul class="inline-list center-me amenities">
													<li><i class="icon-326 font-13x"></i></li>
													<li><i class="icon-391 font-13x"></i></li>
													<li><i class="icon-426 font-13x"></i></li>
													<li><i class="icon-217 font-13x"></i></li>
													<li><i class="icon-219 font-13x"></i></li>
													<li><i class="icon-237 font-13x"></i></li>
												</ul>
											</figcaption>
										</figure>
										<div class="rooms-description">
											<p>
												Warm within me, that it might be the mirror of my soul, 
												as my soul is the mirror <br> of the infinite God!
											</p>
											<a href="#" class="button-md center-me grey text-black hover-orange soft-corners long-button"> <i class="icon-382"></i>View</a>
										</div>
									</div>
								</li>
								<li>
									<div class="text-center">
										<h3 class="text-dark-blue"><a href="#" class="text-dark-blue hover-text-aquablue">Standard Suite</a></h3>
										<figure>
											<a href="http://placehold.it/600x600" class="zoom-image" title="Hotelia rooms" rel="gallery-1"><img src="http://placehold.it/600x600" alt="portfolio item"></a>
											<figcaption class="aquablue text-white">
												<ul class="inline-list center-me amenities">
													<li><i class="icon-326 font-13x"></i></li>
													<li><i class="icon-391 font-13x"></i></li>
													<li><i class="icon-426 font-13x"></i></li>
													<li><i class="icon-217 font-13x"></i></li>
													<li><i class="icon-219 font-13x"></i></li>
													<li><i class="icon-237 font-13x"></i></li>
												</ul>
											</figcaption>
										</figure>
										<div class="rooms-description">
											<p>
												Warm within me, that it might be the mirror of my soul, 
												as my soul is the mirror <br> of the infinite God!
											</p>
											<a href="#" class="button-md center-me grey text-black hover-orange soft-corners long-button"> <i class="icon-382"></i>View</a>
										</div>
									</div>
								</li>
								<li>
									<div class="text-center">
										<h3 class="text-dark-blue"><a href="#" class="text-dark-blue hover-text-aquablue">Standard Suite</a></h3>
										<figure>
											<a href="http://placehold.it/600x600" class="zoom-image" title="Hotelia rooms" rel="gallery-1"><img src="http://placehold.it/600x600" alt="portfolio item"></a>
											<figcaption class="aquablue text-white">
												<ul class="inline-list center-me amenities">
													<li><i class="icon-326 font-13x"></i></li>
													<li><i class="icon-391 font-13x"></i></li>
													<li><i class="icon-426 font-13x"></i></li>
													<li><i class="icon-217 font-13x"></i></li>
													<li><i class="icon-219 font-13x"></i></li>
													<li><i class="icon-237 font-13x"></i></li>
												</ul>
											</figcaption>
										</figure>
										<div class="rooms-description">
											<p>
												Warm within me, that it might be the mirror of my soul, 
												as my soul is the mirror <br> of the infinite God!
											</p>
											<a href="#" class="button-md center-me grey text-black hover-orange soft-corners long-button"> <i class="icon-382"></i>View</a>
										</div>
									</div>
								</li>
								<li>
									<div class="text-center">
										<h3 class="text-dark-blue"><a href="#" class="text-dark-blue hover-text-aquablue">Standard Suite</a></h3>
										<figure>
											<a href="http://placehold.it/600x600" class="zoom-image" title="Hotelia rooms" rel="gallery-1"><img src="http://placehold.it/600x600" alt="portfolio item"></a>
											<figcaption class="aquablue text-white">
												<ul class="inline-list center-me amenities">
													<li><i class="icon-326 font-13x"></i></li>
													<li><i class="icon-391 font-13x"></i></li>
													<li><i class="icon-426 font-13x"></i></li>
													<li><i class="icon-217 font-13x"></i></li>
													<li><i class="icon-219 font-13x"></i></li>
													<li><i class="icon-237 font-13x"></i></li>
												</ul>
											</figcaption>
										</figure>
										<div class="rooms-description">
											<p>
												Warm within me, that it might be the mirror of my soul, 
												as my soul is the mirror <br> of the infinite God!
											</p>
											<a href="#" class="button-md center-me grey text-black hover-orange soft-corners long-button"> <i class="icon-382"></i>View</a>
										</div>
									</div>
								</li>
								<li>
									<div class="text-center">
										<h3 class="text-dark-blue"><a href="#" class="text-dark-blue hover-text-aquablue">Standard Suite</a></h3>
										<figure>
											<a href="http://placehold.it/600x600" class="zoom-image" title="Hotelia rooms" rel="gallery-1"><img src="http://placehold.it/600x600" alt="portfolio item"></a>
											<figcaption class="aquablue text-white">
												<ul class="inline-list center-me amenities">
													<li><i class="icon-326 font-13x"></i></li>
													<li><i class="icon-391 font-13x"></i></li>
													<li><i class="icon-426 font-13x"></i></li>
													<li><i class="icon-217 font-13x"></i></li>
													<li><i class="icon-219 font-13x"></i></li>
													<li><i class="icon-237 font-13x"></i></li>
												</ul>
											</figcaption>
										</figure>
										<div class="rooms-description">
											<p>
												Warm within me, that it might be the mirror of my soul, 
												as my soul is the mirror <br> of the infinite God!
											</p>
											<a href="#" class="button-md center-me grey text-black hover-orange soft-corners long-button"> <i class="icon-382"></i>View</a>
										</div>
									</div>
								</li>
							</ul> <!-- /.rooms-items -->
						</div>
					</div>
				</div>
			</div>
		</section>

		<section class="box box-discover-us" data-stellar-background-ratio="0.1">
			<div class="container">
				<div class="row">
					<div class="col-md-8 col-md-offset-2">
						<div class="text-center text-white">
							<h1 class="font-100">Be our guest</h1>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
							<br>
							<a href="http://vimeo.com/15202735" class="text-white hover-text-aquablue zoom-image" rel="vimeo">
								<i class="icon-485 font-5x"></i>
							</a>
						</div>
					</div>
				</div>
			</div>
		</section>
		
	<!-- INCLUDE FILE: Footer.jsp which includes phone, email, twiter follow links and flicker photo section at the bottom of every page -->
	<jst:import url="includes/footer.jsp"></jst:import>
	</div><!-- /.boxed-view -->
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script src="js/plugins.js"></script>
	<script src="js/options.js"></script>
</body>
</html>