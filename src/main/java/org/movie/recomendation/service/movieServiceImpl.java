package org.movie.recomendation.service;

import java.sql.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Optional;

import org.movie.recomendation.model.MovieDetail;
import org.movie.recomendation.model.actorModel;
import org.movie.recomendation.model.genersModel;
//import org.movie.recomendation.model.macjoinModel;
import org.movie.recomendation.model.movieModel;
import org.movie.recomendation.repository.movieRepository;
import org.movie.recomendation.repository.movieRepositoryImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
@Service("mService")
public class movieServiceImpl implements movieService{
	 @Autowired
	    private movieRepository regRepo;
	@Override
	public boolean isAddMovie(movieModel model) {
	  return regRepo.isAddMovie(model);       
	}
	@Override
	public List<movieModel> getAllMovies() {
		return regRepo.getAllMovies();
	}
	
	
	
	@Override
	public List<movieModel> getMovieDetailByName(String name) {
		// TODO Auto-generated method stub
		return regRepo.getMovieDetailByName(name);
	}
	@Override
	public void isDeleteMovie(String moviename) {
	    regRepo.isDeleteMovie(moviename);
	}

	@Override
	public List<movieModel> getAllGenres() {
		return regRepo.findAllGenres();
	}
	
	@Override
	public List<movieModel> findAllMovieName() {
		// TODO Auto-generated method stub
		return regRepo.findAllMovieName();
	}
	
	
	@Override
    public boolean addMovie(movieModel model, Integer gid, Integer aid) {
        return regRepo.addMovie(model, gid, aid);
    }

	
	@Override
	public List<MovieDetail> getAllMovieDetails() {
		// TODO Auto-generated method stub
		return regRepo.getAllMovieDetails();
	}
	@Override
	public List<MovieDetail> searchMovies(int mid, String moviename, String movielang,String moviecat, String yearFrom,String yearTo){
		return regRepo.searchMovies(mid, moviename, movielang, moviecat, yearFrom, yearTo);
	}
	@Override
	public MovieDetail findById(int movieId) {
		// TODO Auto-generated method stub
		return regRepo.findById(movieId);
	}
	@Override
	public void updateMovie(MovieDetail movieDetail) {
	    regRepo.updateMovie(movieDetail);
	}
//	@Override
//	public List<String> findMoviesByActionGenre() {
//		return regRepo.findMoviesByActionGenre();
//	}
	@Override
	public void insertMovieUser(int userId, int movieId) {
	    regRepo.insertMovieUser(userId, movieId);		
	}
	@Override
	public void insertRatingAndReview(int userId, int movieId, int rating, String review) {
 		regRepo.insertRatingAndReview(userId, movieId, rating, review);
	}
	@Override
	public List<MovieDetail> getTopRatedMovies() {
		// TODO Auto-generated method stub
		return regRepo.getTopRatedMovies();
	}
	
		@Override
		public List<MovieDetail> searchMoviesByName(String name) {
	        return regRepo.searchMoviesByName(name);
	    }
		 @Override
		    public List<MovieDetail> getMoviesByGenre(String genre) {
		        return regRepo.findMoviesByGenre(genre);
		    }
		@Override
		public List<MovieDetail> getAllMovieDetailss(int id) {
			// TODO Auto-generated method stub
			return  regRepo.getAllMovieDetailss(id);
		}
		
		
		
		

}
