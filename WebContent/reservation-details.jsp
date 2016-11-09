<!DOCTYPE html>
<html lang="en" class="no-js">
<%@ taglib prefix="jst" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jst:import url="includes/header.jsp" />

<body>
    <div id="home" class="boxed-view">
       <!-- INCLUDE FILE: header.jsp which includes header shortcode area(email/phone) and main navigation bar -->
		<jst:import url="includes/menubar.jsp" />
        <!-- /.main-nav -->

        <!-- main content -->
        <section class="box">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="text-dark-blue text-center fancy-heading">
							<h1 class="font-700">Detailed Booking Information</h1>
							<hr class="text-dark-blue size-30 center-me">			
						</div>
					</div>
				</div> <!-- /.row -->
			
               <!-- main content -->
        <section class="box">
			<div class="container">
				<div class="row booking-nav">
					<div class="col-md-1 col-sm-1 col-xs-1">
						<div class="text-center nav-step" data-target="4">
						</div>
					</div>
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
						</div>
					</div>
				</div>
				<div class="booking-slider">
					<ul class="clean-list">
						<li>
						<div class="grey booking-info">
						
						<div class="col-md-12">
							<div class="row">
								<div class="alert-box green">
									<h4 class="text-white">Guest Stay Summary</h4>
								</div>
							</div>
						</div><br>
							<div class="row">
							
								<div class="col-md-12">
										<div class="row">
											<div class="col-md-2 col-sm-3">
												<figure>
													<a href="#" class="zoom-image">
														<img src="img/rooms/one.jpg" alt="">
													</a>
												</figure>
											</div>
											<div class="col-md-10 col-sm-9">
												<h3 class="blog-title text-dark-blue font-300"> Reservation <jst:out value="${reservation.reservationId }" /> (<span class="text-orange">Room #<jst:out value="${reservation.room.roomId }" /></span>)</h3>
											</div>
											
										</div>
										
								</div>
								</div>
								<br><br>
								<div class="row">
									<div class="col-md-12">
										<div class="col-md-5">
												<table>
												<tbody>
													<tr>
														<td>Primary Guest</td>
														
														<td class="text-right"><span class="text-orange">  <jst:out value=" ${reservation.guest.firstName} " /> <jst:out value="  ${reservation.guest.lastName } " />  </span></td>
													</tr>
													<tr>
														<td>Total # Guests</td>
														<td class="text-right text-orange"><jst:out value="${reservation.numOfGuests }" /> </td>
													</tr>
													<tr>
														<td>Room Type</td>
														<td class="text-right text-orange"><jst:out value="${reservation.room.roomType.roomTypeName }" /> </td>
													</tr>
												</tbody>
											</table>
										</div>
										<br><br>
									</div>
								</div>
								<br>
								<div class="row">
									<div class="col-md-12">
										<div class="col-md-5" >
												<table>
												<tbody>
													<tr>
														<td>Check In</td>
														<td class="text-right"><span class="text-orange"><fmt:formatDate value="${reservation.checkIn }"/></span></td>
													</tr>
													<tr>
														<td>Check Out</td>
														<td class="text-right text-orange"><fmt:formatDate value="${reservation.checkOut }"/></td>
													</tr>
													<tr>
														<td>Room Price</td>
														<td class="text-right text-orange">$<jst:out value="${reservation.room.price }" /> / night</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
								<br>
								<div class="row">
									<div class="col-md-12">
										<div class="col-md-5">
											<table>
												<tbody>
													<tr>
														<td>Total Duration of Stay:</td>
														<td class="text-right"><jst:out value="${duration}" /> nights x <span class="text-orange">$<jst:out value="${reservation.room.price }" /></span></td>
													</tr>
													<tr>
														<td>Additional charges</td>
														<td class="text-right text-orange">$<jst:out value="${ reservation.room.price}" /></td>
													</tr>
													<tr>
														<td class="uppercase font-500 text-green">Total Charges</td>
														<td class="text-right text-orange">$${reservation.room.price * duration } <span class="text-green">(Paid)</span></td>
													</tr>
												</tbody>
											</table>
										</div>
										<div class="col-md-11">
										<br><br>
											<p class="clearfix">
												<a href="#" class="button-md green to-right hover-dark-green nav-step" data-target="next">Guest Details</a>
											</p>
										</div>
									</div> 
								</div>
						</li>

						<li>
							<div class="row">
							<!-- Open form tag here **-->
								<div class="col-md-6">							
										<p>
											<input type="text" name="firstName" placeholder="First name" value="<jst:out value='${reservation.guest.firstName }' />" readonly >
										</p>
										<p>
											<input type="text" name="lastName" placeholder="Last name" value="<jst:out value='${reservation.guest.lastName }' />" readonly >
										</p>
										<p>
											<input type="email" name="email" placeholder="E-mail"value="<jst:out value='${reservation.guest.email }' />" readonly  >
										</p>
										<p>
											<input type="tel" name="address" placeholder="Address" value="<jst:out value='${reservation.guest.address }' />" readonly >
										</p>
										<p>
											<input type="tel" name="phone" placeholder="Telephone Number" value="<jst:out value='${reservation.guest.phone }' />" readonly >
										</p>
										<p>
											<input type="tel" name="zip" placeholder="Zip Code" value="<jst:out value='${reservation.guest.zipcode }' />" readonly >
										</p>
								</div>
								
								<div class="col-md-6">
									<div class="row">
										<jst:if test="${reservation.earlyCheckIn eq true}"><jst:set var="earlyCheckInButton" value="checked"/></jst:if>
										<div class="col-md-6">
											<p>
												<label class="check-fancy white round-corners">
													<b>Yes</b>
													<input type="checkbox" name="earlyCheckIn" disabled <jst:out value="${earlyCheckInButton}" /> >
													<span class="round-corners green"></span>
													<b>No</b>
												</label>
												<span>Early Check In</span>
											</p>
										</div>
										<jst:if test="${reservation.lateCheckOut eq true}"><jst:set var="lateCheckOutButton" value="checked"/></jst:if>
										<div class="col-md-6">
											<p>
												<label class="check-fancy white round-corners">
													<b>Yes</b>
													<input type="checkbox" name="lateCheckOut" disabled <jst:out value="${lateCheckOutButton}" /> >
													<span class="round-corners green"></span>
													<b>No</b>
												</label>
												<span>Late Check Out</span>
											</p>
										</div>
									</div>
									<jst:if test="${reservation.smokingRoomRequested eq true}"><jst:set var="smokingRoomButton" value="checked"/></jst:if>
									<div class="row">
										<div class="col-md-12">
											<p>
												<label class="check-fancy white round-corners">
													<b>Yes</b>
													<input type="checkbox" name="smokingRoom" disabled <jst:out value="${smokingRoomButton}" /> >
													<span class="round-corners green"></span>
													<b>No</b>
												</label>
												<span>Smoking Room</span>
											</p>
										</div>
									</div>
									<jst:if test="${reservation.pets eq true}"><jst:set var="petsButton" value="checked"/></jst:if>
									<div class="row">
										<div class="col-md-6">
											<p>
												<label class="check-fancy white round-corners">
													<b>Yes</b>
													<input type="checkbox" name="travelingWithPets" disabled <jst:out value="${petsButton}" />>
													<span class="round-corners green"></span>
													<b>No</b>
												</label>
												<span>Travel with pets</span>
											</p>
										</div>
										<jst:if test="${reservation.parking eq true}"><jst:set var="parkingButton" value="checked"/></jst:if>
										<div class="col-md-6">
											<p>
												<label class="check-fancy white round-corners">
													<b>Yes</b>
													<input type="checkbox" name="needsParking" disabled <jst:out value="${parkingButton}" />>
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
												<jst:choose>
												<jst:when test="${month eq null}">
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
													</jst:when>
													<jst:otherwise>
														<input type="text" name="DOBmonth" placeholder="Month" readonly value="<jst:out value='${month}' />" >
													</jst:otherwise>
												</jst:choose>
											</p>
										</div>
										<div class="col-md-4">
											<p>
												<input type="text" name="DOBday" placeholder="Day" readonly value="<jst:out value='${day}' />" >
											</p>
										</div>
										<div class="col-md-4">
											<p>
												<input type="text" name="DOByear" placeholder="Year" readonly value="<jst:out value='${year}' />" >
											</p>
										</div>
									</div>
									<br><br>
									<div class="row">
										<p>
											<textarea name="notes" cols="30" rows="4" placeholder="Notes and special requests" readonly><jst:out value="${reservation.specialRequests}"/></textarea>
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
										<a href="#" class="button-md green hover-dark-green nav-step" data-target="next">Payment Details</a>
									</p>
								</div>
							</div>
							<!--  close form tag here ** -->
						</li>

						<li>
							<div class="row">
								<form action="#">
								<div class="col-md-6">
									<h3 class="font-300">Payment method</h3>
									<ul class="inline-list payment-method">
										<li>
											<label>
												<input type="radio" name="payment" disabled>
												<img src="http://placehold.it/64x40" alt="payment method">
											</label>
										</li>
										<li>
											<label>
												<input type="radio" name="payment" disabled>
												<img src="http://placehold.it/64x40" alt="payment method">
											</label>
										</li>
										<li>
											<label>
												<input type="radio" name="payment" disabled>
												<img src="http://placehold.it/64x40" alt="payment method">
											</label>
										</li>
										<li>
											<label>
												<input type="radio" name="payment" disabled>
												<img src="http://placehold.it/64x40" alt="payment method">
											</label>
										</li>
									</ul>
								</div>
								<div class="col-md-6">							
									<p>
										<input type="text" name="firstName" placeholder="Cardholder name" readonly>
									</p>
									<p>
										<input type="text" name="lastName" placeholder="Credit Card Number" readonly>
									</p>
									<div class="row">
										<div class="col-md-4">
											<p>
												<input type="email" name="cardExpireDate" placeholder="Expiration Date" readonly>
											</p>
										</div>
										<div class="col-md-4">
											<p>
												<input type="email" name="cardExpireYear" placeholder="Expiration Year" readonly>
											</p>
										</div>
									</div>
									<div class="row">
										<div class="col-md-4">
											<p>
												<input type="text" name="cardCvv" placeholder="CVV" readonly>
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
									<a href="#" class="button-md green hover-orange nav-step" data-target="prev">Back</a>
								</div>
								<div class="col-md-6 col-xs-6">
									<p class="text-right">
									</p>
								</div>
							</div>
							</form>
						</li>
					</ul>
				</div>
			</div> <!-- /.container -->
		</section> <!-- /.box -->
			</div> <!-- /.container -->
		</section> <!-- /.box -->
        
		<footer class="main-footer">
			<!-- Footer widgets -->
			<div class="big-footer box darken-less">
				<div class="container">
					<div class="footer-sidebar row">

						<div class="col-md-4 col-sm-6 widget">
							<figure>
								<a href="#">
									<img src="img/logo-corp.png" alt="logo footer">
								</a>
							</figure>
							<p>
								Lorem ipsum dolor sit amet, consectetur adipisicing elit. Necessitatibus a incidunt, amet illum maiores nihil. Nihil repellat dolorum fugit doloribus earum!
							</p>

							<ul class="clean-list contact-info text-dark-blue uppercase">
								<li><i class="icon-338 font-2x"></i> <b>Address: </b> West bridge, LA,  New York 225 of 254/5A</li>
								<li><i class="icon-274 font-2x"></i> <b>E-mail: </b> <a href="mailto:otelia@gmail.com">otelia@gmail.com</a></li>
								<li><i class="icon-274 font-2x"></i> <b>E-mail: </b> <a href="mailto:hotelia@gmail.com">hotelia@gmail.com</a></li>
								<li><i class="icon-402 font-2x"></i> <b>Phone: </b> (001) 777 555 888</li>
								<li><i class="icon-402 font-2x"></i> <b>Phone: </b> (001) 777 555 999</li>
							</ul>
						</div>
						
						<div class="col-md-4 col-sm-6 widget post-widget">
							<h4>Follow Hotelia</h4>
							<ul class="inline-list social-links">
								<li>
									<a href="#" class="social-facebook shape-square font-2x soft-corners"><i class="icon-528"></i></a>
								</li>
								<li>
									<a href="#" class="social-twitter shape-square font-2x soft-corners"><i class="icon-556"></i></a>
								</li>
								<li>
									<a href="#" class="social-foursquare shape-square font-2x soft-corners"><i class="icon-530"></i></a>
								</li>
								<li>
									<a href="#" class="social-pinterest shape-square font-2x text-white soft-corners"><i class="icon-545"></i></a>
								</li>
							</ul>
							<div class="subscribe-wrapper">
								<form action="#" class="subscribe-form row">
									<div class="col-md-12">
										<h4>Newsletter Subscribe</h4>
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Assumenda inventore ex laborum numquam at iusto facere.</p>
									</div>
									<p class="col-md-12">
										<input type="text" name="subscribe">
									</p>
									<p class="col-md-12">
										<button type="submit" class="button-md green hover-dark-green full-size">Submit</button>
									</p>
								</form>
							</div>							
						</div>
						<div class="col-md-4 col-sm-12 widget">
							<h4>Flickr Photo</h4>
							<ul class="flickr-widget clean-list row" data-userid="36587311@N08" data-items="6">
							</ul>
							<div class="usefull-links">
								<h4>Usefull link</h4>
								<ul class="">
									<li class="col-md-4 col-sm-4 col-xs-6">
										<a href="#">About us</a>
									</li>
									<li class="col-md-4 col-sm-4 col-xs-6">
										<a href="#">Help Center</a>
									</li>
									<li class="col-md-4 col-sm-4 col-xs-6">
										<a href="#">Careers</a>
									</li>
									<li class="col-md-4 col-sm-4 col-xs-6">
										<a href="#">Global Sites</a>
									</li>
									<li class="col-md-4 col-sm-4 col-xs-6">
										<a href="#">Privacy</a>
									</li>
									<li class="col-md-4 col-sm-4 col-xs-6">
										<a href="#">Travel</a>
									</li>
									<li class="col-md-4 col-sm-4 col-xs-6">
										<a href="#">Affiliate </a>
									</li>
									<li class="col-md-4 col-sm-4 col-xs-6">
										<a href="#">Businesses</a>
									</li>
									<li class="col-md-4 col-sm-4 col-xs-6">
										<a href="#">Contact Support</a>
									</li>
									<li class="col-md-4 col-sm-4 col-xs-6">
										<a href="#">Shopping </a>
									</li>
									<li class="col-md-4 col-sm-4 col-xs-6">
										<a href="#">Site Map</a>
									</li>
									<li class="col-md-4 col-sm-4 col-xs-6">
										<a href="#">Investor Relations</a>
									</li>
								</ul>
							</div>
						</div>
					</div><!-- /.row -->
				</div><!-- /.container -->
			</div><!-- /.big-footer -->
			<!-- Copyright section -->
			<div class="small-footer">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<p class="copyright center-me uppercase font-small">
								<span>copyright 2013</span>
								<a href="#">hotelia</a>
								<span> designed by</span>
								<a href="http://teslathemes.com">Teslathemes</a>	
							</p>
						</div>
					</div> <!-- /.row -->
				</div>			
			</div><!-- /.small-footer -->			
		</footer><!-- /.main-footer -->
	</div><!-- /.boxed-view -->
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script src="js/plugins.js"></script>
	<script src="js/options.js"></script>
</body>
</html>