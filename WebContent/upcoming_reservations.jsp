<!DOCTYPE html>
<html lang="en" class="no-js">
<%@ taglib prefix="jst" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jst:import url="/includes/header.jsp" />

<body>
    <div id="home" class="boxed-view">
      	<jst:import url="/includes/menubar.jsp" />
        <!-- /.main-nav -->

        <!-- main content -->
        <section class="box">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="text-dark-blue text-center fancy-heading">
							<h1 class="font-700">Upcoming Reservations</h1>
							<hr class="text-dark-blue size-30 center-me">
							<br>			
						</div>
					</div>
				</div> <!-- /.row -->
				<section>
					<div class="container">
						<div class="row">
							<div class="col-md-12">
								<div class="grey booking-form">
									<form action="Reservation" class="row no-padding">
										<div class="col-md-2">
											<select name="room-type" class="roomtype-select" >
												<option value="">Room Type </option>
													
												<jst:forEach items="${roomTypes}" var="type">
													<jst:choose>
														<jst:when test="${roomTypeId eq type.roomTypeId}">
															<jst:set var="selectedItem" value="selected" />
														</jst:when>
														<jst:otherwise>
															<jst:set var="selectedItem" value="" />
														</jst:otherwise>
													</jst:choose>
													<option value="<jst:out value='${type.roomTypeId}' />" ${selectedItem}> ${type.roomTypeName}</</option>
												</jst:forEach>
											</select>
		
										</div>
										<div class="col-md-2">
										
											<select name="month-of-stay" class="roomtype-select"  >
													<option value="">Month Stayed</option>
													<jst:forEach items="${months_list}" var="month" varStatus="month_number">
														<jst:choose>
															<jst:when test="${monthOfStay eq month_number.count}">
																<jst:set var="monthSelected" value="selected" />
															</jst:when>
															<jst:otherwise>
																<jst:set var="monthSelected" value="" />
															</jst:otherwise>
														</jst:choose>
														<option value="${month_number.count}" ${monthSelected}> <jst:out value="${month}" /></option>
													</jst:forEach>
												</select>
										</div>
										<div class="col-md-2">
												<select name="year-of-stay" class="roomtype-select"  >
													<option value="">Year  Stayed</option>
													<jst:forEach items="${years_list}" var="year">
														<jst:choose>
															<jst:when test="${yearOfStay eq year}">
																<jst:set var="yearSelected" value="selected" />
															</jst:when>
															<jst:otherwise>
																<jst:set var="yearSelected" value="" />
															</jst:otherwise>
														</jst:choose>
														<option value="${year}" ${yearSelected}> <jst:out value="${year}" /></option>
														
													</jst:forEach>
												</select>
										</div>
										<div class="col-md-2">
											<input type="text" name="first-name" id="first-name" placeholder="First Name" value=${firstName}>
		
										</div>
										<div class="col-md-2">
											<input type="text" name="last-name" id="last-name" placeholder="Last Name" value=${lastName}>
		
										</div>
										<div class="col-md-2 text-right">
											<input type="hidden" name="action" value="Filter" />
											<button type="submit" class="button-md green hover-dark-green soft-corners">Search </button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</section> <!-- /.search-form -->
				
				<div class="row">
					<div class="col-md-12">
						<div class="text-dark-blue text-center fancy-heading">
						<h1 class="text-center font-100 font-3x text-green"><span class="white">  <jst:out value="${search_name}" /></span></h1>
							<hr class="text-dark-blue size-30 center-me">
							<p><jst:out value="${search_description}" /></p>
							<br>			
						</div>
					</div>
				</div> <!-- /.row -->
				<ul class="clean-list timeline-items">
				<jst:forEach items="${upcoming_reservations }" var="reservation" varStatus="counter">
					<jst:if test="${counter.count  eq 1 }">
						<li>
							<div class="row">
					</jst:if>
								<div class="col-md-6">
									<div class="timeline-item">
										<span class="text-orange font-13x"><a href=Reservation?action=Details&reservationId=${reservation.reservationId }>Reservation id   : <jst:out value="${reservation.reservationId }" /> : </a></span>
										<h3 class="text-dark-blue"><jst:out value="${reservation.guest.firstName }" />  <jst:out value="${reservation.guest.lastName }" /></h3>
										<p>Check in <fmt:formatDate value="${reservation.checkIn }" /></p>
										<p>Check out  <fmt:formatDate value="${reservation.checkOut }" /> </p>
										<p>Room number: <jst:out value="${reservation.room.roomId }" /> </p>
									</div>
									<div class="rooms-footer clearfix">
										<a href="Reservation?roomId=${room.roomId}&action=New" class="button-sm to-left grey text-black hover-orange soft-corners">Check in</a>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="Reservation?roomId=${room.roomId}&action=New" class="button-sm grey text-black hover-orange soft-corners">Modify</a>
										<a href="Reservation?roomId=${room.roomId}&action=New" class="button-sm to-right grey text-black hover-orange soft-corners">Cancel</a>
									</div>
								</div>			
						<jst:if test="${(counter.count mod 2) eq 0}">
							</div>
						</li>
						<li>
							<div class="row">
						</jst:if>
				</jst:forEach>
				</ul>
			</div> <!-- /.container -->
		</section> <!-- /.box -->
        
		<jst:import url="/includes/footer.jsp" />
	</div><!-- /.boxed-view -->
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script src="js/plugins.js"></script>
	<script src="js/options.js"></script>
</body>
</html>