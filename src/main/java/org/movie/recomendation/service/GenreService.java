package org.movie.recomendation.service;

import java.util.List;

import org.movie.recomendation.model.genersModel;
import org.movie.recomendation.model.movieModel;

public interface GenreService {
	  boolean isAddgeners(genersModel model);
	List<genersModel> getAllGenres();
	public Integer getGenreIdByName(String gname);
	public void isDeletecat(int cid);
	
}
