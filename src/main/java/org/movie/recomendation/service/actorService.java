package org.movie.recomendation.service;

import java.util.List;

import org.movie.recomendation.model.actorModel;

public interface actorService {
	  boolean isAddActor(actorModel model);
	  public List<actorModel> getAllActor();
	  public Integer getActorIdByName(String aname);
		public void isDeleteactor(int aid) ;
}
