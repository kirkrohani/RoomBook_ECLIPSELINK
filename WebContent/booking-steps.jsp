<!DOCTYPE html>
<html lang="en" class="no-js">
<%@ taglib prefix="jst" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jst:import url="/includes/header.jsp" />
<body>
    <div id="home" class="boxed-view">
        <jst:import url="/includes/menubar.jsp" />
        <!-- /.main-nav -->
		<form name="booking" method="post" action="Reservation"> 
        <!-- main content -->
        <section class="box">
        
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="text-dark-blue text-center fancy-heading">
							<h1 class="font-700">Book now</h1>
							<hr class="text-dark-blue size-30 center-me">
							<br>			
						</div>
					</div>
				</div> <!-- /.row -->

				<div class="row booking-nav">
					<div class="col-md-3 col-sm-3 col-xs-3">
						<div class="text-center nav-step" data-target="1">
							<span></span>
							<h4 class="font-100">01. Booking Info</h4>
						</div>
					</div>
					<div class="col-md-3 col-sm-3 col-xs-3">
						<div class="text-center nav-step" data-target="2">
							<span></span>
							<h4 class="font-100">02. Personal Info</h4>
						</div>
					</div>
					<div class="col-md-3 col-sm-3 col-xs-3">
						<div class="text-center nav-step" data-target="3">
							<span></span>
							<h4 class="font-100">03. Payment Info</h4>
						</div>
					</div>
					<div class="col-md-3 col-sm-3 col-xs-3">
						<div class="text-center nav-step" data-target="4">
							<span></span>
							<h4 class="font-100">04. Complete</h4>
						</div>
					</div>
				</div>
				<div class="booking-slider">
					<ul class="clean-list">
						<li>
							<div class="row">
								<div class="col-md-12">
									<div class="grey booking-info">
										<div class="row">
											<div class="col-md-2 col-sm-3">
												<figure>
													<a href="#" class="zoom-image">
														<img src="img/rooms/one.jpg" alt="">
													</a>
												</figure>
											</div>
											<div class="col-md-10 col-sm-9">
												<h3 class="blog-title text-dark-blue font-300"><jst:out value=" ${room.roomType.roomTypeName} - #${room.roomId}" /> (<span class="text-orange"><jst:out value="$${room.price}/night" /></span>)</h3>
												<ol class="inline-list tag-list font-small">
													<li>
														<a href="#" class="button-sm green text-white hover-green hover-text-white">SPA</a>
													</li>
													<li>
														<a href="#" class="button-sm green text-white hover-green hover-text-white">GYM</a>
													</li>
													<li>
														<a href="#" class="button-sm green text-white hover-green hover-text-white">WI-FI</a>
													</li>
													<li>
														<a href="#" class="button-sm green text-white hover-green hover-text-white">TV</a>
													</li>
													<li>
														<a href="#" class="button-sm green text-white hover-green hover-text-white">Parking</a>
													</li>
												</ol>
												<div class="grey booking-form">
													<!-- open form tag here ** -->
														<div class="col-md-3">
															<i class="icon-233"></i><input type="text"  id="check-in" name="check-in" placeholder="Check In" value="<fmt:formatDate value='${reservation.checkIn}' pattern='MM-dd-yyyy' />" >
														</div>
														<div class="col-md-3">
															<i class="icon-233"></i>
															<input type="text" id="check-out" name="check-out" placeholder="Check Out" value="<fmt:formatDate value='${reservation.checkOut}' pattern='MM-dd-yyyy' />">
														</div>
														<div class="col-md-2">
														</div>
														<div class="col-md-2">
															<i class="icon-201"></i>
															<input type="text" name="adults" class="room-select" placeholder="Adults" value="${reservation.numOfGuests}">
															<ul class="clean-list font-small">
																<li>1</li>
																<li>2</li>
																<li>3</li>
																<li>4</li>
															</ul>
														</div>
														<div class="col-md-2">
															<i class="icon-201"></i>
															<input type="text"  name="children" class="room-select" placeholder="Children" >
															<ul class="clean-list font-small">
																<li>0</li>
																<li>1</li>
																<li>2</li>
																<li>3</li>
																<li>4</li>
															</ul>

														</div>
													 <!-- form tag here ** -->
												</div>
											</div>
										</div>
									</div>
								</div>
						
								<div class="col-md-12">
									<p>
										<jst:out value="${room.roomDescription}" />
									</p>
									<p>
										<label class="radio-fancy">
											<input type="radio" name="terms">
											<span class="light-blue round-corners"><i class="darken round-corners"></i></span>
											<em>I read and accept the terms & conditions</em>
										</label>
									</p>
									
								</div>
								<div class="col-md-4">
									
								</div>
							</div> <!-- /.row -->
							<div class="col-md-12">
									<p class="clearfix">
										<a href="#" class="button-md green to-right hover-dark-green nav-step" data-target="next">Next</a>
									</p>
								</div>
						</li>

						<li>
							<div class="row">
							<!-- Open form tag here **-->
								<div class="col-md-6">							
										<p>
											<input type="text" name="firstName" placeholder="First name">
										</p>
										<p>
											<input type="text" name="lastName" placeholder="Last name">
										</p>
										<p>
											<input type="email" name="email" placeholder="E-mail">
										</p>
										<p>
											<input type="tel" name="address" placeholder="Address">
										</p>
										<p>
											<input type="tel" name="phone" placeholder="Telephone Number">
										</p>
										<p>
											<input type="tel" name="zip" placeholder="Zip Code">
										</p>
								</div>
								
								<div class="col-md-6">
									<div class="row">
										<div class="col-md-6">
											<p>
												<label class="check-fancy white round-corners">
													<b>Yes</b>
													<input type="checkbox" name="earlyCheckIn">
													<span class="round-corners green"></span>
													<b>No</b>
												</label>
												<span>Early Check In</span>
											</p>
										</div>
										<div class="col-md-6">
											<p>
												<label class="check-fancy white round-corners">
													<b>Yes</b>
													<input type="checkbox" name="lateCheckOut">
													<span class="round-corners green"></span>
													<b>No</b>
												</label>
												<span>Late Check Out</span>
											</p>
										</div>
									</div>
									<div class="row">
										<div class="col-md-12">
											<p>
												<label class="check-fancy white round-corners">
													<b>Yes</b>
													<input type="checkbox" name="smokingRoom">
													<span class="round-corners green"></span>
													<b>No</b>
												</label>
												<span>Smoking Room</span>
											</p>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<p>
												<label class="check-fancy white round-corners">
													<b>Yes</b>
													<input type="checkbox" name="travelingWithPets">
													<span class="round-corners green"></span>
													<b>No</b>
												</label>
												<span>Travel with pets</span>
											</p>
										</div>
										<div class="col-md-6">
											<p>
												<label class="check-fancy white round-corners">
													<b>Yes</b>
													<input type="checkbox" name="needsParking">
													<span class="round-corners green"></span>
													<b>No</b>
												</label>
												<span>Need parking</span>
											</p>
										</div>
									</div>
									<br>
									<div class="row">
										<div class="col-md-6">
												<p>
													Date of Birth
												</p>
										</div>
									</div>	
									<div class="row">
										<div class="col-md-4">
											<p>
												<select name="DOBmonth" class="roomtype-select"  >
													<option value="">Month</option>
														<option value="Jan"> January</option>
														<option value="Feb"> February</option>
														<option value="Mar"> March</option>
														<option value="Apr"> April</option>
														<option value="May"> May</option>
														<option value="Jun"> June</option>
														<option value="Jul"> July</option>
														<option value="Aug"> August</option>
														<option value="Sep"> September</option>
														<option value="Oct"> October</option>
														<option value="Nov"> November</option>
														<option value="Dec"> December</option>
												</select>
											</p>
										</div>
										<div class="col-md-4">
											<p>
												<input type="text" name="DOBday" placeholder="Day">
											</p>
										</div>
										<div class="col-md-4">
											<p>
												<input type="text" name="DOByear" placeholder="Year">
											</p>
										</div>
									</div>
									<br>
									<div class="row">
										<p>
											<textarea name="notes" cols="30" rows="4" placeholder="Notes and special requests"></textarea>
										</p>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6 col-xs-6">
									<a href="#" class="button-md grey text-dark hover-orange nav-step" data-target="prev">Back</a>
								</div>
								<div class="col-md-6 col-xs-6">
									<p class="text-right">
										<a href="#" class="button-md green hover-dark-green nav-step" data-target="next">Next</a>
									</p>
								</div>
							</div>
							<!--  close form tag here ** -->
						</li>

						<li>
							<div class="row">
								<!-- open form tag here ** -->
								<div class="col-md-6">
									Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quia voluptatem laborum magni facilis officiis vel accusantium sed hic cumque quis id a nihil dicta, dignissimos blanditiis tempore quidem tenetur culpa!
									<h3 class="font-300">Select Payment method</h3>
									<ul class="inline-list payment-method">
										<li>
											<label>
												<input type="radio" name="payment">
												<img src="http://placehold.it/64x40" alt="payment method">
											</label>
										</li>
										<li>
											<label>
												<input type="radio" name="payment">
												<img src="http://placehold.it/64x40" alt="payment method">
											</label>
										</li>
										<li>
											<label>
												<input type="radio" name="payment">
												<img src="http://placehold.it/64x40" alt="payment method">
											</label>
										</li>
										<li>
											<label>
												<input type="radio" name="payment">
												<img src="http://placehold.it/64x40" alt="payment method">
											</label>
										</li>
									</ul>
								</div>
								<div class="col-md-6">							
									<p>
										<input type="text" name="f_name" placeholder="Cardholder name">
									</p>
									<p>
										<input type="text" name="l_name" placeholder="Credit Card Number">
									</p>
									<div class="row">
										<div class="col-md-4">
											<p>
												<input type="email" name="email" placeholder="Expiration Date">
											</p>
										</div>
										<div class="col-md-4">
											<p>
												<input type="email" name="email" placeholder="Expiration Year">
											</p>
										</div>
									</div>
									<div class="row">
										<div class="col-md-4">
											<p>
												<input type="text" name="tel" placeholder="CVV">
											</p>
										</div>

										<div class="col-md-8">
											<a href="#" class="button-md no-shadow text-blue hover-text-green">Card Identification Number?</a>
										</div>
									</div>
									<br>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6 col-xs-6">
									<a href="#" class="button-md grey text-dark hover-orange nav-step" data-target="prev">Back</a>
								</div>
								<div class="col-md-4 col-xs-4">
									<p class="text-right">
										<input type="hidden" id="action" name="action" value="Submit">
										<input type="hidden" id="roomId" name="roomId" value="${room.roomId}" >
										<input type="submit" name="submit" class="button-md green hover-dark-green" value="Confirm and Pay" >
									</p>
								</div>
							</div>
							<!-- Final form tag here ** -->
							
						</li>
					</ul>
				</div>
			</div> <!-- /.container -->
		</section> <!-- /.box -->
		</form> 
		
		<jst:import url="/includes/footer.jsp" />
	</div><!-- /.boxed-view -->
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script src="js/plugins.js"></script>
	<script src="js/options.js"></script>
</body>
</html>