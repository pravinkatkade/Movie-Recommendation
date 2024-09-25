package org.movie.recomendation.service;

import org.movie.recomendation.model.LoginModel;

public interface adminService {
    boolean isValidateUser(LoginModel model);
}
