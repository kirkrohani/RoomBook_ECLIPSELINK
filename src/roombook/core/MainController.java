package roombook.core;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import roombook.room.RoomType;

/**
 * Servlet implementation class MainController
 */
public class MainController extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	public MainController()
	{
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// Redirect to the doPost method in all cases for now
		this.doPost(request, response);
	}

	@SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		System.out.println("-----> MainController.doPost() with ACTION=None" );
		ServletContext sc = getServletContext();
		EntityManager em = DBUtils.getEntityManager();
		
		// Load Application Context Root for multiple versions of the application
		if (sc.getAttribute("Context_Root") == null)
		{
			System.out.println("Setting CONTEXT ROOT to: " + sc.getInitParameter("AppName"));
			sc.setAttribute("Context_Root", sc.getInitParameter("AppName"));
		}
		
		// Load Room Types for drop-down and Select all roomTypes for filter bar
		List<RoomType> roomTypes = (List<RoomType>) request.getSession().getAttribute("roomTypes");
		if (roomTypes == null || roomTypes.isEmpty())
		{
			TypedQuery<RoomType> roomTypeQuery = em.createNamedQuery("RoomType.findAll", RoomType.class);
			roomTypes = roomTypeQuery.getResultList();
			request.getSession().setAttribute("roomTypes", roomTypes);
			System.out.println("Setting ROOM TYPES: " + roomTypes);
		}
		
		//Set the current section for the main navigation menu highlight
		request.setAttribute("current_section", "Lobby");
		getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);

	}

}
