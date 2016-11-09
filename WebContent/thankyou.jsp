<!DOCTYPE html>
<html lang="en" class="no-js">
<%@ taglib prefix="jst" uri="http://java.sun.com/jsp/jstl/core" %>
<jst:import url="/includes/header.jsp" />
<body>
    <div id="home" class="boxed-view">
        <jst:import url="/includes/menubar.jsp" />
        <!-- /.main-nav -->
		<form name="booking" method="post" action="Booking"> 
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
						<div class="text-center nav-step" data-target="2">
							<span></span>
							<h4 class="font-100">01. Booking Info</h4>
						</div>
					</div>
					<div class="col-md-3 col-sm-3 col-xs-3">
						<div class="text-center nav-step" data-target="3">
							<span></span>
							<h4 class="font-100">02. Personal Info</h4>
						</div>
					</div>
					<div class="col-md-3 col-sm-3 col-xs-3">
						<div class="text-center nav-step" data-target="4">
							<span></span>
							<h4 class="font-100">03. Payment Info</h4>
						</div>
					</div>
					<div class="col-md-3 col-sm-3 col-xs-3">
						<div class="text-center nav-step" data-target="1">
							<span></span>
							<h4 class="font-100">04. Complete</h4>
						</div>
					</div>
				</div>
				<div class="booking-slider">
					<ul class="clean-list">
						<li>
							<div class="row">
								<div class="col-md-4">
									<table>
										<tbody>
											<tr>
												<td>Room:</td>
												<td class="text-right">30 night x <span class="text-orange">49$</span></td>
											</tr>
											<tr>
												<td>Additinal fee:</td>
												<td class="text-right text-orange">119$</td>
											</tr>
											<tr>
												<td class="uppercase font-500 text-green">Grand-total:</td>
												<td class="text-right text-orange">1589$ <span class="text-green">(Paid)</span></td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="col-md-8">
									<div class="alert-box green">
										<h4 class="text-white">Your reservation was succefull submited!</h4>
									</div>
									<p>
										Lorem ipsum dolor sit amet, consectetur adipisicing elit. Excepturi dicta commodi officia unde esse enim repellat ipsa quae omnis error numquam!
									</p>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<a href="#" class="button-md grey text-dark hover-orange" data-target="prev">About Hotelia</a>
								</div>
							</div>
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