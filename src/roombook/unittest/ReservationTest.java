package roombook.unittest;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.persistence.EntityManager;

import roombook.core.DBUtils;
import roombook.guest.Guest;
import roombook.reservation.Reservation;

public class ReservationTest
{

	public static void main(String... args) throws ParseException
	{

		// If customer does not provide date of birth then set to current date
		SimpleDateFormat dateFormatter = new SimpleDateFormat("MMM dd yyyy", Locale.ENGLISH);
		String DOBmonth = "Sep";
		String DOBday = "15";
		String DOByear = "2015";

		Date dateOfBirth = null;
		if (DOBmonth != null && !DOBmonth.isEmpty() && DOBday != null && !DOBday.isEmpty() && DOByear != null
				&& !DOByear.isEmpty())
		{
			String dob = DOBmonth + " " + DOBday + " " + DOByear;
			dateOfBirth = dateFormatter.parse(dob);
		}
		System.out.println(dateFormatter.format(dateOfBirth));

		
		  EntityManager em = DBUtils.getEntityManager(); 
		  /*
		 * EntityTransaction transaction = em.getTransaction(); try { transaction.begin();
		 * Guest pg = retrieveBookingData();
		 * em.persist(createReservation(pg)); System.out.println(
		 * "Committing x-action"); transaction.commit(); } catch (Exception e) {
		 * transaction.rollback(); } finally { em.close(); }
		 */
	}

	private static Guest retrieveBookingData()
	{
		Guest pg = new Guest();
		pg.setFirstName("TestFName");
		pg.setLastName("TestLName");
		pg.setEmail("email@test.com");
		pg.setPhone("214-55-5555");
		pg.setGuestNotes("What a great guest!");
		pg.setDateOfBirth(new Date());
		pg.setAddress("my address");
		pg.setZipcode(75252);
		pg.setGuestIdentifier("Johnson1235");

		System.out.println("PRIMARY GUEST CREATED: " + pg);
		return pg;
	}

	private static Reservation createReservation(Guest pg)
	{
		Reservation res = new Reservation();
		res.setCheckIn(new Date());
		res.setCheckOut(new Date());
		res.setReservationCreationDate(new Date());
		res.setEarlyCheckIn(true);
		res.setGuest(pg);
		res.setLateCheckOut(true);
		res.setNumOfGuests(8);
		res.setParking(false);
		res.setPets(false);
		//res.setRoomId(1003);
		res.setSmokingRoomRequested(false);
		System.out.println("RESERVATION CREATED: " + res);
		return res;
	}

}
