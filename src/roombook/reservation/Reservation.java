package roombook.reservation;

import java.io.Serializable;
import javax.persistence.*;

import roombook.guest.Guest;
import roombook.room.Room;

import java.util.Date;


/**
 * The persistent class for the Reservations database table.
 * 
 */
@Entity
@Table(name="Reservations")
@NamedQueries ({
	@NamedQuery(name = "Reservation.findAll", query = "SELECT r FROM Reservation r"),
	@NamedQuery(name= "Reservation.findById", query ="SELECT r FROM Reservation r where r.reservationId = :reservationId"),
	@NamedQuery(name="Reservation.findByCheckOutDate",query = "SELECT r FROM Reservation r where r.checkOut >= :filterDateMin and r.checkOut < :filterDateMax"),
	@NamedQuery(name="Reservation.findByCheckInDate",query = "SELECT r FROM Reservation r where r.checkIn >= :filterDateMin and r.checkIn < :filterDateMax")
} )
public class Reservation implements Serializable {
	private static final long serialVersionUID = 1L;
	private int reservationId;
	private Date checkIn;
	private Date checkOut;
	private Boolean earlyCheckIn;
	private Guest guest;
	private Boolean lateCheckOut;
	private int numOfGuests;
	private Boolean parking;
	private Boolean pets;
	private Date reservationCreationDate;
	private Room room;
	private Boolean smokingRoomRequested;
	private String specialRequests;

	public Reservation() {
	}


	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="reservation_id")
	public int getReservationId() {
		return this.reservationId;
	}

	public void setReservationId(int reservationId) {
		this.reservationId = reservationId;
	}


	@Temporal(TemporalType.DATE)
	@Column(name="check_in")
	public Date getCheckIn() {
		return this.checkIn;
	}

	public void setCheckIn(Date checkIn) {
		this.checkIn = checkIn;
	}


	@Temporal(TemporalType.DATE)
	@Column(name="check_out")
	public Date getCheckOut() {
		return this.checkOut;
	}

	public void setCheckOut(Date checkOut) {
		this.checkOut = checkOut;
	}


	@Column(name="early_check_in")
	public Boolean getEarlyCheckIn() {
		return this.earlyCheckIn;
	}

	public void setEarlyCheckIn(Boolean earlyCheckIn) {
		this.earlyCheckIn = earlyCheckIn;
	}


	@OneToOne
	@JoinColumn(name="guest_id")
	public Guest getGuest() {
		return this.guest;
	}

	public void setGuest(Guest guest) {
		this.guest = guest;
	}


	@Column(name="late_check_out")
	public Boolean getLateCheckOut() {
		return this.lateCheckOut;
	}

	public void setLateCheckOut(Boolean lateCheckOut) {
		this.lateCheckOut = lateCheckOut;
	}


	@Column(name="num_of_guests")
	public int getNumOfGuests() {
		return this.numOfGuests;
	}

	public void setNumOfGuests(int numOfGuests) {
		this.numOfGuests = numOfGuests;
	}


	public Boolean getParking() {
		return this.parking;
	}

	public void setParking(Boolean parking) {
		this.parking = parking;
	}


	public Boolean getPets() {
		return this.pets;
	}

	public void setPets(Boolean pets) {
		this.pets = pets;
	}


	@Temporal(TemporalType.DATE)
	@Column(name="reservation_creation_date")
	public Date getReservationCreationDate() {
		return this.reservationCreationDate;
	}

	public void setReservationCreationDate(Date reservationCreationDate) {
		this.reservationCreationDate = reservationCreationDate;
	}


	@OneToOne
	@JoinColumn(name="room_id")
	public Room getRoom() {
		return this.room;
	}

	public void setRoom(Room room) {
		this.room = room;
	}


	@Column(name="smoking_room_requested")
	public Boolean getSmokingRoomRequested() {
		return this.smokingRoomRequested;
	}

	public void setSmokingRoomRequested(Boolean smokingRoomRequested) {
		this.smokingRoomRequested = smokingRoomRequested;
	}

	@Column(name="special_requests")
	public String getSpecialRequests()
	{
		return specialRequests;
	}


	public void setSpecialRequests(String specialRequests)
	{
		this.specialRequests = specialRequests;
	}


	@Override
	public String toString()
	{
		return getClass().getName() + " {\n\treservationId: " + reservationId + "\n\tcheckIn: " + checkIn
				+ "\n\tcheckOut: " + checkOut + "\n\tearlyCheckIn: " + earlyCheckIn + "\n\tguest: " + guest
				+ "\n\tlateCheckOut: " + lateCheckOut + "\n\tnumOfGuests: " + numOfGuests + "\n\tparking: " + parking
				+ "\n\tpets: " + pets + "\n\treservationCreationDate: " + reservationCreationDate + "\n\troom: " + room
				+ "\n\tsmokingRoomRequested: " + smokingRoomRequested + "\n\tspecialRequests: " + specialRequests
				+ "\n}";
	}
	
	

}