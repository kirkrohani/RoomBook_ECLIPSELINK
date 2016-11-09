package roombook.room;

import java.io.Serializable;
import javax.persistence.*;
import java.math.BigDecimal;


/**
 * The persistent class for the Rooms database table.
 * 
 */
@Entity
@Table(name="Rooms")
@NamedQueries(
{ @NamedQuery(name = "Room.findAll", query = "SELECT r FROM Room r"),
		@NamedQuery(name = "Room.findById", query = "SELECT r FROM Room r WHERE r.roomId = :roomId"),
		@NamedQuery(name = "Room.findAllVacantAndClean", query = "SELECT r FROM Room r WHERE r.clean = true and r.vacant=true"),
		@NamedQuery(name = "Room.findAllOccupied", query = "SELECT r FROM Room r WHERE r.vacant = false"),
		@NamedQuery(name = "Room.findAllOutOfOrder", query = "SELECT r FROM Room r WHERE r.outOfOrder = true"),
		@NamedQuery(name = "Room.findAllDirty", query = "SELECT r FROM Room r WHERE r.clean = false"),
		@NamedQuery(name = "Room.findByRoomType", query = "SELECT r FROM Room r JOIN r.roomType rt WHERE rt.roomTypeId = :roomTypeId") })
public class Room implements Serializable {
	private static final long serialVersionUID = 1L;
	private int roomId;
	private Boolean clean;
	private Boolean maintenanceNeeded;
	private Boolean outOfOrder;
	private BigDecimal price;
	private String roomDescription;
	private String roomLocation;
	private RoomType roomType;
	private Boolean vacant;

	public Room() {
	}


	@Id
	@Column(name="room_id")
	public int getRoomId() {
		return this.roomId;
	}

	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}


	public Boolean getClean() {
		return this.clean;
	}

	public void setClean(Boolean clean) {
		this.clean = clean;
	}


	@Column(name="maintenance_needed")
	public Boolean getMaintenanceNeeded() {
		return this.maintenanceNeeded;
	}

	public void setMaintenanceNeeded(Boolean maintenanceNeeded) {
		this.maintenanceNeeded = maintenanceNeeded;
	}


	@Column(name="out_of_order")
	public Boolean getOutOfOrder() {
		return this.outOfOrder;
	}

	public void setOutOfOrder(Boolean outOfOrder) {
		this.outOfOrder = outOfOrder;
	}


	public BigDecimal getPrice() {
		return this.price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}


	@Column(name="room_description")
	public String getRoomDescription() {
		return this.roomDescription;
	}

	public void setRoomDescription(String roomDescription) {
		this.roomDescription = roomDescription;
	}


	@Column(name="room_location")
	public String getRoomLocation() {
		return this.roomLocation;
	}

	public void setRoomLocation(String roomLocation) {
		this.roomLocation = roomLocation;
	}

	@OneToOne
	@JoinColumn(name="room_type_id")
	public RoomType getRoomType() {
		return this.roomType;
	}

	public void setRoomType(RoomType roomType) {
		this.roomType = roomType;
	}


	public Boolean getVacant() {
		return this.vacant;
	}

	public void setVacant(Boolean vacant) {
		this.vacant = vacant;
	}

}