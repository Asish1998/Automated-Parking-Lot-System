package com.myproject.myapp.daos;

import javax.annotation.Resource;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.myproject.myapp.models.ParkingLotInfo;
@Repository
public class ParkingLotInfoimpl implements ParkingLotInfodaos{
	@Resource
	private SessionFactory sessionFactory; // hibernate ko obj

	@Override
	@Transactional
	public ParkingLotInfo getParkingDetails(String parkingName) {
		
		
		Session session = sessionFactory.getCurrentSession();
		Criteria crt = session.createCriteria(ParkingLotInfo.class);
		crt.add(Restrictions.eq("name", parkingName));
		
		ParkingLotInfo parking = (ParkingLotInfo)crt.uniqueResult();
		
		return parking;
	}

}
