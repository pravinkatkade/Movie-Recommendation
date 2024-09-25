package org.movie.recomendation.service;

import java.util.List;

import org.movie.recomendation.model.MovieDetail;
import org.movie.recomendation.model.userLoginModel;
import org.movie.recomendation.repository.userRegRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class userRegServiceImpl implements userRegService{
	@Autowired
    private userRegRepository regRepo;
	@Override
	public boolean isUserReg(userLoginModel model) {
		return regRepo.isUserReg(model);
	}
	@Override
    public boolean isValidate(userLoginModel model) {
        return regRepo.isValidate(model);
    }
	@Override
	public int getUserId(userLoginModel model) {
		// TODO Auto-generated method stub
		return regRepo.getUserId(model);
	}
	@Override
	public List<userLoginModel> getAllUser() {
		// TODO Auto-generated method stub
		return regRepo.getAllUser();
	}

	@Override
	public void isDeleteuser(int uid) {
	    regRepo.isDeleteuser(uid);
	}
	@Override
	public List<MovieDetail> getTopRatedMovies() {
		// TODO Auto-generated method stub
		return regRepo.getTopRatedMovies();
	}
	@Override
	public List<userLoginModel> getUserName(String name) {
		return regRepo.getUserName(name);
	}
	@Override
	public void updateUser(userLoginModel user) {
        regRepo.updateUser(user);
		
	}
	

	
}
