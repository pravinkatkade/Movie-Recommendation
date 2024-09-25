package org.movie.recomendation.service;

import org.movie.recomendation.model.LoginModel;
import org.movie.recomendation.repository.adminRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class adminServiceImpl implements adminService {

    @Autowired
    private adminRepository aRepository;

    @Override
    public boolean isValidateUser(LoginModel model) {
        return aRepository.isValidate(model);
    }
}
