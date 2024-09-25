package org.movie.recomendation.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.movie.recomendation.model.MovieDetail;
import org.movie.recomendation.model.actorModel;
import org.movie.recomendation.model.genersModel;
import org.movie.recomendation.model.movieModel;
import org.movie.recomendation.model.userLoginModel;
//import org.movie.recomendation.repository.movieRepositoryImpl.MovieRowMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
@Repository("regRepo")
public class userRegRepositoryImpl implements userRegRepository{

	@Autowired
	 private JdbcTemplate template;
	@Override
	public boolean isUserReg(userLoginModel model) {
		int value = template.update("insert into userlogin values ('0',?,?,?,?)", new PreparedStatementSetter() {
            @Override
            public void setValues(PreparedStatement ps) throws SQLException {
                ps.setString(1,model.getUsername());
                ps.setString(2,model.getPassword());
                ps.setString(3,model.getMail());
                ps.setString(4,model.getContact());        
                }
        });
        return value > 0;
    }
	
	@Override
	public boolean isValidate(userLoginModel  model) {
		
		PreparedStatementSetter pstmt = new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1, model.getUsername());
				ps.setString(2, model.getPassword());
				
			}
		};
		RowMapper<userLoginModel> rowmapper = new RowMapper<userLoginModel>() {

			@Override
			public userLoginModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				userLoginModel model =  new userLoginModel();
				model.setUsername(rs.getString(1));
				model.setPassword(rs.getString(2));
				
				return model;
			}
			
		};
		List<userLoginModel> list = template.query("select u_name,u_pass from userlogin where u_name=? and u_pass=?", pstmt,rowmapper);
		return list.size()>0?true:false;
	}
    
	
	public int getUserId(userLoginModel model) {
	    String sql = "SELECT u_id FROM userlogin WHERE u_name = ? AND u_pass = ?";
	    return template.queryForObject(sql, new Object[]{model.getUsername(), model.getPassword()}, Integer.class);
	}
	
	
	
	
	@Override
	public List<userLoginModel> getAllUser() {
	    String sql = "SELECT * FROM userlogin";

	    return template.query(sql, new RowMapper<userLoginModel>() {
	        @Override
	        public userLoginModel mapRow(ResultSet rs, int rowNum) throws SQLException {
	            userLoginModel umodel = new userLoginModel();

	            umodel.setUid(rs.getInt(1)); // Assuming 'uid' is the column name
	            umodel.setUsername(rs.getString(2)); // Assuming 'username' is the column name
	            umodel.setPassword(rs.getString(3)); // Assuming 'password' is the column name
	            umodel.setMail(rs.getString(4)); // Assuming 'mail' is the column name
	            umodel.setContact(rs.getString(5)); // Assuming 'contact' is the column name

	            return umodel;
	        }
	    });
	}
	@Override
	public void isDeleteuser(int uid) {
	    int value = template.update("DELETE FROM userlogin WHERE u_id = ?", uid);
	}


	
	@Override
	public List<MovieDetail> getTopRatedMovies() {
	    String query = "SELECT m.mid, m.mname, m.myear, g.gname AS genre, a.aname AS actor, (SUM(r.Rating) / COUNT(r.uid)) AS overall_rating, COUNT(r.uid) AS user_count FROM ratingmaster r JOIN moviemaster m ON r.mid = m.mid JOIN movieactcatjoin mj ON m.mid = mj.mid JOIN geners g ON mj.gid = g.gid JOIN actor a ON mj.aid = a.aid GROUP BY m.mid, m.mname, m.myear, g.gname, a.aname HAVING COUNT(r.uid) > 0 ORDER BY user_count DESC,overall_rating DESC LIMIT 5";

	    return template.query(query, (rs, rowNum) -> {
	        movieModel movie = new movieModel();
	        movie.setMovieid(rs.getInt("mid"));
	        movie.setMoviename(rs.getString("mname"));
	        movie.setMovieyear(rs.getString("myear")); // Assuming `myear` is a String

	        genersModel genre = new genersModel();
	        genre.setGname(rs.getString("genre"));

	        actorModel actor = new actorModel();
	        actor.setAname(rs.getString("actor"));

	        MovieDetail movieDetail = new MovieDetail();
	        movieDetail.setMovie(movie);
	        movieDetail.setGenre(genre);
	        movieDetail.setActor(actor);
	        movieDetail.setOverallRating(rs.getFloat("overall_rating"));
            movieDetail.setUsercount(rs.getInt("user_count"));
	        return movieDetail;
	    });
	}

	@Override
	public List<userLoginModel> getUserName(String name) {
	    String sql = "SELECT * FROM userlogin WHERE u_name=?";
	    return template.query(sql, new Object[]{name}, new userRowMapper());
	}

	private static class userRowMapper implements RowMapper<userLoginModel> {
	    @Override
	    public userLoginModel mapRow(ResultSet rs, int rowNum) throws SQLException {
	        userLoginModel umodel = new userLoginModel();
	        umodel.setUid(rs.getInt("u_id"));
	        umodel.setUsername(rs.getString("u_name"));
	        umodel.setPassword(rs.getString("u_pass"));
	        umodel.setMail(rs.getString("u_mail"));
	        umodel.setContact(rs.getString("u_contact"));
	        return umodel;
	    }
	}

		
	public int updateUser(userLoginModel user) {
        String sql = "UPDATE userlogin SET u_name = ?, u_mail = ?, u_contact = ? WHERE u_id = ?";
        return template.update(sql, user.getUsername(), user.getMail(), user.getContact(), user.getUid());
    }

   

	


}
