package com.wellness.ServiceImpl;

import java.util.List;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wellness.Dao.WellnessDao;
import com.wellness.model.UserLogin;
import com.wellness.service.WellnesService;


@Service
@Transactional
public class WellnesServiceImpl implements WellnesService {

	@Autowired
	WellnessDao wellnessDao;
	
	@Override
	public boolean findUser(String email) {
		return wellnessDao.findUser(email);
	}

	@Override
	public long createUser(UserLogin userLogin) {
		return wellnessDao.createUser(userLogin);
	}

	@Override
	public UserLogin updateUser(UserLogin userLogin) {
		return wellnessDao.updateUser(userLogin);
	}

	@Override
	public void deleteUserById(long id) {
		wellnessDao.deleteUserById(id);
		
	}

	@Override
	public List<UserLogin> getAllusers() {
		return wellnessDao.getAllusers();
	}

	@Override
	public UserLogin getUserByEmailId(String email) {
		return wellnessDao.getUserByEmailId(email);
	}

	@Override
	public UserLogin getUserById(long id) {
		return wellnessDao.getUserById(id);
	}

	@Override
	public void updaterole(UserLogin userLogin, String role, long id) {
		wellnessDao.updaterole(userLogin, role, id);
		
	}

	
	@Override
	public void passReset(UserLogin userLogin, String pass, String email) {
		wellnessDao.passReset(userLogin, pass, email);
		
	}

	@Override
	public void updateSubscription(UserLogin userLogin, String membership, long id) {
		wellnessDao.updateSubscription(userLogin, membership, id);
	}

	@Override
	public List<UserLogin> lookupMembers(String name) {		
		return wellnessDao.lookupMembers(name);
	}

	@Override
	public void updateUserById(UserLogin userLogin, long id) {
		wellnessDao.updateUserById(userLogin, id);
		
	}

	@Override
	public List<UserLogin> getUserByName(String user) {
		return wellnessDao.getUserByName(user);
	}

	@Override
	public List<UserLogin> lookupCity(String cityOrZip) {		
		return wellnessDao.lookupCity(cityOrZip);
	}

	@Override
	public JSONObject jdbcDbConnect(String email) {
		return wellnessDao.jdbcDbConnect(email);
	}

}
