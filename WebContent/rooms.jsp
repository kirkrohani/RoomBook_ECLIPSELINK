<!DOCTYPE html>
<html lang="en" class="no-js">
<%@ taglib prefix="jst" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jst:import url="includes/header.jsp" />
<body>
    <div id="home" class="boxed-view">
            <!-- /.header-bar -->
           <!-- Main Menu Bar include -->
           <jst:import url="includes/menubar.jsp" />
        <!-- /.main-nav -->

        <!-- main content -->
        <section class="box">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="text-dark-blue text-center fancy-heading">
							<h1 class="font-700">${room_sub_section}</h1>
							<hr class="text-dark-blue size-30 center-me">
							<br>			
						</div>
					</div>
				</div> <!-- /.row -->
				<jst:if test="${allowBooking eq 'true'}">
				<div class="row">
					<div class="col-md-12">
						<div class="orange">
							<ul class="inline-list filter-tags center-me">
							<jst:forEach items="${roomTypes}" var="type">
								<li>
									<a href="Room?action=Filter&roomType=${type.roomTypeId}" class="text-white hover-text-orange"><jst:out value="${type.roomTypeName}" /></a>
								</li>
								</jst:forEach>
							</ul>
						</div>
						<br>
					</div>
				</div> <!-- /.row -->
				</jst:if>

				<ul class="clean-list rooms-items row">
					<jst:set var="increment" value="9"/>
					<jst:set var="pageNum" value="${param.page}" />
					<jst:if test="${pageNum eq null or empty param.page }">
						<jst:set var="pageNum" value="1" />
					</jst:if>
					<jst:set var="end" value="${pageNum*increment-1}" />
					<jst:set var="start" value="${end-increment+1}" />
					<jst:forEach items="${rooms}" var="room" begin="${start}" end="${end}">
					<li class="col-md-4 col-sm-6">
						<div class="text-center">
							<h3 class="text-dark-blue"><a href="?page=room-preview" class="text-dark-blue hover-text-aquablue">Room #<jst:out value="${room.roomId}" /> <br> <jst:out value="${room.roomType.roomTypeName}" /> </a></h3>
							<figure>
								<a href="img/rooms/one.jpg" class="zoom-image" title="Hotelia rooms" rel="gallery-1"><img src="img/rooms/one.jpg" alt="portfolio item"></a>
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
							<jst:if test="${allowBooking eq 'true'}">
							<div class="rooms-description">
								<p>
									<jst:out value="${room.roomDescription}"></jst:out>
								</p>
								<div class="rooms-footer clearfix">
									
									<span class="to-left align-button">Price: <b class="text-aquablue font-13x font-300"> $<jst:out value="${room.price}"></jst:out></b></span>
									<a href="Reservation?roomId=${room.roomId}&action=New" class="button-sm to-right grey text-black hover-orange soft-corners">Book now</a>
								</div>
							</div>
							</jst:if>
						</div>
					</li>
					</jst:forEach>
				</ul> <!-- /.row -->
				<div class="row">
					<div class="col-md-12">
						<ul class="inline-list center-me pagination-links">
							<jst:set var="totalPages" value="${fn:substringBefore(fn:length(rooms) div increment, '.')}" />
							<jst:if test="${pageNum >= 2 }">
								<li><a href="rooms.jsp?page=${pageNum-1}">Prev</a></li>
							</jst:if>
							<jst:forEach begin="1" end="${totalPages}" var="pageNavi">
								<li><a href="rooms.jsp?page=${pageNavi}">${pageNavi}</a></li>
							</jst:forEach>
							<jst:if test="${totalPages >= 2 }">
								<li><a href="rooms.jsp?page=${pageNum+1}">Next</a></li>
							</jst:if>
						</ul>
					</div>
				</div> <!-- /.row -->
			</div> <!-- /.container -->
		</section> <!-- /.box -->
        
		<jst:import url="/includes/footer.jsp" />
	</div><!-- /.boxed-view -->
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script src="js/plugins.js"></script>
	<script src="js/options.js"></script>
</body>
</html>