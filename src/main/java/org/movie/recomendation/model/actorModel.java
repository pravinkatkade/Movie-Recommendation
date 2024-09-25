package org.movie.recomendation.model;

public class actorModel {
	private Integer aid; // Changed from int to Integer
    private String aname;

    public actorModel() {
	}
    
    public actorModel(String aname) {
	
    
    this.aname=aname;
    }
    
    // Getters and Setters
    public Integer getAid() {
        return aid;
    }

    public void setAid(Integer aid) {
        this.aid = aid;
    }

    public String getAname() {
        return aname;
    }

    public void setAname(String aname) {
        this.aname = aname;
    }
}
