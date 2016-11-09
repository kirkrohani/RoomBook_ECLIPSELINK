package roombook.reservation;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Expression;
import javax.persistence.criteria.Join;
import javax.persistence.criteria.Path;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.persistence.metamodel.EntityType;
import javax.persistence.metamodel.Metamodel;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import roombook.core.DBUtils;
import roombook.guest.Guest;
import roombook.room.Room;
import roombook.room.RoomType;

public class ReservationController extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	public ReservationController()
	{
		super();
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		this.doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String forwardURL = null;
		Room room = null;
		HttpSession session = request.getSession();
		String roomId = request.getParameter("roomId");
		String action = request.getParameter("action");
		Reservation reservation =  (Reservation) request.getSession().getAttribute("reservation");
		EntityManager em = DBUtils.getEntityManager();
		
		//TODO: Remove for  Log4J
		System.out.println(" ----> ReservationController.doPost() with ACTION= " + action + " and ROOM ID: " + roomId);
		System.out.println(reservation != null ? "Reservation in SESSION" : "Reservation NOT in SESSION");
	
		if (action == null || action.isEmpty())
			action = "New";   

		switch (action)
		{
		/*
		 * Begin the process to start a NEW RESERVATION 
		 */
		case "New":
		{
			// Request is to book a specific room number
			if (roomId != null && !roomId.isEmpty())
			{
				System.out.println("QUERY Room.findById for Room Id: " + roomId);
				TypedQuery<Room> roomQuery = (TypedQuery<Room>) em.createNamedQuery("Room.findById", Room.class);			
				roomQuery.setParameter("roomId", Integer.parseInt(roomId));
				room = roomQuery.getSingleResult();

			}
			
			//Check if Reservaation already created and set room otherwise Reservation gets created in "Submit" section below
			if (reservation == null)
				reservation = new Reservation();
			reservation.setRoom(room);
			
			session.setAttribute("reservation", reservation);
			request.setAttribute("current_section", "Booking");
			request.setAttribute("room",room);
			forwardURL = "/booking-steps.jsp";
			break;
		}
		/*
		 * PARTIAL RESERVATION STARTED ON HOME PAGE
		 * If the staff starts a reservation from the home page (aka Lobby) then we get a subset of information entered and create a 
		 * partial Reservation object and set it into Session to grab when we are ready to fill the remaining data a submit
		 */
		case "Partial_Booking":
		{
			
			try
			{
				if (reservation == null)
					reservation = new Reservation();
				
				retrieveBasicReservationInput(request, reservation);
				System.out.println("NEW RESERVATION CREATED:  \n" + reservation);
				request.getSession().setAttribute("reservation", reservation);

			} catch (ParseException e)
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			forwardURL = "/Room?action=Filter&roomType="+request.getParameter("room-type");
			break;
		}
		/*
		 * SUBMIT RESERVATION TO DATABASE
		 * Once user completed all booking-steps and they choose to "Confirm" their Reservation and submit
		 */
		case "Submit":
		{
			try
			{
				EntityTransaction transaction = em.getTransaction();

				transaction.begin();
					Guest primaryGuest = retrievePrimaryGuestInput(request);
					retrieveBasicReservationInput(request, reservation);
					retrieveReservationInput(request, reservation);
					em.persist(primaryGuest);
					reservation.setGuest(primaryGuest);
					em.persist(reservation);
				transaction.commit();
				System.out.println("DATABASE: Committing x-action");

			} catch (ParseException e)
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			//Remove information from session so that new reservations can be created
			clearReservation(request);
			
			request.setAttribute("current_section", "Lobby");
			forwardURL = "/Lobby";
			break;
		}
		/*
		 * EXISTING RESERVATIONS 
		 * Retrieve all that are currently awaiting check in from today forward
		 */
		case "Upcoming":
		{
			System.out.println("QUERY Reservation.findByCheckInDate");
			TypedQuery<Reservation> reservationQuery = em.createNamedQuery("Reservation.findByCheckInDate", Reservation.class);
			
			/*
			 * Create dates for filterDateMin and filterDateMax to get all upcoming reservations for the next 30 days 
			 * and set parameters for query
			 */
			Integer daysToGoForward = 30;
			Calendar currentDate = Calendar.getInstance(Locale.ENGLISH);
			reservationQuery.setParameter("filterDateMin", currentDate.getTime());
			
			currentDate.add(Calendar.DAY_OF_YEAR, daysToGoForward);
			reservationQuery.setParameter("filterDateMax",currentDate.getTime() );
			
			
			List<Reservation> upcoming_reservations = reservationQuery.getResultList();
			System.out.println("Reservation List returned " + upcoming_reservations.size() + " results.");
			
			request.setAttribute("search_name", "Upcoming 30 Days");
			request.setAttribute("search_description", "Reservations due to check in during the next 30 days. For further results use the search above. ");
			request.setAttribute("upcoming_reservations", upcoming_reservations);
			forwardURL = "/upcoming_reservations.jsp";
			request.setAttribute("current_section", "Booking");
			break;
		}
		/*
		 * PREVIOUS RESERVATIONS
		 * Retrieve all past reservations that have already complete their stay in the past 30 days
		 */
		case "Previous":
		{
			
			Integer daysToGoBack = -30;
			
			System.out.println("QUERY Reservation.findByCheckOutDate");
			TypedQuery<Reservation> reservationQuery = em.createNamedQuery("Reservation.findByCheckOutDate", Reservation.class);
			
			/*
			 *  Set Parameters filterDateMin and filterDateMax for Past 30 Days in the Query
			 *  Since we are only searching going back 30 days from today
			 */
			Calendar currentDate = Calendar.getInstance(Locale.ENGLISH);
			reservationQuery.setParameter("filterDateMax", currentDate.getTime());
			currentDate.add(Calendar.DAY_OF_YEAR, daysToGoBack);
			reservationQuery.setParameter("filterDateMin", currentDate.getTime() );
			
			List<Reservation> previousReservations = reservationQuery.getResultList();
			
			
			request.setAttribute("previous_reservations", previousReservations);
			request.setAttribute("search_name", "Past 30 Days");
			request.setAttribute("search_description", "Reservations that were scheduled to check out in the past 30 days");
			request.setAttribute("years_list", getCalendarYears());
			request.setAttribute("months_list", getCalendarMonths());
			request.setAttribute("current_section", "Booking");
			
			forwardURL = "/previous-reservations.jsp";
			break;
		}
		/**
		 * RESERVATION DETAILS
		 * Retrieve reservation details for the selected reservation
		 */
		case "Details":
		{
			
			Integer reservationId = Integer.parseInt(request.getParameter("reservationId"));
			TypedQuery<Reservation> reservationQuery = em.createNamedQuery("Reservation.findById", Reservation.class);
			reservationQuery.setParameter("reservationId", reservationId);
			reservation = reservationQuery.getSingleResult();
			System.out.println("RESERVATION RETURNED FROM DB: " + reservation);
			
			//Parse the Date of Birth in the DB and set the month /  day / year for the separate fields
			parseDOB(reservation.getGuest().getDateOfBirth(), request);
			request.setAttribute("duration", durationOfStay(reservation.getCheckIn(), reservation.getCheckOut()));
			session.setAttribute("reservation", reservation);
			forwardURL = "/reservation-details.jsp";
			break;
		}
		/*
		 * SEARCH RESERVATIONS
		 * Search all past reservations based on room type, check in date, check out date, first name, lastname 
		 */
		case "Search":
		{
			
			/*
			 * Retrieve user entered SEARCH CRITERIA
			 */
			String roomTypeId = request.getParameter("room-type");
			String monthOfStay = request.getParameter("month-of-stay");
			String yearOfStay = request.getParameter("year-of-stay");
			String firstName = request.getParameter("first-name");
			String lastName = request.getParameter("last-name");
			
			
			/*
			 * Create a criteria builder to use JPA Criteria API
			 */
			CriteriaBuilder cb = em.getCriteriaBuilder();
			CriteriaQuery<Reservation> searchQuery = cb.createQuery(Reservation.class);
			Root<Reservation> reservationRoot = searchQuery.from(Reservation.class);
			Path<Guest> guestRoot = reservationRoot.get("guest");
			Path<Room> roomRoot = reservationRoot.get("room");
			Path<RoomType> roomTypeRoot = roomRoot.get("roomType");
			List<Predicate> whereClause = new ArrayList<>();
			
			
			System.out.println("QUERY Reservation by CRITERIA");
			searchQuery.select(reservationRoot);
			
			
			if ( (monthOfStay != null && !monthOfStay.isEmpty()) || (yearOfStay != null && !yearOfStay.isEmpty()) )
			{
				String beginningSearchDate = null;
				String endingSearchDate = null;
				
				//If YEAR not searched then search by current year
				if (yearOfStay == null || yearOfStay.isEmpty())
					yearOfStay = Integer.toString(Calendar.getInstance().get(Calendar.YEAR));
				else
					request.setAttribute("yearOfStay", yearOfStay);
				
				
				//If MONTH not searched then search by any month of the year and set the beginning and end day of the month to 1 and 30 or 31.
				if (monthOfStay == null || monthOfStay.isEmpty())
				{
					beginningSearchDate = yearOfStay + "-" + "01" + "-" + "1";
					endingSearchDate = yearOfStay + "-" + "12" + "-" + "31"; 
				}
				else
				{
					beginningSearchDate = yearOfStay + "-" + monthOfStay + "-" + "1";
					endingSearchDate = yearOfStay + "-" + monthOfStay + "-" + "30";
					request.setAttribute("monthOfStay", monthOfStay);
				}
					
				
				whereClause.add(cb.and(cb.greaterThanOrEqualTo(reservationRoot.get("checkIn"), beginningSearchDate)));
				whereClause.add(cb.and(cb.lessThanOrEqualTo(reservationRoot.get("checkIn"), endingSearchDate)));
			}
			
			if (firstName != null && !firstName.isEmpty())
			{
				System.out.println("First Name Query");
				whereClause.add(cb.and(cb.like(guestRoot.get("firstName"), firstName)));
				request.setAttribute("firstName", firstName);
			}
				
				
			if (lastName != null && !lastName.isEmpty())
			{
				System.out.println("Last Name Query");
				whereClause.add(cb.and(cb.like(guestRoot.get("lastName"), lastName)));
				request.setAttribute("lastName", lastName);
			}
				
		
			if (roomTypeId != null && !roomTypeId.isEmpty())
			{
				System.out.println("Room Type Query");
				whereClause.add(cb.and(cb.equal(roomTypeRoot.get("roomTypeId"), roomTypeId)));
				request.setAttribute("roomTypeId", roomTypeId);
				
			}
				
			
				
			searchQuery.where(cb.and(whereClause.toArray(new Predicate[whereClause.size()])));
			TypedQuery<Reservation> reservationQuery = em.createQuery(searchQuery);
			List<Reservation> previousReservations  = reservationQuery.getResultList();
			
			request.setAttribute("months_list", getCalendarMonths());
			request.setAttribute("years_list", getCalendarYears());
			request.setAttribute("search_name", "Filtered Search Results");
			request.setAttribute("search_description", "Previous Reservations filtered based upon the above-selected search criteria.");
			request.setAttribute("previous_reservations", previousReservations);
			forwardURL = "/previous-reservations.jsp";
			request.setAttribute("current_section", "Booking");
		}
		
		
		} // End Switch

		
		getServletContext().getRequestDispatcher(forwardURL).forward(request, response);

	}
	
	private List<String> getCalendarYears()
	{
		List<String> years = new ArrayList<>();
		years.add("2016");
		years.add("2015");
		years.add("2014");
		years.add("2013");
		years.add("2012");
		years.add("2011");
		years.add("2010");
		years.add("2009");
		years.add("2008");
		years.add("2007");
		years.add("2006");
		years.add("2005");
		years.add("2004");
		years.add("2003");
		years.add("2002");
		years.add("2001");
		years.add("2000");
		years.add("1999");
		
		return years;
	}
	
	private List<String> getCalendarMonths()
	{
		List<String> months = new ArrayList<>();
		months.add("January");
		months.add("February");
		months.add("March");
		months.add("April");
		months.add("May");
		months.add("June");
		months.add("July");
		months.add("August");
		months.add("September");
		months.add("October");
		months.add("November");
		months.add("December");
		return months;
	}


	private void parseDOB(Date dateOfBirth, HttpServletRequest request)
	{
		
		SimpleDateFormat dateFormatter = new SimpleDateFormat("MM-dd-yyyy", Locale.ENGLISH);
		String[] dob = dateFormatter.format(dateOfBirth).split("-");
		request.setAttribute("month", dob[0]);
		request.setAttribute("day", dob[1]);
		request.setAttribute("year", dob[2]);
		
	}
	
	private int durationOfStay(Date checkIn, Date checkOut)
	{
		int duration = (int) Math.round( (checkOut.getTime() - checkIn.getTime())/ (1000*60*60*24)  );
		if (duration <= 0)
				duration = 1;
		
		return duration;
	}
	private Guest retrievePrimaryGuestInput(HttpServletRequest request) throws ParseException
	{
		System.out.println("METHOD: Inside retrievePrimaryGuestInput()" );
		
		Guest pg = new Guest();
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String DOBmonth = request.getParameter("DOBmonth");
		String DOBday = request.getParameter("DOBday");
		String DOByear = request.getParameter("DOByear");
		String address = request.getParameter("address");
		String zip = request.getParameter("zip");

		// If customer does not provide date of birth then set to current date
		SimpleDateFormat dateFormatter = new SimpleDateFormat("MMM dd yyyy", Locale.ENGLISH);

		Date dateOfBirth = null;
		if (DOBmonth != null && !DOBmonth.isEmpty() && DOBday != null && !DOBday.isEmpty() && DOByear != null
				&& !DOByear.isEmpty())
		{
			String dob = DOBmonth + " " + DOBday + " " + DOByear;
			dateOfBirth = dateFormatter.parse(dob);
		} else
		{
			dateOfBirth = new Date();
		}

		// If zipcode not provided then set to default zipcode
		Integer zipCode = zip != null ? Integer.parseInt(zip) : 75024;
		pg.setZipcode(zipCode);

		pg.setAddress(address);
		pg.setDateOfBirth(dateOfBirth);
		pg.setEmail(email);
		pg.setFirstName(firstName);
		pg.setLastName(lastName);

		SimpleDateFormat dbFormatter = new SimpleDateFormat("MMddyyyy", Locale.ENGLISH);
		pg.setGuestIdentifier(lastName + dbFormatter.format(dateOfBirth));
		pg.setPhone(phone);

		System.out.println("NEW GUEST CREATED: \n"+ pg);
		return pg;
	}
	
	private void retrieveBasicReservationInput(HttpServletRequest request, Reservation res) throws ParseException
	{
		System.out.println("METHOD: Inside retrieveBasicReservationInput()" );

		SimpleDateFormat dateFormatter = new SimpleDateFormat("MM-dd-yyyy", Locale.ENGLISH);

		Date checkInDate = null;
		String checkIn = request.getParameter("check-in");
		checkInDate = (checkIn != null && !checkIn.isEmpty()) ? dateFormatter.parse(checkIn) : new Date();
		System.out.println("CHECK IN: " + checkInDate);

		Date checkOutDate = null;
		String checkOut = request.getParameter("check-out");
		checkOutDate = (checkOut != null && !checkOut.isEmpty()) ? dateFormatter.parse(checkOut) : new Date();
		System.out.println("CHECK OUT: " + checkOutDate);

		String numAdults = request.getParameter("adults");
		String numChildren = request.getParameter("children");
		Integer numberOfGuests = null;
		if (numAdults != null && !numAdults.isEmpty())
		{
			numberOfGuests = (numAdults != null && numChildren != null)
					? Integer.parseInt(numAdults) + Integer.parseInt(numChildren) : 1;
		} else
		{
			numberOfGuests = Integer.parseInt(request.getParameter("number-guests"));
		}
		

		String specialRequests = request.getParameter("notes");

		res.setSpecialRequests(specialRequests);
		res.setCheckIn(checkInDate);
		res.setCheckOut(checkOutDate);
		res.setNumOfGuests(numberOfGuests);
		
		

	}

	private void retrieveReservationInput(HttpServletRequest request, Reservation res) throws ParseException
	{
		System.out.println("METHOD: Inside retrieveReservationInput()" );
		Date createdDate = new Date();
		Boolean earlyCheckIn = request.getParameter("earlyCheckIn") != null ? true : false;
		Boolean lateCheckOut = request.getParameter("lateCheckOut") != null ? true : false;
		Boolean smokingRoom = request.getParameter("smokingRoom") != null ? true : false;
		Boolean travelingWithPets = request.getParameter("travelingWithPets") != null ? true : false;
		Boolean needsParking = request.getParameter("needsParking") != null ? true : false;

		res.setReservationCreationDate(createdDate);
		res.setEarlyCheckIn(earlyCheckIn);
		res.setLateCheckOut(lateCheckOut);
		res.setParking(needsParking);
		res.setPets(travelingWithPets);
		res.setSmokingRoomRequested(smokingRoom);
		

		

	}
	
	private void clearReservation(HttpServletRequest request)
	{
		HttpSession session = request.getSession(false);
		if (session != null)
		{
			session.removeAttribute("reservation");
		}
			
		
			
	}

}
