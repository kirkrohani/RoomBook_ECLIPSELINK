package roombook.guest;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the Guest database table.
 * 
 */
@Entity
@Table(name="Guest")
@NamedQuery(name="Guest.findAll", query="SELECT g FROM Guest g")
public class Guest implements Serializable {
	private static final long serialVersionUID = 1L;
	private int id;
	private String address;
	private Date dateOfBirth;
	private String email;
	private String firstName;
	private String guestIdentifier;
	private String guestNotes;
	private String lastName;
	private String phone;
	private int zipcode;

	public Guest() {
	}


	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="guest_id")
	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}


	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}


	@Temporal(TemporalType.DATE)
	@Column(name="date_of_birth")
	public Date getDateOfBirth() {
		return this.dateOfBirth;
	}

	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}


	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}


	@Column(name="first_name")
	public String getFirstName() {
		return this.firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}


	@Column(name="guest_identifier")
	public String getGuestIdentifier() {
		return this.guestIdentifier;
	}

	public void setGuestIdentifier(String guestIdentifier) {
		this.guestIdentifier = guestIdentifier;
	}


	@Column(name="guest_notes")
	public String getGuestNotes() {
		return this.guestNotes;
	}

	public void setGuestNotes(String guestNotes) {
		this.guestNotes = guestNotes;
	}


	@Column(name="last_name")
	public String getLastName() {
		return this.lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}


	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}


	public int getZipcode() {
		return this.zipcode;
	}

	public void setZipcode(int zipcode) {
		this.zipcode = zipcode;
	}


	@Override
	public String toString()
	{
		return getClass().getName() + " {\n\tid: " + id + "\n\taddress: " + address + "\n\tdateOfBirth: " + dateOfBirth
				+ "\n\temail: " + email + "\n\tfirstName: " + firstName + "\n\tguestIdentifier: " + guestIdentifier
				+ "\n\tguestNotes: " + guestNotes + "\n\tlastName: " + lastName + "\n\tphone: " + phone
				+ "\n\tzipcode: " + zipcode + "\n}";
	}
	
	

}