package roombook.core;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class DBUtils
{
	private static final EntityManagerFactory factory = Persistence.createEntityManagerFactory("RoomBook_ECLIPSELINK");

	public static EntityManagerFactory getEntityManagerFactory()
	{
		if (factory == null)
			return  Persistence.createEntityManagerFactory("RoomBook_ECLIPSELINK");
		else
			return factory;
	}

	public static EntityManager getEntityManager()
	{
		return getEntityManagerFactory().createEntityManager();
	}

}
