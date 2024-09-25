package org.movie.recomendation.repository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.movie.recomendation.model.MovieDetail;
import org.movie.recomendation.model.actorModel;
import org.movie.recomendation.model.genersModel;
//import org.movie.recomendation.model.macjoinModel;
import org.movie.recomendation.model.movieModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
//import org.movie.recomendation.repository.MovieRowMapper;

@Repository("mRepo")
public class movieRepositoryImpl implements movieRepository {

	@Autowired
	private JdbcTemplate template;
	List<movieModel> mlist;
	List<MovieDetail> moviedetails;

	@Override
	public boolean isAddMovie(final movieModel model) {

		int value = template.update("insert into moviemaster values('0',?,?,?,?)", new PreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1, model.getMoviename());
				ps.setString(2, model.getMovielang());
//	                ps.setString(3, model.getMoviecat());
				ps.setString(3, model.getMovieyear());
				ps.setString(4, model.getMovielink());

			}
		});
		return value > 0;
	}

	@Override
	public List<movieModel> getAllMovies() {
		return template.query("SELECT * FROM moviemaster", new RowMapper<movieModel>() {
			@Override
			public movieModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				movieModel mmodel = new movieModel();
				mmodel.setMovieid(rs.getInt(1));
				mmodel.setMoviename(rs.getString(2));
				mmodel.setMovielang(rs.getString(3));
				mmodel.setMovieyear(rs.getString(4));
				mmodel.setMovielink(rs.getString(5));
				return mmodel;
			}
		});
	}

	@Override
	public List<movieModel> getMovieDetailByName(String name) {
		return template.query("select * from moviemaster where mname like '%" + name + "%'",
				new RowMapper<movieModel>() {
					@Override
					public movieModel mapRow(ResultSet rs, int rowNum) throws SQLException {
						movieModel mmodel = new movieModel();
						mmodel.setMovieid(rs.getInt(1));
						mmodel.setMoviename(rs.getString(2));
						mmodel.setMovielang(rs.getString(3));
						mmodel.setMovieyear(rs.getString(4));

						return mmodel;
					}
				});
	}

	@Override
	public void isDeleteMovie(String moviename) {
		int value = template.update("DELETE FROM moviemaster WHERE mname = ?", moviename);
	}

	@Override
	public List<movieModel> findAllGenres() {

		return template.query("select Distinct mgen from moviemaster", new RowMapper<movieModel>() {

			@Override
			public movieModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				movieModel model = new movieModel();
//	            	model.setMoviecat(rs.getString(1));
				return model;
			}
		});

	}

	@Override
	public List<movieModel> findAllMovieName() {

		return template.query("select mname from moviemaster", new RowMapper<movieModel>() {

			@Override
			public movieModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				movieModel model = new movieModel();
				model.setMoviename(rs.getString(1));
				return model;
			}
		});

	}

//============================================

	@Override
	public boolean addMovie(final movieModel model, final Integer gid, final Integer aid) {
		String sql = "CALL AddMovieDetails(?, ?, ?, ?, ?, ?)"; // Adjusted to match stored procedure signature
		int result = template.update(sql, model.getMoviename(), model.getMovielang(), model.getMovieyear(),
				model.getMovielink(), gid, aid);
		return result > 0; // Return true if update is successful
	}

//================================================================
	@Override
	public List<MovieDetail> getAllMovieDetails() {
		String sql = "SELECT m.mid,m.mname, m.mlang, m.myear,m.movie_link,g.gname, a.aname " + "FROM moviemaster m "
				+ "JOIN movieactcatjoin mj ON mj.mid = m.mid " + "JOIN geners g ON g.gid = mj.gid "
				+ "JOIN actor a ON a.aid = mj.aid";

		return template.query(sql, new RowMapper<MovieDetail>() {
			@Override
			public MovieDetail mapRow(ResultSet rs, int rowNum) throws SQLException {
				MovieDetail detailsDTO = new MovieDetail();

				movieModel movie = new movieModel();
				movie.setMovieid(rs.getInt("mid"));
				movie.setMoviename(rs.getString("mname"));
				movie.setMovielang(rs.getString("mlang"));
				movie.setMovieyear(rs.getString("myear"));

				movie.setMovielink(rs.getString(5));

				genersModel genre = new genersModel();
				genre.setGname(rs.getString("gname"));

				actorModel actor = new actorModel();
				actor.setAname(rs.getString("aname"));

				detailsDTO.setMovie(movie);
				detailsDTO.setGenre(genre);
				detailsDTO.setActor(actor);

				return detailsDTO;
			}
		});
	}

	@SuppressWarnings("deprecation")
	@Override
	public List<MovieDetail> getAllMovieDetailss(int id) {
		String sql = "SELECT m.mid, m.mname, m.mlang, m.myear, m.movie_link, g.gname, a.aname " + "FROM moviemaster m "
				+ "JOIN movieactcatjoin mj ON mj.mid = m.mid " + "JOIN geners g ON g.gid = mj.gid "
				+ "JOIN actor a ON a.aid = mj.aid WHERE m.mid = ?";

		return template.query(sql, new Object[] { id }, new RowMapper<MovieDetail>() {
			@Override
			public MovieDetail mapRow(ResultSet rs, int rowNum) throws SQLException {
				MovieDetail detailsDTO = new MovieDetail();

				// Map the movie details
				movieModel movie = new movieModel();
				movie.setMovieid(rs.getInt("mid"));
				movie.setMoviename(rs.getString("mname"));
				movie.setMovielang(rs.getString("mlang"));
				movie.setMovieyear(rs.getString("myear"));
				movie.setMovielink(rs.getString("movie_link"));

				// Map the genre
				genersModel genre = new genersModel();
				genre.setGname(rs.getString("gname"));

				// Map the actor
				actorModel actor = new actorModel();
				actor.setAname(rs.getString("aname"));

				// Set movie, genre, and actor to MovieDetail DTO
				detailsDTO.setMovie(movie);
				detailsDTO.setGenre(genre);
				detailsDTO.setActor(actor);

				return detailsDTO;
			}
		});
	}

	@Override
	public List<MovieDetail> searchMovies(int mid, String moviename, String movielang, String moviecat, String yearFrom,
			String yearTo) {
		StringBuilder sql = new StringBuilder(
				"SELECT m.mid, m.mname, m.mlang, m.myear, g.gname, a.aname FROM moviemaster m JOIN movieactcatjoin mj ON mj.mid = m.mid JOIN geners g ON g.gid = mj.gid JOIN actor a ON a.aid = mj.aid WHERE 1=1");
		List<Object> params = new ArrayList<>();

		if (mid > 0) {
			sql.append(" AND m.mid = ?");
			params.add(mid);
		}
		if (moviename != null && !moviename.isEmpty()) {
			sql.append(" AND m.mname LIKE ?");
			params.add("%" + moviename + "%");
		}
		if (movielang != null && !movielang.isEmpty()) {
			sql.append(" AND m.mlang LIKE ?");
			params.add("%" + movielang + "%");
		}
		if (moviecat != null && !moviecat.isEmpty()) {
			sql.append(" AND g.gname LIKE ?");
			params.add("%" + moviecat + "%");
		}
		if (yearFrom != null && !yearFrom.isEmpty()) {
			sql.append(" AND m.myear >= ?");
			params.add(java.sql.Date.valueOf(yearFrom));
		}
		if (yearTo != null && !yearTo.isEmpty()) {
			sql.append(" AND m.myear <= ?");
			params.add(java.sql.Date.valueOf(yearTo));
		}

		return template.query(sql.toString(), params.toArray(), new MovieRowMapper());
	}

	private static class MovieRowMapper implements RowMapper<MovieDetail> {
		@Override
		public MovieDetail mapRow(ResultSet rs, int rowNum) throws SQLException {
			MovieDetail moviedet = new MovieDetail();
			movieModel movie = new movieModel();
			movie.setMovieid(rs.getInt("mid"));
			movie.setMoviename(rs.getString("mname"));
			movie.setMovielang(rs.getString("mlang"));
			movie.setMovieyear(rs.getString("myear"));

			genersModel genre = new genersModel();
			genre.setGname(rs.getString("gname"));

			actorModel actor = new actorModel();
			actor.setAname(rs.getString("aname"));

			moviedet.setMovie(movie);
			moviedet.setGenre(genre);
			moviedet.setActor(actor);

			return moviedet;
		}
	}
	// --------------search===================

	@SuppressWarnings("deprecation")
	@Override
	public MovieDetail findById(int movieId) {
		String sql = "SELECT m.mid, m.mname, m.mlang, m.myear,m.movie_link, g.gname, a.aname " + "FROM moviemaster m "
				+ "JOIN movieactcatjoin mj ON mj.mid = m.mid " + "JOIN geners g ON g.gid = mj.gid "
				+ "JOIN actor a ON a.aid = mj.aid " + "WHERE m.mid = ?";

		return template.query(sql, new Object[] { movieId }, rs -> {
			if (rs.next()) {
				movieModel movie = new movieModel();
				movie.setMovieid(rs.getInt("mid"));
				movie.setMoviename(rs.getString("mname"));
				movie.setMovielang(rs.getString("mlang"));
				movie.setMovieyear(rs.getString("myear"));
				movie.setMovielink(rs.getString("movie_link"));

				genersModel genre = new genersModel();
				genre.setGname(rs.getString("gname"));

				actorModel actor = new actorModel();
				actor.setAname(rs.getString("aname"));

				MovieDetail movieDetail = new MovieDetail();
				movieDetail.setMovie(movie);
				movieDetail.setGenre(genre);
				movieDetail.setActor(actor);

				return movieDetail;
			} else {
				return null;
			}
		});
	}

	public void updateMovie(MovieDetail movieDetail) {
		String updateMovieSql = "UPDATE moviemaster SET mname = ?, mlang = ?, myear = ?,movie_link = ? WHERE mid = ?";
		template.update(updateMovieSql, movieDetail.getMovie().getMoviename(), movieDetail.getMovie().getMovielang(),
				movieDetail.getMovie().getMovieyear(), movieDetail.getMovie().getMovielink(),
				movieDetail.getMovie().getMovieid());

		if (movieDetail.getGenre() != null && movieDetail.getActor() != null) {
			String updateGenreActorSql = "UPDATE movieactcatjoin SET gid = (SELECT gid FROM geners WHERE gname = ?), "
					+ "aid = (SELECT aid FROM actor WHERE aname = ?) WHERE mid = ?";
			template.update(updateGenreActorSql, movieDetail.getGenre().getGname(), movieDetail.getActor().getAname(),
					movieDetail.getMovie().getMovieid());
		}
	}

//		======================================find genesr;==================
	@SuppressWarnings("deprecation")
	@Override
	public List<MovieDetail> findMoviesByGenre(String genre) {
		String query = "SELECT m.mid, m.mname, m.mlang, m.myear, g.gname, a.aname " + "FROM moviemaster m "
				+ "JOIN movieactcatjoin mj ON mj.mid = m.mid " + "JOIN geners g ON g.gid = mj.gid "
				+ "JOIN actor a ON a.aid = mj.aid " + "WHERE g.gname = ?";

		return template.query(query, new Object[] { genre }, new RowMapper<MovieDetail>() {

			@Override
			public MovieDetail mapRow(ResultSet rs, int rowNum) throws SQLException {
				MovieDetail movieDetail = new MovieDetail();

				movieModel movie = new movieModel();
				movie.setMovieid(rs.getInt("mid"));
				movie.setMoviename(rs.getString("mname"));
				movie.setMovielang(rs.getString("mlang"));
				movie.setMovieyear(rs.getString("myear"));

				genersModel genre = new genersModel();
				genre.setGname(rs.getString("gname"));

				actorModel actor = new actorModel();
				actor.setAname(rs.getString("aname"));

				movieDetail.setMovie(movie);
				movieDetail.setGenre(genre);
				movieDetail.setActor(actor);

				return movieDetail;
			}

		});
	}

//		=================insert movieuserjoin table========= 
	public void insertMovieUser(int userId, int movieId) {
		String sql = "INSERT INTO movieuserjoin (uid, mid) VALUES (?, ?)";
		template.update(sql, userId, movieId);
	}

	// ===============review and rating ====================
	@Override
	public void insertRatingAndReview(int userId, int movieId, int rating, String review) {
		String sql = "INSERT INTO ratingmaster (uid, mid, Rating, Review) VALUES (?, ?, ?, ?)";
		template.update(sql, userId, movieId, rating, review);
	}

	@Override
	public List<MovieDetail> getTopRatedMovies() {
		String query = "SELECT m.mid, m.mname, m.myear, g.gname AS genre, a.aname AS actor, (SUM(r.Rating) / COUNT(r.uid)) AS overall_rating, COUNT(DISTINCT r.uid) AS user_count FROM ratingmaster r JOIN moviemaster m ON r.mid = m.mid JOIN movieactcatjoin mj ON m.mid = mj.mid JOIN geners g ON mj.gid = g.gid JOIN actor a ON mj.aid = a.aid GROUP BY m.mid, m.mname, m.myear, g.gname, a.aname HAVING COUNT(r.uid) > 0 ORDER BY user_count DESC,overall_rating DESC";

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

			return movieDetail;
		});
	}

	@Override
	public List<MovieDetail> searchMoviesByName(String name) {
		String sql = "SELECT m.mid, m.mname, m.mlang, m.myear, g.gname, a.aname " + "FROM moviemaster m "
				+ "JOIN movieactcatjoin mj ON mj.mid = m.mid " + "JOIN geners g ON g.gid = mj.gid "
				+ "JOIN actor a ON a.aid = mj.aid " + "WHERE LOWER(m.mname) LIKE LOWER(?)";
		return template.query(sql, new Object[] { "%" + name + "%" }, new MovieRowMapper());
	}

	private static class MovieRowMapper1 implements RowMapper<MovieDetail> {
		@Override
		public MovieDetail mapRow(ResultSet rs, int rowNum) throws SQLException {
			MovieDetail movieDetail = new MovieDetail();

			movieModel movie = new movieModel();
			movie.setMovieid(rs.getInt("mid"));
			movie.setMoviename(rs.getString("mname"));
			movie.setMovielang(rs.getString("mlang"));
			movie.setMovieyear(rs.getString("myear"));

			genersModel genre = new genersModel();
			genre.setGname(rs.getString("gname"));

			actorModel actor = new actorModel();
			actor.setAname(rs.getString("aname"));

			movieDetail.setMovie(movie);
			movieDetail.setGenre(genre);
			movieDetail.setActor(actor);

			return movieDetail;
		}
	}

}
