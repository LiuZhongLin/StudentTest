package addHibernateFile;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

//加载hibernate配置文件
public class HibernateSessionFactory {
	private SessionFactory sessionFactory;
	public HibernateSessionFactory(){		
	}
	
	public SessionFactory config(){
		try {
			Configuration configuration = new Configuration();
			Configuration configure = configuration.configure("hibernate.cfg.xml");
			return configure.buildSessionFactory();
		} catch (Exception e) {
			e.getMessage();
			return null;
		}
	}
	
	public Session getSession(){
		sessionFactory=config();
		return sessionFactory.openSession();
	}
	
	// 关闭Session
		public static void closeSession(Session session) {
			if (session != null) {
				session.close();
			}
		}
}
