package roombook.room;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import roombook.core.DBUtils;

/**
 * Servlet implementation class RoomsController
 */

public class RoomController extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	public RoomController()
	{
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{

		this.doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String action = request.getParameter("action");
		System.out.println("-----> RoomsController.doPost() with ACTION=" + action);
		
		EntityManager em = DBUtils.getEntityManager();
		List<Room> rooms = null;
		TypedQuery<Room> roomQuery = null;
		String subSection = null;
		
		if (action == null || action.isEmpty())
			action = "All";   

		switch (action)
		{
		case "All":
		{
			System.out.println(" QUERY named Room.findAll");
			roomQuery = em.createNamedQuery("Room.findAll", Room.class);
			rooms = (List<Room>) roomQuery.getResultList();
			request.setAttribute("allowBooking", "true");
			subSection = "All Rooms";
			break;
		}
		case "Occupied":
		{
			System.out.println(" QUERY named Room.findAllOccupied");
			roomQuery = DBUtils.getEntityManager().createNamedQuery("Room.findAllOccupied", Room.class);
			rooms = roomQuery.getResultList();
			subSection = "Occupied Rooms";
			break;
		}
		case "Vacant":
		{
			System.out.println(" QUERY named Room.findAllVacantAndClean");
			roomQuery = DBUtils.getEntityManager().createNamedQuery("Room.findAllVacantAndClean", Room.class);
			rooms = roomQuery.getResultList();
			request.setAttribute("allowBooking", "true");
			subSection = "Vacant Rooms";
			break;
		}
		case "Dirty":
		{
			System.out.println(" QUERY named Room.findAllDirty");
			roomQuery = DBUtils.getEntityManager().createNamedQuery("Room.findAllDirty", Room.class);
			rooms = roomQuery.getResultList();
			subSection = "Dirty Rooms";
			break;
		}
		case "Out_of_order":
		{
			System.out.println(" QUERY named Room.findAllOutOfOrder");
			roomQuery = DBUtils.getEntityManager().createNamedQuery("Room.findAllOutOfOrder", Room.class);
			rooms = roomQuery.getResultList();
			subSection = "Out of Order Rooms";
			break;
		}
		case "Filter":
		{

			String roomTypeId = request.getParameter("roomType");
			System.out.println("Calling QUERY named Room.findByRoomType " + roomTypeId);
			roomQuery = DBUtils.getEntityManager().createNamedQuery("Room.findByRoomType", Room.class);
			roomQuery.setParameter("roomTypeId", Integer.parseInt(roomTypeId));
			rooms = roomQuery.getResultList();
			request.setAttribute("allowBooking", "true");
			subSection = "Rooms By Type";
			break;
		}
		}

		System.out.println("Number of Rooms retrieved from DB:" + rooms.size());
		request.setAttribute("rooms", rooms);
		request.setAttribute("current_section", "Rooms");
		request.setAttribute("room_sub_section", subSection);
		getServletContext().getRequestDispatcher("/rooms.jsp").forward(request, response);
	}

}
