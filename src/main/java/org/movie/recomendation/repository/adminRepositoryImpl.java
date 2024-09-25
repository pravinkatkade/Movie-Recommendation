package org.movie.recomendation.repository;

import org.movie.recomendation.model.LoginModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class adminRepositoryImpl implements adminRepository {

    @Autowired
    private JdbcTemplate template;

 
        
        @Override
    	public boolean isValidate(LoginModel model) {
    		
    		PreparedStatementSetter pstmt = new PreparedStatementSetter() {
    			
    			@Override
    			public void setValues(PreparedStatement ps) throws SQLException {
    				ps.setString(1, model.getUsername());
    				ps.setString(2, model.getPassword());
    			}
    		};
    		RowMapper<LoginModel> rowmapper = new RowMapper<LoginModel>() {

    			@Override
    			public LoginModel mapRow(ResultSet rs, int rowNum) throws SQLException {
    				LoginModel model =  new LoginModel();
    				model.setUsername(rs.getString(1));
    				model.setPassword(rs.getString(2));
    				return model;
    			}
    			
    		};
    		List<LoginModel> list = template.query("select username,password from login where username=? and password=?", pstmt,rowmapper);
    		return list.size()>0?true:false;
    	}
        
        
        
    
}
