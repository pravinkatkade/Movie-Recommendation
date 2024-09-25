package org.movie.recomendation.repository;

import java.util.List;

import org.movie.recomendation.model.genersModel;
import org.movie.recomendation.model.movieModel;

public interface GenreRepository {
	List<genersModel> findAllGenres();
	  boolean isAddGenere(genersModel model);
	  public Integer getGenreIdByName(String gname);
	  public void isDeletecat(int cid);
}
