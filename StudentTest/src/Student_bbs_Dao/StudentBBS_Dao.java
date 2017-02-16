package Student_bbs_Dao;

import addHibernateFile.HibernateSessionFactory;
import Student_bbs_PO.PostPO;
import Student_bbs_PO.ProductPO;
import Student_bbs_PO.ReplyPO;
import Student_bbs_PO.UserPO;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;
import org.hibernate.*;

public class StudentBBS_Dao {
	private Session session;
	private Transaction transaction;
	private Query query;
	HibernateSessionFactory getSession;

	public StudentBBS_Dao() {
	}

	//退出当前用户
	public void exitUser(Session session){
		getSession = new HibernateSessionFactory();
		getSession.closeSession(session);
	}
	
	// 保存用户的注册信息
	public String saveInfo(UserPO info) {
		String mess = "error";
		getSession = new HibernateSessionFactory();
		session = getSession.getSession();
		try {
			transaction = session.beginTransaction(); // 开启事务
			session.save(info); // 调用save()方法保存数据
			transaction.commit(); // 提交事务
			mess = "success";
			return mess;
		} catch (Exception e) {
			message("RegisterInfo.error:" + e);
			e.printStackTrace();
			return null;
		}
	}

	// 查询用户名是否存在
	public List queryInfo(String type, Object value) {
		getSession = new HibernateSessionFactory();
		session = getSession.getSession();
		try {
			String hqlsql = "from UserPO as u where u.username=?";
			query = session.createQuery(hqlsql);
			query.setParameter(0, value);
			List list = query.list(); // list()方法返回查询结果，并把查询结果转换成List对象
			transaction = session.beginTransaction();
			transaction.commit();
			return list;
		} catch (Exception e) {
			message("LoginRegisterInfo类中有异常，异常为:" + e);
			e.printStackTrace();
			return null;
		}
	}

	// 查询产品
	public List findProduct(String type, Object value) {
		getSession = new HibernateSessionFactory();
		session = getSession.getSession();
		try {
			String hqlsql = "from ProductPO as u where u.productTitle like?";
			query = session.createQuery(hqlsql);
			query.setParameter(0, value);
			List list = query.list(); // list()方法返回查询结果，并把查询结果转换成List对象
			transaction = session.beginTransaction();
			transaction.commit();
			return list;
		} catch (Exception e) {
			message("LoginRegisterInfo类中有异常，异常为:" + e);
			e.printStackTrace();
			return null;
		}
	}

	// 返回user表的所有记录
	public List findAllUser() {
		getSession = new HibernateSessionFactory();
		session = getSession.getSession();
		try {
			transaction = session.beginTransaction(); // 开启事务
			String hqlsql = "from UserPO";
			query = session.createQuery(hqlsql); // 查询整个用户表
			List list = query.list(); // list()方法返回查询结果，并把查询结果转换成List对象
			transaction.commit(); // 提交事务
			session.close(); // session关闭
			return list;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	// 返回post表的所有记录
	public List findAllPost() {
		getSession = new HibernateSessionFactory();
		session = getSession.getSession();
		try {
			transaction = session.beginTransaction(); // 开启事务
			String hqlsql = "from PostPO";
			query = session.createQuery(hqlsql); // 查询整个用户表
			List list = query.list(); // list()方法返回查询结果，并把查询结果转换成List对象
			transaction.commit(); // 提交事务
			session.close(); // session关闭
			return list;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	// 返回reply表的所有记录
	public List findAllReply() {
		getSession = new HibernateSessionFactory();
		session = getSession.getSession();
		try {
			transaction = session.beginTransaction(); // 开启事务
			String hqlsql = "from ReplyPO";
			query = session.createQuery(hqlsql); // 查询整个用户表
			List list = query.list(); // list()方法返回查询结果，并把查询结果转换成List对象
			transaction.commit(); // 提交事务
			session.close(); // session关闭
			return list;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	// 查询回复贴是否存在
	public List queryReply(int pid) {
		getSession = new HibernateSessionFactory();
		session = getSession.getSession();
		try {
			String hqlsql = "from ReplyPO as u where u.pid=?";
			query = session.createQuery(hqlsql);
			query.setParameter(0, pid);
			List list = query.list(); // list()方法返回查询结果，并把查询结果转换成List对象
			transaction = session.beginTransaction();
			transaction.commit();
			return list;
		} catch (Exception e) {
			message("LoginRegisterInfo类中有异常，异常为:" + e);
			e.printStackTrace();
			return null;
		}
	}

	// 返回product表的所有记录
	public List findAllProduct() {
		getSession = new HibernateSessionFactory();
		session = getSession.getSession();
		try {
			transaction = session.beginTransaction(); // 开启事务
			String hqlsql = "from ProductPO";
			query = session.createQuery(hqlsql); // 查询整个用户表
			List list = query.list(); // list()方法返回查询结果，并把查询结果转换成List对象
			transaction.commit(); // 提交事务
			session.close(); // session关闭
			return list;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	// 保存用户的回帖信息
	public String saveReply(ReplyPO info) {
		String mess = "error";
		getSession = new HibernateSessionFactory();
		session = getSession.getSession();
		try {
			transaction = session.beginTransaction(); // 开启事务
			session.save(info); // 调用save()方法保存数据
			transaction.commit(); // 提交事务
			mess = "success";
			return mess;
		} catch (Exception e) {
			message("RegisterInfo.error:" + e);
			e.printStackTrace();
			return null;
		}
	}

	// 保存用户的发帖信息
	public String savePost(PostPO info) {
		String mess = "error";
		getSession = new HibernateSessionFactory();
		session = getSession.getSession();
		try {
			transaction = session.beginTransaction(); // 开启事务
			session.save(info); // 调用save()方法保存数据
			transaction.commit(); // 提交事务
			mess = "success";
			return mess;
		} catch (Exception e) {
			message("RegisterInfo.error:" + e);
			e.printStackTrace();
			return null;
		}
	}

	// 保存用户的产品信息
	public String saveProduct(ProductPO info) {
		String mess = "error";
		getSession = new HibernateSessionFactory();
		session = getSession.getSession();
		try {
			transaction = session.beginTransaction(); // 开启事务
			session.save(info); // 调用save()方法保存数据
			transaction.commit(); // 提交事务
			mess = "success";
			return mess;
		} catch (Exception e) {
			message("RegisterInfo.error:" + e);
			e.printStackTrace();
			return null;
		}
	}

	public void message(String mess) {
		int type = JOptionPane.YES_NO_OPTION;
		String title = "提示信息";
		JOptionPane.showMessageDialog(null, mess, title, type);
	}
}
