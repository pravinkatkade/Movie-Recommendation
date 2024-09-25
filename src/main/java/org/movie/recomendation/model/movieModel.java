	package org.movie.recomendation.model;
	
	public class movieModel {
	    private int movieid;
	    private String moviename;
	    private String movielang;
	    private String movieyear;
	     private String movielink;
	     private String moviephoto;
	    public String getMoviephoto() {
			return moviephoto;
		}

		public void setMoviephoto(String moviephoto) {
			this.moviephoto = moviephoto;
		}

		public String getMovielink() {
			return movielink;
		}
	
		public void setMovielink(String movielink) {
			this.movielink = movielink;
		}
	
		// Default constructor
	    public movieModel() {}
	
	    // Constructor with parameters
	    public movieModel( String moviename, String movielang, String movieyear,String movielink) {
	       
	        this.moviename = moviename;
	        this.movielang = movielang;
	        this.movieyear = movieyear;
	        this.movielink = movielink;
	
	    }
	
	    // Getters and Setters
	    public int getMovieid() {
	        return movieid;
	    }
	    public void setMovieid(int movieid) {
	        this.movieid = movieid;
	    }
	
	    public String getMoviename() {
	        return moviename;
	    }
	    public void setMoviename(String moviename) {
	        this.moviename = moviename;
	    }
	
	    public String getMovielang() {
	        return movielang;
	    }
	    public void setMovielang(String movielang) {
	        this.movielang = movielang;
	    }
	
	    public String getMovieyear() {
	        return movieyear;
	    }
	    public void setMovieyear(String movieyear) {
	        this.movieyear = movieyear;
	    }

		@Override
		public String toString() {
			return "movieModel [movieid=" + movieid + ", moviename=" + moviename + ", movielang=" + movielang
					+ ", movieyear=" + movieyear + ", movielink=" + movielink + "]";
		}
	    
	}
