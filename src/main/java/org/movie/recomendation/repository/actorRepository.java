package org.movie.recomendation.repository;

import java.util.List;

import org.movie.recomendation.model.actorModel;
import org.movie.recomendation.model.genersModel;

public interface actorRepository {
	  boolean isAddActor(actorModel model);
	  public List<actorModel> findAllActor();
	  public Integer getActorIdByName(String aname);
		public void isDeleteactor(int aid) ;
}
