package org.movie.recomendation.repository;

import org.movie.recomendation.model.LoginModel;

public interface adminRepository {
    boolean isValidate(LoginModel model);
}
