package org.movie.recomendation.service;

import java.sql.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Optional;

import org.movie.recomendation.model.MovieDetail;
import org.movie.recomendation.model.genersModel;
//import org.movie.recomendation.model.macjoinModel;
import org.movie.recomendation.model.movieModel;


public interface movieService {
	  boolean isAddMovie(movieModel model);
	 public List<movieModel> getAllMovies();
	 public List<MovieDetail> getAllMovieDetails();
	 public void isDeleteMovie(String moviename);
	 public List<movieModel> getMovieDetailByName(String name);
	public List<movieModel> getAllGenres();
	public List<movieModel> findAllMovieName();
	public boolean addMovie(movieModel model, Integer gid,  Integer aid);
	public List<MovieDetail> searchMovies(int mid, String moviename, String movielang,String moviecat, String yearFrom,String yearTo);
   
	public MovieDetail findById(int movieId);
	   public void updateMovie(MovieDetail movieDetail);
	   public void insertMovieUser(int userId, int movieId);
	   public void insertRatingAndReview(int userId, int movieId, int rating, String review) ;
		public List<MovieDetail> getTopRatedMovies() ;
		public List<MovieDetail> searchMoviesByName(String name);

		public List<MovieDetail> getMoviesByGenre(String genre);
		
		public List<MovieDetail> getAllMovieDetailss(int id);
		
		

		
}
