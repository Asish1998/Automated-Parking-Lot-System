package com.myproject.myapp.daos;


import javax.annotation.Resource;
import javax.sql.DataSource;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.myproject.myapp.models.UserInfo;
import com.myproject.myapp.models.User;

@Repository
public class UserDaosimpl implements userdaos {

	@Resource
	private SessionFactory sessionFactory; // hibernate ko obj

	@Autowired
	private DataSource dataSource;

	@Override
	@Transactional
	public void userSignup(User u) {
		Session session = sessionFactory.getCurrentSession();
		session.save(u);
	}

	@Override
	@Transactional
	public User isExist(String un, String psw) {

		Session session = sessionFactory.getCurrentSession();
		Criteria crt = session.createCriteria(User.class);

		crt.add(Restrictions.eq("uid", un)).add(Restrictions.eq("password", psw));

		User u = (User) crt.uniqueResult();

		// String sql = "select * from users where username ='" + un + "' and
		// password='" + psw + "' ";
		//
		// JdbcTemplate temp = new JdbcTemplate(dataSource);
		//
		// try {
		// System.out.println("========khkj================");
		// User user = temp.queryForObject(sql, User.class);
		// System.out.println("============uname===="+user.getUsername());
		//
		// if (user != null ) {
		// return user;
		// }
		// } catch (Exception e) {
		// e.printStackTrace();
		// }
		return u;
	}

	@Override
	@Transactional
	public boolean isExist(String id) {
		String sql = "select uid from user where uid='" + id + "'";

		JdbcTemplate temp = new JdbcTemplate(dataSource);

		try {
			String name = temp.queryForObject(sql, String.class);

			if (name != null && !name.equals("")) {
				return true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;

	}

	@Override
	@Transactional
	public boolean valid(String id) {
		String sql = "select phone from user where phone='" + id + "'";

		JdbcTemplate temp = new JdbcTemplate(dataSource);

		try {
			String name = temp.queryForObject(sql, String.class);

			if (name != null && !name.equals("")) {
				return true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;

	}
	@Override
	@Transactional
	public boolean timevalid(String etime) {
		String sql = "select e_time from userinfo where e_time ='" + etime + "'";

		JdbcTemplate temp = new JdbcTemplate(dataSource);

		try {
			String name = temp.queryForObject(sql, String.class);

			if (name != null && !name.equals("")) {
				return true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;

	}
	
	@Override
	public void userUpdate(User u) {
		// TODO Auto-generated method stub

	}

	

	@Override
	@Transactional
	public UserInfo getById(long uid) {

		User u = new User();
		u.setId(uid);

		Session session = sessionFactory.getCurrentSession();
		Criteria crt = session.createCriteria(UserInfo.class);

		crt.add(Restrictions.eq("user", u));
		UserInfo uf = (UserInfo) crt.uniqueResult();

		return uf;
	}


	@Override
	@Transactional
	public void updateInfo(UserInfo uf) {

		System.out.println("uid = " + uf.getUser().getId() + "log = " + uf.getLatitude()+"  ufid ="+uf.getId());

		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(uf);

	}

}