package roombook.room;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the RoomType database table.
 * 
 */
@Entity
@Table(name="RoomType")
@NamedQuery(name="RoomType.findAll", query="SELECT r FROM RoomType r")
public class RoomType implements Serializable {
	private static final long serialVersionUID = 1L;
	private int roomTypeId;
	private String bedType;
	private int numberOfBeds;
	private String roomTypeName;
	private Boolean suite;
	private Boolean upgraded;

	public RoomType() {
	}


	@Id
	@Column(name="room_type_id")
	public int getRoomTypeId() {
		return this.roomTypeId;
	}

	public void setRoomTypeId(int roomTypeId) {
		this.roomTypeId = roomTypeId;
	}


	@Column(name="bed_type")
	public String getBedType() {
		return this.bedType;
	}

	public void setBedType(String bedType) {
		this.bedType = bedType;
	}


	@Column(name="number_of_beds")
	public int getNumberOfBeds() {
		return this.numberOfBeds;
	}

	public void setNumberOfBeds(int numberOfBeds) {
		this.numberOfBeds = numberOfBeds;
	}


	@Column(name="room_type_name")
	public String getRoomTypeName() {
		return this.roomTypeName;
	}

	public void setRoomTypeName(String roomTypeName) {
		this.roomTypeName = roomTypeName;
	}


	public Boolean getSuite() {
		return this.suite;
	}

	public void setSuite(Boolean suite) {
		this.suite = suite;
	}


	public Boolean getUpgraded() {
		return this.upgraded;
	}

	public void setUpgraded(Boolean upgraded) {
		this.upgraded = upgraded;
	}
	

}