package org.movie.recomendation.repository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.movie.recomendation.model.genersModel;
import org.movie.recomendation.model.movieModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
@Repository
public class GenreRepositoryImpl implements GenreRepository{
@Autowired
private  JdbcTemplate template;
	@Override
	public List<genersModel> findAllGenres() {
		
	    	    return template.query("SELECT * FROM geners", new RowMapper<genersModel>() {

	        	@Override
	            public genersModel mapRow(ResultSet rs, int rowNum) throws SQLException {
	            	genersModel gmodel = new genersModel();
	            	gmodel.setGid(rs.getInt(1));
	            	gmodel.setGname(rs.getString(2));
	                return gmodel;
	            }
	        });
	    
	}
	
	

	



	 @Override
	    public boolean isAddGenere(final genersModel model) {
		 int value = template.update("insert into geners values('0',?)", new PreparedStatementSetter() {
	            @Override
	            public void setValues(PreparedStatement ps) throws SQLException {
	                ps.setString(1, model.getGname());
	                
	            }
	        });
	        return value > 0;
	    }  
	 
	 
	 
	 
	 
	 
	 
	 @Override
	 public Integer getGenreIdByName(String gname) {
	        String sql = "SELECT gid FROM geners WHERE gname = ?";
	        
	        try {
	            return template.queryForObject(sql, new Object[]{gname}, Integer.class);
	        } catch (Exception e) {
	            // Handle case where the genre is not found
	            System.out.println("Genre not found: " + gname);
	            return null; // or throw an exception if necessary
	        }
	    }
	 
	 
	 
	 @Override
		public void isDeletecat(int cid) {
		    int value = template.update("DELETE FROM geners WHERE gid = ?", cid);
			
		}
		
        
    

}