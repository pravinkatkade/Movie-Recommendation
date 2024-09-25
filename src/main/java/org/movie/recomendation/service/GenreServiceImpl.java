package org.movie.recomendation.service;

import java.util.List;

import org.movie.recomendation.model.genersModel;
import org.movie.recomendation.repository.GenreRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GenreServiceImpl implements GenreService {
	@Autowired
	private GenreRepository gRepo;

	@Override
	public List<genersModel> getAllGenres() {
		// TODO Auto-generated method stub
		return gRepo.findAllGenres();
	}

	@Override
	public boolean isAddgeners(genersModel model) {
		// TODO Auto-generated method stub
		return gRepo.isAddGenere(model);
	}

	@Override
	public Integer getGenreIdByName(String gname) {
		// TODO Auto-generated method stub
		return gRepo.getGenreIdByName(gname);
	}

	@Override
	public void isDeletecat(int cid) {
		// TODO Auto-generated method stub
		gRepo.isDeletecat(cid);
	}

}
