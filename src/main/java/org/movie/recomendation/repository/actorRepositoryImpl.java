package org.movie.recomendation.repository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.jar.Attributes.Name;

import org.movie.recomendation.model.actorModel;
import org.movie.recomendation.model.genersModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
@Repository
public class actorRepositoryImpl implements actorRepository{
@Autowired
private  JdbcTemplate template;

	@Override
	public boolean isAddActor(final actorModel model) {
		int value = template.update("insert into actor values('0',?)", new PreparedStatementSetter() {
            @Override
            public void setValues(PreparedStatement ps) throws SQLException {
                ps.setString(1, model.getAname());
                
            }
        });
        return value > 0;
    }

	@Override
	public List<actorModel> findAllActor() {
		return template.query("SELECT * FROM actor", new RowMapper<actorModel>() {

			@Override
            public actorModel mapRow(ResultSet rs, int rowNum) throws SQLException {
            	actorModel amodel = new actorModel();
            	amodel.setAid(rs.getInt(1));
            	amodel.setAname(rs.getString(2));
                return amodel;
            }
        });

	}
	
	
	@Override
    public Integer getActorIdByName(String aname) {
        String sql = "SELECT aid FROM actor WHERE aname = ?";
        
        return template.queryForObject(sql, new Object[]{aname}, Integer.class);
    }

	@Override
	public void isDeleteactor(int aid) {
	    int value = template.update("DELETE FROM actor WHERE aid = ?", aid);
		
	}
	
	
}
