package org.movie.recomendation.service;

import java.util.List;

import org.movie.recomendation.model.actorModel;
import org.movie.recomendation.model.genersModel;
import org.movie.recomendation.repository.GenreRepository;
import org.movie.recomendation.repository.actorRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class actorServiceImpl implements actorService{
@Autowired
private actorRepository aRepo;

	@Override
	public boolean isAddActor(actorModel model) {
		return aRepo.isAddActor(model);
	}
	@Override
	public List<actorModel> getAllActor() {
		return aRepo.findAllActor();
	}
	@Override
	public Integer getActorIdByName(String aname) {
		// TODO Auto-generated method stub
		return aRepo.getActorIdByName(aname);
	}
	@Override
	public void isDeleteactor(int aid) {
	    aRepo.isDeleteactor(aid);
	}

}
