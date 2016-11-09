 <%@ taglib prefix="jst" uri="http://java.sun.com/jsp/jstl/core" %>
        <header class="main-header clearfix">
            <!-- Header Shorcode Area -->
            <div class="header-bar">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6 col-sm-8">
                            <ul class="inline-list uppercase font-small header-meta">
                                <li><i class="icon-312 font-13x"></i> Dallas, Texas 75001 </li>
                                <li><i class="icon-274 font-13x"></i> kirk.rohani@gmail.com</li>
                            </ul>
                        </div>

                        <div class="col-md-6 col-sm-4">
                            <ul class="inline-list to-right header-social">
                                <li><a href="#"><i class="icon-528"></i></a>
                                </li>
                                <li><a href="#"><i class="icon-556"></i></a>
                                </li>
                                <li><a href="#"><i class="icon-537"></i></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.header-bar -->
            <div class="nav-bar sticky-bar grey">
                <!-- .mega-menu helper class ued as switcher -->
                <div class="container">
                    <div class="row">
                        <div class="col-md-4 col-xs-8">
                            <!-- Logo Area -->
                            <figure class="identity">
                                <a href="/${Context_Root}/Lobby">
                                    <img src="img/roombooklogo.png" alt="RoomBook logo missing">
                                </a>
                            </figure>
                        </div>
                        <!-- /.col-md-2 -->
                        <div class="col-md-8 col-xs-4">
                            <!-- Menu Area -->
                            <nav class="main-nav clearfix">
                                <!-- .mega-menu helper class ued as switcher -->
                                <ul class="clean-list to-right">
                                    <!-- .to-right, to-left, .center-me helper class-->
                                    <jst:choose>
	                                   	<jst:when test="${current_section eq 'Lobby'}">
	                                   		<li class="current-menu-item">
	                                   	</jst:when>
	                                   	<jst:otherwise>
	                                   		 <li>
	                                   	</jst:otherwise>
                                    </jst:choose>
                                    <a href="/${Context_Root}/Lobby">Lobby</a> </li>
                                    <jst:choose>
	                                   	<jst:when test="${current_section eq 'Guests'}">
	                                   		<li class="current-menu-item">
	                                   	</jst:when>
	                                   	<jst:otherwise>
	                                   	 <li>
	                                   	</jst:otherwise>
                                    </jst:choose>
                                    <a href="/${Context_Root}/Guest">Guests</a>
                                        <ul>
                                            <li><a href="gallery.html">Gallery</a></li>
                                            <li><a href="restaurant.html">Restaurant</a></li>
                                            <li><a href="guestbook.html">GuestBook</a></li>
                                            <li><a href="error.html">Eror 404 page</a></li>
                                        </ul>
                                    </li>
                                    <jst:choose>
                                    	<jst:when test="${current_section eq 'Rooms'}">
                                    		<li class="current-menu-item">
                                    	</jst:when>
                                    	<jst:otherwise>
                                    	 <li>
                                    	</jst:otherwise>
                                    </jst:choose>
                                   		<a href="/${Context_Root}/Room">Rooms</a>
                                        <ul>
                                      	    <li><a href="/${Context_Root}/Room?action=All">All Rooms</a></li>
                                            <li><a href="/${Context_Root}/Room?action=Vacant">Vacant Rooms</a></li>
                                            <li><a href="/${Context_Root}/Room?action=Occupied">Occupied Rooms</a></li>
                                            <li><a href="/${Context_Root}/Room?action=Dirty">Dirty Rooms</a></li>
                                            <li><a href="/${Context_Root}/Room?action=Out_of_order">Out of Order Rooms</a></li>
                                        </ul>
                                    </li>
                                      <jst:choose>
                                    	<jst:when test="${current_section eq 'Booking'}">
                                    		<li class="current-menu-item">
                                    	</jst:when>
                                    	<jst:otherwise>
                                    	 <li>
                                    	</jst:otherwise>
                                    </jst:choose><a href="/${Context_Root}/Reservation">Reservations</a>
                                        <ul>
                                            <li><a href="/${Context_Root}/Room?action=Vacant">New Reservation</a></li>
                                            <li><a href="/${Context_Root}/Reservation?action=Upcoming">Upcoming Reservations</a></li>
                                            <li><a href="/${Context_Root}/Reservation?action=Previous">Previous Reservations</a></li>
              
                                        </ul>
                                    </li>
                                     <jst:choose>
                                    	<jst:when test="${current_section eq 'FrontDesk'}">
                                    		<li class="current-menu-item">
                                    	</jst:when>
                                    	<jst:otherwise>
                                    	 <li>
                                    	</jst:otherwise>
                                    </jst:choose><a href="/${Context_Root}/FrontDesk">Front Desk</a></li>
                                </ul>

                            </nav>
                            <!-- /.main-nav -->

                            <a href="#" class="mobile-switch to-right">
                                <i class="icon-467 font-2x text-dark hover-text-grey"></i>
                            </a>
                        </div>
                        <!-- /.col-md-10 -->
                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.container -->
            </div>
            <!-- /.nav-bar -->
        </header>
        <!-- /.main-nav -->