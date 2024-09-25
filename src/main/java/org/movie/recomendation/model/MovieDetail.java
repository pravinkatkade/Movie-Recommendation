package org.movie.recomendation.model;

public class MovieDetail {
	private movieModel movie;
    private genersModel genre;
    private actorModel actor;
    private float overallRating;
    private int usercount;
    public int getUsercount() {
		return usercount;
	}

	public void setUsercount(int usercount) {
		this.usercount = usercount;
	}

	private userLoginModel user;
    public userLoginModel getUser() {
	return user;
}

public void setUser(userLoginModel user) {
	this.user = user;
}

	public float getOverallRating() {
		return overallRating;
	}

	public void setOverallRating(float overallRating) {
		this.overallRating = overallRating;
	}

	// Getters and Setters
    public movieModel getMovie() {
        return movie;
    }

    public void setMovie(movieModel movie) {
        this.movie = movie;
    }


	public genersModel getGenre() {
        return genre;
    }

    @Override
	public String toString() {
		return "MovieDetail [movie=" + movie + ", genre=" + genre + ", actor=" + actor + ", overallRating="
				+ overallRating + ", usercount=" + usercount + ", user=" + user + "]";
	}

	public void setGenre(genersModel genre) {
        this.genre = genre;
    }

    public actorModel getActor() {
        return actor;
    }

    public void setActor(actorModel actor) {
        this.actor = actor;
    }
    
}
