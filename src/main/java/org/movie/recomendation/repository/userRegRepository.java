package org.movie.recomendation.repository;

import java.util.List;

import org.movie.recomendation.model.MovieDetail;
import org.movie.recomendation.model.movieModel;
import org.movie.recomendation.model.userLoginModel;

public interface userRegRepository {
	boolean isUserReg(userLoginModel model);
	public boolean isValidate(userLoginModel model);
	public int getUserId(userLoginModel model);
	public List<userLoginModel> getAllUser() ;
	
	public void isDeleteuser(int uid) ;
	public List<MovieDetail> getTopRatedMovies() ;
	 public List<userLoginModel> getUserName(String name);
	 public int updateUser(userLoginModel user);
	 
	 
}
